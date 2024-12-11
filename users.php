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
    $email = isset($_POST['mail']) ? trim($_POST['mail']) : null;
    $password = isset($_POST['password']) ? trim($_POST['password']) : null;
    $role = isset($_POST['role']) ? trim($_POST['role']) : null;
    $username = isset($_POST['username']) ? trim($_POST['username']) : null;

    // Validation basique des champs
    if (empty($email) || empty($password) || empty($role) || empty($username)) {
        echo json_encode(['success' => false, 'message' => 'Tous les champs sont obligatoires.']);
        exit;
    }

    // Vérification si l'utilisateur existe déjà
    $stmt = $pdo->prepare("SELECT * FROM users WHERE mail = :email");
    $stmt->execute(['email' => $email]);
    if ($stmt->rowCount() > 0) {
        echo json_encode(['success' => false, 'message' => 'Un utilisateur avec cet email existe déjà.']);
        exit;
    }

    // Insertion dans la base de données
    $sql = "INSERT INTO users (mail, password, role, username) VALUES (:email, :password, :role, :username)";
    $stmt = $pdo->prepare($sql);
    $params = [
        'email' => $email,
        'password' => $password, // Le mot de passe est stocké en clair
        'role' => $role,
        'username' => $username
    ];

    if ($stmt->execute($params)) {
        echo json_encode(['success' => true, 'message' => 'Utilisateur enregistré avec succès.']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Une erreur est survenue lors de l\'enregistrement.']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Requête non valide.']);
}
