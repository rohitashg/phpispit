<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET');  
include("functions.php");

if(isset($_GET['id'])){
	$id = intval($_GET['id']);
	echo deleteProizvod($id);
}


?>