
/*
	AUTOR: JOAO PAULO
	DATA: 25/07/2015
	VERSÃO: 0.0.0.1
	DESC: MANTÉM CLIENTES
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS USP_MANTER_USUARIOS $$

CREATE PROCEDURE USP_MANTER_USUARIOS
(
	NOME_ VARCHAR(30),
    ID_ORGANIZACAO INT,
    ID_DEPARTAMENTO INT,
    STATUS_ BIT,
    PESQUISA VARCHAR(50),
    CPF VARCHAR(20),
    DATA_NASC DATETIME,
    TELEFONE VARCHAR(20),
    CELULAR VARCHAR(20),
    EMAIL VARCHAR(50),
    CEP VARCHAR(12),
    ENDERECO VARCHAR(100),
    NUMERO VARCHAR(20),
    COMPLEMENT0 VARCHAR(20),	
    ID_USUARIO INT,
    LOGIN VARCHAR(15),
    SENHA VARCHAR(15),
    ID_PARAMETRO_CONSULTA INT 	
)
BEGIN
	
	IF(ID_PARAMETRO_CONSULTA = 0)
	THEN
		INSERT INTO `usuarios`
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
            `senha`
		)
        VALUES
		(
			ID_ORGANIZACAO,
            ID_DEPARTAMENTO,
			NOME,
			CPF,
			DATA_NASC,
			TELEFONE,
			CELULAR,
			EMAIL,
			CEP,
            COMPLEMENTO,
            NUMERO,
			1,
			current_timestamp(),
			ID_USUARIO,
			NULL,
			NULL,
            LOGIN,
            SENHA
        );

	ELSEIF(ID_PARAMETRO_CONSULTA = 1)
    THEN
		UPDATE 
			usuarios
		SET
			`telefone` = TELEFONE,
			`celular` = CELULAR,
            `idDepartamento` = ID_DEPARTAMENTO,
			`email` = EMAIL,
			`cep` =  CEP,
            `numero` =  NUMERO,
            `complemento` = COMPLEMENTO,
			`AtualizacaoDataHora` = current_timestamp(),
			`AtualizacaoUsuarioId` = ID_USUARIO
		WHERE 
			`idUsuario` = ID_USUARIO
		AND
			`idOrganizacao`= ID_ORGANIZACAO;
            
	ELSEIF(ID_PARAMETRO_CONSULTA = 2)
    THEN
		UPDATE 
			usuarios
		SET
			`status` = 0,
			`AtualizacaoDataHora` = current_timestamp(),
            `AtualizacaoUsuarioId` = ID_USUARIO
		WHERE 
			`idUsuario` = ID_USUARIO
		AND
			`idOrganizacao`= ID_ORGANIZACAO;
	
    ELSEIF(ID_PARAMETRO_CONSULTA = 3)
    THEN
		SELECT 
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
			,	CadastroDataHora
			,	CadastroUsuarioId
			,	AtualizacaoDataHora
			,	AtualizacaoUsuarioId
		FROM 
			usuarios 
		WHERE
			(idUsuario= ID_USUARIO OR ID_USUARIO IS NULL)
            AND
            (
				(nome LIKE ('%'+PESQUISA+'%') OR PESQUISA IS NULL)
                OR
                (telefone LIKE ('%'+PESQUISA+'%') OR PESQUISA IS NULL)
			)
		AND 
			status=1
		AND
			idOrganizacao = ID_ORGANIZACAO;
            
	END IF;
END$$

DELIMITER ;



