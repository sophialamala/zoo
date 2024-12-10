<?php
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
    $stmt = $pdo->prepare("SELECT * FROM biomes");
    $stmt->execute();

    // Récupérer les résultats
    $biomes = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Convertir les résultats en JSON pour le front-end
    header('Content-Type: application/json');
    echo json_encode($biomes);

} catch (PDOException $e) {
    // Gérer les erreurs de connexion ou d'exécution
    http_response_code(500);
    echo json_encode(["error" => "Erreur de connexion à la base de données : " . $e->getMessage()]);
}
?>
