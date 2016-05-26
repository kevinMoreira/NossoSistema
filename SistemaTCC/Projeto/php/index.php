<?php

include './sistemaJP.php';

if (isset($_POST['action'])) {
    switch ($_POST['action']) {
        case 'Login':
            Login();
            break;
    }
}

function Login() {
    session_start();
    $conexao = AbreBancoJP();
    $sql = "call USP_SEL_LOGIN('".$_POST['login']."', '".md5($_POST['senha'])."');";
    $result = mysql_query($sql, $conexao);    

    while($row = mysql_fetch_row($result)){
        $_SESSION['codUsuario'] = $row['0'];
        $_SESSION['nomeUsuario'] = $row['1'];
        $_SESSION['permissao'] = $row['4'];
        $_SESSION['idOrganizacao'] = $row['2'];
        $_SESSION['nomeOrganizacao'] = $row['3'];
    }

    if (mysql_num_rows($result) <= 0) {
        echo '0';
        return;
    } else {
        echo '1';
    }   
}
