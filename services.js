function sendGetRequest(url, callback) {
    const xhr = new XMLHttpRequest();
    xhr.open('GET', url, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                try {
                    const response = JSON.parse(xhr.responseText);
                    console.log("Réponse du serveur : ", response); // Affiche la réponse du serveur
                    callback(response);
                } catch (e) {
                    console.error("Erreur de parsing JSON : ", e);
                }
            } else {
                console.error("Erreur de requête : ", xhr.status);
            }
        }
    };
    xhr.send();
}

// Récupérer et afficher les services
window.onload = function() {
    sendGetRequest('services.php', function(response) {
        if (response.message) {
            alert(response.message); // Si aucun service trouvé
        } else {
            const tableBody = document.getElementById('services-table-body');
            if (tableBody) {
                console.log("Tableau trouvé : ", tableBody);
                response.forEach(function(service) {
                    console.log("Service : ", service); // Affiche chaque service
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>${service.id}</td>
                        <td>${service.nom}</td>
                    `;
                    tableBody.appendChild(row);
                });
            } else {
                console.error("Le corps du tableau est introuvable.");
            }
        }
    });
};
