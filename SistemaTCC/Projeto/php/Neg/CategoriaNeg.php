<?php
require_once('../Ent/Categoria.php');
require_once('../Dao/CategoriaDao.php');
$objCategoria= new Categoria();
$objCategoriaNeg = new CategoriaNeg();


if(isset($_POST['nome']))
    $objCategoria->setNome($_POST['nome']);

if(isset($_POST['id_categoria']))
    $objCategoria->setIdCategoria($_POST['id_categoria']);

if(isset($_POST['status']))
    $objCategoria->setStatus($_POST['status']);


//chamando as ações

if (isset($_POST['action'])){
    switch ($_POST['action']) {

        case 'pesquisarCategoria':
       
            $objCategoria= $objCategoriaNeg->Obter($_POST['pesq']);
            $json = json_encode( $objCategoria );
            echo $json;


            break;

        case 'salvarCategoria':
            $teste = $objCategoriaNeg->Salvar($objCategoria);
            echo $teste;
            break;

        case 'editarCategoria':
            $objCategoriaNeg->Atualizar($objCategoria);
            break;


        case 'excluir':
            $objCategoriaNeg->Excluir($objCategoria);
            break;

    }
}

class CategoriaNeg {

    public function Obter($pesquisa){
         $CategoriaDao = new CategoriaDao();
         return $CategoriaDao->Obter($pesquisa);
       echo '1';
    }
        
     
     public function Salvar(Categoria $objCategoria){
         $CategoriaDao = new CategoriaDao();
         return  $CategoriaDao->Salvar($objCategoria);
         echo '1';

    }
     
     public function Excluir(Categoria $objCategoria){

         $CategoriaDao = new CategoriaDao();
       
         return $CategoriaDao->excluir($objCategoria);
         echo '1';
    }
     
     public function Atualizar(Categoria $objCategoria){

         $CategoriaDao = new CategoriaDao();

         return $CategoriaDao->excluir($objCategoria);
         echo '1';
    }
    
    
}