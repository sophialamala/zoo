const requestOptions = {
    method: "GET",
    redirect: "follow",
  };
  
  fetch("http://localhost/zoo/zoo/enclos.php", requestOptions)
    .then((response) => response.json())
    .then((data) => {
      const carouselContainer = document.getElementById("carousel-photos");
  
      // Parcourir les données pour récupérer les images
      data.forEach((biome) => {
        biome.enclos.forEach((enclos) => {
          enclos.animaux.forEach((animal, index) => {
            // Créer un élément pour chaque image
            const item = document.createElement("div");
            item.className = `carousel-item ${index === 0 ? "active" : ""}`;
            item.innerHTML = `
              <img src="${animal.image}" class="d-block w-100" alt="${animal.nom}">
              <div class="carousel-caption d-none d-md-block">
                <h5>${animal.nom}</h5>
              </div>
            `;
            carouselContainer.appendChild(item);
          });
        });
      });
    })
    .catch((error) => console.error("Erreur :", error));