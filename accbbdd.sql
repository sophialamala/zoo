-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 12 déc. 2024 à 12:43
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `accbbdd`
--

-- --------------------------------------------------------

--
-- Structure de la table `animaux`
--

CREATE TABLE `animaux` (
  `id` int(11) NOT NULL,
  `nom` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `animaux`
--

INSERT INTO `animaux` (`id`, `nom`) VALUES
(1, 'Python'),
(2, 'Tortue'),
(3, 'Iguane'),
(4, 'Ara Perroquet'),
(5, 'Grand Hocco'),
(6, 'Panthère'),
(7, 'Panda Roux'),
(8, 'Lémurien'),
(9, 'Chèvre naine'),
(10, 'Mouflon'),
(11, 'Loutre'),
(12, 'Binturong'),
(13, 'Macaque crabier'),
(14, 'Cerf'),
(15, 'Vautour'),
(16, 'Loup d\'Europe'),
(17, 'Antilope'),
(18, 'Daim'),
(19, 'Nilgaut'),
(20, 'Dromadaire'),
(21, 'Bison'),
(22, 'Âne de Provence'),
(23, 'Lynx'),
(24, 'Serval'),
(25, 'Chien des buissons'),
(26, 'Tigre'),
(29, 'Ibis '),
(30, 'Pécari'),
(31, 'Tamanoir'),
(32, 'Nandou'),
(33, 'Flamant rose'),
(34, 'Émeu'),
(35, 'Wallaby'),
(36, 'Porc-épic'),
(37, 'Mouton Noir'),
(38, 'Yack'),
(39, 'Âne de Somalie'),
(40, 'Watusi'),
(41, 'Oryx algazelle'),
(42, 'Cigogne'),
(43, 'Marabout'),
(44, 'Tamarin'),
(45, 'Capucin'),
(46, 'Ouistiti'),
(47, 'Gibbon'),
(48, 'Varan de Komodo'),
(49, 'Grivet Cercopithèque'),
(50, 'Eléphant'),
(51, 'Girafe'),
(52, 'Zèbre'),
(53, 'Hyène'),
(54, 'Loup à crinière'),
(55, 'Lion'),
(56, 'Hippopotame'),
(57, 'Casoar'),
(58, 'Crocodile nain'),
(59, 'Tapir'),
(60, 'Guépard'),
(61, 'Gazelle'),
(62, 'Autruche'),
(63, 'Saïmiri'),
(64, 'Gnou'),
(65, 'Coati'),
(66, 'Fennec'),
(67, 'Suricate'),
(68, 'Rhinocéros'),
(69, 'Oryx beisa');

-- --------------------------------------------------------

--
-- Structure de la table `avis`
--

CREATE TABLE `avis` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `commentaire` text NOT NULL,
  `note` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `avis`
--

INSERT INTO `avis` (`id`, `user_id`, `date`, `commentaire`, `note`) VALUES
(1, 1, '2024-12-10 13:59:55', 'Super expérience au zoo !\r\nLes animaux sont bien soignés et les enclos spacieux. Le personnel est accueillant et les activités pour enfants sont géniales. Mention spéciale pour le spectacle pour les crocodiles nains, vraiment impressionnant. Une sortie parfaite pour toute la famille !', 9),
(3, 2, '2024-12-10 14:02:33', 'Le zoo est correct, mais certains enclos semblent un peu petits pour les animaux. Peu d’ombre dans les allées, ce qui rend la visite fatigante par temps chaud. Les prix des snacks sont élevés, et il manque un peu d\'animations ou d\'explications sur les animaux. Une expérience moyenne.', 5),
(4, 3, '2024-12-10 14:03:54', 'Le zoo est magnifique, avec des animaux fascinants et des enclos bien aménagés. On sent que le bien-être animal est une priorité. Le parcours est agréable et bien pensé, parfait pour une sortie en famille. Gros coup de cœur pour la zone tropicale et les girafes ! ', 10),
(5, 4, '2024-12-10 14:04:36', 'Les animaux sont magnifiques et semblent bien soignés. Le parc est propre, bien organisé et propose des activités intéressantes. Idéal pour passer une journée en famille ou entre amis. Coup de cœur pour la diversité des espèces et les animations pédagogiques.', 9),
(9, 45, '2024-12-11 22:12:55', 'génial wesh', 9),
(12, 16, '2024-12-11 22:26:22', 'ce zoo est sumblimissime', 10);

-- --------------------------------------------------------

--
-- Structure de la table `biomes`
--

CREATE TABLE `biomes` (
  `id` int(11) NOT NULL,
  `couleur` text NOT NULL,
  `nom` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `biomes`
--

INSERT INTO `biomes` (`id`, `couleur`, `nom`) VALUES
(1, 'Bleu', 'Le Vallon des cascades'),
(2, 'Rouge', 'Le Plateau'),
(3, 'Marron', 'Le Belvédère'),
(4, 'Jaune', 'Les Clairières'),
(5, 'Vert', 'Le Bois des pins'),
(6, 'Turquoise', 'La Bergerie des Reptiles');

-- --------------------------------------------------------

--
-- Structure de la table `enclos`
--

CREATE TABLE `enclos` (
  `id` int(11) NOT NULL,
  `id_biomes` int(11) NOT NULL,
  `repas` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `enclos`
--

INSERT INTO `enclos` (`id`, `id_biomes`, `repas`) VALUES
(1, 6, '12h36'),
(2, 5, '8h02'),
(3, 5, '8h24'),
(4, 5, '8h47'),
(5, 5, '9h00'),
(6, 5, '9h15'),
(7, 3, '17h00'),
(8, 3, '17h12'),
(9, 3, '17h25'),
(10, 3, '17h38'),
(11, 3, '17h59'),
(12, 3, '18h07'),
(13, 3, '18h23'),
(14, 3, '18h34'),
(15, 3, '18h26'),
(16, 4, '13h11'),
(17, 4, '13h15'),
(18, 4, '13h21'),
(19, 4, '13h27'),
(20, 4, '13h56'),
(21, 4, '14h01'),
(22, 4, '14h14'),
(23, 4, '14h18'),
(24, 4, '14h56'),
(25, 4, '14h37'),
(26, 4, '15h26'),
(27, 4, '15h25'),
(28, 4, '19h24'),
(29, 4, '19h58'),
(30, 4, '21h21'),
(31, 1, '17h45'),
(32, 1, '17h55'),
(33, 1, '7h02'),
(34, 1, '18h33'),
(35, 1, '13h06'),
(36, 1, '12h25'),
(37, 1, '9h21'),
(38, 1, '9h55'),
(39, 1, '17h28'),
(40, 2, '11h31'),
(41, 2, '11h56'),
(42, 2, '17h00'),
(43, 2, '17h17'),
(44, 2, '10h50'),
(45, 2, '10h31'),
(46, 2, '16h11'),
(47, 2, '16h14'),
(48, 2, '18h25'),
(49, 2, '17h41'),
(50, 2, '15h14'),
(51, 2, '14h02'),
(52, 2, '19h21');

-- --------------------------------------------------------

--
-- Structure de la table `relation`
--

CREATE TABLE `relation` (
  `id_enclos` int(11) NOT NULL,
  `id_animaux` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `relation`
--

INSERT INTO `relation` (`id_enclos`, `id_animaux`, `id`) VALUES
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(2, 16, 4),
(3, 17, 5),
(3, 18, 6),
(3, 19, 7),
(4, 15, 8),
(5, 14, 9),
(6, 13, 10),
(7, 57, 11),
(8, 58, 12),
(9, 67, 13),
(10, 66, 14),
(11, 63, 15),
(11, 65, 16),
(12, 59, 17),
(13, 64, 18),
(13, 69, 19),
(13, 68, 20),
(14, 60, 21),
(15, 61, 22),
(15, 62, 23),
(31, 10, 24),
(32, 9, 25),
(33, 7, 26),
(34, 8, 27),
(35, 2, 28),
(37, 6, 29),
(36, 11, 30),
(36, 12, 31),
(38, 4, 32),
(39, 5, 33),
(40, 53, 34),
(41, 55, 35),
(42, 54, 36),
(43, 56, 37),
(44, 51, 38),
(45, 50, 39),
(46, 49, 41),
(47, 48, 42),
(48, 44, 43),
(49, 52, 44),
(50, 45, 45),
(51, 47, 46),
(52, 46, 47),
(16, 22, 48),
(17, 20, 49),
(18, 21, 50),
(19, 39, 51),
(19, 40, 52),
(19, 41, 53),
(20, 37, 54),
(20, 38, 55),
(21, 42, 56),
(21, 43, 57),
(22, 26, 58),
(23, 25, 59),
(24, 24, 60),
(25, 23, 61),
(26, 34, 62),
(26, 35, 63),
(27, 36, 64),
(29, 30, 65),
(30, 29, 66),
(30, 2, 67),
(28, 31, 68),
(28, 32, 69),
(28, 33, 70);

-- --------------------------------------------------------

--
-- Structure de la table `relations_services`
--

CREATE TABLE `relations_services` (
  `id` int(11) NOT NULL,
  `quantité` int(11) NOT NULL,
  `id_biome` int(11) NOT NULL,
  `id_service` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `relations_services`
--

INSERT INTO `relations_services` (`id`, `quantité`, `id_biome`, `id_service`) VALUES
(1, 1, 6, 8),
(2, 1, 6, 5),
(3, 1, 6, 14),
(4, 1, 6, 12),
(5, 1, 4, 16),
(6, 3, 4, 6),
(7, 1, 4, 5),
(8, 2, 4, 7),
(9, 3, 3, 16),
(10, 3, 2, 7),
(11, 1, 2, 9),
(12, 1, 2, 5),
(13, 2, 2, 6),
(14, 1, 2, 16),
(15, 1, 2, 15),
(16, 1, 2, 10),
(17, 1, 2, 17),
(18, 1, 1, 17),
(19, 3, 1, 7),
(20, 1, 1, 9),
(21, 1, 1, 6),
(22, 1, 1, 13);

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `nom` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `services`
--

INSERT INTO `services` (`id`, `nom`) VALUES
(5, 'toilettes'),
(6, 'point d\'eau'),
(7, 'espace pique-nique'),
(8, 'boutique'),
(9, 'gare'),
(10, 'lodge'),
(11, 'tente pédagogique'),
(12, 'paillote'),
(13, 'café nomade'),
(14, 'petit café'),
(15, 'plateaux de jeux'),
(16, 'point de vue'),
(17, 'trajet en train');

-- --------------------------------------------------------

--
-- Structure de la table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `type` enum('Famille','Adulte','Enfant') NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tickets`
--

INSERT INTO `tickets` (`id`, `type`, `price`) VALUES
(1, 'Adulte', 30.00),
(2, 'Enfant', 20.00),
(3, 'Famille', 80.00);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `mail` text NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin','','') NOT NULL,
  `username` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `mail`, `password`, `role`, `username`) VALUES
(1, 'ilana.coignet@isen.yncrea.fr', 'jevousensuppliesortezmoidela', 'admin', 'ilanarbre'),
(2, 'sophie.malara@caca.com', 'caca.caca2', 'admin', 'sophiarbre'),
(3, 'emeric.janowski@yncrea.fr', 'repondeznoussvp', 'user', 'emericdu83'),
(4, 'emilien.capel@hotmail.com', 'jesuisemilien9', 'user', 'emiliano'),
(5, 'charly@jesuischarlylechien.fr', 'dalmatien', 'user', 'charlylechiendilana'),
(6, 'ilana.coignet@gmail.com', 'isen', 'admin', 'ilanape');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `animaux`
--
ALTER TABLE `animaux`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `avis`
--
ALTER TABLE `avis`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `biomes`
--
ALTER TABLE `biomes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `enclos`
--
ALTER TABLE `enclos`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `relation`
--
ALTER TABLE `relation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `relations_services`
--
ALTER TABLE `relations_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Etrangère` (`id_biome`,`id_service`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `animaux`
--
ALTER TABLE `animaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT pour la table `avis`
--
ALTER TABLE `avis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `biomes`
--
ALTER TABLE `biomes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `enclos`
--
ALTER TABLE `enclos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT pour la table `relation`
--
ALTER TABLE `relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT pour la table `relations_services`
--
ALTER TABLE `relations_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
