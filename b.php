<?php
// etape 1: connexion a la base de donnée
$server = "localhost";
$username = "root";
$password ="";
$databaseName = "accbbdd";

// SELECT * FROM `user`
$conn = new mysqli($server, $username, $password, $databaseName);

//check connection
if($conn->connect_error){
    die("connection BDD échouée");
}
// etape 2 -> execute requete sql
$sql = "SELECT * FROM `biomes`";
$result = $conn->query($sql);
$array = array();
while($row = $result -> fetch_assoc()){
    // on ajoute notre dico à la table des matières
    $array[]=$row;
}
//var_dump($result); il retourne du html et ici on veut pas de html
header('Content-Type:application/json');
$json = json_encode($array);
echo $json;
?>