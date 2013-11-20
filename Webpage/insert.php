<?php
$dbhost = 'localhost';
$dbname = '3430-f13-t11';
$dbuser = 'vanhineam';
$dbpass = '900453870';

$con = mysql_connect($dbhost, $dbuser, $dbpass);

if($con == FALSE)
{
	echo "Connection error " . mysql_error();
}
else
{
	echo "Connected to database\n";
}

mysql_select_db($dbname, $con);

$sql = "INSERT INTO EMPLOYEE (fname,minit,lname,address,
	   birthdate,ssn)
		VALUES('$_POST[fname]','$_POST[minit]', '$_POST[lname]', 
		'$_POST[address]', '$_POST[birthdate]', '$_POST[ssn]')";

if(!mysql_query($sql, $con))
{
	die('Error: ' . mysql_error());
}
echo "1 record added";

mysql_close($con)
?>