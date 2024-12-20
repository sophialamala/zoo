<?php
// Activer l'affichage des erreurs pour le débogage
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Configuration de la base de données
$host = '127.0.0.1'; // Adresse du serveur
$dbname = 'accbbdd'; // Nom de la base de données
$username = 'root'; // Nom d'utilisateur
$password = ''; // Mot de passe

try {
    // Connexion à la base de données avec PDO
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Préparer et exécuter la requête SQL
    $stmt = $pdo->prepare("SELECT * FROM animaux");
    $stmt->execute();

    // Récupérer les résultats
    $animaux = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Vérifier si des résultats existent
    header('Content-Type: application/json');
    if (empty($animaux)) {
        echo json_encode(["message" => "Aucun animal trouvé"]);
    } else {
        echo json_encode($animaux, JSON_PRETTY_PRINT);
    }

} catch (PDOException $e) {
    // Gérer les erreurs
    http_response_code(500);
    echo json_encode(["error" => "Erreur de connexion à la base de données : " . $e->getMessage()]);
}
?>
