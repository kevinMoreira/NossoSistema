
/*
	AUTOR: JOAO PAULO
	DATA: 21/06/2015
	VERSÃO: 0.0.0.1
	DESC: MANTÉM AS CATEGORIAS
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS USP_MANTER_CATEGORIAS $$

CREATE PROCEDURE USP_MANTER_CATEGORIAS
(
	NOME_ VARCHAR(30),
    ID_ORGANIZACAO INT,
    ID_CATEGORIA INT,
    STATUS_ BIT,
    PESQUISA VARCHAR(50),
    ID_PARAMETRO_CONSULTA INT 	
)
BEGIN
	
	IF(ID_PARAMETRO_CONSULTA = 0)
	THEN

		INSERT INTO categoria
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
			ID_ORGANIZACAO,
			NOME_,
			1,
			current_timestamp(),
			NULL,
			NULL,
			NULL
        );

	ELSEIF(ID_PARAMETRO_CONSULTA = 1)
    THEN
		UPDATE 
			`categoria`
		SET
			`nomeCategoria` = NOME_,
			`status` = STATUS_,
			`AtualizacaoDataHora` = current_timestamp()
		WHERE 
			`idCategoria` = ID_CATEGORIA
		AND
			`idOrganizacao`= ID_ORGANIZACAO;
            
	ELSEIF(ID_PARAMETRO_CONSULTA = 2)
    THEN
		UPDATE 
			`categoria`
		SET
			`status` = 0,
			`AtualizacaoDataHora` = current_timestamp()
		WHERE 
			`idCategoria` = ID_CATEGORIA
		AND
			`idOrganizacao`= ID_ORGANIZACAO;
	
    ELSEIF(ID_PARAMETRO_CONSULTA = 3)
    THEN
		SELECT 
				idCategoria 
			,	nomeCategoria
		FROM 
			categoria 
		WHERE
			(idCategoria= ID_CATEGORIA OR ID_CATEGORIA IS NULL)
            AND
            (nomeCategoria LIKE CONCAT('%', PESQUISA, '%') OR PESQUISA IS NULL)
		AND 
			status=1
		AND
			idOrganizacao = ID_ORGANIZACAO;
            
	END IF;
END$$

DELIMITER ;



