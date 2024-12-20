const requestOptions = {
    method: "GET",
    redirect: "follow",
};

fetch("http://localhost/zoo/zoo/enclos.php", requestOptions)
    .then((response) => response.json())
    .then((data) => {
        console.log("Données reçues :", data); // Vérifie les données ici

        const carouselContainer = document.getElementById("carousel-photos");

        // Parcourir les données pour récupérer les images
        data.forEach((biome) => {
            console.log("Biome :", biome); // Vérifie chaque biome

            if (biome.enclos && Array.isArray(biome.enclos)) {
                biome.enclos.forEach((enclos) => {
                    console.log("Enclos :", enclos); // Vérifie chaque enclos

                    if (enclos.animaux && Array.isArray(enclos.animaux)) {
                        enclos.animaux.forEach((animal, index) => {
                            console.log("Animal :", animal); // Vérifie chaque animal

                            if (animal.image && animal.nom) {
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
                            } else {
                                console.warn("Animal incomplet :", animal);
                            }
                        });
                    } else {
                        console.warn("Enclos sans animaux :", enclos);
                    }
                });
            } else {
                console.warn("Biome sans enclos :", biome);
            }
        });
    })
    .catch((error) => console.error("Erreur :", error));