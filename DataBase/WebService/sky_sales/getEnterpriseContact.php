<?php

//Conecta a database 
$dbHost = $_POST['DBHost'];
$dbUserName = $_POST['DBUserName'];
$dbPassword = $_POST['DBPassword'];
$dbName = $_POST['DBName'];

$con = mysql_connect($dbHost,$dbUserName,$dbPassword);
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }

mysql_select_db($dbName, $con);
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
