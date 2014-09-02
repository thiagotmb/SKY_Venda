
<?php

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


$civilState = intval($_POST[CivilState]);//filter_input($_POST[CivilState], 'a', FILTER_VALIDATE_INT);
$gender = intval($_POST[Gender]);

$creditCardOperator = intval($_POST[CreditCardOperator]);

$sql="INSERT INTO SignatureData (
Name, 
Cpf, 
Rg, 
Email, 
PhoneNumber, 
BirthDate, 
CivilState, 
Gender, 
Cep, 
City, 
State, 
Sector, 
Street, 
AdressNumber, 
Complement, 
CreditCardOperator, 
CreditCardNumber, 
CreditCardExpiration, 
Package,
SubmitDate) VALUES (
'$_POST[Name]',
'$_POST[Cpf]',
'$_POST[Rg]',
'$_POST[Email]',
'$_POST[PhoneNumber]',
'$_POST[BirthDate]',
'$civilState',
'$gender',
'$_POST[Cep]',
'$_POST[City]',
'$_POST[State]',
'$_POST[Sector]',
'$_POST[Street]',
'$_POST[AdressNumber]',
'$_POST[Complement]',
'$creditCardOperator',
'$_POST[CreditCardNumber]',
'$_POST[CreditCardExpiration]',
'$_POST[Package]',
'$_POST[SubmitDate]')";

if (!mysql_query($sql,$con))
  {
  die('Error: ' . mysql_error());
  }

echo "1 record added to tags";  

mysql_close($con)
?>
 