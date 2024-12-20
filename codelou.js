
// Fonction pour récupérer et afficher les biomes
function populateBiomes() {
    // URL de l'API pour récupérer les biomes
    const apiUrl = "http://localhost/webdev/zoo/enclos.php?action=get_biomes";

    fetch(apiUrl)
        .then(response => {
            if (!response.ok) {
                throw new Error(`Erreur HTTP : ${response.status}`); // Gestion des erreurs HTTP
            }
            return response.json();
        })
        .then(biomes => {
            console.log("Biomes reçus :", biomes); // Log des données pour le débogage
            
            const biomesContainer = document.getElementById("biomes-container");
            biomesContainer.innerHTML = ""; // Vider le conteneur avant d'ajouter les biomes

            // Vérification si des biomes ont été reçus
            if (biomes.length === 0) {
                biomesContainer.innerHTML = "<p>Aucun biome disponible pour le moment.</p>";
                return;
            }

            // Tableau d'association statique pour les images des biomes
            const biomeImages = {
                "La Bergerie des reptiles": "bergerie-de-reptiles.png",
                "Le Vallon des cascades": "Le-vallon-des-cascades.jpg",
                "Le Belvédère": "le-belvédère.jpg",
                "Le Plateau": "le-plateau.jpg",
                "Les Clairières": "les-clairières.jpg",
                "Le Bois des pins": "le-bois-des-pins.jpg"
            };

            // Création des cartes pour chaque biome
            biomes.forEach(biome => {
                const biomeCard = document.createElement("div");
                biomeCard.className = "biome-card";

                // Définir l'image du biome ou une image par défaut
                const biomeImage = biomeImages[biome.name] || "images/default_biome.jpg";

                // Contenu HTML de la carte
                biomeCard.innerHTML = `
                    <img src="${biomeImage}" alt="${biome.name}" class="biome-image">
                    <div class="biome-info">
                        <h3>${biome.name}</h3>
                        <p>${biome.description || 'Découvrez ce biome fascinant.'}</p>
                    </div>
                `;

                // Gestionnaire de clic pour afficher les enclos
                biomeCard.addEventListener("click", () => {
                    console.log("Biome cliqué :", biome.id);
                    populateEnclosures(biome.id); // Charger les enclos associés
                });

                // Ajout de la carte au conteneur
                biomesContainer.appendChild(biomeCard);
            });
        })
        .catch(error => {
            console.error("Erreur lors de la récupération des biomes :", error);
            const biomesContainer = document.getElementById("biomes-container");
            biomesContainer.innerHTML = "<p>Une erreur est survenue lors du chargement des biomes. Veuillez réessayer plus tard.</p>";
        });
}


// Fonction pour récupérer et afficher les enclos d'un biome donné
function populateEnclosures(biomeId) {
    fetch(`http://localhost/webdev/zoo/enclos.php?action=get_enclos_by_biome&biome_id=${biomeId}`)
        .then(response => response.json())
        .then(enclos => {
            console.log("Enclos reçus :", enclos); // Log des données
            const enclosContainer = document.getElementById("enclos-container");
            enclosContainer.innerHTML = ""; // Vider le conteneur
            
            enclos.forEach(enclosItem => {
                const enclosElement = document.createElement("button");
                enclosElement.textContent = enclosItem.name;
                enclosElement.className = "enclos-item";
                enclosElement.onclick = () => {
                    console.log("Enclos cliqué :", enclosItem.id);
                    populateAnimals(enclosItem.id);
                };
                enclosContainer.appendChild(enclosElement);
            });
        })
        .catch(error => console.error("Erreur lors de la récupération des enclos :", error));
}

// Fonction pour récupérer et afficher les animaux d'un enclos donné
function populateAnimals(enclosId) {
    fetch(`http://localhost/webdev/zoo/enclos.php?action=get_animals_by_enclos&enclos_id=${enclosId}`)
        .then(response => response.json())
        .then(animals => {
            console.log("Animaux reçus :", animals); // Log des données
            const animalsContainer = document.getElementById("animals-container");
            animalsContainer.innerHTML = ""; // Vider le conteneur

            // Correspondance des images pour chaque animal
            const animalPhotos = {
                Python: ["python1.jpg", "python2.jpg"],
                Tortue: ["tortue1.jpg", "tortue2.jpg", "tortue3.jpg"],
                Iguane: ["iguane1.jpg", "iguane2.jpg"],
                Ara: ["ara1.jpg", "ara2.jpg"],
                "Grand Hocco" : ["hocco1.jpg", "hocco2.jpg"],
                Panthère: ["pantere1.jpg", "pantere2.jpg"],
                "Panda roux": ["panda1.jpg", "panda2.jpg"],
                "Chèvre naine": ["chevre_naine1.jpg"],
                Lémurien: ["lemurien1.jpg", "lemurien2.jpg"],
                Mouflon : ["mouflon1.jpg", "mouflon2.jpg"],
                Binturong: ["binturong.jpg"],
                "Panda roux": ["panda1.jpg", "panda2.jpg"],
                Loutre: ["loutre1.jpg", "loutre2.jpeg"],
                Rhinocéros : ["rhino1.jpg", "rhino2.jpg"],
                //pas la  bonne photo//
                "Oryx Beisa": ["ob1.jpg", "ob2.jpg"],
                Gnou : ["gnou1.jpg", "gnou2.jpg"],
                Fennec: ["fennec1.jpg", "fennec2.jpg"],
                Suricate: ["suricate1.jpg", "suricate2.jpg"],
                Coati : ["coati1.jpg", "coati2.jpg"],
                Saïmiri: ["saimiris1.jpg", "saimiris2.jpg"],
                Tapir: ["tapir1.jpg", "tapir2.jpg"],
                Gazelle : ["gazelle1.jpg", "gazelle2.jpg"],
                Autruche: ["autruche1.jpg", "autruche2.jpg"],
                Guépard: ["guepard1.jpg", "guepard2.jpg","guepard3.jpg"],
                Casoar : ["casoar1.jpg", "casoar2.jpg"],
                "Crocodile nain": ["croconain1.jpg"],
                Tamarin: ["tamarin1.jpg", "tamarin2.jpg"],
                Capucin : ["capucin1.jpg", "capucin2.jpg"],
                Ouistiti: ["ouistiti1.jpg", "ouistiti2.jpg"],
                Gibbon: ["gibbon1.jpg", "gibbon2.jpg"],
                "Varan de Komodo" : ["varranco1.jpg", "varanco2.jpg"],
                Éléphant: ["elephant1.jpg", "elephant2.jpg"],
                //manque photo// 
                Grivet: ["grivet1.jpg", "grivet2.jpg"],
                //manque photo//
                Girafe : ["girafe1.jpg", "girafe2.jpg"],

                Hyène: ["hyene1.jpg", "hyene2.jpg"],
                Zèbre: ["zebre1.jpg", "zebre2.jpg"],
                Hippopotame : ["hippo1.jpg", "hippo2.jpg"],
                Lion: ["lion1.jpg", "lion2.jpg"],
                Marabout: ["marabout1.jpg"],
                Cigogne: ["cigogne1.jpg", "cigogne2.jpg"],
                "Oryx algazelle" : ["oa1.jpg", "oa2.jpg"],
                Watusi: ["watusi1.jpg", "watusi2.jpg"],
                "Âne de Somalie": ["anedeso1.jpg", "anedeso2.jpg"],
                Yack : ["yack1.jpg", "yack2.jpg"],
                "Mouton noir": ["moutonnoir1.jpg", "moutonnoir2.jpg"],
                Ibis: ["ibis1.jpg", "ibis2.jpg"],
                Pécari: ["pecari1.jpg"],
                Tamanoir: ["tamanoir1.jpg", "tamanoir2.jpg"],
                "Flamant rose": ["flamant1.jpg"],
                Nandou: ["nadou1.jpg", "nadou2.jpg"],
                Émeu: ["emeu1.jpg", "emeu2.jpg"],
                Wallaby: ["wallaby.jpg", "wallaby2.jpg"],
                "Porc-épic": ["porc1.jpg", "porc2.jpg"],
                Bison: ["bison1.jpg", "bison2.jpg"],
                "Âne de Provence" : ["anedeso1.jpg", "anedeso2.jpg"],
                Dromadaire: ["dro1.jpg", "dro2.jpg"],
                Lynx: ["lynx1.jpg", "lynx2.jpg"],
                Serval: ["serval1.jpg", "serval2.jpg"],
                "Chien des buissons": ["chien1.jpg", "chien2.jpg"],
                Tigre: ["tigre1.jpg", "tigre2.jpg","tigre3.jpg"],
                "Macaque crabier": ["macaquecra.jpg", "macaquecra2.jpg"],
                Cerf: ["cerf1.jpg", "cerf2.jpg"],
                Vautour: ["vautour1.jpg", "vautour2.jpg"],
                Daim: ["daim.jpg", "daim2.jpg"],
                Nilgaut: ["nilgaut.jpg"],
                Antilope: ["antilope1.jpg", "antilope2.jpg"],
                "Loup d’Europe": ["loupeuro.jpg","loupeuro1.jpg","loupeuro2.jpg"],
                
            };

            animals.forEach(animal => {
                const animalElement = document.createElement("div");
                animalElement.className = "animal-item";

                // Vérifier si l'animal a des photos dans le tableau
                const photos = animalPhotos[animal.nom] || ["default1.jpg", "default2.jpg"];

                // Générer le carrousel HTML
                let carouselHTML = `
                    <div class="animal-carousel">
                        <button class="carousel-prev" onclick="moveCarousel(-1, '${animal.nom}')">&#10094;</button>
                        <div class="carousel-images" id="carousel-images-${animal.nom}">
                `;

                photos.forEach(photo => {
                    carouselHTML += `<img src="${photo}" alt="${animal.nom}" class="carousel-image">`;
                });

                carouselHTML += `
                        </div>
                        <button class="carousel-next" onclick="moveCarousel(1, '${animal.nom}')">&#10095;</button>
                    </div>
                `;

                // Ajouter le contenu de l'animal
                animalElement.innerHTML = `
                    <h3>${animal.nom}</h3>
                    <p>${animal.espece}</p>
                    ${carouselHTML}
                `;

                animalsContainer.appendChild(animalElement);
            });
        })
        .catch(error => console.error("Erreur lors de la récupération des animaux :", error));
}

// Fonction pour gérer le mouvement du carrousel
function moveCarousel(direction, animalName) {
    const carousel = document.getElementById(`carousel-images-${animalName}`);
    if (!carousel) return;

    const images = carousel.querySelectorAll(".carousel-image");
    const totalImages = images.length;
    let currentIndex = parseInt(carousel.dataset.currentIndex || "0");

    // Calculer le nouvel index
    currentIndex = (currentIndex + direction + totalImages) % totalImages;

    // Mettre à jour la position des images
    images.forEach((img, index) => {
        img.style.display = index === currentIndex ? "block" : "none";
    });

    // Sauvegarder l'index actuel
    carousel.dataset.currentIndex = currentIndex;
}



// Lancer la récupération des biomes au chargement de la page
window.onload = populateBiomes;
