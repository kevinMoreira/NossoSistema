
/*
	AUTOR: JOAO PAULO
	DATA: 05/07/2015
	VERSÃO: 0.0.0.1
	DESC: MANTÉM CLIENTES
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS USP_MANTER_CLIENTES $$

CREATE PROCEDURE USP_MANTER_CLIENTES
(
	NOME_ VARCHAR(30),
    ID_ORGANIZACAO INT,
    ID_CATEGORIA INT,
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
    ID_CLIENTE INT,
    ID_PARAMETRO_CONSULTA INT 	
)
BEGIN
	
	IF(ID_PARAMETRO_CONSULTA = 0)
	THEN
		INSERT INTO `cliente`
		(
			`idOrganizacao`,
			`nome`,
			`cpf`,
			`data_nascimento`,
			`telefone`,
			`celular`,
			`email`,
			`cep`,
            `numero`,
			`complemento`,
			`status`,
			`CadastroDataHora`,
			`CadastroUsuarioId`,
			`AtualizacaoDataHora`,
			`AtualizacaoUsuarioId`
		)
        VALUES
		(
			ID_ORGANIZACAO,
			NOME_,
			CPF,
			DATA_NASC,
			TELEFONE,
			CELULAR,
			EMAIL,
			CEP,
			NUMERO,
            COMPLEMENTO,
			1,
			current_timestamp(),
			NULL,
			NULL,
			NULL
        );

	ELSEIF(ID_PARAMETRO_CONSULTA = 1)
    THEN
		UPDATE 
			cliente
		SET
			`telefone` = TELEFONE,
			`celular` = CELULAR,
			`email` = EMAIL,
			`cep` =  CEP,
            `numero` =  NUMERO,
            `complemento` = COMPLEMENTO,
			`AtualizacaoDataHora` = current_timestamp(),
			`AtualizacaoUsuarioId` = ID_USUARIO
		WHERE 
			`idCliente` = ID_CLIENTE
		AND
			`idOrganizacao`= ID_ORGANIZACAO;
            
	ELSEIF(ID_PARAMETRO_CONSULTA = 2)
    THEN
		UPDATE 
			cliente
		SET
			`status` = 0,
			`AtualizacaoDataHora` = current_timestamp(),
            `AtualizacaoUsuarioId` = ID_USUARIO
		WHERE 
			`idCliente` = ID_CLIENTE
		AND
			`idOrganizacao`= ID_ORGANIZACAO;
	
    ELSEIF(ID_PARAMETRO_CONSULTA = 3)
    THEN
		SELECT 
				nome
            ,	idCliente
			,	idOrganizacao
			,	nome
			,	cpf
			,	data_nascimento
			,	telefone
			,	celular
			,	email
			,	cep
			,	endereco
			,	numero
			,	complemento
			,	bairro
			,	cidade
			,	uf
			,	status
			,	CadastroDataHora
			,	CadastroUsuarioId
			,	AtualizacaoDataHora
			,	AtualizacaoUsuarioId
		FROM 
			cliente 
		WHERE
			(IDCLIENTE= ID_CLIENTE OR ID_CLIENTE IS NULL)
            AND
            (
				(NOME LIKE ('%'+PESQUISA+'%') OR PESQUISA IS NULL)
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



