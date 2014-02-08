-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Sam 08 Février 2014 à 17:09
-- Version du serveur: 5.5.32-log
-- Version de PHP: 5.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `dev_materialDB`
--

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL,
  `property` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` int(11) NOT NULL,
  `comment` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_product_cmts` (`product`),
  KEY `fk_property_cmts` (`property`),
  KEY `fk_user_cmts` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `filters`
--

CREATE TABLE IF NOT EXISTS `filters` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `filter_id` int(4) NOT NULL,
  `property_id` int(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `filters`
--

INSERT INTO `filters` (`ID`, `filter_id`, `property_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `list_filter`
--

CREATE TABLE IF NOT EXISTS `list_filter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `list_filter`
--

INSERT INTO `list_filter` (`ID`, `name`) VALUES
(1, 'Design Office Lons'),
(2, 'Orpheus');

-- --------------------------------------------------------

--
-- Structure de la table `list_properties`
--

CREATE TABLE IF NOT EXISTS `list_properties` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `property` varchar(60) NOT NULL,
  `symbol` varchar(60) DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `unit` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- Contenu de la table `list_properties`
--

INSERT INTO `list_properties` (`ID`, `property`, `symbol`, `temperature`, `unit`) VALUES
(1, 'Young Modulus', 'E', NULL, 'GPa'),
(2, 'Density', 'rho', NULL, 'kg/m^3'),
(3, 'Poisson Coefficient', 'nu', NULL, NULL),
(4, 'Tensile Yield Strength', 'Fy', NULL, 'GPa'),
(5, 'Compressive Yield Strength', 'Fby', NULL, 'GPa'),
(6, 'Tensile Ultimate Strength', 'Fru', NULL, 'GPa'),
(7, 'Compressive Ultimate Strength', 'Fbru', NULL, 'GPa'),
(8, 'AISI Designation', NULL, NULL, NULL),
(9, 'AFNOR Designation', NULL, NULL, NULL),
(10, 'Designation', NULL, NULL, NULL),
(11, 'Code Valencienne', NULL, NULL, NULL),
(12, 'Appellation Normalisée', NULL, NULL, NULL),
(13, 'Appellation Courante', NULL, NULL, NULL),
(14, 'E @-74°C', NULL, NULL, NULL),
(15, 'E @0°C', NULL, NULL, NULL),
(16, 'E @100°C', NULL, NULL, NULL),
(17, 'E @200°C', NULL, NULL, NULL),
(18, 'E @300°C', NULL, NULL, NULL),
(19, 'E @400°C', NULL, NULL, NULL),
(20, 'E @500°C', NULL, NULL, NULL),
(21, 'Thermal Expansion Coefficient @-74°C', NULL, NULL, NULL),
(22, 'Thermal Expansion Coefficient @0°C', NULL, NULL, NULL),
(23, 'Thermal Expansion Coefficient @100°C', NULL, NULL, NULL),
(24, 'Thermal Expansion Coefficient @200°C', NULL, NULL, NULL),
(25, 'Thermal Expansion Coefficient @300°C', NULL, NULL, NULL),
(26, 'Thermal Expansion Coefficient @400°C', NULL, NULL, NULL),
(27, 'Thermal Expansion Coefficient @500°C', NULL, NULL, NULL),
(28, 'AMS Designation', NULL, NULL, NULL),
(29, 'AIR Designation', NULL, NULL, NULL),
(30, 'Rm', NULL, NULL, 'MPa'),
(31, 'Rp 0.2', NULL, NULL, 'MPa'),
(32, 'A', NULL, NULL, '%'),
(33, 'Limit radial Pressure', NULL, NULL, 'MPa'),
(34, 'Dilatation''s ratio -70°C/20°C', NULL, NULL, '10^-6/°C'),
(35, 'Dilatation''s ratio 20°C/100°C', NULL, NULL, '10^-6/°C'),
(36, 'Dilatation''s ratio 20°C/200°C', NULL, NULL, '10^-6/°C'),
(37, 'Dilatation''s ratio 20°C/300°C', NULL, NULL, '10^-6/°C'),
(38, 'Dilatation''s ratio 20°C/400°C', NULL, NULL, '10^-6/°C'),
(39, 'Dilatation''s ratio 20°C/500°C', NULL, NULL, '10^-6/°C'),
(40, 'Dilatation''s ratio 20°C/600°C', NULL, NULL, '10^-6/°C'),
(41, 'Source', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `list_user`
--

CREATE TABLE IF NOT EXISTS `list_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(60) NOT NULL,
  `prenom` varchar(60) NOT NULL,
  `right` varchar(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `list_user`
--

INSERT INTO `list_user` (`ID`, `nom`, `prenom`, `right`) VALUES
(1, 'Aury', 'Alexandre', 'rw');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `designation` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Contenu de la table `product`
--

INSERT INTO `product` (`ID`, `designation`, `active`) VALUES
(1, 'M50_Falconer', 1),
(2, '100C6', 1),
(3, '450CA30', 1),
(4, '100C6_1', 0),
(5, '100C6_1', 0),
(6, '100C6_1', 0),
(7, '100C6_1', 0),
(8, '100C6_2', 0),
(9, '100C6_3', 1),
(10, '100C6_4', 1),
(11, '100C6_5', 1),
(12, '100C6_6', 1),
(13, '100C6_25', 1),
(14, '15 CDV 6', 1),
(15, '100 C6 ESR', 1),
(16, '', 1),
(17, '440C (Z100CD17) >=58HRc', 1),
(18, 'NK15CAT', 1);

-- --------------------------------------------------------

--
-- Structure de la table `properties`
--

CREATE TABLE IF NOT EXISTS `properties` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL,
  `property` int(11) NOT NULL,
  `value` varchar(128) NOT NULL,
  `source` varchar(256) DEFAULT NULL,
  `owner` varchar(128) DEFAULT NULL,
  `source link` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_property_prop` (`property`),
  KEY `fk_product_prop` (`product`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=122 ;

--
-- Contenu de la table `properties`
--

INSERT INTO `properties` (`ID`, `product`, `property`, `value`, `source`, `owner`, `source link`) VALUES
(1, 1, 1, '200000', 'UNKNOW', '', NULL),
(2, 1, 3, '4860', 'UNKNOW', '', NULL),
(3, 1, 4, '0.3', 'UNKNOW', '', NULL),
(4, 1, 5, '1100', 'UNKNOW', '', NULL),
(5, 1, 7, '1400', 'UNKNOW', '', NULL),
(6, 1, 8, 'M50', '', '', NULL),
(7, 1, 9, '80MoCrV4216', '', '', NULL),
(8, 3, 2, '125', '', '', NULL),
(9, 1, 10, 'M50 Falconner', '', '', NULL),
(10, 3, 10, 'Victrex PEEK 450CA30', '', '', NULL),
(11, 10, 10, '100C6', NULL, NULL, NULL),
(12, 11, 1, 'aeze', NULL, NULL, NULL),
(13, 11, 3, 'dsdsd', NULL, NULL, NULL),
(14, 11, 10, '100C6 58/62 HRc', NULL, NULL, NULL),
(15, 12, 1, 'eeee', NULL, NULL, NULL),
(16, 12, 3, '0.2', NULL, NULL, NULL),
(17, 12, 10, '100C6_6', NULL, NULL, NULL),
(18, 13, 1, '25', NULL, NULL, NULL),
(19, 13, 2, '22346', NULL, NULL, NULL),
(20, 13, 10, '100C6_25', NULL, NULL, NULL),
(21, 1, 1, '200000', NULL, NULL, NULL),
(22, 1, 2, '7800', NULL, NULL, NULL),
(23, 1, 3, '4860', NULL, NULL, NULL),
(24, 1, 4, '0.3', NULL, NULL, NULL),
(25, 1, 5, '1100', NULL, NULL, NULL),
(26, 1, 7, '1400', NULL, NULL, NULL),
(27, 1, 8, 'M50', NULL, NULL, NULL),
(28, 1, 9, '80MoCrV4216', NULL, NULL, NULL),
(29, 1, 10, 'M50 Falconner', NULL, NULL, NULL),
(30, 1, 27, 'thomasdt', NULL, NULL, NULL),
(58, 1, 14, '20900', NULL, NULL, NULL),
(59, 1, 15, '10', NULL, NULL, NULL),
(60, 1, 16, '11', NULL, NULL, NULL),
(61, 10, 2, '7.83', NULL, NULL, NULL),
(62, 10, 11, '2', NULL, NULL, NULL),
(63, 10, 12, '100 C6', NULL, NULL, NULL),
(64, 10, 13, '52100', NULL, NULL, NULL),
(65, 10, 14, '20900', NULL, NULL, NULL),
(66, 10, 15, '20700', NULL, NULL, NULL),
(67, 10, 16, '20500', NULL, NULL, NULL),
(68, 10, 17, '20000', NULL, NULL, NULL),
(69, 10, 18, '19300', NULL, NULL, NULL),
(70, 10, 19, '18500', NULL, NULL, NULL),
(71, 10, 20, '17700', NULL, NULL, NULL),
(72, 10, 21, '11.4', NULL, NULL, NULL),
(73, 10, 22, '11.4', NULL, NULL, NULL),
(74, 10, 23, '11.4', NULL, NULL, NULL),
(75, 10, 24, '12.3', NULL, NULL, NULL),
(76, 10, 25, '13.1', NULL, NULL, NULL),
(77, 10, 26, '14', NULL, NULL, NULL),
(78, 10, 27, '14.9', NULL, NULL, NULL),
(79, 14, 1, '7.83', NULL, NULL, NULL),
(80, 14, 10, '15 CDV 6', NULL, NULL, NULL),
(81, 14, 11, '3', NULL, NULL, NULL),
(82, 14, 12, '15 CDV 6', NULL, NULL, NULL),
(83, 14, 14, '22000', NULL, NULL, NULL),
(84, 14, 15, '21400', NULL, NULL, NULL),
(85, 14, 16, '20800', NULL, NULL, NULL),
(86, 14, 17, '20300', NULL, NULL, NULL),
(87, 14, 18, '19800', NULL, NULL, NULL),
(88, 14, 19, '19300', NULL, NULL, NULL),
(89, 14, 20, '18800', NULL, NULL, NULL),
(90, 14, 21, '12.1', NULL, NULL, NULL),
(91, 14, 22, '12.1', NULL, NULL, NULL),
(92, 14, 23, '12.1', NULL, NULL, NULL),
(93, 14, 24, '12.6', NULL, NULL, NULL),
(94, 14, 25, '13', NULL, NULL, NULL),
(95, 14, 26, '13.5', NULL, NULL, NULL),
(96, 14, 27, '14', NULL, NULL, NULL),
(97, 15, 2, '7.9', NULL, NULL, NULL),
(98, 15, 10, '100 C6 ESR', NULL, NULL, NULL),
(99, 15, 28, 'AMS 6447', NULL, NULL, NULL),
(100, 16, 2, '7.7', NULL, NULL, NULL),
(101, 16, 29, 'AIR 9160C-361', NULL, NULL, NULL),
(102, 11, 2, '7.7', NULL, NULL, NULL),
(103, 11, 29, 'AIR 9160C-361', NULL, NULL, NULL),
(104, 17, 1, '200', NULL, NULL, NULL),
(105, 17, 2, '7.7', NULL, NULL, NULL),
(106, 17, 3, '0.293', NULL, NULL, NULL),
(107, 17, 10, '440C (Z100CD17) >=58HRc', NULL, NULL, NULL),
(108, 17, 30, '1750', NULL, NULL, NULL),
(109, 17, 31, '1280', NULL, NULL, NULL),
(110, 17, 32, '4', NULL, NULL, NULL),
(111, 17, 34, '10.2', NULL, NULL, NULL),
(112, 17, 35, '10.2', NULL, NULL, NULL),
(113, 17, 36, '10.8', NULL, NULL, NULL),
(114, 17, 37, '10.8', NULL, NULL, NULL),
(115, 17, 39, '11.5', NULL, NULL, NULL),
(116, 11, 41, 'XLS Sheet ....xls or a windchill link', NULL, NULL, NULL),
(117, 18, 2, '7.7', NULL, NULL, NULL),
(118, 18, 10, 'NK15CAT', NULL, NULL, NULL),
(119, 18, 11, '36', NULL, NULL, NULL),
(120, 18, 12, 'NK15CAT', NULL, NULL, NULL),
(121, 18, 13, 'IN 100', NULL, NULL, NULL);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_product_cmts` FOREIGN KEY (`product`) REFERENCES `product` (`ID`),
  ADD CONSTRAINT `fk_property_cmts` FOREIGN KEY (`property`) REFERENCES `properties` (`ID`),
  ADD CONSTRAINT `fk_user_cmts` FOREIGN KEY (`user`) REFERENCES `list_user` (`ID`);

--
-- Contraintes pour la table `properties`
--
ALTER TABLE `properties`
  ADD CONSTRAINT `fk_product_prop` FOREIGN KEY (`product`) REFERENCES `product` (`ID`),
  ADD CONSTRAINT `fk_property_prop` FOREIGN KEY (`property`) REFERENCES `list_properties` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
