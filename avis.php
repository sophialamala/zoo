<?php
// Activer l'affichage des erreurs pour le débogage
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Étape 1 : Connexion à la base de données
$server = "localhost";
$username = "root";
$password = "";
$databaseName = "accbbdd";

// Connexion à la base de données
$conn = new mysqli($server, $username, $password, $databaseName);

// Vérifier la connexion
if ($conn->connect_error) {
    die(json_encode(["error" => "La connexion à la base de données a échoué : " . $conn->connect_error]));
}

// Étape 2 : Vérifier si la méthode utilisée est POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Récupérer les données envoyées par le client via POST
    $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : null;
    $commentaire = isset($_POST['commentaire']) ? $_POST['commentaire'] : null;
    $note = isset($_POST['note']) ? $_POST['note'] : null;

    // Étape 3 : Validation des données
    if (empty($user_id) || empty($commentaire) || empty($note)) {
        die(json_encode(["error" => "Tous les champs (user_id, commentaire, note) sont requis."]));
    }

    // Étape 4 : Préparer la requête d'insertion
    $stmt = $conn->prepare("INSERT INTO avis (user_id, date, commentaire, note) VALUES (?, NOW(), ?, ?)");
    if (!$stmt) {
        die(json_encode(["error" => "Erreur de préparation de la requête : " . $conn->error]));
    }

    // Associer les paramètres
    $stmt->bind_param("isi", $user_id, $commentaire, $note);

    // Étape 5 : Exécuter la requête
    if ($stmt->execute()) {
        echo json_encode(["message" => "Avis ajouté avec succès."]);
    } else {
        echo json_encode(["error" => "Erreur lors de l'ajout de l'avis : " . $stmt->error]);
    }

    // Fermer la requête préparée
    $stmt->close();
} else {
    echo json_encode(["error" => "Méthode HTTP non autorisée. Utilisez POST."]);
}

// Fermer la connexion
$conn->close();
?>
