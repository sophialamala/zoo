function sendPostRequest(url, data, callback) {
    const xhr = new XMLHttpRequest();
    xhr.open('POST', url, true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            callback(JSON.parse(xhr.responseText));
        }
    };
    let formData = '';
    for (const key in data) {
        if (data.hasOwnProperty(key)) {
            formData += encodeURIComponent(key) + '=' + encodeURIComponent(data[key]) + '&';
        }
    }
    xhr.send(formData.slice(0, -1)); // Enlever le dernier "&"
}

// Fonction pour gérer la soumission du formulaire de connexion
document.getElementById('login-form').addEventListener('submit', function(event) {
    event.preventDefault(); // Empêcher le rechargement de la page

    // Récupérer les valeurs des champs du formulaire
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    // Vérifier que les champs ne sont pas vides
    if (!username || !password) {
        alert('Nom d\'utilisateur et mot de passe sont obligatoires.');
        return;
    }

    // Envoi des données de connexion au backend
    sendPostRequest('login.php', { username: username, password: password }, function(response) {
        if (response.success) {
            // Connexion réussie, rediriger ou afficher un message
            alert('Connexion réussie');
            window.location.href = 'dashboard.html'; // Rediriger vers la page d'accueil ou tableau de bord
        } else {
            // Afficher un message d'erreur
            alert(response.message);
        }
    });
});