
/*
	AUTOR: JOAO PAULO
	DATA: 14/06/2015
	VERSÃO: 0.0.0.1
	DESC: VALIDA TOKEN DE CADASTRO DE USUÁRIO
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS USP_SEL_VALIDA_TOKEN $$

CREATE PROCEDURE USP_SEL_VALIDA_TOKEN
(
	TOKEN_ VARCHAR(500) 
)
BEGIN       
        
     -- VERIFICA SE O TOKN EXISTE, SE EXISTIR RETORNA AS INFORMAÇOES DO USUÁRIO 
    IF(exists(SELECT * FROM usuarios WHERE TOKEN = TOKEN_ and FlagAtivacaoToken=0))
    THEN
	-- MARCA TOKEN UTILIZADO
		update
			usuarios
		SET
			FlagAtivacaoToken =1
		where
			Token = TOKEN_;
		
        -- RETORNA DADOS PARA POPULAR A SESSÃO DO USUÁRIO NO SISTEMA
		SELECT 
				USU.idUsuario AS codUsuario
            ,	USU.nome AS nome
            ,	USU.permissao AS permissao
            ,	USU.idOrganizacao AS idOrganizacao
            ,	ORG.nome AS nomeOrganizacao
		FROM
			usuarios AS USU
		INNER JOIN
			organizacao AS ORG
		ON
			ORG.idOrganizacao = USU.idOrganizacao
		WHERE
			USU.Token= TOKEN_
		AND
			usu.DataValidadeToken >= current_timestamp()
		AND
			USU.status=1
		AND
			ORG.status=1;
	else
		SELECT 0;
	END IF;
        
END$$

DELIMITER ;



