<?php
// Activer l'affichage des erreurs
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Connexion à la base de données
$server = "localhost";
$username = "root";
$password = "";
$databaseName = "accbbdd";

$conn = new mysqli($server, $username, $password, $databaseName);

// Vérification de la connexion
if ($conn->connect_error) {
    die(json_encode(["error" => "Connexion échouée : " . $conn->connect_error]));
}

// Vérifier que la méthode HTTP est POST
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Récupérer les données POST
    $mail = isset($_POST['mail']) ? $_POST['mail'] : null;
    $password = isset($_POST['password']) ? $_POST['password'] : null;
    $role = isset($_POST['role']) ? $_POST['role'] : null;
    $username = isset($_POST['username']) ? $_POST['username'] : null;

    // Vérifier si tous les champs sont remplis
    if (empty($mail) || empty($password) || empty($role) || empty($username)) {
        die(json_encode(["error" => "Tous les champs (mail, password, role, username) sont requis."]));
    }

    // Vérifier si l'utilisateur existe déjà
    $checkUserQuery = "SELECT id FROM users WHERE mail = ?";
    $stmt = $conn->prepare($checkUserQuery);
    if (!$stmt) {
        die(json_encode(["error" => "Erreur dans la préparation de la requête SELECT : " . $conn->error]));
    }
    $stmt->bind_param("s", $mail);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        die(json_encode(["error" => "Un compte avec cet email existe déjà."]));
    }
    $stmt->close();

    // Insérer dans la base de données
    $insertQuery = "INSERT INTO users (mail, password, role, username) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($insertQuery);
    if (!$stmt) {
        die(json_encode(["error" => "Erreur dans la préparation de la requête INSERT : " . $conn->error]));
    }
    $stmt->bind_param("ssss", $mail, $password, $role, $username);

    if ($stmt->execute()) {
        echo json_encode(["message" => "Compte créé avec succès."]);
    } else {
        echo json_encode(["error" => "Erreur lors de la création du compte : " . $stmt->error]);
    }

    $stmt->close();
} else {
    echo json_encode(["error" => "Méthode HTTP non autorisée. Utilisez POST."]);
}

$conn->close();
?>
