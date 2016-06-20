<?php

include 'sistemaJP.php';

date_default_timezone_set('America/Sao_Paulo'); //fuso horario

if (isset($_POST['action'])) {
	switch ($_POST['action']) {

		case 'busca':
			busca();
			break;

		case 'criaVenda':
			criaVenda();
			break;

		case 'baixaEstoque':
			baixaEstoque();
			break;
	}
}

function busca(){

	session_start();
	$conexao = AbreBancoJP();

	$sql = "SELECT p.nome, p.valorVenda, sum(l.qtde) from produto p
	INNER JOIN loteprodutos l on l.idProduto = p.idProduto
	where p.idProduto = '$_POST[pesq]' 
	and p.status=1 and p.idOrganizacao=". $_SESSION['idOrganizacao'] ."
	and l.status=1 and l.idOrganizacao=". $_SESSION['idOrganizacao'];

	$sql=mysql_query($sql, $conexao);

	if(mysql_num_rows($sql) <= 0){
		echo '0';
		mysql_close($conexao);
		return;
	}

	while($row = mysql_fetch_row($sql)){

		$json[]= array(
			'nome' => $row['0'],
			'preco' => $row['1'],
			'qtde' => $row['2'],
		);
	}

	echo json_encode($json);
	mysql_close($conexao);
}


//---------------------------------------------------------------------------------------------------------
// ATUALIZADO 22/08/2014 INCLUSÃO DO CAMPO ORGANIZACAO
//---------------------------------------------------------------------------------------------------------
function criaVenda() {
	echo "<script>alert('Entrou no cria venda');</script>";
	session_start();
	$cancelado = 0;

	if(isset($_POST['cancelado'])){
		$cancelado = 1;
	}

	$conexao= AbreBancoJP();
	$hora = date("H:i:s"); //pega a hora do sistema. Para isso ela precisa estar no fuso horário de são paulo setado no inicio do programa
//	$query = "insert into venda values ('', '$_SESSION[idOrganizacao]', '', curdate(),'$hora', $cancelado)";//3° posição codigo do cliente possivelmente acrescentarei posteriormente
	$query = "insert into venda(idOrganizacao,idCliente,horaVenda,cancelado) values
	('$_SESSION[idOrganizacao]',0,CURRENT_TIME ,$cancelado)";
	mysql_query($query, $conexao);
	mysql_close($conexao);
}

function baixaEstoque() {//dá baixa no estoque seguindo a regra de negócio
//	criaVenda() ;

	session_start();
	if(isset($_POST['idProduto']) && isset($_POST['qtde']) && isset($_POST['valor'])){

		$idProdutos = $_POST['idProduto']; //recebe string de produtos
		$getQtde = $_POST['qtde']; //recebe string de quantidade
		$getValor = $_POST['valor']; //recebe string de valor
		$getSubtotal = $_POST['subtotal'];//recebe string de subtotal
		$idProduto = explode(",", $idProdutos); //quebra a string em vetor na virgula, nunca usar mesma varável, pois dá conflito
		$exp_qtde = explode(",", $getQtde); //quebra a string em vetor na virgula
		$exp_valor = explode(",", $getValor);//quebra a string em vetor na virgula
		$exp_subtotal = explode(",", $getSubtotal);//quebra a string em vetor na virgula
		$conexao= AbreBancoJP();//abre conexao

		$lastId = "SELECT idVenda from venda
		where cancelado = 0 and idOrganizacao=". $_SESSION['idOrganizacao'] ." order by idVenda desc limit 1"; //pega id da ultima venda

		$lastId = mysql_query($lastId, $conexao);
		$last = mysql_fetch_row($lastId); //percorre vetor

		for ($i = 0; $i < sizeof($idProduto); $i++) {

			$cancelado = 0;
			$qtde = explode("x", $exp_qtde[$i]);//valor retirado da tabela necessita ser explodido dentro da iteração
			$valor = explode("R$", $exp_valor[$i]);//valor retirado da tabela necessita ser explodido dentro da iteração

			if ($exp_subtotal[$i] != '0') {
				$subtotal = explode("R$", $exp_subtotal[$i]);//valor retirado da tabela necessita ser explodido dentro da iteração
			}else{
				$cancelado = 1;
			}

			$valorItem = $qtde[0] * $valor[1];


			//$query = "insert into item_venda values ('', $last[0], $idProduto[$i], $qtde[0], $valorItem, $cancelado)"; //insere itens de venda
			$query = "insert into item_venda(idVenda,idProduto,qtde,subTotal,cancelado) values ( $last[0], $idProduto[$i], $qtde[0], $valorItem, $cancelado)";

			$query = mysql_query($query, $conexao); //conexao insere itens de venda

			//=========================================================================================
			// Início da baixa no estoque
			//=========================================================================================
			if($cancelado != 1){
//			    $qtdeTotalProd = "select sum(qtde) from loteprodutos
//			    where idProduto = '$idProduto[$i]' and status=1 and idOrganizacao=". $_SESSION['idOrganizacao'];

				$qtdeTotalProd ="select sum(lpb.quantidade) as total from loteprodutosbaixa lpb, loteprodutos lp
				where 
				
				lp.idProduto = ".$idProduto[$i]."
				
				and 
				lp.status=1 
				 and 
				
				 lp.idOrganizacao=$_SESSION[idOrganizacao]
				 and
				
				lpb.LoteProdutosId = lp.idLote;";
				$qtdeTotalProd = mysql_query($qtdeTotalProd, $conexao);
				$qtdeTotalProd = mysql_fetch_row($qtdeTotalProd);
				//quantidade total de produtos qtde, quantidade total do banco - qtd inserida
				//pelo usuário 
				$qtdeRestante = $qtdeTotalProd[0] - $qtde[0];

				//Pega produto com o prazo de validade mais próximo do vencimento orderby desc
//				$qtdeBanco = "select qtde, validade,idlote from loteprodutos
//			    where idProduto = '$idProduto[$i]' and status=1 and idOrganizacao=". $_SESSION['idOrganizacao'] ." order by validade desc limit 1";

				$qtdeBanco="select 
								ifnull(lb.Quantidade,0), 
								l.validade, 
								l.idlote							
								from loteprodutos l,
								loteprodutosbaixa lb
								
								where 
								l.idProduto = '$idProduto[$i]'
								and l.status=1
								and l.idLote = lb.LoteProdutosId 
								-- and lb.Quantidade>0
								and l.idOrganizacao= ". $_SESSION['idOrganizacao'] ."
								order by l.validade asc;
								";

				$qtdeBanco = mysql_query($qtdeBanco, $conexao);

				//tem q fazer a soma no banco e não pegar de um prduto só quando tem 2
				$validade = 0;

				/*a baixa no estoque é feita da seguinte forma: obtem-se o total da qtde do mesmo produto em todos os lotes
                e subtrai-se pela qtde a retirar. O resultado do cálculo é a qtde que deve restar após a baixa no estoque.
                Então faz-se um select decrescente pela validade nos lotes subtraindo a quantidade a retirar
                com a qtde real naquele lote, quando essa subtração der um valor negativo o if abaixo entra em ação multiplicando
                o valor negativo por -1 e depois subtraindo com a qtde real do produto naquele lote dando um UPDATE.
                feito isso faz-se um outro select decrescente na validade zerando o status e a quantidade dos lotes com a data
                de vencimento mais próxima.*/

				//A flag serve para verificar se entrou no if que determina o desconto na qtde apartir de um calculo feito,
				//para que no proximo item de data de vencimento mais curta, tenha a qtde zerada
				$flag=0;
//				echo "<script> alert('chegou até aqui');</script>";
//				echo "<script> alert('$qtdeBanco');</script>";
				while($row = mysql_fetch_row($qtdeBanco)){
//					echo "<script>alert('$row[0]');</script>";
					$qtdeRestante = $qtdeRestante - $row[0];
//					print "<script> alert('$qtdeRestante');</script>";
//					print '<script> alert("entrou no while");</script>';
					if($qtdeRestante<0) {

//						echo  "<scirpt> alert('qted maior que 0');</scirpt>";
						if ($qtdeRestante < 0 && $flag != 1) {
//							print '<script> alert("entrou no if");</script>';
							$validade = $row[1];
							$qtdeRestante = $qtdeRestante * (-1);

							$teste= $row[0] - $qtdeRestante;
//							echo '<script> alert("Valor do if".$teste);</script>';
							if (($row[0] - $qtdeRestante) <= 0) {
								$updateQtde = "
							UPDATE 
								loteprodutos as a 
								inner join loeprodutosbaixa as b on b.LoteProdutosId = a.idLote
							set 
								Quantidade = 0, 
								FlagStatus = 0,
								Status = 0
				            where 
				            	(idProduto = '$idProduto[$i]' and idlote='$row[2]') 
				            	and status = 1 
				            	and idOrganizacao=" . $_SESSION['idOrganizacao'];
								$updateQtde = mysql_query($updateQtde);
							} else {
								$updateQtde = "
							UPDATE 
								loteprodutos as a 
								inner join loteprodutosbaixa as b on b.LoteProdutosId = a.idLote
							set 
								Quantidade = '$row[0]' - '$qtdeRestante',
								b.CadastroDataHora = CURRENT_DATE()

					        where 
					        	(idProduto = '$idProduto[$i]' and idlote = '$row[2]') 
					        	and status = 1 
					        	and idOrganizacao=" . $_SESSION['idOrganizacao'];
								$updateQtde = mysql_query($updateQtde);
							}

							$flag = 1;
						} else if ($flag == 1) {
							$updateQtde = "
							UPDATE 
								loteprodutos as a 
								inner join LoteProdutosBaixa as b on b.LoteProdutosId = a.idLote
							set 
						        Quantidade = 0, 
						        status = 0,
						        FlagStatus = 0
				        where 
				        
				        	(idProduto = '$idProduto[$i]' and idlote='$row[2]') 
				        	and status = 1 
				        	and idOrganizacao=" . $_SESSION['idOrganizacao'];
							$updateQtde = mysql_query($updateQtde);
						}
					}else{

						$updateQtde = "
							UPDATE 
								loteprodutos as a 
								inner join LoteProdutosBaixa as b on b.LoteProdutosId = a.idLote
							set 
						        Quantidade = 0, 
						        status = 0,
						        FlagStatus = 0
				        where 
				        
				        	(idProduto = '$idProduto[$i]' and idlote='$row[2]') 
				        	and status = 1 
				        	and idOrganizacao=" . $_SESSION['idOrganizacao'];
						$updateQtde = mysql_query($updateQtde);
						
					}
				}

				/*while($row = mysql_fetch_row($qtdeBanco)){
					print "<script>alert('qtd-> '$row[0]); </script>";
					print "<script>alert('restante-> '$qtdeRestante); </script>";
					$qtdeRestante = $qtdeRestante - $row[0];

					print "<script>alert('sobrou -->'$qtdeRestante); </script>";
					print 'entrou no while';

					if($qtdeRestante < 0 && $flag != 1){// vc mexeu nesse sinal aqui??? mexi mas deois cploqui do jeito q tava se'r que nao tinha um igual ai?
						$validade = $row[1];

						print 'passou aqui';

						if(($row[0] - $qtdeRestante) <= 0){
							$updateQtde = "
											UPDATE loteprodutosbaixa set Quantidade = 0 
											where LoteProdutosId = ".$row[2];


							$updateQtde = mysql_query($updateQtde);


							echo '0';
						}else{
							$ver1 = $row[3] - $qtdeRestante;
							print "Estoque ".$ver1;
							echo "<script>alert('qtd -> '$row[3])</script>";
							echo "<script>alert('qtd restante ->' $qtdeRestante)</script>";
							//$ver = $row[0] + $qtdeRestante;
							echo ' valor gerado'.$ver;
							//if ($ver>=0){
								$updateQtde ="
											UPDATE loteprodutosbaixa set Quantidade = '$row[3]' + '$qtdeRestante'
											where LoteProdutosId = ".$row[2];


								$updateQtde = mysql_query($updateQtde);
								echo '1';
								echo $updateQtde;
							//}
							else if($getQtde < $row[0]){

//							$result=
//							"select
//									lb.Quantidade
//								from
//									loteprodutos l,
//								    loteprodutosbaixa lb
//
//								where
//									l.idLote = lb.LoteProdutosId
//								    and
//								    l.idProduto =20
//								    and
//								    lb.Quantidade>0;";

//							$i=0;
//							$aux=$row['Quantidade'];
//
//							while ($bus = mysql_fetch_array($result)){
//								print $bus[0];
//							}

								$quant = $row[0]- $getQtde;

							}
							else
								echo "Quantidade insuficiente";
						}

						$flag=1;
					}else if($flag == 1){
						print 'não passou';
						$updateQtde = "UPDATE loteprodutosbaixa set Quantidade = 0 
											where LoteProdutosId = ".$row[2];
						$updateQtde = mysql_query($updateQtde);
//						echo '2';
					}
				}*/
			}
		}


		mysql_close($conexao);
	}
}
