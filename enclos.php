<?php
// Etape 1 -> Connexion a la base de données
$server = "localhost";
$username = "root";
$password = "";
$databaseName = "accbbdd";
 
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
    $enclos_sql = "SELECT * FROM `enclos` WHERE id_biomes = '".$row["id"]."'";
    $enclos_result = $conn->query($enclos_sql);
 
    $enclos = array();
    while($enclosRow = $enclos_result->fetch_assoc()) {
 
        $animaux_sql = "SELECT * FROM `animaux` AS A INNER JOIN `relation` AS R ON A.id = R.id_animaux AND R.id_enclos = '".$enclosRow["id"]."'";
        $animaux_result = $conn->query($animaux_sql);
   
        $animals = array();
        while($animauxRow = $animaux_result->fetch_assoc()) {
            $animaux[] = $animauxRow;
        }
        $enclosRow["animaux"] = $animaux;
 
        $enclos[] = $enclosRow;
    }
 
    $row["enclos"] = $enclos;
    $array[] = $row;
}
header('Content-Type:application/json');
$json = json_encode($array);
echo $json;
 
?>