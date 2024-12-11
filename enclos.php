<?php
// Étape 1 : Connexion à la base de données
$server = "localhost";
$username = "root";
$password = "";
$databaseName = "accbbdd";

// Connexion à la base de données
$conn = new mysqli($server, $username, $password, $databaseName);

// Vérifier la connexion
if ($conn->connect_error) {
    die("La connexion à la base de données a échoué : " . $conn->connect_error);
}

// Étape 2 : Récupérer tous les enclos
$sql = "SELECT * FROM `enclos`";
$result = $conn->query($sql);

$enclos = array(); // Tableau pour stocker les résultats

// Parcourir les résultats et les ajouter au tableau
while ($row = $result->fetch_assoc()) {
    $enclos[] = $row;
}

// Étape 3 : Envoyer les résultats sous forme de JSON
header('Content-Type: application/json');
echo json_encode($enclos, JSON_PRETTY_PRINT);
?>
