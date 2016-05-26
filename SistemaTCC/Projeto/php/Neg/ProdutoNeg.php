<?php

require_once('../Dao/ProdutoDao.php');

class CategoriaNeg {

    public function Obter(){
        $CategoriaDao = new CategoriaDao();
        return $CategoriaDao->Obter();
    }

}