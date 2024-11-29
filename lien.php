<?php
// Etape 1 -> Connexion a la base de données
$server = "localhost";
$username = "root";
$password = "";
$databaseName = "zoo";
 
// Connexion a la base de données
$conn = new mysqli($server, $username, $password, $databaseName);
 
// Check connection
if($conn->connect_error) {
    die("connection BDD échouée");
}
 
// Etape 2 -> Execute requete SQL
$sql = "SELECT * FROM `biomes`";
$result = $conn->query($sql);
$array = array();
// On parcours tous les resultats sql
while($row = $result->fetch_assoc()) {
    // On ajoute notre dictionnaire au tableau de resultats
    $enclosure_sql = "SELECT * FROM `enclosures` WHERE id_biomes = '".$row["id"]."'";
    $enclosure_result = $conn->query($enclosure_sql);
 
    $enclosures = array();
    while($enclosureRow = $enclosure_result->fetch_assoc()) {
 
        $animals_sql = "SELECT * FROM `animals` AS A INNER JOIN `relation_enclos_animals` AS R ON A.id = R.id_animal AND R.id_enclos = '".$enclosureRow["id"]."'";
        $animals_result = $conn->query($animals_sql);
   
        $animals = array();
        while($animalsRow = $animals_result->fetch_assoc()) {
            $animals[] = $animalsRow;
        }
        $enclosureRow["animals"] = $animals;
 
        $enclosures[] = $enclosureRow;
    }
 
    $row["enclosures"] = $enclosures;
    $array[] = $row;
}
header('Content-Type:application/json');
$json = json_encode($array);
echo $json;
 
?>