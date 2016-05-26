
/*
	AUTOR: JOAO PAULO
	DATA: 05/06/2015
	VERSÃO: 0.0.0.1
	DESC: CADASTRA NOVO USUÁRIO ADM PARA O SISTEMA ATRAVÉS DO CADASTRE-SE
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS USP_INS_CADASTRO_USUARIO $$

CREATE PROCEDURE USP_INS_CADASTRO_USUARIO
(
	ORGANIZACAO_ VARCHAR(30),
	NOME VARCHAR(30),
	TELEFONE VARCHAR(30),
	EMAIL VARCHAR(30),
	SENHA VARCHAR(30)	
)
BEGIN
	
    -- VERIFICA SE JÁ EXISTE UM USUÁRIO COM MESMO LOGIN, CASO NÃO CRIA UM NOVO USUÁRIO
	IF(NOT exists(SELECT * FROM usuarios AS USU WHERE USU.login = EMAIL and status=1))
    THEN
		-- CRIA ORGANZACAO
		INSERT INTO organizacao
		(
			nome,
			STATUS,
			CadastroDataHora
		)
		VALUES
		(
			ORGANIZACAO_,
			1,
			CURRENT_TIMESTAMP()
		);
		-- RECUPERA ID DA NOVA ORGANIZACAO
		SET @ID_ORGANIZACAO = LAST_INSERT_ID();

		-- CRIA USUÁRIO
		INSERT INTO usuarios
		(
			idOrganizacao,
			idDepartamento,
			nome,
			cpf,
			telefone,
			email,
			login,
			senha,
			permissao,
			STATUS,
			CadastroDataHora,
            Token,
            DataValidadeToken
		)
		VALUES
		(
			@ID_ORGANIZACAO,
			NULL,
			NOME,
			NULL,
			TELEFONE,
			EMAIL,
			EMAIL,
			MD5(SENHA),
			2,
			1,
			CURRENT_TIMESTAMP(),
            (SELECT md5(FLOOR(RAND() * 1000000))),-- TOKEN
            (select DATE_ADD(current_timestamp(), INTERVAL 7 DAY))-- DATA VALIDADE TOKEN DATA HOJE + 7 DIAS
		);
		-- RECUPERA ID DO NOVO USUÁRIO
		SET @ID_NOVO_USUARIO = LAST_INSERT_ID();
		
        -- LIBERACAO DE MENU
		INSERT controle_menu
		(
			idUsuario,
			idMenu,
			idOrganizacao,
			CadastroDataHora        
		)
		SELECT
			@ID_NOVO_USUARIO,
			idMenu,
			@ID_ORGANIZACAO,
			CURRENT_TIMESTAMP()
		FROM 
			menu
		WHERE
			status = 1;
			
		-- LIBERACAO DE SUB MENU
		INSERT controle_submenu
		(
			idUsuario,
			idSubMenu,
			idOrganizacao,
			CadastroDataHora        
		)
		SELECT
			@ID_NOVO_USUARIO,
			idSubMenu,
			@ID_ORGANIZACAO,
			CURRENT_TIMESTAMP()
		FROM 
			sub_menu
		WHERE
			status = 1;
		
        -- RECUPERA INFORMAÇÕES DO NOVO USUÁRIO
		SELECT 
				nome
			,	email
            ,	telefone
            ,	Token
            , 	CadastroDataHora
		FROM 
			usuarios
		WHERE
			idUsuario = @ID_NOVO_USUARIO;
	ELSE
		SELECT 0;
	END IF;
END$$

DELIMITER ;



