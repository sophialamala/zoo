// Fonction pour envoyer une requête GET avec AJAX
function sendGetRequest(url, callback) {
    const xhr = new XMLHttpRequest();
    xhr.open('GET', url, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            callback(JSON.parse(xhr.responseText));
        }
    };
    xhr.send();
}

// Récupérer et afficher les animaux
window.onload = function() {
    sendGetRequest('animaux.php', function(response) {
        if (response.success) {
            const animauxContainer = document.getElementById('animaux-container');
            response.data.forEach(function(animal) {
                const animalDiv = document.createElement('div');
                animalDiv.classList.add('animal');
                animalDiv.innerHTML = `
                    <h3>Nom: ${animal.nom}</h3>
                    <p>Espèce: ${animal.espece}</p>
                    <p>Age: ${animal.age}</p>
                    <p>Biomes: ${animal.biomes}</p>
                `;
                animauxContainer.appendChild(animalDiv);
            });
        } else {
            alert('Erreur: ' + response.message);
        }
    });
};