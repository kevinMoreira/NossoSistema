<?php
/**
 * Created by PhpStorm.
 * User: Hp
 * Date: 14/07/2015
 * Time: 23:50
 */
require_once('../MySQL.php');
require_once('../Ent/Cliente.php');

class ClienteDAO {

    //Retorna endereço cadstrado na base
    public function Obter($pesquisa){
        $conexao = new MySQL();
        $objCliente= new Cliente();
        //Seleciona endereço na base
        $sql="set @PESQUISA = '$pesquisa'; call USP_SEL_ENDERECO(@PESQUISA);";
        $retorno = $conexao->execSP($sql);

        //Se endereço não existir realiza uma busca no web service
        if($retorno != null)
        {
            $objCliente->setNome($retorno["nome"]);
            $objCliente->setIdCliente($retorno["bairro"]);
            $objCliente->setIdOrganizacao($retorno["cidade"]);
            $objCliente->setNome($retorno["estado"]);
            $objCliente->setCpf($retorno["cpf"]);
            $objCliente->setDataNascimento($retorno["dataNascimento"]);
            $objCliente->setTelefone($retorno["telefone"]);           
            $objCliente->setCelular($retorno["celular"]);
            $objCliente->setEmail($retorno["email"]);
            $objCliente->setCep($retorno["cep"]);
            $objCliente->setEndereco($retorno["endereco"]);
            $objCliente->setNumero($retorno["numero"]);
            $objCliente->setComplemento($retorno["complemento"]);
            $objCliente->setBairro($retorno["bairro"]);
            $objCliente->setCidade($retorno["cidade"]);
            $objCliente->setUf($retorno["uf"]);
            // $objCliente->setStatus($retorno["CadastroDataHora"]);
            // $objCliente->setComplemento($retorno["Complemento"]);
        }else{
            // $objEndereco = $this->ConsultarWebServiceEndereco($cep);
            $this->Salvar($objCliente);
        }
        return $objCliente;
    }

    //Retorna endereço consultado no web service apimon
    private function ConsultarWebServiceEndereco($cep){
        $objEndereco = new eEndereco();
        $jsonEndereco = file_get_contents('http://api.postmon.com.br/v1/cep/'.$cep);
        $objEndereco->setLogradouro(utf8_decode($jsonEndereco["Logradouro"]));
        $objEndereco->setBairro(utf8_decode($jsonEndereco["Bairro"]));
        $objEndereco->setCidade(utf8_decode($jsonEndereco["Cidade"]));
        $objEndereco->setEstado(utf8_decode($jsonEndereco["Estado"]));
        $objEndereco->setCep(utf8_decode($jsonEndereco["Cep"]));

        return $objEndereco;
    }

    //Salva endereco na base
    private function Salvar(Cliente $cliente){
        $conexao= new MySQL();
        $objCliente= new Cliente();
        //Seleciona endereço na base
        $sql="set @NOME = '$cliente->getNome()';
        set @BAIRRO = '$cliente->getBairro()';
        
        set @ESTADO = '$cliente->getEstado()';
        set @CPF = '$cliente->getCpf()';
        set @DARTANASCIMENTO = '$cliente->getDataNascimento()';
        set @TELEFONE = '$cliente->getTelefone()';
        set @CELULAR = '$cliente->getCeluar()';
        set @EMAIL ='$cliente->getEmail()';
        set @CEP = '$cliente->getCep()';
        set @ENDERECO = '$cliente->getEndereco()';
        set @NUMERO = '$cliente->getNumero()';
        set @COMPLEMENTO = '$cliente->getComplemento()';
        set @BAIRRO = '$cliente->getBairro()';
        set @ENDERECO = '$cliente->getEndereco()';
        set @CIDADE = '$cliente->getCidade()';
        
        call USP_INS_ENDERECO(@CEP, @LOGRADOURO, @BAIRRO, @CIDADE, @ESTADO);";
        $retorno = $conexao->execSP($sql);
    }

    //Atualiza endereco na base
    private function Atualizar(eEndereco $endereco){
        $conexao= new MySQL();
        $objEndereco= new eEndereco();
        //Seleciona endereço na base
        $sql="set @CEP = '$endereco->getCep()';
        set @LOGRADOURO = '$endereco->getLogradouro()';
        set @BAIRRO = '$cep';
        set @CIDADE = '$cep';
        set @ESTADO = '$cep';
        call USP_UPD_ENDERECO(@CEP, @LOGRADOURO, @BAIRRO, @CIDADE, @ESTADO);";
        $retorno = $conexao->execSP($sql);
    }
} 