-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 29 nov. 2024 à 10:23
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
CREATE DATABASE IF NOT EXISTS `accbbdd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `accbbdd`;

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
(52, 46, 47);

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `nom` text NOT NULL,
  `id_biomes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tickets`
--

CREATE TABLE `tickets` (
  `tickets_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ticket_type` enum('Famille','Adulte','Enfant') NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `date_achat` timestamp NULL DEFAULT current_timestamp(),
  `date_fin` time NOT NULL,
  `used` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tickets`
--

INSERT INTO `tickets` (`tickets_id`, `user_id`, `ticket_type`, `description`, `price`, `date_achat`, `date_fin`, `used`) VALUES
(1, 1, 'Adulte', 'Accès à toutes les attractions', 30.00, '2024-11-29 08:27:57', '00:00:00', 0),
(2, 1, 'Enfant', 'Accès complet pour les enfants de 4 à 12 ans', 20.00, '2024-11-29 08:27:57', '00:00:00', 0),
(3, 1, 'Famille', 'Offre spéciale 2 adultes et 2 enfants', 80.00, '2024-11-29 08:27:57', '00:00:00', 0);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `mail` text NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin','','') NOT NULL,
  `name` varchar(64) NOT NULL,
  `phone number` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `animaux`
--
ALTER TABLE `animaux`
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
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`tickets_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `animaux`
--
ALTER TABLE `animaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT pour la table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `tickets_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
