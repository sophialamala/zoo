<?php
// Connexion à la base de données
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "accbbdd"; // Remplace par le nom de ta base de données

$conn = new mysqli($servername, $username, $password, $dbname);

// Vérifier la connexion
if ($conn->connect_error) {
    die("La connexion à la base de données a échoué : " . $conn->connect_error);
}

// Étape 1 : Récupérer les biomes
$sql = "SELECT * FROM `biomes`";
$result = $conn->query($sql);

$array = array(); // Tableau pour stocker le résultat final

// Parcourir les résultats et ajouter les enclos et animaux
while ($row = $result->fetch_assoc()) {
    // Récupérer les enclos liés au biome courant
    $enclos_sql = "SELECT * FROM `enclos` WHERE id_biomes = '" . $row["id"] . "'";
    $enclos_result = $conn->query($enclos_sql);

    $enclos = array(); // Tableau pour stocker les enclos pour ce biome

    while ($enclosRow = $enclos_result->fetch_assoc()) {
        // Récupérer les animaux liés à l'enclos courant
        $animaux_sql = "
            SELECT A.* 
            FROM `animaux` AS A
            INNER JOIN `relation` AS R ON A.id = R.id_animaux
            WHERE R.id_enclos = '" . $enclosRow["id"] . "'
        ";
        $animaux_result = $conn->query($animaux_sql);

        $animaux = array(); // Tableau pour stocker les animaux pour cet enclos

        while ($animauxRow = $animaux_result->fetch_assoc()) {
            $animaux[] = $animauxRow; // Ajouter chaque animal dans le tableau
        }

        $enclosRow["animaux"] = $animaux; // Ajouter les animaux à l'enclos courant
        $enclos[] = $enclosRow; // Ajouter l'enclos au tableau des enclos
    }

    $row["enclos"] = $enclos; // Ajouter les enclos au biome courant
    $array[] = $row; // Ajouter le biome dans le résultat final
}

// Étape 2 : Envoyer les résultats sous forme de JSON
header('Content-Type: application/json');
echo json_encode($array, JSON_PRETTY_PRINT);

$conn->close();
?>
