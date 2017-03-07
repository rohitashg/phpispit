<?php
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token , Authorization, Token, token, TOKEN');
if($_SERVER['REQUEST_METHOD'] == "OPTIONS"){
    exit();
}
$servername = "localhost";
$username = "root";
$password = "kiwitech";
$db = "probaispita";
// Kreiraj konekciju
$conn = mysqli_connect($servername, $username, $password, $db);

// Check connection
if (mysqli_connect_errno())
{
echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
 
?>