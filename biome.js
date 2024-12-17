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

// Récupérer et afficher les biomes et enclos
window.onload = function() {
    sendGetRequest('biomes.php', function(response) {
        if (response.success) {
            const biomesContainer = document.getElementById('biomes-container');
            for (const biome in response.data) {
                const biomeDiv = document.createElement('div');
                biomeDiv.classList.add('biome');
                biomeDiv.innerHTML = `<h2>${biome}</h2>`;
                
                response.data[biome].enclos.forEach(function(enclos) {
                    const enclosDiv = document.createElement('div');
                    enclosDiv.classList.add('enclos');
                    enclosDiv.innerHTML = `
                        <h3>Enclos ID: ${enclos.enclos_id}</h3>
                        <p>Repas: ${enclos.repas}</p>
                        <p>Animaux: ${enclos.animaux}</p>
                    `;
                    biomeDiv.appendChild(enclosDiv);
                });

                biomesContainer.appendChild(biomeDiv);
            }
        } else {
            alert('Erreur: ' + response.message);
        }
    });
};