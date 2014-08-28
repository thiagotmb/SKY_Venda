<?php

echo "1 record added to tags";  


$con = mysql_connect("localhost","root","root");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }

mysql_select_db("SKY_VENDA", $con);

$socialReason = intval($_POST[SocialReason]);//filter_input($_POST[SocialReason], 'a', FILTER_VALIDATE_INT);
$gender = intval($_POST[Gender]);

$creditCardOperator = intval($_POST[CreditCardOperator]);

$sql="INSERT INTO SignatureData (
Name, 
Cpf, 
Rg, 
Email, 
PhoneNumber, 
BirthDate, 
SocialReason, 
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
'$socialReason',
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
 