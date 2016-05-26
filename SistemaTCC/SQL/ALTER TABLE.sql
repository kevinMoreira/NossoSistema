-- ALTER TABLE usuarios ADD CadastroDataHora DATETIME NULL;
-- ALTER TABLE usuarios ADD CadastroUsuarioId INT NULL;
-- ALTER TABLE usuarios ADD AtualizacaoDataHora DATETIME NULL;
-- ALTER TABLE usuarios ADD AtualizacaoUsuarioId INT NULL;
alter table usuarios modify token nvarchar(200) unique key null;
ALTER TABLE organizacao ADD Cnpj varchar(20) NULL;
ALTER TABLE organizacao ADD Telefone varchar(20) NULL;
ALTER TABLE organizacao ADD Email varchar(50) NULL;
ALTER TABLE organizacao ADD Cep varchar(20) NULL;
ALTER TABLE organizacao ADD Complemento varchar(50) NULL;

ALTER TABLE produto ADD CodigoDeBarras VARCHAR(20) NULL;
ALTER TABLE usuarios ADD Token varchar(400) null;
ALTER TABLE usuarios ADD DataValidadeToken datetime null;
alter table usuarios modify Token varchar(400) unique key;
ALTER TABLE usuarios ADD FlagAtivacaoToken bit default 0;

ALTER TABLE categoria ADD CadastroDataHora DATETIME NULL;
ALTER TABLE categoria ADD CadastroUsuarioId INT NULL;
ALTER TABLE categoria ADD AtualizacaoDataHora DATETIME NULL;
ALTER TABLE categoria ADD AtualizacaoUsuarioId INT NULL;

ALTER TABLE cliente ADD CadastroDataHora DATETIME NULL;
ALTER TABLE cliente ADD CadastroUsuarioId INT NULL;
ALTER TABLE cliente ADD AtualizacaoDataHora DATETIME NULL;
ALTER TABLE cliente ADD AtualizacaoUsuarioId INT NULL;

ALTER TABLE conta ADD CadastroDataHora DATETIME NULL;
ALTER TABLE conta ADD CadastroUsuarioId INT NULL;
ALTER TABLE conta ADD AtualizacaoDataHora DATETIME NULL;
ALTER TABLE conta ADD AtualizacaoUsuarioId INT NULL;

ALTER TABLE controle_menu ADD CadastroDataHora DATETIME NULL;
ALTER TABLE controle_menu ADD CadastroUsuarioId INT NULL;
ALTER TABLE controle_menu ADD AtualizacaoDataHora DATETIME NULL;
ALTER TABLE controle_menu ADD AtualizacaoUsuarioId INT NULL;

ALTER TABLE controle_submenu ADD CadastroDataHora DATETIME NULL;
ALTER TABLE controle_submenu ADD CadastroUsuarioId INT NULL;
ALTER TABLE controle_submenu ADD AtualizacaoDataHora DATETIME NULL;
ALTER TABLE controle_submenu ADD AtualizacaoUsuarioId INT NULL;

ALTER TABLE departamento ADD CadastroDataHora DATETIME NULL;
ALTER TABLE departamento ADD CadastroUsuarioId INT NULL;
ALTER TABLE departamento ADD AtualizacaoDataHora DATETIME NULL;
ALTER TABLE departamento ADD AtualizacaoUsuarioId INT NULL;

ALTER TABLE FORNECEDOR ADD CadastroDataHora DATETIME NULL;
ALTER TABLE FORNECEDOR ADD CadastroUsuarioId INT NULL;
ALTER TABLE FORNECEDOR ADD AtualizacaoDataHora DATETIME NULL;
ALTER TABLE FORNECEDOR ADD AtualizacaoUsuarioId INT NULL;

ALTER TABLE item_venda ADD CadastroDataHora DATETIME NULL;
ALTER TABLE item_venda ADD CadastroUsuarioId INT NULL;
ALTER TABLE item_venda ADD AtualizacaoDataHora DATETIME NULL;
ALTER TABLE item_venda ADD AtualizacaoUsuarioId INT NULL;

ALTER TABLE loteprodutos ADD CadastroDataHora DATETIME NULL;
ALTER TABLE loteprodutos ADD CadastroUsuarioId INT NULL;
ALTER TABLE loteprodutos ADD AtualizacaoDataHora DATETIME NULL;
ALTER TABLE loteprodutos ADD AtualizacaoUsuarioId INT NULL;

ALTER TABLE menu ADD CadastroDataHora DATETIME NULL;
ALTER TABLE menu ADD CadastroUsuarioId INT NULL;
ALTER TABLE menu ADD AtualizacaoDataHora DATETIME NULL;
ALTER TABLE menu ADD AtualizacaoUsuarioId INT NULL;

ALTER TABLE organizacao ADD CadastroDataHora DATETIME NULL;
ALTER TABLE organizacao ADD CadastroUsuarioId INT NULL;
ALTER TABLE organizacao ADD AtualizacaoDataHora DATETIME NULL;
ALTER TABLE organizacao ADD AtualizacaoUsuarioId INT NULL;

ALTER TABLE pagamento ADD CadastroDataHora DATETIME NULL;
ALTER TABLE pagamento ADD CadastroUsuarioId INT NULL;
ALTER TABLE pagamento ADD AtualizacaoDataHora DATETIME NULL;
ALTER TABLE pagamento ADD AtualizacaoUsuarioId INT NULL;

ALTER TABLE perdas ADD CadastroDataHora DATETIME NULL;
ALTER TABLE perdas ADD CadastroUsuarioId INT NULL;
ALTER TABLE perdas ADD AtualizacaoDataHora DATETIME NULL;
ALTER TABLE perdas ADD AtualizacaoUsuarioId INT NULL;

ALTER TABLE permissoes ADD CadastroDataHora DATETIME NULL;
ALTER TABLE permissoes ADD CadastroUsuarioId INT NULL;
ALTER TABLE permissoes ADD AtualizacaoDataHora DATETIME NULL;
ALTER TABLE permissoes ADD AtualizacaoUsuarioId INT NULL;

ALTER TABLE produto ADD CadastroDataHora DATETIME NULL;
ALTER TABLE produto ADD CadastroUsuarioId INT NULL;
ALTER TABLE produto ADD AtualizacaoDataHora DATETIME NULL;
ALTER TABLE produto ADD AtualizacaoUsuarioId INT NULL;

ALTER TABLE sub_menu ADD CadastroDataHora DATETIME NULL;
ALTER TABLE sub_menu ADD CadastroUsuarioId INT NULL;
ALTER TABLE sub_menu ADD AtualizacaoDataHora DATETIME NULL;
ALTER TABLE sub_menu ADD AtualizacaoUsuarioId INT NULL;

ALTER TABLE venda ADD CadastroDataHora DATETIME NULL;
ALTER TABLE venda ADD CadastroUsuarioId INT NULL;
ALTER TABLE venda ADD AtualizacaoDataHora DATETIME NULL;
ALTER TABLE venda ADD AtualizacaoUsuarioId INT NULL;