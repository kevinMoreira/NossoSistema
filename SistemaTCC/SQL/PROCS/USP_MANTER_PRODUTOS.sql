
/*
	AUTOR: JOAO PAULO
	DATA: 21/06/2015
	VERSÃO: 0.0.0.1
	DESC: MANTÉM OS PRODUTOS
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS USP_MANTER_PRODUTOS $$

CREATE PROCEDURE USP_MANTER_PRODUTOS
(
	NOME_ VARCHAR(30),
    ID_ORGANIZACAO INT,
    ID_CATEGORIA INT,
    STATUS_ BIT,
    ID_PRODUTO INT,
    VALOR_VENDA DECIMAL(10,2),
    CODIGO_BARRAS VARCHAR(20),
    PESQUISA VARCHAR(50),
    ID_PARAMETRO_CONSULTA INT 	
)
BEGIN
	
	IF(ID_PARAMETRO_CONSULTA = 0)
	THEN

		INSERT INTO `produto`
		(
			`idOrganizacao`,
			`idCategoria`,
			`nome`,
			`valorVenda`,
			`status`,
			`CadastroDataHora`,
			`CadastroUsuarioId`,
			`AtualizacaoDataHora`,
			`AtualizacaoUsuarioId`,
			`CodigoDeBarras`
        )
		VALUES
		(
			ID_ORGANIZACAO,
			ID_CATEGORIA,
			NOME_,
			VALOR_VENDA,
			1,
			CURRENT_TIMESTAMP(),
			NULL,
			NULL,
			NULL,
			CODIGO_BARRAS
        );


	ELSEIF(ID_PARAMETRO_CONSULTA = 1)
    THEN
		UPDATE 
			`produto`
		SET
			`idCategoria` = ID_CATEGORIA,
			`nome` = NOME_,
			`valorVenda` = VALOR_VENDA,
			`status` = STATUS_,
			`AtualizacaoDataHora` = CURRENT_TIMESTAMP()
		WHERE 
			`idProduto` =ID_PRODUTO
		AND
			`idOrganizacao` = ID_ORGANIZACAO;

	ELSEIF(ID_PARAMETRO_CONSULTA = 2)
    THEN
		UPDATE 
			`produto`
		SET
			`status` = 0,
			`AtualizacaoDataHora` = CURRENT_TIMESTAMP()
		WHERE 
			`idProduto` =ID_PRODUTO
		AND
			`idOrganizacao` = ID_ORGANIZACAO;

	ELSEIF(ID_PARAMETRO_CONSULTA = 3)
    THEN
		SELECT 
				p.idProduto AS ID_PRODUTO
			,	p.nome AS NOME 
			, 	p.valorVenda AS VALOR_VENDA 
			, 	p.idCategoria AS ID_CATEGORIA
			, 	c.nomeCategoria AS NOME_CATEGORIA
        FROM 
			produto p
		INNER JOIN 
			categoria c 
		ON 
			c.idCategoria = p.idCategoria
		WHERE 
		       (p.nome LIKE CONCAT('%','',PESQUISA,'','%'));
		-- and 
		--	p.status=1 
		-- and 
		-- 	p.idOrganizacao = ID_ORGANIZACAO
		-- and 
		-- 	c.status=1 
		-- and 
		--	c.idOrganizacao = ID_ORGANIZACAO;
            
	END IF;
END$$

DELIMITER ;



