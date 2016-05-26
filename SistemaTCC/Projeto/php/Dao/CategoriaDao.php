<?php
/**
 * @author Kevin Rangel Moreira
 * @since data 26/03/2016
 *	classe criada para conexão banco de dados categoria 
 */


//require_once('../MySQL.php');
require_once('../Ent/Categoria.php');
include '../sistemaJP.php';


	class CategoriaDAO {
		
		public function Obter($pesq)
		{

			session_start();
			$conexao= AbreBancoJP();

			$objCategoriaEnt = new Categoria();

					$sql="SELECT 
						idCategoria ,
						nomeCategoria
				FROM 
					categoria 
				WHERE
				 --	(idCategoria= ID_CATEGORIA OR ID_CATEGORIA IS NULL)
				   -- AND
				    (nomeCategoria LIKE CONCAT('%', ".$pesq.", '%') OR ".$pesq." IS NULL)
				 AND 
					status=1
				AND
					idOrganizacao = $_SESSION[idOrganizacao];";

			$sql=mysql_query($sql, $conexao);

			if(mysql_num_rows($sql) <= 0){
				echo '0';
				mysql_close($conexao);
				return;
			}

			while($row=mysql_fetch_row($sql)){

				$objCategoriaEnt->setIdCategoria($row['0']);
				$objCategoriaEnt->setNome($row['1']);


			}
			mysql_close($conexao);
			return $objCategoriaEnt;



		}
			
			
		//Salva categria  na base
		public function Salvar(categoria $categoria)
		{
			session_start();
			$conexao=AbreBancoJP();

			$sql="INSERT INTO categoria
		(
			`idOrganizacao`,
			`nomeCategoria`,
			`status`,
			`CadastroDataHora`,
			`CadastroUsuarioId`,
			`AtualizacaoDataHora`,
			`AtualizacaoUsuarioId`
		)
		VALUES
		(
			$_SESSION[idOrganizacao],
			'".$categoria->getNome()."',
			1,
			current_timestamp(),
			NULL,
			NULL,
			NULL
        );";

			mysql_query($sql, $conexao);


			$retorno = "1";

			mysql_close($conexao);

			return $retorno;
			
		}
			
		
		//Atualiza categoria na base
		private function Atualizar(categoria $categoria)
		{
			session_start();
			$conexao=AbreBancoJP();

			$sql="
				UPDATE 
					`categoria`
				SET
					`nomeCategoria` = NOME_,
					`status` = STATUS_,
					`AtualizacaoDataHora` = current_timestamp()
				WHERE 
					`idCategoria` = ID_CATEGORIA
				AND
					`idOrganizacao`= ID_ORGANIZACAO;";

			mysql_query($sql, $conexao);


			$retorno = "1";

			mysql_close($conexao);

			return $retorno;
		}


		public  function  excluir(categoria $categoria){
			session_start();
			$conexao=AbreBancoJP();

			$sql="UPDATE 
				`categoria`
			SET
				`status` = 0,
				`AtualizacaoDataHora` = current_timestamp()
			WHERE 
				`idCategoria` = ID_CATEGORIA
			AND
				`idOrganizacao`= ID_ORGANIZACAO;
		";


			mysql_query($sql, $conexao);


			$retorno = "1";

			mysql_close($conexao);

			return $retorno;
		}

		
	}
