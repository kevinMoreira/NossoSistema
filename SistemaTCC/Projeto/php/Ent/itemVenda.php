<?php

/**
 * Created by PhpStorm.
 * User: kevin_000
 * Date: 27/05/2016
 * Time: 17:44
 */

$produto =new Produto();
class itemVenda
{

        public  $qtd;
        public $subtotal;

    /**
     * @return mixed
     */
    public function getSubtotal()
    {
        return $this->subtotal;
    }

    /**
     * @param mixed $subtotal
     */
    public function setSubtotal($subtotal)
    {
        $this->subtotal = $subtotal;
    }

    /**
     * @return mixed
     */
    public function getQtd()
    {
        return $this->qtd;
    }

    /**
     * @param mixed $qtd
     */
    public function setQtd($qtd)
    {
        $this->qtd = $qtd;
    }


    //getter e setter da classe produto
    public function getProduto()
    {
        return $this->Produto();
    }

    /**
     * @param mixed $qtd
     */


    public function setCodigo($codigoBarra)
    {
         $produto = new Produto;

        $produto->setCodigoBarras($codigoBarra);
        return $produto;
    }
    


}