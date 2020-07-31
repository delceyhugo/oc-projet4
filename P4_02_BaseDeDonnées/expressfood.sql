-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 13 fév. 2020 à 13:51
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `expressfood`
--

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_commande` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_adresse` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `Id_User` (`id_user`),
  KEY `fk_commande_UserAdresse1_idx` (`id_adresse`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `id_user`, `id_adresse`, `date`) VALUES
(1, 3, 6, '2020-01-29 00:00:00'),
(2, 3, 5, '2020-02-10 00:00:00'),
(3, 1, 1, '2020-02-05 00:00:00'),
(4, 2, 3, '2020-01-29 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `datemenu`
--

DROP TABLE IF EXISTS `datemenu`;
CREATE TABLE IF NOT EXISTS `datemenu` (
  `id_datemenu` int(11) NOT NULL AUTO_INCREMENT,
  `id_platsetdesserts` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id_datemenu`),
  KEY `fk_dateMenu_platsEtDesserts1_idx` (`id_platsetdesserts`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `datemenu`
--

INSERT INTO `datemenu` (`id_datemenu`, `id_platsetdesserts`, `date`) VALUES
(1, 1, '2020-02-26'),
(2, 4, '2020-02-26'),
(3, 1, '2020-02-19'),
(4, 2, '2020-02-20'),
(5, 4, '2020-02-20');

-- --------------------------------------------------------

--
-- Structure de la table `detailcommande`
--

DROP TABLE IF EXISTS `detailcommande`;
CREATE TABLE IF NOT EXISTS `detailcommande` (
  `id_contenu` int(11) NOT NULL AUTO_INCREMENT,
  `id_commande` int(11) NOT NULL,
  `id_platsetdesserts` int(11) NOT NULL,
  `quantite` varchar(45) NOT NULL,
  `prix` float NOT NULL,
  PRIMARY KEY (`id_contenu`),
  KEY `fk_detailCommande_commande1_idx` (`id_commande`),
  KEY `fk_detailCommande_platsEtDesserts1_idx` (`id_platsetdesserts`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `detailcommande`
--

INSERT INTO `detailcommande` (`id_contenu`, `id_commande`, `id_platsetdesserts`, `quantite`, `prix`) VALUES
(1, 1, 1, '1', 12.5),
(2, 1, 5, '2', 2.9),
(3, 2, 3, '2', 9),
(4, 2, 4, '2', 5.5);

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
CREATE TABLE IF NOT EXISTS `livraison` (
  `id_livraison` int(11) NOT NULL AUTO_INCREMENT,
  `id_livreur` int(11) DEFAULT NULL,
  `id_commande` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `statut` varchar(45) NOT NULL,
  PRIMARY KEY (`id_livraison`),
  KEY `fk_id_livreur` (`id_livreur`),
  KEY `fk_livraison_commande1_idx` (`id_commande`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livraison`
--

INSERT INTO `livraison` (`id_livraison`, `id_livreur`, `id_commande`, `date`, `statut`) VALUES
(1, 6, 1, '2020-01-29 00:00:00', 'livrée'),
(2, 6, 4, '2020-01-29 00:00:00', 'livrée'),
(3, 7, 2, '2020-01-10 00:00:00', 'livrée'),
(4, 7, 3, '2020-01-05 00:00:00', 'livrée');

-- --------------------------------------------------------

--
-- Structure de la table `platsetdesserts`
--

DROP TABLE IF EXISTS `platsetdesserts`;
CREATE TABLE IF NOT EXISTS `platsetdesserts` (
  `id_platsetdesserts` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `description` longtext NOT NULL,
  `stock` int(11) NOT NULL,
  `prix_unitaire` float NOT NULL,
  PRIMARY KEY (`id_platsetdesserts`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `platsetdesserts`
--

INSERT INTO `platsetdesserts` (`id_platsetdesserts`, `nom`, `description`, `stock`, `prix_unitaire`) VALUES
(1, 'Pavés de Saumon', 'Si vous aimez le saumon frais et la cuisine à la légère, cette recette de pavés de saumon devrait vous faire vous sentir parfaitement bien dans votre assiette.', 150, 12.5),
(2, 'Poulet basquaise', 'Une spécialité culinaire de cuisine traditionnelle emblématique de la cuisine basque', 150, 10),
(3, 'Chili con carne', 'Le chili con carne est une sorte de ragoût de viande épicé originaire du sud des États-Unis dont les ingrédients essentiels de la variante la plus connue sont la viande de bœuf et le chili.', 175, 9.5),
(4, 'Tiramisu', 'Le tiramisu est une pâtisserie et un dessert traditionnel de la cuisine italienne.', 150, 5.5),
(5, 'Pancakes', 'Un pancake est un type de crêpe épaisse, servie habituellement au déjeuner en Amérique du Nord.', 200, 2.9);

-- --------------------------------------------------------

--
-- Structure de la table `useradresse`
--

DROP TABLE IF EXISTS `useradresse`;
CREATE TABLE IF NOT EXISTS `useradresse` (
  `id_adresse` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_adresse`),
  KEY `fk_UserAdresse_users1_idx` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `useradresse`
--

INSERT INTO `useradresse` (`id_adresse`, `id_user`, `adresse`) VALUES
(1, 1, '15 rue des jardins'),
(2, 1, '4 rue du stade'),
(3, 2, '26 rue charle laumier'),
(4, 3, '2 avenue georges pompidou'),
(5, 3, '18 rue du crechot'),
(6, 3, '30 rue du saule');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(25) NOT NULL,
  `nom` varchar(80) NOT NULL,
  `localisation` varchar(100) DEFAULT NULL,
  `dispo` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `nom_UNIQUE` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_user`, `type`, `nom`, `localisation`, `dispo`) VALUES
(1, 'client', 'Jean Dupont', NULL, NULL),
(2, 'client', 'Edouard Martin', NULL, NULL),
(3, 'client', 'Emma Bernard', NULL, NULL),
(4, 'client', 'Léo Petit', NULL, NULL),
(5, 'livreur', 'Victor Durand', NULL, 0),
(6, 'livreur', 'Manon Richard', 'Rue Balangerie', 1),
(7, 'livreur', 'Adam Thomas', 'Avenue Aristide Rondeau', 1),
(8, 'client', 'Axel Roussel', NULL, NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_commande_UserAdresse1` FOREIGN KEY (`id_adresse`) REFERENCES `useradresse` (`id_adresse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_commande_id` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `datemenu`
--
ALTER TABLE `datemenu`
  ADD CONSTRAINT `fk_dateMenu_platsEtDesserts1` FOREIGN KEY (`id_platsetdesserts`) REFERENCES `platsetdesserts` (`id_platsetdesserts`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `detailcommande`
--
ALTER TABLE `detailcommande`
  ADD CONSTRAINT `fk_detailCommande_commande1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detailCommande_platsEtDesserts1` FOREIGN KEY (`id_platsetdesserts`) REFERENCES `platsetdesserts` (`id_platsetdesserts`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `fk_livraison_commande1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_livraison_id` FOREIGN KEY (`id_livreur`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `useradresse`
--
ALTER TABLE `useradresse`
  ADD CONSTRAINT `fk_UserAdresse_users1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
