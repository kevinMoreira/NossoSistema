
-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 26/03/2016 às 20:33:42
-- Versão do Servidor: 10.0.23-MariaDB
-- Versão do PHP: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `u919637772_estoq`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `idOrganizacao` int(11) NOT NULL,
  `nomeCategoria` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `CadastroDataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`),
  KEY `FK_categoria_idOrganizacao` (`idOrganizacao`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `idOrganizacao`, `nomeCategoria`, `status`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`) VALUES
(1, 210, 'Teste', b'1', '2016-01-06 16:07:51', 227, NULL, NULL),
(2, 210, 'Teste', b'1', '2016-01-06 16:19:25', 227, NULL, NULL),
(3, 210, 'Testee', b'1', '2016-01-06 16:21:49', 227, NULL, NULL),
(4, 210, 'PENDRIVES TESTE', b'1', '2016-01-07 05:41:33', 227, NULL, NULL),
(5, 210, 'PEN DRIVE METAL ', b'1', '2016-01-07 11:46:30', 227, NULL, NULL),
(6, 1, 'Categ1', b'1', '2016-01-09 13:58:49', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `idOrganizacao` int(11) NOT NULL,
  `nome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cpf` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `data_nascimento` date NOT NULL,
  `telefone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `celular` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cep` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `endereco` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numero` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `complemento` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bairro` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cidade` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uf` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `CadastroDataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `FK_cliente_idOrganizacao` (`idOrganizacao`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`idCliente`, `idOrganizacao`, `nome`, `cpf`, `data_nascimento`, `telefone`, `celular`, `email`, `cep`, `endereco`, `numero`, `complemento`, `bairro`, `cidade`, `uf`, `status`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`) VALUES
(1, 1, 'nome', 'cpf', '2011-01-01', 'tel', 'cel', 'email', 'cep', 'end', 'n', '', 'bairro', 'cid', 'uf', b'1', '2016-01-07 03:13:26', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `conta`
--

CREATE TABLE IF NOT EXISTS `conta` (
  `idConta` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `saldoConta` decimal(10,2) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `CadastroDataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idConta`),
  KEY `FK_conta_idCliente` (`idCliente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `controle_menu`
--

CREATE TABLE IF NOT EXISTS `controle_menu` (
  `idControlemenu` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idMenu` int(11) NOT NULL,
  `idOrganizacao` int(11) NOT NULL,
  `CadastroDataHora` datetime DEFAULT NULL,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idControlemenu`),
  KEY `FK_controle_menu_idOrganizacao` (`idOrganizacao`),
  KEY `FK_controle_menu_idUsuario` (`idUsuario`),
  KEY `FK_controle_menu_idMenu` (`idMenu`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=233 ;

--
-- Extraindo dados da tabela `controle_menu`
--

INSERT INTO `controle_menu` (`idControlemenu`, `idUsuario`, `idMenu`, `idOrganizacao`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`) VALUES
(221, 2, 7, 1, NULL, NULL, NULL, NULL),
(222, 2, 2, 1, NULL, NULL, NULL, NULL),
(223, 2, 6, 1, NULL, NULL, NULL, NULL),
(224, 2, 5, 1, NULL, NULL, NULL, NULL),
(225, 2, 9, 1, NULL, NULL, NULL, NULL),
(226, 227, 2, 210, '2016-01-06 16:03:18', NULL, NULL, NULL),
(227, 227, 4, 210, '2016-01-06 16:03:18', NULL, NULL, NULL),
(228, 227, 5, 210, '2016-01-06 16:03:18', NULL, NULL, NULL),
(229, 227, 6, 210, '2016-01-06 16:03:18', NULL, NULL, NULL),
(230, 227, 7, 210, '2016-01-06 16:03:18', NULL, NULL, NULL),
(231, 227, 8, 210, '2016-01-06 16:03:18', NULL, NULL, NULL),
(232, 227, 9, 210, '2016-01-06 16:03:18', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `controle_submenu`
--

CREATE TABLE IF NOT EXISTS `controle_submenu` (
  `idControleSubMenu` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idSubMenu` int(11) NOT NULL,
  `idOrganizacao` int(11) NOT NULL,
  `CadastroDataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idControleSubMenu`),
  KEY `FK_controle_submenu_idOrganizacao` (`idOrganizacao`),
  KEY `FK_controle_submenu_idUsuario` (`idUsuario`),
  KEY `FK_controle_submenu_idSubMenu` (`idSubMenu`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=435 ;

--
-- Extraindo dados da tabela `controle_submenu`
--

INSERT INTO `controle_submenu` (`idControleSubMenu`, `idUsuario`, `idSubMenu`, `idOrganizacao`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`) VALUES
(406, 2, 1, 1, NULL, NULL, NULL, NULL),
(407, 2, 2, 1, NULL, NULL, NULL, NULL),
(408, 2, 3, 1, NULL, NULL, NULL, NULL),
(409, 2, 4, 1, NULL, NULL, NULL, NULL),
(410, 2, 6, 1, NULL, NULL, NULL, NULL),
(411, 2, 9, 1, NULL, NULL, NULL, NULL),
(412, 2, 7, 1, NULL, NULL, NULL, NULL),
(413, 2, 8, 1, NULL, NULL, NULL, NULL),
(414, 2, 10, 1, NULL, NULL, NULL, NULL),
(415, 2, 11, 1, NULL, NULL, NULL, NULL),
(416, 2, 12, 1, NULL, NULL, NULL, NULL),
(417, 2, 13, 1, NULL, NULL, NULL, NULL),
(418, 2, 14, 1, NULL, NULL, NULL, NULL),
(419, 2, 15, 1, NULL, NULL, NULL, NULL),
(420, 227, 1, 210, '2016-01-06 16:03:18', NULL, NULL, NULL),
(421, 227, 2, 210, '2016-01-06 16:03:18', NULL, NULL, NULL),
(422, 227, 3, 210, '2016-01-06 16:03:18', NULL, NULL, NULL),
(423, 227, 4, 210, '2016-01-06 16:03:18', NULL, NULL, NULL),
(424, 227, 5, 210, '2016-01-06 16:03:18', NULL, NULL, NULL),
(425, 227, 6, 210, '2016-01-06 16:03:18', NULL, NULL, NULL),
(426, 227, 7, 210, '2016-01-06 16:03:18', NULL, NULL, NULL),
(427, 227, 8, 210, '2016-01-06 16:03:18', NULL, NULL, NULL),
(428, 227, 9, 210, '2016-01-06 16:03:18', NULL, NULL, NULL),
(429, 227, 10, 210, '2016-01-06 16:03:18', NULL, NULL, NULL),
(430, 227, 11, 210, '2016-01-06 16:03:18', NULL, NULL, NULL),
(431, 227, 12, 210, '2016-01-06 16:03:18', NULL, NULL, NULL),
(432, 227, 13, 210, '2016-01-06 16:03:18', NULL, NULL, NULL),
(433, 227, 14, 210, '2016-01-06 16:03:18', NULL, NULL, NULL),
(434, 227, 15, 210, '2016-01-06 16:03:18', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `departamento`
--

CREATE TABLE IF NOT EXISTS `departamento` (
  `idDepartamento` int(11) NOT NULL AUTO_INCREMENT,
  `idOrganizacao` int(11) NOT NULL,
  `nome` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `CadastroDataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDepartamento`),
  KEY `FK_departamento_idOrganizacao` (`idOrganizacao`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Extraindo dados da tabela `departamento`
--

INSERT INTO `departamento` (`idDepartamento`, `idOrganizacao`, `nome`, `status`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`) VALUES
(1, 3, 'Comercial', b'1', NULL, NULL, NULL, NULL),
(2, 3, 'Outsourcing', b'1', NULL, NULL, NULL, NULL),
(3, 1, 'Soluções', b'1', NULL, NULL, NULL, NULL),
(4, 3, 'Infraestrutura', b'1', NULL, NULL, NULL, NULL),
(5, 3, 'RH', b'1', NULL, NULL, NULL, NULL),
(6, 3, 'Vendas', b'1', NULL, NULL, NULL, NULL),
(7, 1, 'Comercial', b'1', NULL, NULL, NULL, NULL),
(8, 1, 'Outsourcing', b'1', NULL, NULL, NULL, NULL),
(9, 1, 'Soluções', b'1', NULL, NULL, NULL, NULL),
(10, 1, 'RH', b'1', NULL, NULL, NULL, NULL),
(11, 1, 'infraestrutura', b'1', NULL, NULL, NULL, NULL),
(12, 2, 'Comercial', b'1', NULL, NULL, NULL, NULL),
(13, 2, 'Outsourcing', b'1', NULL, NULL, NULL, NULL),
(14, 2, 'Soluções', b'1', NULL, NULL, NULL, NULL),
(15, 2, 'RH', b'1', NULL, NULL, NULL, NULL),
(16, 2, 'infraestrutura', b'1', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE IF NOT EXISTS `fornecedor` (
  `idFornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `idOrganizacao` int(11) NOT NULL,
  `nome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cnpj` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `telefone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cep` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `endereco` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `complemento` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `bairro` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `cidade` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `status` bit(1) NOT NULL,
  `CadastroDataHora` datetime DEFAULT NULL,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFornecedor`),
  KEY `FK_fornecedor_idOrganizacao` (`idOrganizacao`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `fornecedor`
--

INSERT INTO `fornecedor` (`idFornecedor`, `idOrganizacao`, `nome`, `cnpj`, `telefone`, `email`, `cep`, `endereco`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `status`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`) VALUES
(1, 210, 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', b'1', '2016-01-07 05:47:54', 227, NULL, NULL),
(2, 1, 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', b'1', '2016-01-09 14:01:22', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_venda`
--

CREATE TABLE IF NOT EXISTS `item_venda` (
  `idItem` int(11) NOT NULL AUTO_INCREMENT,
  `idVenda` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `qtde` int(11) NOT NULL DEFAULT '1',
  `subTotal` float NOT NULL,
  `cancelado` bit(1) NOT NULL COMMENT 'se for 1 é cancelado',
  `CadastroDataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idItem`),
  KEY `FK_item_venda_idVenda` (`idVenda`),
  KEY `FK_item_venda_idProduto` (`idProduto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `LogAcessosUsuarios`
--

CREATE TABLE IF NOT EXISTS `LogAcessosUsuarios` (
  `LogAcessoUsuarioId` int(11) NOT NULL AUTO_INCREMENT,
  `UsuarioId` int(11) NOT NULL,
  `CadastroDataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LogAcessoUsuarioId`),
  KEY `FK_LogAcessosUsuarios_idUsuario` (`UsuarioId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Extraindo dados da tabela `LogAcessosUsuarios`
--

INSERT INTO `LogAcessosUsuarios` (`LogAcessoUsuarioId`, `UsuarioId`, `CadastroDataHora`) VALUES
(20, 2, '2016-01-07 11:37:44'),
(19, 2, '2016-01-07 11:04:33'),
(18, 227, '2016-01-07 10:31:56'),
(17, 227, '2016-01-07 10:19:20'),
(16, 227, '2016-01-07 10:15:32'),
(15, 227, '2016-01-07 10:13:23'),
(14, 227, '2016-01-07 05:47:11'),
(13, 227, '2016-01-07 05:43:02'),
(12, 227, '2016-01-07 05:36:07'),
(11, 227, '2016-01-07 05:29:23'),
(21, 227, '2016-01-07 14:14:39'),
(22, 227, '2016-01-08 10:18:28'),
(23, 227, '2016-01-08 15:35:05'),
(24, 2, '2016-01-09 13:57:27');

-- --------------------------------------------------------

--
-- Estrutura da tabela `loteprodutos`
--

CREATE TABLE IF NOT EXISTS `loteprodutos` (
  `idLote` int(11) NOT NULL AUTO_INCREMENT,
  `idOrganizacao` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `idFornecedor` int(11) NOT NULL,
  `valorCompra` float NOT NULL,
  `qtde` int(11) NOT NULL,
  `validade` date NOT NULL,
  `data` date NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `CadastroDataHora` datetime DEFAULT NULL,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLote`),
  KEY `FK_loteprodutos_idOrganizacao` (`idOrganizacao`),
  KEY `FK_loteprodutos_idFornecedor` (`idFornecedor`),
  KEY `FK_loteprodutos_idProduto` (`idProduto`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `loteprodutos`
--

INSERT INTO `loteprodutos` (`idLote`, `idOrganizacao`, `idProduto`, `idFornecedor`, `valorCompra`, `qtde`, `validade`, `data`, `status`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`) VALUES
(1, 210, 1, 1, 12, 1111, '2010-11-11', '2016-01-07', b'1', '2016-01-07 05:48:23', 227, NULL, NULL),
(2, 1, 2, 2, 1111, 93, '0000-00-00', '2016-01-09', b'1', '2016-01-09 14:02:05', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `idMenu` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) COLLATE utf8_unicode_ci DEFAULT '',
  `link` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `status` int(11) NOT NULL,
  `CadastroDataHora` datetime DEFAULT NULL,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMenu`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `menu`
--

INSERT INTO `menu` (`idMenu`, `nome`, `link`, `status`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`) VALUES
(2, 'Caixa', 'caixa.html', 1, NULL, NULL, NULL, NULL),
(5, 'Relatórios', '', 1, NULL, NULL, NULL, NULL),
(6, 'Despesas', '', 1, NULL, NULL, NULL, NULL),
(7, 'Cadastros', '', 1, NULL, NULL, NULL, NULL),
(8, 'Contate o desenvolvedor', '', 0, NULL, NULL, NULL, NULL),
(9, 'Visualizar', '', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `organizacao`
--

CREATE TABLE IF NOT EXISTS `organizacao` (
  `idOrganizacao` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `CadastroDataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  `Cnpj` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Telefone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Cep` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Complemento` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idOrganizacao`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=211 ;

--
-- Extraindo dados da tabela `organizacao`
--

INSERT INTO `organizacao` (`idOrganizacao`, `nome`, `status`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`, `Cnpj`, `Telefone`, `Email`, `Cep`, `Complemento`) VALUES
(1, 'Processor', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'IBM', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Microsoft', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(210, 'Gipentec', 1, '2016-01-06 16:03:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE IF NOT EXISTS `pagamento` (
  `idPagamento` int(11) NOT NULL AUTO_INCREMENT,
  `idOrganizacao` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `valor` float NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `CadastroDataHora` datetime DEFAULT NULL,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPagamento`),
  KEY `FK_pagamento_idOrganizacao` (`idOrganizacao`),
  KEY `FK_pagamento_idCliente` (`idCliente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `perdas`
--

CREATE TABLE IF NOT EXISTS `perdas` (
  `idPerda` int(11) NOT NULL AUTO_INCREMENT,
  `idOrganizacao` int(11) NOT NULL,
  `idLote` int(11) NOT NULL,
  `qtde` int(11) NOT NULL,
  `dataPerda` date NOT NULL,
  `motivoPerda` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CadastroDataHora` datetime DEFAULT NULL,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPerda`),
  KEY `FK_perdas_idOrganizacao` (`idOrganizacao`),
  KEY `FK_perdas_idLote` (`idLote`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissoes`
--

CREATE TABLE IF NOT EXISTS `permissoes` (
  `idPermissao` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) COLLATE utf8_unicode_ci DEFAULT '',
  `ativo` bit(1) DEFAULT b'1',
  `CadastroDataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPermissao`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `permissoes`
--

INSERT INTO `permissoes` (`idPermissao`, `nome`, `ativo`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`) VALUES
(1, 'Adm', b'1', NULL, NULL, NULL, NULL),
(2, 'User', b'1', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE IF NOT EXISTS `produto` (
  `idProduto` int(11) NOT NULL AUTO_INCREMENT,
  `idOrganizacao` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `nome` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `valorVenda` float NOT NULL,
  `status` bit(1) NOT NULL,
  `CadastroDataHora` datetime DEFAULT NULL,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  `CodigoDeBarras` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `FK_produto_idOrganizacao` (`idOrganizacao`),
  KEY `FK_produto_idCategoria` (`idCategoria`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`idProduto`, `idOrganizacao`, `idCategoria`, `nome`, `valorVenda`, `status`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`, `CodigoDeBarras`) VALUES
(1, 210, 4, 'TESTE', 1, b'1', '2016-01-07 05:46:10', 227, NULL, NULL, '11'),
(2, 1, 6, 'prod1', 12, b'1', '2016-01-09 13:59:21', 2, NULL, NULL, '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sub_menu`
--

CREATE TABLE IF NOT EXISTS `sub_menu` (
  `idSubMenu` int(11) NOT NULL AUTO_INCREMENT,
  `idMenu` int(11) NOT NULL,
  `nome` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `link` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `status` int(11) NOT NULL,
  `CadastroDataHora` datetime DEFAULT NULL,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSubMenu`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Extraindo dados da tabela `sub_menu`
--

INSERT INTO `sub_menu` (`idSubMenu`, `idMenu`, `nome`, `link`, `status`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`) VALUES
(1, 7, 'Cadastro de Clientes', 'cadastro-de-clientes.html', 1, NULL, NULL, NULL, NULL),
(2, 7, 'Cadastro de Produtos', 'cadastro-de-produtos.html', 1, NULL, NULL, NULL, NULL),
(3, 7, 'Cadastro de Usuários', 'cadastro-de-usuarios.html', 1, NULL, NULL, NULL, NULL),
(4, 7, 'Cadastro de Fornecedores', 'cadastro-de-fornecedores.html', 1, NULL, NULL, NULL, NULL),
(5, 7, 'Cadastro de Serviços', 'cadastro-de-servicos.html', 1, NULL, NULL, NULL, NULL),
(6, 7, 'Cadastro de Categoria', 'cadastro-de-categorias.html', 1, NULL, NULL, NULL, NULL),
(7, 5, 'Relatório Diário', 'relatorio-diario.html', 1, NULL, NULL, NULL, NULL),
(8, 5, 'Relatório Semanal', 'relatorio-semanal.html', 1, NULL, NULL, NULL, NULL),
(9, 6, 'Compra de Produtos', 'compra-de-produtos.html', 1, NULL, NULL, NULL, NULL),
(10, 9, 'Clientes', 'listar-clientes.html', 1, NULL, NULL, NULL, NULL),
(11, 9, 'Usuários', 'listar-usuarios.html', 1, NULL, NULL, NULL, NULL),
(12, 9, 'Produtos', 'listar-produtos.html', 1, NULL, NULL, NULL, NULL),
(13, 9, 'Fornecedores', 'listar-fornecedores.html', 1, NULL, NULL, NULL, NULL),
(14, 9, 'Lotes', 'listar-lotes.html', 1, NULL, NULL, NULL, NULL),
(15, 9, 'Estoque', 'listar-estoque.html', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `idOrganizacao` int(11) NOT NULL,
  `idDepartamento` int(11) DEFAULT NULL,
  `nome` varchar(200) COLLATE utf8_unicode_ci DEFAULT '',
  `cpf` varchar(14) COLLATE utf8_unicode_ci DEFAULT '',
  `data_nascimento` date DEFAULT NULL,
  `telefone` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `celular` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `cep` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `endereco` varchar(200) COLLATE utf8_unicode_ci DEFAULT '',
  `numero` varchar(10) COLLATE utf8_unicode_ci DEFAULT '',
  `complemento` varchar(200) COLLATE utf8_unicode_ci DEFAULT '',
  `bairro` varchar(200) COLLATE utf8_unicode_ci DEFAULT '',
  `cidade` varchar(200) COLLATE utf8_unicode_ci DEFAULT '',
  `estado` varchar(10) COLLATE utf8_unicode_ci DEFAULT '',
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT '',
  `login` varchar(200) COLLATE utf8_unicode_ci DEFAULT '',
  `senha` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `permissao` int(11) DEFAULT '0',
  `status` bit(1) DEFAULT b'1',
  `CadastroDataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  `token` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DataValidadeToken` datetime DEFAULT NULL,
  `FlagAtivacaoToken` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `Token` (`token`),
  KEY `FK_usuario_idOrganizacao` (`idOrganizacao`),
  KEY `FK_usuario_idDepartamento` (`idDepartamento`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=228 ;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `idOrganizacao`, `idDepartamento`, `nome`, `cpf`, `data_nascimento`, `telefone`, `celular`, `cep`, `endereco`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `email`, `login`, `senha`, `permissao`, `status`, `CadastroDataHora`, `CadastroUsuarioId`, `AtualizacaoDataHora`, `AtualizacaoUsuarioId`, `token`, `DataValidadeToken`, `FlagAtivacaoToken`) VALUES
(2, 1, 3, 'João Paulo', '37896155877', '1991-06-24', '23370426', '949096384', '04255001', 'rua sao joao climaco', '414', 'casa 3', 'sao joao climaco', 'sao paulo', 'sp', 'joaopaulo_391@hotmail.com', 'jpe_contato@live.com', '81dc9bdb52d04dc20036dbd8313ed055', 2, b'1', NULL, NULL, NULL, NULL, NULL, NULL, b'0'),
(22, 2, 12, 'Fernanda', '12312312311', '1111-12-11', '233165448', '999999999', '04209001', 'rua', '37', 'b', 'sao joao cliamco', 'sao paulo', 'sp', '@@@@@@', '698dc19d489c4e4db73e28a713eab07b', '81dc9bdb52d04dc20036dbd8313ed055', 2, b'1', NULL, NULL, NULL, NULL, NULL, NULL, b'0'),
(227, 210, NULL, 'Reginaldo', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 'vendas@gipentec.com', 'vendas@gipentec.com', '81dc9bdb52d04dc20036dbd8313ed055', 2, b'1', '2016-01-06 16:03:18', NULL, NULL, NULL, '750f5194f676631f59dea593a50e59d9', '2016-01-13 16:03:18', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE IF NOT EXISTS `venda` (
  `idVenda` int(11) NOT NULL AUTO_INCREMENT,
  `idOrganizacao` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL DEFAULT '0',
  `dataVenda` datetime DEFAULT CURRENT_TIMESTAMP,
  `horaVenda` time NOT NULL,
  `cancelado` bit(1) NOT NULL COMMENT 'se for 1 é cancelado',
  `CadastroDataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  `CadastroUsuarioId` int(11) DEFAULT NULL,
  `AtualizacaoDataHora` datetime DEFAULT NULL,
  `AtualizacaoUsuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idVenda`),
  KEY `FK_venda_idOrganizacao` (`idOrganizacao`),
  KEY `FK_venda_idCliente` (`idCliente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
