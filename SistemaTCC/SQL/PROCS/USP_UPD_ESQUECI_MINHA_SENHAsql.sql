
/*
	AUTOR: JOAO PAULO
	DATA: 14/06/2015
	VERSÃO: 0.0.0.1
	DESC: ATUALIZA SENHA DO USUÁRIO COM NÚMERO ALEATÓRIO
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS USP_UPD_ESQUECI_MINHA_SENHA $$

CREATE PROCEDURE USP_UPD_ESQUECI_MINHA_SENHA
(
	EMAIL_ VARCHAR(30)
)
BEGIN       
	-- VARIÁVEIS 
    DECLARE IdUsuarioAux INT;
    DECLARE COUNT_ INT;
	DECLARE NOVASENHA INT;
         
     -- RETORNA NUMERO DE CONTAS COM O MESMO EMAIL
    SELECT COUNT(*) INTO COUNT_ FROM usuarios WHERE login = EMAIL_;
	
    -- VERIFICA SE TEM MAIS DE UMA CONTA COM O MESMO EMAIL
    IF (COUNT_ = 1)
    THEN
		-- SELECIONA O ID DO USUÁRIO
		SELECT idUsuario INTO IdUsuarioAux FROM usuarios WHERE login = EMAIL_;
		-- GERA UMA SENHA 
		SELECT (FLOOR(RAND() * 1000000)) INTO NOVASENHA FROM DUAL;
        
		-- ATUALIZA COM A NOVA SENHA
		UPDATE
			usuarios
		SET
			SENHA = MD5(NOVASENHA)
		WHERE
			idUsuario = IdUsuarioAux;	
          
		-- RETORNA OS DADOS DO USUÁRIO
		SELECT 
				NOVASENHA as senha
			, 	usu.login as login 
            ,	org.nome as organizacao
            ,	usu.email as email
            ,	usu.nome as nome
        FROM 
			usuarios as usu
		INNER JOIN
			organizacao as org
		on
			org.idOrganizacao = usu.idOrganizacao
		WHERE 
			idUsuario = idUsuarioAux;
    else
		-- RETORNA ZERO CASO HAJA MAIS DE UMA CONTA COM O MESMO EMAIL
        SELECT 0;
	end if;     
END$$

DELIMITER ;



