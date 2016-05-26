<?php
/***
 * @author kevin Rangel Moreira
 * @since 26/03/2016
 * classe conexão banco de dados com a classe produto
 */
require_once('../MySQL.php');
require_once('../Ent/Produto.php');
//adicionando classes da categoria
require_once('../Ent/Categoria.php');
require_once ('../Dao/dCategoria.php');


class dProduto{
	public function Obter(){
		$conexao= new MySQL();
		$objProduto = new Produto();
		

		$sql="set  ('','','','','','','',3,@PESQUISA) = '$pesquisa'; call USP_MANTER_PRODUTOS('','','','','','','',3,@PESQUISA);";
		$retorno = $conexao->execSP($sql);
		if($retorno != null)
		{

			$objProduto->setCodigo($retorno["CODIGO"]);
			$objProduto->setNome($retorno["NOME"]);
			$objProduto->setValor($retorno["VALOR_VENDA"]);
			$objProduto->setCategoria($retorno["NOME_CATEGORIA"]);
			$objProduto->setCategoria($retorno["ID_CATEGORIA"]);
		}
	
		else{
			$objProduto = $this->ConsultarWebServiceProduto($pesquisa);
			$this->Salvar($objProduto);
		}
			return $objProduto;
	}
	
	//Retorna endereÃ§o consultado no web service apimon
	private function ConsultarWebServiceEndereco($pesquisa){
		$objProduto = new Produto();
		$jsonProduto = file_get_contents('http://api.postmon.com.br/v1/cep/'.$pesquisa);
		$objProduto->setLogradouro(utf8_decode($jsonEndereco["Logradouro"]));
		$objProduto->setCodigo(utf8_decode($jsonProduto["CODIGO"]));
		$objProduto->setNome(utf8_decode($jsonProduto["NOME"]));
		$objProduto->setValor(utf8_decode($jsonProduto["VALOR_VENDA"]));
		$objProduto->setCategoria(utf8_decode($jsonProduto["NOME_CATEGORIA"]));
		$objProduto->setCategoria(utf8_decode($jsonProduto["ID_CATEGORIA"]));
		return $objProduto;
	}
	
	
	//Salva endereco na base
	private function Salvar(Produto $produto, $categoria){
		$conexao= new MySQL();
		$objProduto= new Produto();
		//inserindo id da categoria
		$objCategoria = new Categoria();
		$dcategoria = new dCategotia(); 
		$objCategoria = $dcategoria->Obter($categoria);
		//pegando id da organixacao
		
		$objOrganizacao = new Organizacao();
		$dOrganizacao = new dOrganizacao();
		$objOrganizacao = $dOrganizacao->Obter($nome); 
		
// 		ID_ORGANIZACAO,
// 		ID_CATEGORIA,
// 		NOME_,
// 		VALOR_VENDA,
		
		
		//Seleciona endereÃ§o na base
		$sql="set @ID_ORGANIZACAO = '$endereco->getCep()';
		set @ID_CATEGORIA = '$endereco->getLogradouro()';
		set @BAIRRO = '$endereco->getBairro()';
		set @NOME_ = '$endereco->getCidade()';
		set @VALOR_VENDA = '$endereco->getEstado()';
		call USP_INS_ENDERECO(,0);";
		$retorno = $conexao->execSP($sql);
	}
}