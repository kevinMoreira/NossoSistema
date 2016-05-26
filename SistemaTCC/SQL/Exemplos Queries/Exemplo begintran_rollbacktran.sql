select * from categoria where nomeCategoria like '%do%';

select * from usuarios where nome like '%joao%';


start transaction;

update 
	usuarios
set
	login='joao'
where 
	idUsuario = 2;    

	
rollback;
