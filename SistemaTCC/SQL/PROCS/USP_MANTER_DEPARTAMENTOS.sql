
/*
	AUTOR: JOAO PAULO
	DATA: 05/07/2015
	VERSÃO: 0.0.0.1
	DESC: MANTÉM CLIENTES
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS USP_MANTER_DEPARTAMENTOS $$

CREATE PROCEDURE USP_MANTER_DEPARTAMENTOS
(
	NOME_ VARCHAR(30),
    ID_ORGANIZACAO INT,
    ID_DEPARTAMENTO INT,
    STATUS_ BIT,
    PESQUISA VARCHAR(50),
    ID_PARAMETRO_CONSULTA INT 	
)
BEGIN

	IF(ID_PARAMETRO_CONSULTA = 0)
	THEN
		INSERT INTO `departamento`
		(
			idDepartamento,
			idOrganizacao,
			nome,
			status,
			CadastroDataHora,
			CadastroUsuarioId,
			AtualizacaoDataHora,
			AtualizacaoUsuarioId
		)
        VALUES
		(
			ID_DEPARTAMENTO,
			ID_ORGANIZACAO,
			NOME,
			1,
			current_timestamp(),
			ID_USUARIO,
			NULL,
			NULL
        );

	ELSEIF(ID_PARAMETRO_CONSULTA = 1)
    THEN
		UPDATE 
			departamento
		SET
			`nome` = NOME,
			`AtualizacaoDataHora` = current_timestamp(),
			`AtualizacaoUsuarioId` = ID_USUARIO
		WHERE 
			`idDepartamento` = ID_DEPARTAMENTO
		AND
			`idOrganizacao`= ID_ORGANIZACAO;
            
	ELSEIF(ID_PARAMETRO_CONSULTA = 2)
    THEN
		UPDATE 
			departamento
		SET
			`status` = 0,
			`AtualizacaoDataHora` = current_timestamp(),
            `AtualizacaoUsuarioId` = ID_USUARIO
		WHERE 
			`idDepartamento` = ID_DEPARTAMENTO
		AND
			`idOrganizacao`= ID_ORGANIZACAO;
	
    ELSEIF(ID_PARAMETRO_CONSULTA = 3)
    THEN
		SELECT 
				idDepartamento
			,	idOrganizacao
			,	nome
			,	status
			,	CadastroDataHora
			,	CadastroUsuarioId
			,	AtualizacaoDataHora
			,	AtualizacaoUsuarioId
		FROM 
			departamento 
		WHERE
			(idDepartamento= ID_DEPARTAMENTO OR ID_DEPARTAMENTO IS NULL)
		AND
			(nome LIKE ('%'+PESQUISA+'%') OR PESQUISA IS NULL)
		AND 
			status=1
		AND
			idOrganizacao = ID_ORGANIZACAO;
            
	END IF;
END$$

DELIMITER ;



