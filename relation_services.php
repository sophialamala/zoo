<?php
// Activer l'affichage des erreurs pour le débogage
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Connexion à la base de données
$server = "localhost";
$username = "root";
$password = "";
$databaseName = "accbbdd";

$conn = new mysqli($server, $username, $password, $databaseName);

// Vérifier la connexion
if ($conn->connect_error) {
    die(json_encode(["error" => "Connexion échouée : " . $conn->connect_error]));
}

// Récupérer toutes les relations avec leurs services
$sql = "SELECT rs.id AS relation_id, rs.quantité, rs.id_biome, rs.id_service, s.nom AS service_nom 
        FROM relations_services rs
        INNER JOIN services s ON rs.id_service = s.id";

$result = $conn->query($sql);

// Vérifier si des données sont disponibles
if ($result->num_rows > 0) {
    $relations = [];
    while ($row = $result->fetch_assoc()) {
        $relations[] = $row;
    }

    // Retourner les relations en JSON
    header('Content-Type: application/json');
    echo json_encode($relations);
} else {
    // Aucun résultat
    echo json_encode(["message" => "Aucune relation trouvée."]);
}

$conn->close();
?>
