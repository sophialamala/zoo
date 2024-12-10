<?php
// Activer les erreurs
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Configuration de la base de données
$host = '127.0.0.1';
$dbname = 'accbbdd';
$username = 'root';
$password = '';

try {
    // Connexion à la base de données
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Préparer et exécuter la requête
    $stmt = $pdo->prepare("SELECT * FROM users");
    $stmt->execute();

    // Récupérer les résultats
    $users = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Vérifier si des résultats sont trouvés
    header('Content-Type: application/json');
    if (empty($users)) {
        echo json_encode(["message" => "Aucun utilisateur trouvé"]);
    } else {
        echo json_encode($users, JSON_PRETTY_PRINT);
    }

} catch (PDOException $e) {
    // Gérer les erreurs
    http_response_code(500);
    echo json_encode(["error" => "Erreur de connexion : " . $e->getMessage()]);
}
?>
