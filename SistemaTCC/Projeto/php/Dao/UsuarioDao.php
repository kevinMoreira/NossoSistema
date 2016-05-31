<?php
/**
 * @author Kevin Rangel Moreira
 * @since 27/03/2016
 * classe criada para conexão com banco de dados usuário
 */


include '../sistemaJP.php';
require_once('../Ent/Usuario.php');



class UsuarioDao
{


    public function Obter($pesq)
    {

        session_start();
        $conexao = AbreBancoJP();


        $objUsuarioEnt = new Usuario();

        $sql = "SELECT 
					nome
            ,	idUsuario
			,	idOrganizacao
            ,	idDepartamento
			,	nome
			,	cpf
			,	data_nascimento
			,	telefone
			,	celular
			,	email
			,	cep
			,	numero
			,	complemento
			,	status
			,   login
			,   senha
			,   endereco
			 ,   cidade
			 ,   estado
			
			
		   ,	CadastroDataHora
		   ,	CadastroUsuarioId
		   ,	AtualizacaoDataHora
		  ,	AtualizacaoUsuarioId
		FROM 
			usuarios
             
		WHERE
			
            
				(nome = '".$pesq." ' 
                OR
                telefone = '".$pesq. "') 
			
		AND 
			status=1;";
//		AND
//			u.idOrganizacao =" . $_SESSION['idOrganizacao'];

        $sql = mysql_query($sql, $conexao);

        if (mysql_num_rows($sql) <= 0) {
            mysql_close($conexao);
            return 0;
        }

        while ($row = mysql_fetch_row($sql)) {


            $objUsuarioEnt->setNome($row['0']);
            $objUsuarioEnt->setIdUsuario($row['1']);
            $objUsuarioEnt->setIdOrganizacao($row['2']);
            $objUsuarioEnt->setIdDepartamento($row['3']);
            $objUsuarioEnt->setNome($row['4']);
            $objUsuarioEnt->setCpf($row['5']);
            $objUsuarioEnt->setDataNasc($row['6']);
            $objUsuarioEnt->setTelefone($row['7']);
            $objUsuarioEnt->setCelular($row['8']);
            $objUsuarioEnt->setEmail($row['9']);
            $objUsuarioEnt->setCep($row['10']);
            $objUsuarioEnt->setNumero($row['11']);
            $objUsuarioEnt->setComplemento($row['12']);
            $objUsuarioEnt->setStatus($row['13']);
            $objUsuarioEnt->setLogin($row['14']);
            $objUsuarioEnt->setSenha($row['15']);

            $objUsuarioEnt->setEndereco($row['16']);
            $objUsuarioEnt->setCidade($row['17']);
            $objUsuarioEnt->setUf($row['18']);
            $objUsuarioEnt->setDepartamento($row['19']);

        }
        mysql_close($conexao);
        return $objUsuarioEnt;
    }


    public function CarregarComboBox()
    {

        session_start();
        $conexao = AbreBancoJP();

        $sql = "SELECT 
						idDepartamento ,
						nome
				FROM 
					departamento 
				WHERE 
					status=1
				AND
					idOrganizacao =" . $_SESSION['idOrganizacao'];

        $sql = mysql_query($sql, $conexao);

        if (mysql_num_rows($sql) <= 0) {
            mysql_close($conexao);
            return 0;
        }

        while ($row = mysql_fetch_row($sql)) {
            $json[] = array(
                'idDepartamento' => $row[0],
                'nome' => $row[1]
            );
        }
        mysql_close($conexao);
        return $json;
    }


    public function Salvar(Usuario $objUsuario)
    {
        session_start();
        $conexao=AbreBancoJP();

        $sql="INSERT INTO `usuarios`
		(
	
			`idOrganizacao`,
            `idDepartamento`,
			`nome`,
			`cpf`,
			`data_nascimento`,
			`telefone`,
			`celular`,
			`email`,
			`cep`,
            `complemento`,
            `numero`,
			`status`,
			`CadastroDataHora`,
			`CadastroUsuarioId`,
			`AtualizacaoDataHora`,
			`AtualizacaoUsuarioId`,
            `login`,
            `senha`,
            `endereco`,
            `bairro`,
            `cidade`,
            `estado`,
            `idUsuario`
		)
        VALUES
		(
			-- $_SESSION[idOrganizacao],
			".$objUsuario->getIdOrganizacao().",
             '".$objUsuario->getIdDepartamento()."',
			'".$objUsuario->getNome()."',
			'".$objUsuario->getCpf()."',
			'".$objUsuario->getDataNasc()."',
			'".$objUsuario->getTelefone()."',
			'".$objUsuario->getCelular()."',
			'".$objUsuario->getEmail()."',
			'".$objUsuario->getCep()."',
            '".$objUsuario->getComplemento()."',
            '".$objUsuario->getNumero()."',
			1,
			current_timestamp(),
			'".$objUsuario->getIdUsuario()."',
			NULL,
			NULL,
            '".$objUsuario->getLogin()."',
            '".$objUsuario->getSenha()."',
            '".$objUsuario->getEndereco()."',
            '".$objUsuario->getBairo()."',
            '".$objUsuario->getCidade()."',
            '".$objUsuario->getEstado()."',
            ".$objUsuario->getIdUsuario()."
            
        );
";

        mysql_query($sql, $conexao);

        $retorno = $sql;
        mysql_close($conexao);
        return $retorno;
    }

    public function Atualizar($codigo,$nome,$cpf,$data_nascimento
        ,$telefone,$celular, $email, $cep, $endereco,
                              $numero,$complemento,$bairro,$cidade,$uf,$login
        ,$senha,$status,$cod)
    {
        session_start();
        $conexao = AbreBancoJP();

        $sql = " UPDATE
			`usuarios`
		SET

			`nome` = '".$nome."',
			`cpf` = '".$cpf."',
			`data_nascimento` = '".$data_nascimento."',
			`telefone` = '".$telefone."',
			`celular` = '".$celular."',
			`email` = '".$email()."',
			`cep` = '".$cep()."',
            `complemento` = '".$complemento()."',
            `numero` = '".$numero()."',
			`status`=1,
			`AtualizacaoDataHora` = current_timestamp(),
			`AtualizacaoUsuarioId` = ".$codigo().",
            `login` = '".$login()."',
            `senha` = '".$senha()."',
            `endereco` = '".$endereco()."',
            `bairro` =  '".$bairro()."',
            `cidade` = '".$cidade()."',
            `estado` = '".$uf()."'
			`AtualizacaoUsuarioId` = ".$codigo()."
		WHERE
			`idUsuario` = ".$codigo()."
		AND
			`idOrganizacao`= ".$_SESSION[idOrganizacao];


//        $sql="UPDATE
//			usuarios
//		SET
//			`telefone` = '".$objUsuario->getTelefone()."'
//			--`celular` = '".$objUsuario->getCelular()."'
//            -- `idDepartamento` = ".$objUsuario->getIdDepartamento().",
//			-- `email` = '".$objUsuario->getEmail()."',
//			-- `cep` =  '".$objUsuario->getCep()."',
//           -- `numero` =  '".$objUsuario->getNumero()."',
//          --  `complemento` = '".$objUsuario->getComplemento()."',
//		-- `AtualizacaoDataHora` = current_timestamp(),
//			-- `AtualizacaoUsuarioId` = ".$objUsuario->getIdUsuario().",
//			-- parte adicionada
//			/*
//			`login` = '".$objUsuario->getLogin()."',
//            `senha` = '".$objUsuario->getSenha()."',
//            `endereco` = '".$objUsuario->getEndereco()."',
//            `bairro` =  '".$objUsuario->getBairo()."',
//            `cidade` = '".$objUsuario->getCidade()."',
//            `estado` = '".$objUsuario->getEstado()."',
//            `nome` = '".$objUsuario->getNome()."',
//			`cpf` = '".$objUsuario->getCpf()."',
//			`data_nascimento` = '".$objUsuario->getDataNasc()."'
//		*/
//		WHERE
//			`idUsuario` = ".$objUsuario->getIdUsuario()."
//
//		 AND
//			`idOrganizacao`= $_SESSION[idOrganizacao]";


        mysql_query($sql, $conexao);
        $retorno = "1";
        mysql_close($conexao);
        return $retorno;
    }


//    public function Excluir(Usuario $usuario)
//    {
//        session_start();
//        $conexao = AbreBancoJP();
//
//        $sql = "UPDATE
//			`usuarios`
//		SET
//			`status` = 0,
//			`AtualizacaoDataHora` = current_timestamp()
//           -- `AtualizacaoUsuarioId` = ".$usuario->getIdUsuario()."
//		WHERE
//			`idUsuario` = ".$usuario->getIdUsuario()."
//		AND
//			`idOrganizacao`= ".$_SESSION[idOrganizacao];
//
//        mysql_query($sql, $conexao);
//        $retorno = "1";
//        mysql_close($conexao);
//
//        return $retorno;
//    }


    
//    function menu(){
//
//        $conexao = AbreBancoJP();
//
//        $sql = "SELECT m.idMenu AS codgrupo, m.nome AS grupo, s.idSubmenu AS codsubgrupo, IFNULL(s.nome, '') AS subgrupo FROM menu AS m
//            LEFT JOIN sub_menu AS s ON s.idMenu = m.idMenu group by m.nome";
//
//        $Tb = mysql_query($sql, $conexao);
//
//        if(mysql_num_rows($Tb) <= 0){
//            echo '0';
//            mysql_close($conexao);
//            return;
//        }
//
//        while($linha = mysql_fetch_assoc($Tb)){
//
//            $json[] = array(
//                'id_menu' => $linha['codgrupo'],
//                'nome_menu' => $linha['grupo'],
//                'id_submenu' => $linha['codsubgrupo']
//            );
//        }
//
//        echo json_encode($json);
//        mysql_close($conexao);
//        
//    }
//
//    function subMenu(){
//        $conexao = AbreBancoJP();
//
//        $query = "SELECT s.nome, s.idSubmenu FROM sub_menu s where s.idMenu=" . $_POST['id_menu'];
//
//        $query = mysql_query($query, $conexao);
//
//        while($row=mysql_fetch_row($query)){
//
//            $json[] = array(
//                'id_submenu' => $row['1'],
//                'nome_submenu' => $row['0'],
//                //'id_menu' => $_POST['id_menu']//teste
//            );
//        }
//        echo json_encode($json);
//        mysql_close($conexao);
//    }


    public function Excluir($id)
    {
        session_start();
        $conexao=AbreBancoJP();


        $sql="	UPDATE 
			`usuarios`
		SET
			`status` = 0,
			`AtualizacaoDataHora` = current_timestamp()
           
		WHERE 
			
			  `idUsuario` = 1;";

        mysql_query($sql, $conexao);


        $retorno = "1";
        mysql_close($conexao);
        return $retorno;
    }
}