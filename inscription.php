<?php
// Connexion à la base de données
$conn = new mysqli('localhost', 'root', '', 'accbbdd'); // Ajuste selon tes paramètres
if ($conn->connect_error) {
    die("Erreur de connexion : " . $conn->connect_error);
}

// Vérifier si le formulaire a été soumis
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Récupérer les données du formulaire
    $email = htmlspecialchars($_POST['email']);
    $password = htmlspecialchars($_POST['password']);

    // Requête SQL pour trouver l'utilisateur par email
    $sql = "SELECT user_id, name, password FROM users WHERE email = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        // L'utilisateur existe, vérifier le mot de passe
        $user = $result->fetch_assoc();
        if ($password === $user['password']) {
            // Mot de passe correct
            echo "Bienvenue, " . htmlspecialchars($user['name']) . " !";
            // (Optionnel) Démarrer une session
            session_start();
            $_SESSION['user_id'] = $user['user_id'];
            $_SESSION['name'] = $user['name'];
        } else {
            // Mot de passe incorrect
            echo "Mot de passe incorrect.";
        }
    } else {
        // Email non trouvé
        echo "Utilisateur non trouvé.";
    }

    $stmt->close();
    $conn->close();
}
