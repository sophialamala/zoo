<?php
// Activer l'affichage des erreurs pour le débogage
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Étape 1 : Connexion à la base de données
$server = "localhost"; // Nom du serveur
$username = "root";    // Nom d'utilisateur MySQL
$password = "";        // Mot de passe MySQL
$databaseName = "accbbdd"; // Nom de votre base de données

// Créer une connexion
$conn = new mysqli($server, $username, $password, $databaseName);

// Vérifier la connexion
if ($conn->connect_error) {
    die("La connexion à la base de données a échoué : " . $conn->connect_error);
}

// Étape 2 : Récupérer les biomes avec leurs enclos et animaux associés
$sql = "SELECT * FROM `biomes`"; // Récupération des biomes
$result = $conn->query($sql);

$array = array(); // Tableau pour stocker les résultats

// Parcourir les résultats des biomes
while ($row = $result->fetch_assoc()) {
    $enclos_sql = "SELECT * FROM `enclos` WHERE id_biomes = '" . $row["id"] . "'";
    $enclos_result = $conn->query($enclos_sql);

    $enclos = array(); // Tableau pour stocker les enclos

    while ($enclosRow = $enclos_result->fetch_assoc()) {
        $animaux_sql = "
            SELECT A.* 
            FROM `animaux` AS A
            INNER JOIN `relation` AS R ON A.id = R.id_animaux
            WHERE R.id_enclos = '" . $enclosRow["id"] . "'
        ";
        $animaux_result = $conn->query($animaux_sql);

        $animaux = array(); // Tableau pour stocker les animaux

        while ($animauxRow = $animaux_result->fetch_assoc()) {
            $animaux[] = $animauxRow; // Ajouter chaque animal au tableau
        }

        $enclosRow["animaux"] = $animaux; // Associer les animaux à l'enclos courant
        $enclos[] = $enclosRow; // Ajouter l'enclos au tableau des enclos
    }

    $row["enclos"] = $enclos; // Associer les enclos au biome courant
    $array[] = $row; // Ajouter le biome au tableau final
}

// Étape 3 : Envoyer les résultats sous forme de JSON
header('Content-Type: application/json');
echo json_encode($array, JSON_PRETTY_PRINT);

// Fermer la connexion
$conn->close();
?>
