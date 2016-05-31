<?php

/**
 * Created by PhpStorm.
 * User: kevin_000
 * Date: 27/05/2016
 * Time: 21:47
 */

require_once('../Ent/Usuario.php');
require_once('../Dao/UsuarioDao.php');
$objUsuarioEnt =new Usuario();
$objUsuarioNeg = new UsuarioNeg();

if(isset($_POST['nome']))
    $objUsuarioEnt->setNome($_POST['nome']);

if(isset($_POST['nome']))
    $objUsuarioEnt->setCpf($_POST['cpf']);

if(isset($_POST['dataNasc']))
    $objUsuarioEnt->setDataNasc($_POST['data_nascimento']);

if(isset($_POST['telefone']))
    $objUsuarioEnt->setTelefone($_POST['telefone']);

if(isset($_POST['celular']))
    $objUsuarioEnt->setCelular($_POST['celular']);

if(isset($_POST['email']))
    $objUsuarioEnt->setEmail($_POST['email']);
if(isset($_POST['cep']))
    $objUsuarioEnt->setCep($_POST['cep']);

if(isset($_POST['endereco']))
    $objUsuarioEnt->setEndereco($_POST['endereco']);

if(isset($_POST['numero']))
    $objUsuarioEnt->setNumero($_POST['numero']);

if(isset($_POST['complemento']))
    $objUsuarioEnt->setComplemento($_POST['complemento']);

if(isset($_POST['bairro']))
    $objUsuarioEnt->setBairo($_POST['bairro']);

if(isset($_POST['cidade']))
    $objUsuarioEnt->setCidade($_POST['cidade']);
if(isset($_POST['uf']))
    $objUsuarioEnt->setUf($_POST['uf']);

if(isset($_POST['login']))
    $objUsuarioEnt->setLogin($_POST['login']);

if(isset($_POST['senha']))
    $objUsuarioEnt->setSenha($_POST['senha']);

if(isset($_POST['status']))
    $objUsuarioEnt->setStatus($_POST['status']);

if(isset($_POST['codigo']))
    $objUsuarioEnt->setIdUsuario($_POST['codigo']);




if (isset($_POST['action'])){
    switch ($_POST['action']) {

        case 'pesquisarUsuario':
            $objUsuarioEnt = $objUsuarioNeg->Obter($_POST['pesq']);
            $json = json_encode($objUsuarioEnt);
            echo $json;
            break;

        case 'salvarUsuario':
            $teste = $objUsuarioNeg->Salvar($objUsuarioEnt);
            echo $teste;
            break;

        case 'editarUsuario':
            $teste= $objUsuarioNeg->Atualizar($objUsuarioEnt);
            echo $teste;
            break;


        case 'excluir':
           $teste=$objUsuarioNeg->Excluir($objUsuarioEnt);
            echo $teste;
            break;

        case 'carregaDep':
            $usuarios = $objUsuarioNeg->CarregarComboBox();
            $json = json_encode($usuarios);
            echo $json;
            break;

//        case 'subMenu':
//            $objUsuarioNeg->subMenu() ;
//            break;
//
//        case 'salvarMenu':
//            salvarMenu();
//            break;


    }
}



class UsuarioNeg
{
    public function CarregarComboBox(){
        $UsuarioDao = new UsuarioDao();
        return $UsuarioDao->CarregarComboBox();
    }


    public function Obter($pesq){

        $UsuarioDao = new UsuarioDao();
        return $UsuarioDao->Obter($pesq);
    }


    public function Salvar(Usuario $objUsuario){
        $UsuarioDao = new UsuarioDao();
        return $UsuarioDao->Salvar($objUsuario);

    }

    public function Atualizar(Usuario $objUsuario){
        $UsuarioDao = new UsuarioDao();
        return $UsuarioDao->Atualizar($objUsuario);
    }

    public function Excluir(Usuario $objUsuario){
        $UsuarioDao = new UsuarioDao();
        return $UsuarioDao->Excluir($objUsuario);
    }


//    public function subMenu(){
//        $UsuarioDao = new UsuarioDao();
//        $UsuarioDao->subMenu();
//    }

//    public function subMenu(){
//        $UsuarioDao = new UsuarioDao();
//        $UsuarioDao->subMenu();
//    }

}
