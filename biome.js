const requestOptions = {
    method: "GET",
    redirect: "follow"
  };
  
  fetch("http://localhost/zoo/zoo/b.php", requestOptions)
    .then((response) => response.text())
    .then((result) => console.log(result))
    .catch((error) => console.error(error));
    function showBiome(id) {
        let biome = biomes[id];
    
        document.getElementById("biome-list").style.display = "none";
        document.getElementById("biome-detail").style.display = "block";
    
        document.getElementById("biome-name").textContent = biome.nom;
        document.getElementById("biome-description").textContent = biome.description;
    
        // Afficher les enclos du biome
        let enclosHTML = "";
        if (biome.enclos && biome.enclos.length > 0) {
            biome.enclos.forEach(enclos => {
                enclosHTML += `<li>${enclos.nom}</li>`;
            });
        } else {
            enclosHTML = "<li>Aucun enclos disponible</li>";
        }
    
        document.getElementById("enclos").innerHTML = enclosHTML;
    }