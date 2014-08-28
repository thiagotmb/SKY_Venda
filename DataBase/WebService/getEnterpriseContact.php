<?php

//Conecta a database 
$link = mysql_pconnect("localhost","root","root") or die("Could not connect with DB");

//Seleciona o banco a ser usado
mysql_select_db("SKY_VENDA") or die("Could not select database");


$arr = array();

//Seleciona o a tabela users e salva em um usuário
$rs = mysql_query("SELECT * FROM EnterpriseInfo");


//Enquanto tiver objetos na tabela $rs salvar esse objeto numa variavel
while($obj = mysql_fetch_object($rs)){
    
    //adiciona objeto no array  
    $arr[] = $obj;
}

//Apresenta dados do array.
Echo json_encode($arr);

?>
