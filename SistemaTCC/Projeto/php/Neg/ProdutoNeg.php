<?php
/*
 * Feito por Kevin Rangel
 * inicio: 26/05/2016
 * 
*/

require_once('../Dao/ProdutoDao.php');
require_once('../Ent/Produto.php');
$objProdutoNeg = new ProdutoNeg();
$objProdutoEnt = new dProduto();

if(isset($_POST['nome']))
    $objProdutoEnt->setNome($_POST['nome']);

if(isset($_POST['valor']))
    $objProdutoEnt->setNome($_POST['valor']);

if(isset($_POST['status']))
    $objProdutoEnt->setNome($_POST['status']);

if(isset($_POST['codigo']))
    $objProdutoEnt->setCOdigo($_POST['codigo']);

if (isset($_POST['action'])) {
    switch ($_POST['action']) {

        case 'pesquisarProduto':

            $objProdutoEnt = $objProdutoNeg->Obter($_POST['pesq']);
            $json = json_encode( $objProdutoEnt );
            echo $json;

            break;

        case 'salvarProduto':

            $teste = $objProdutoNeg->Salvar($objProdutoEnt);
            echo $teste;

            break;

        case 'excluirProduto':
            $objProdutoNeg->Excluir($objProdutoEnt);
            break;

        case 'editarProduto':
            $teste= $objFornecedorNeg->Atualizar($objFornecedorEnt);
            echo $teste;
            break;
    }
}


class ProdutoNeg {

    public function Obter(){
        $CategoriaDao = new CategoriaDao();
        return $CategoriaDao->Obter();
    }
    
    public function cadastrar(){
        $CategoriaDao = new CategoriaDao();
        return $CategoriaDao->Obter();
    }
    
    public function editar(){
        $CategoriaDao = new CategoriaDao();
        return $CategoriaDao->Obter();
    }

    public function excluir(){
        $CategoriaDao = new CategoriaDao();
        return $CategoriaDao->Obter();
    }
    
}