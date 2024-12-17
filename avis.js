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

// Récupérer et afficher les avis
window.onload = function() {
    sendGetRequest('avis.php', function(response) {
        if (response.success) {
            const avisContainer = document.getElementById('avis-container');
            response.data.forEach(function(avis) {
                const avisDiv = document.createElement('div');
                avisDiv.classList.add('avis');
                avisDiv.innerHTML = `
                    <h3>Avis de ${avis.username}</h3>
                    <p>${avis.commentaire}</p>
                    <p>Note: ${avis.note}</p>
                `;
                avisContainer.appendChild(avisDiv);
            });
        } else {
            alert('Erreur: ' + response.message);
        }
    });
};