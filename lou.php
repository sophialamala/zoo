<?php
header("Content-Type: application/json");

// Connexion à la base de données
$conn = new mysqli("localhost", "root", "", "accbbdd");

// Vérification de la connexion
if ($conn->connect_error) {
    die(json_encode(["error" => "Erreur de connexion : " . $conn->connect_error]));
}

// Récupérer l'action depuis la requête GET
$action = isset($_GET['action']) ? $_GET['action'] : '';

// Initialisation de la réponse
$response = [];

if ($action === 'get_biomes') {
    // Récupérer tous les biomes
    $sql = "SELECT id, name FROM biomes";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $response = $result->fetch_all(MYSQLI_ASSOC);
    } else {
        $response = ["message" => "Aucun biome trouvé"];
    }

} elseif ($action === 'get_enclos_by_biome' && isset($_GET['biome_id'])) {
    // Récupérer les enclos associés à un biome
    $biome_id = intval($_GET['biome_id']);
    $sql = "SELECT id, name, status, repas FROM enclos WHERE id_biomes = $biome_id";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $response = $result->fetch_all(MYSQLI_ASSOC);
    } else {
        $response = ["message" => "Aucun enclos trouvé pour ce biome"];
    }

} elseif ($action === 'get_animals_by_enclos' && isset($_GET['enclos_id'])) {
    // Récupérer les animaux associés à un enclos
    $enclos_id = intval($_GET['enclos_id']);
    $sql = "SELECT a.id, a.nom, a.espece 
            FROM animaux a
            INNER JOIN animal_enclos ae ON a.id = ae.id_animaux
            WHERE ae.id_enclos = $enclos_id";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $response = $result->fetch_all(MYSQLI_ASSOC);
    } else {
        $response = ["message" => "Aucun animal trouvé pour cet enclos"];
    }

} else {
    // Action par défaut si rien n'est spécifié
    $response = ["message" => "Action non valide ou paramètre manquant"];
}

// Retourner la réponse en JSON
echo json_encode($response);

// Fermer la connexion
$conn->close();
?>