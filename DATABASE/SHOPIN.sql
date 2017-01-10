-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mar 10 Janvier 2017 à 21:36
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `shopin`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `ID_CATEGORY` int(11) NOT NULL,
  `CAT_ID_CATEGORY` int(11) DEFAULT NULL,
  `NAME_CATEGORY` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`ID_CATEGORY`, `CAT_ID_CATEGORY`, `NAME_CATEGORY`) VALUES
(1, 0, 'Fashion'),
(2, 0, 'Jewlery'),
(3, 0, 'Cosmetics'),
(4, 0, 'Sport'),
(5, 0, 'Technologies'),
(6, 0, 'Home'),
(7, 1, 'Men'),
(8, 1, 'Women'),
(9, 1, 'Kids'),
(10, 2, 'Necklaces'),
(11, 2, 'Rings'),
(12, 2, 'Bracelets'),
(13, 2, 'Earrings'),
(14, 2, 'Watches'),
(15, 3, 'Face'),
(16, 3, 'Eyes'),
(17, 3, 'Lips'),
(18, 5, 'IT'),
(19, 5, 'Mobile'),
(20, 5, 'Home appliances');

-- --------------------------------------------------------

--
-- Structure de la table `composed_by_products`
--

CREATE TABLE `composed_by_products` (
  `ID_ORDER` int(11) NOT NULL,
  `ID_PRODUCT` int(11) NOT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `SIZE` varchar(100) DEFAULT NULL,
  `COLOR` longtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

CREATE TABLE `customer` (
  `ID_CUSTOMER` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `customer`
--

INSERT INTO `customer` (`ID_CUSTOMER`) VALUES
(26);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `ID_ORDER` int(11) NOT NULL,
  `ID_CUSTOMER` int(11) NOT NULL,
  `TOTAL_AMOUNT` double DEFAULT NULL,
  `ORDER_STATE` longtext,
  `DATE_ORDER` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `pictures`
--

CREATE TABLE `pictures` (
  `ID_PICTURE` int(11) NOT NULL,
  `ID_PRODUCT` int(11) DEFAULT NULL,
  `ID_SHOP` int(11) DEFAULT NULL,
  `ID_CUSTOMER` int(11) DEFAULT NULL,
  `PICTURE_NAME` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `ID_PRODUCT` int(11) NOT NULL,
  `ID_SHOP` int(11) NOT NULL,
  `ID_CATEGORY` int(11) NOT NULL,
  `ID_SELLER` int(11) NOT NULL,
  `NAME_PRODUCT` longtext,
  `PRICE_PRODUCT` double DEFAULT NULL,
  `DESCRIPTION` text,
  `SHORT_DESCRIPTION` text,
  `INITIAL_STOCK` int(11) DEFAULT NULL,
  `CURRENT_STOCK` int(11) DEFAULT NULL,
  `SCORE` int(11) DEFAULT NULL,
  `COLORS` longtext,
  `SIZES` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `shop`
--

CREATE TABLE `shop` (
  `ID_SHOP` int(11) NOT NULL,
  `ID_CATEGORY` int(11) NOT NULL,
  `ID_SELLER` int(11) NOT NULL,
  `NAME_SHOP` varchar(255) DEFAULT NULL,
  `PHONE_SHOP` bigint(20) DEFAULT NULL,
  `ADDRESS_SHOP` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `shop`
--

INSERT INTO `shop` (`ID_SHOP`, `ID_CATEGORY`, `ID_SELLER`, `NAME_SHOP`, `PHONE_SHOP`, `ADDRESS_SHOP`) VALUES
(5, 5, 24, 'Vista', 71568741, '13 Rue Taoufik El Hakim Manouba');

-- --------------------------------------------------------

--
-- Structure de la table `shopman`
--

CREATE TABLE `shopman` (
  `ID_SELLER` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `shopman`
--

INSERT INTO `shopman` (`ID_SELLER`) VALUES
(24);

-- --------------------------------------------------------

--
-- Structure de la table `to_comment`
--

CREATE TABLE `to_comment` (
  `ID_CUSTOMER` int(11) NOT NULL,
  `ID_PRODUCT` int(11) NOT NULL,
  `NOTE` text,
  `DATE` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `ID_USER` int(11) NOT NULL,
  `NAME_USER` longtext,
  `SURNAME_USER` longtext,
  `STATE` varchar(255) NOT NULL,
  `ADDRESS_USER` text,
  `PHONE_USER` bigint(20) DEFAULT NULL,
  `MAIL_USER` longtext,
  `PASSWORD` longtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`ID_USER`, `NAME_USER`, `SURNAME_USER`, `STATE`, `ADDRESS_USER`, `PHONE_USER`, `MAIL_USER`, `PASSWORD`) VALUES
(24, 'Amal', 'Ayeb', 'manouba', '13 Rue Taoufik El Hakim ', 22369854, 'amal.ayeb@gmail.com', '123');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID_CATEGORY`),
  ADD KEY `FK_IS_SUB_CATEGORY` (`CAT_ID_CATEGORY`);

--
-- Index pour la table `composed_by_products`
--
ALTER TABLE `composed_by_products`
  ADD PRIMARY KEY (`ID_ORDER`,`ID_PRODUCT`),
  ADD KEY `FK_COMPOSED_BY_PRODUCTS2` (`ID_PRODUCT`);

--
-- Index pour la table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID_CUSTOMER`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID_ORDER`),
  ADD KEY `FK_COMMAND_ORDER` (`ID_CUSTOMER`);

--
-- Index pour la table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`ID_PICTURE`),
  ADD KEY `FK_IS_PRODUCT_PICTURE` (`ID_PRODUCT`),
  ADD KEY `FK_IS_PROFIL_PICTURE` (`ID_CUSTOMER`),
  ADD KEY `FK_IS_SHOP_PICTURE` (`ID_SHOP`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID_PRODUCT`),
  ADD KEY `FK_BELONG` (`ID_CATEGORY`),
  ADD KEY `FK_CONTAIN_PRODUCTS` (`ID_SHOP`),
  ADD KEY `FK_MANAGE_PRODUCTS` (`ID_SELLER`);

--
-- Index pour la table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`ID_SHOP`),
  ADD KEY `FK_MANAGE_SHOP` (`ID_SELLER`),
  ADD KEY `FK_TO_HAVE` (`ID_CATEGORY`);

--
-- Index pour la table `shopman`
--
ALTER TABLE `shopman`
  ADD PRIMARY KEY (`ID_SELLER`);

--
-- Index pour la table `to_comment`
--
ALTER TABLE `to_comment`
  ADD PRIMARY KEY (`ID_CUSTOMER`,`ID_PRODUCT`),
  ADD KEY `FK_TO_COMMENT2` (`ID_PRODUCT`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID_USER`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `ID_CATEGORY` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `ID_ORDER` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `ID_PICTURE` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `ID_PRODUCT` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `shop`
--
ALTER TABLE `shop`
  MODIFY `ID_SHOP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `ID_USER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
