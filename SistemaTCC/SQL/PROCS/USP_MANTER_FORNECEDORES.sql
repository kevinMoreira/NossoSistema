        

/*
	AUTOR: JOAO PAULO
	DATA: 21/06/2015
	VERSÃO: 0.0.0.1
	DESC: MANTÉM OS PRODUTOS
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS USP_MANTER_FORNECEDORES $$

CREATE PROCEDURE USP_MANTER_FORNECEDORES
(
	
    ID_ORGANIZACAO INT,
    ID_FORNECEDOR INT,
    STATUS_ BIT,
    PESQUISA VARCHAR(50),
	NOME_  VARCHAR(50),
	CNPJ_  VARCHAR(20),
	TELEFONE_  VARCHAR(20),
	EMAIL_  VARCHAR(50),
	CEP_  VARCHAR(10),
	ENDERECO_  VARCHAR(50),
	NUMERO_  INT,
	COMPLEMENTO_  VARCHAR(50),
	BAIRRO_  VARCHAR(50),
	CIDADE_  VARCHAR(50),
	ESTADO_  VARCHAR(50),
    ID_PARAMETRO_CONSULTA INT 	
)
BEGIN
	
	IF(ID_PARAMETRO_CONSULTA = 0)
	THEN

		INSERT INTO `fornecedor`
		(
			`idOrganizacao`,
			`nome`,
			`cnpj`,
			`telefone`,
			`email`,
			`cep`,
			`endereco`,
			`numero`,
			`complemento`,
			`bairro`,
			`cidade`,
			`estado`,
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
			CNPJ_,
			TELEFONE_,
			EMAIL_,
			CEP_,
			ENDERECO_,
			NUMERO_,
			COMPLEMENTO_,
			BAIRRO_,
			CIDADE_,
			ESTADO_,
			1,
			current_timestamp(),
			NULL,
			NULL,
			NULL
        );

	ELSEIF(ID_PARAMETRO_CONSULTA = 1)
    THEN
		UPDATE 
			`fornecedor`
		SET
			`nome` = NOME_,
			`cnpj` = CNPJ_,
			`telefone` = TELEFONE_,
			`email` = EMAIL_,
			`cep` = CEP_,
			`endereco` = ENDERECO_,
			`numero` = NUMERO_,
			`complemento` = COMPLEMENTO_,
			`bairro` = BAIRRO_,
			`cidade` = CIDADE_,
			`estado` = ESTADO_,
			`status` = 1,
			`AtualizacaoDataHora` = current_timestamp()
		WHERE 
			`idFornecedor` = ID_FORNECEDOR
		AND
			`idOrganizacao` = ID_ORGANIZACAO;

	ELSEIF(ID_PARAMETRO_CONSULTA = 2)
    THEN
		UPDATE 
			`fornecedor`
		SET
			`status` = 0,
			`AtualizacaoDataHora` = current_timestamp()
		WHERE 
			`idFornecedor` = ID_FORNECEDOR
		AND
			`idOrganizacao` = ID_ORGANIZACAO;

	ELSEIF(ID_PARAMETRO_CONSULTA = 3)
    THEN
		SELECT 
			idFornecedor
		,	idOrganizacao
		,	nome
		,	cnpj
		,	telefone
		,	email
		,	cep
		,	endereco
		,	numero
		,	complemento
		,	bairro
		,	cidade
		,	estado
		,	status
		,	CadastroDataHora
		,	CadastroUsuarioId
		,	AtualizacaoDataHora
		,	AtualizacaoUsuarioId
		from 
			fornecedor 
		where 
			(nome LIKE CONCAT('%'+PESQUISA+'%') OR PESQUISA IS NULL)
		AND
			(telefone LIKE CONCAT('%'+PESQUISA+'%') OR PESQUISA IS NULL)
		AND
			(cnpj  LIKE CONCAT('%'+PESQUISA+'%') OR PESQUISA IS NULL)
		AND
			(idfornecedor LIKE ('%'+PESQUISA+'%') OR PESQUISA IS NULL)
		and 
			status=1 
		and 
			idOrganizacao = ID_ORGANIZACAO;
           
	END IF;
END$$

DELIMITER ;



