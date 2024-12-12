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

// Requête pour récupérer les données des biomes, enclos et animaux
$sql = "
    SELECT 
        biomes.nom AS biome_nom, 
        enclos.id AS enclos_id, 
        enclos.repas AS enclos_repas, 
        GROUP_CONCAT(animaux.nom SEPARATOR ', ') AS animaux_noms
    FROM biomes
    LEFT JOIN enclos ON biomes.id = enclos.id_biomes
    LEFT JOIN relation ON enclos.id = relation.id_enclos
    LEFT JOIN animaux ON relation.id_animaux = animaux.id
    GROUP BY biomes.nom, enclos.id
    ORDER BY biomes.nom, enclos.id
";

try {
    $stmt = $pdo->query($sql);
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Organisation des résultats par biome
    $biomes = [];
    foreach ($results as $row) {
        $biome_nom = $row['biome_nom'];
        $enclos_id = $row['enclos_id'];
        $enclos_repas = $row['enclos_repas'];
        $animaux_noms = !empty($row['animaux_noms']) ? $row['animaux_noms'] : 'Cet enclos ne contient pas encore d\'animaux.';

        // Créer un tableau pour chaque biome
        if (!isset($biomes[$biome_nom])) {
            $biomes[$biome_nom] = [
                'enclos' => []
            ];
        }

        // Ajouter les enclos et leurs animaux au biome correspondant
        $biomes[$biome_nom]['enclos'][] = [
            'enclos_id' => $enclos_id,
            'repas' => $enclos_repas,
            'animaux' => $animaux_noms,
        ];
    }

    // Retourner uniquement le JSON
    echo json_encode(['success' => true, 'data' => $biomes], JSON_PRETTY_PRINT);

} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erreur : ' . $e->getMessage()]);
}
?>
