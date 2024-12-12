<?php
// Configuration de la base de données
$host = '127.0.0.1'; // Adresse de votre serveur MySQL
$dbname = 'accbbdd'; // Nom de votre base de données
$username = 'root'; // Nom d'utilisateur MySQL
$password = ''; // Mot de passe MySQL

try {
    // Connexion à la base de données avec PDO
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erreur de connexion : " . $e->getMessage());
}

// Vérification que les données POST sont présentes
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Récupération des données envoyées
    $username = isset($_POST['username']) ? trim($_POST['username']) : null;
    $password = isset($_POST['password']) ? trim($_POST['password']) : null;

    // Validation basique des champs
    if (empty($username) || empty($password)) {
        echo json_encode(['success' => false, 'message' => 'Nom d\'utilisateur et mot de passe sont obligatoires.']);
        exit;
    }

    // Vérification des informations de connexion
    $stmt = $pdo->prepare("SELECT * FROM users WHERE username = :username");
    $stmt->execute(['username' => $username]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        if ($user['password'] === $password) {
            echo json_encode(['success' => true, 'message' => 'Connexion réussie.', 'user' => ['id' => $user['id'], 'username' => $user['username'], 'role' => $user['role']]]);
        } else {
            echo json_encode(['success' => false, 'message' => 'Mot de passe incorrect.']);
        }
    } else {
        echo json_encode(['success' => false, 'message' => 'Merci de créer un compte.']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Requête non valide.']);
}
