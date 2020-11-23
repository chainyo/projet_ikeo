-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8081
-- Generation Time: Nov 17, 2020 at 04:20 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ikeo`
--
CREATE DATABASE IF NOT EXISTS `ikeo` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ikeo`;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id_clients` int(11) NOT NULL,
  `id_type` int(11) NOT NULL,
  `id_raisonsociale` int(11) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `ville` int(11) NOT NULL,
  `pays` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id_clients`, `id_type`, `id_raisonsociale`, `adresse`, `ville`, `pays`) VALUES
(1, 1, 1, 'Place Vendôme', 4, 1),
(2, 1, 2, 'Porte de Brandebourg', 5, 2),
(3, 1, 1, 'Rue Jean Jaurès', 6, 1),
(4, 1, 3, 'Rue de la Bastille', 4, 1),
(5, 1, 1, 'Avenue des Trois Dragons', 7, 3),
(6, 2, 4, 'Oxford street', 8, 4),
(7, 1, 5, 'Coven Garden', 8, 4);

-- --------------------------------------------------------

--
-- Table structure for table `factures`
--

CREATE TABLE `factures` (
  `id_facture` int(11) NOT NULL,
  `numero` varchar(6) NOT NULL,
  `date` date NOT NULL,
  `id_clients` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `factures`
--

INSERT INTO `factures` (`id_facture`, `numero`, `date`, `id_clients`) VALUES
(1, 'MSQ291', '2018-06-15', 1),
(2, 'MSQ292', '2018-06-23', 5),
(3, 'MSQ293', '2018-06-23', 6),
(4, 'MSQ294', '2018-06-28', 1),
(5, 'MSQ295', '2018-07-01', 4),
(6, 'MSQ296', '2018-07-04', 7),
(7, 'MSQ297', '2018-07-12', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pays`
--

CREATE TABLE `pays` (
  `id_pays` int(11) NOT NULL,
  `pays` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pays`
--

INSERT INTO `pays` (`id_pays`, `pays`) VALUES
(1, 'France'),
(2, 'Allemagne'),
(3, 'Espagne'),
(4, 'Angleterre');

-- --------------------------------------------------------

--
-- Table structure for table `produits`
--

CREATE TABLE `produits` (
  `id_produits` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `reference` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `abandon` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produits`
--

INSERT INTO `produits` (`id_produits`, `nom`, `reference`, `description`, `abandon`) VALUES
(1, 'Knutsen', 'OANT72', 'Table basse pour poser les bières', 0),
(2, 'Moen', 'OANT34', 'Chaise haute de bar', 1),
(3, 'Eide', 'OANT67', 'Porte-serviettes pour 100 serviettes', 0),
(4, 'Gulbrandsen', 'LXAL34', 'Lit nuage en lévitation', 0),
(5, 'Naess', 'LXAL56', 'Table 128 convives', 0),
(6, 'Lund', 'LXAL78', 'Bureau cafetière électrique', 0),
(7, 'Dahl', 'LXAL12', 'Tiroir à rond de serviette', 1),
(8, 'Ruud', 'OANT90', 'Bureau-lit combiné', 0),
(9, 'Apfelgluk', 'OANT12', 'Panier à chien (ou à chat)', 0);

-- --------------------------------------------------------

--
-- Table structure for table `produits_sites`
--

CREATE TABLE `produits_sites` (
  `id_produits` int(11) NOT NULL,
  `id_usine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produits_sites`
--

INSERT INTO `produits_sites` (`id_produits`, `id_usine`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 3),
(4, 3),
(5, 1),
(5, 2),
(5, 3),
(6, 1),
(6, 3),
(7, 2),
(7, 3),
(8, 3),
(9, 3);

-- --------------------------------------------------------

--
-- Table structure for table `prod_factures`
--

CREATE TABLE `prod_factures` (
  `id_produits` int(11) NOT NULL,
  `id_facture` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prod_factures`
--

INSERT INTO `prod_factures` (`id_produits`, `id_facture`, `quantite`) VALUES
(1, 1, 20),
(2, 1, 30),
(3, 1, 10),
(8, 2, 25),
(4, 2, 32),
(3, 3, 80),
(5, 3, 70),
(6, 3, 60),
(4, 3, 60),
(9, 3, 120),
(7, 3, 90),
(1, 4, 10),
(2, 4, 10),
(6, 4, 30),
(1, 5, 25),
(7, 5, 34),
(2, 6, 40),
(5, 6, 38),
(6, 6, 54),
(4, 7, 20),
(5, 7, 34),
(6, 7, 45);

-- --------------------------------------------------------

--
-- Table structure for table `raisonsociale`
--

CREATE TABLE `raisonsociale` (
  `id_raisonsociale` int(11) NOT NULL,
  `nom_raisonsociale` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `raisonsociale`
--

INSERT INTO `raisonsociale` (`id_raisonsociale`, `nom_raisonsociale`) VALUES
(1, 'Bo Meuble'),
(2, 'Mobel'),
(3, 'Tout A La Maison'),
(4, 'The World Compagny'),
(5, 'The Best Greatest Beautifulest Furniture');

-- --------------------------------------------------------

--
-- Table structure for table `site_prod`
--

CREATE TABLE `site_prod` (
  `id_usines` int(10) NOT NULL,
  `usines` varchar(50) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `ville` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `site_prod`
--

INSERT INTO `site_prod` (`id_usines`, `usines`, `adresse`, `ville`) VALUES
(1, 'Harald', 'Quai Pipervika', 1),
(2, 'Sverre', 'Rue Strangehagen', 2),
(3, 'Olaf', 'Place Nidaros', 3);

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `id_type` int(10) NOT NULL,
  `nom_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id_type`, `nom_type`) VALUES
(1, 'Magasin'),
(2, 'Central d\'achat');

-- --------------------------------------------------------

--
-- Table structure for table `villes`
--

CREATE TABLE `villes` (
  `id_ville` int(11) NOT NULL,
  `ville` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `villes`
--

INSERT INTO `villes` (`id_ville`, `ville`) VALUES
(1, 'Oslo'),
(2, 'Bergen'),
(3, 'Trondheim'),
(4, 'Paris'),
(5, 'Berlin'),
(6, 'Brest'),
(7, 'Barcelone'),
(8, 'Londres');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_clients`),
  ADD KEY `id_type` (`id_type`),
  ADD KEY `id_raisonsociale` (`id_raisonsociale`),
  ADD KEY `ville` (`ville`),
  ADD KEY `pays` (`pays`);

--
-- Indexes for table `factures`
--
ALTER TABLE `factures`
  ADD PRIMARY KEY (`id_facture`),
  ADD KEY `id_clients` (`id_clients`);

--
-- Indexes for table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`id_pays`);

--
-- Indexes for table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id_produits`);

--
-- Indexes for table `produits_sites`
--
ALTER TABLE `produits_sites`
  ADD KEY `id_produits` (`id_produits`),
  ADD KEY `id_usine` (`id_usine`);

--
-- Indexes for table `prod_factures`
--
ALTER TABLE `prod_factures`
  ADD KEY `id_produits` (`id_produits`),
  ADD KEY `id_facture` (`id_facture`);

--
-- Indexes for table `raisonsociale`
--
ALTER TABLE `raisonsociale`
  ADD PRIMARY KEY (`id_raisonsociale`);

--
-- Indexes for table `site_prod`
--
ALTER TABLE `site_prod`
  ADD PRIMARY KEY (`id_usines`),
  ADD KEY `ville` (`ville`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id_type`);

--
-- Indexes for table `villes`
--
ALTER TABLE `villes`
  ADD PRIMARY KEY (`id_ville`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id_clients` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pays`
--
ALTER TABLE `pays`
  MODIFY `id_pays` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `produits`
--
ALTER TABLE `produits`
  MODIFY `id_produits` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `raisonsociale`
--
ALTER TABLE `raisonsociale`
  MODIFY `id_raisonsociale` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `factures`
-- 
ALTER TABLE `factures`
  MODIFY `id_facture` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `site_prod`
--
ALTER TABLE `site_prod`
  MODIFY `id_usines` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `villes`
--
ALTER TABLE `villes`
  MODIFY `id_ville` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type` (`id_type`),
  ADD CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`id_raisonsociale`) REFERENCES `raisonsociale` (`id_raisonsociale`),
  ADD CONSTRAINT `clients_ibfk_3` FOREIGN KEY (`ville`) REFERENCES `villes` (`id_ville`),
  ADD CONSTRAINT `clients_ibfk_4` FOREIGN KEY (`pays`) REFERENCES `pays` (`id_pays`);

--
-- Constraints for table `factures`
--
ALTER TABLE `factures`
  ADD CONSTRAINT `factures_ibfk_1` FOREIGN KEY (`id_clients`) REFERENCES `clients` (`id_clients`);

--
-- Constraints for table `produits_sites`
--
ALTER TABLE `produits_sites`
  ADD CONSTRAINT `produits_sites_ibfk_1` FOREIGN KEY (`id_produits`) REFERENCES `produits` (`id_produits`),
  ADD CONSTRAINT `produits_sites_ibfk_2` FOREIGN KEY (`id_usine`) REFERENCES `site_prod` (`id_usines`);

--
-- Constraints for table `prod_factures`
--
ALTER TABLE `prod_factures`
  ADD CONSTRAINT `prod_factures_ibfk_1` FOREIGN KEY (`id_produits`) REFERENCES `produits` (`id_produits`),
  ADD CONSTRAINT `prod_factures_ibfk_2` FOREIGN KEY (`id_facture`) REFERENCES `factures` (`id_facture`);

--
-- Constraints for table `site_prod`
--
ALTER TABLE `site_prod`
  ADD CONSTRAINT `site_prod_ibfk_1` FOREIGN KEY (`ville`) REFERENCES `villes` (`id_ville`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
