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

// Récupérer et afficher les services
window.onload = function() {
    sendGetRequest('services.php', function(response) {
        if (response.message) {
            alert(response.message); // Si aucun service trouvé
        } else {
            const tableBody = document.getElementById('services-table-body');
            response.forEach(function(relation) {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${relation.relation_id}</td>
                    <td>${relation.quantité}</td>
                    <td>${relation.id_biome}</td>
                    <td>${relation.service_nom}</td>
                `;
                tableBody.appendChild(row);
            });
        }
    });
};