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


$RequestType = intval($_POST[RequestType]);

$sql="INSERT INTO RequestedContacts (
RequestorContact, 
DateOfRequest, 
RequestType) VALUES (
'$_POST[RequestorContact]',
'$_POST[DateOfRequest]',
'$RequestType'
)";

if (!mysql_query($sql,$con))
  {
  die('Error: ' . mysql_error());
  }

echo "1 record added to tags";  

mysql_close($con)
?>
 