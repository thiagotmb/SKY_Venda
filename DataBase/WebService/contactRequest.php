 <?php

$con = mysql_connect("localhost","root","root");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }

mysql_select_db("SKY_VENDA", $con);


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
 