-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 07, 2017 at 04:54 PM
-- Server version: 5.7.16
-- PHP Version: 5.5.9-1ubuntu4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `probaispita`
--

-- --------------------------------------------------------

--
-- Table structure for table `KATEGORIJA_PROIZVODA`
--

CREATE TABLE IF NOT EXISTS `KATEGORIJA_PROIZVODA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IME` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `KORISNICI`
--

CREATE TABLE IF NOT EXISTS `KORISNICI` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FIRSTNAME` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `LASTNAME` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `USERNAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `TOKEN` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `KORISNICI`
--

INSERT INTO `KORISNICI` (`ID`, `FIRSTNAME`, `LASTNAME`, `USERNAME`, `PASSWORD`, `TOKEN`) VALUES
(1, 'rohitash', 'singh', 'rohit', '827ccb0eea8a706c4c34a16891f84e7b', '64244e36b576c7fb69597ebe635a8d9751e5a936');

-- --------------------------------------------------------

--
-- Table structure for table `PORUDZBINA`
--

CREATE TABLE IF NOT EXISTS `PORUDZBINA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `KORISNICI_ID` int(11) DEFAULT NULL,
  `PROIZVOD_ID` int(11) DEFAULT NULL,
  `DATUM` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_2` (`KORISNICI_ID`),
  KEY `FK_RELATIONSHIP_3` (`PROIZVOD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `PROIZVOD`
--

CREATE TABLE IF NOT EXISTS `PROIZVOD` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `KATEGORIJA_PROIZVODA_ID` int(11) DEFAULT NULL,
  `IME` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CENA` decimal(12,4) NOT NULL,
  `OPIS` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_1` (`KATEGORIJA_PROIZVODA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `PORUDZBINA`
--
ALTER TABLE `PORUDZBINA`
  ADD CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`KORISNICI_ID`) REFERENCES `KORISNICI` (`ID`),
  ADD CONSTRAINT `FK_RELATIONSHIP_3` FOREIGN KEY (`PROIZVOD_ID`) REFERENCES `PROIZVOD` (`ID`);

--
-- Constraints for table `PROIZVOD`
--
ALTER TABLE `PROIZVOD`
  ADD CONSTRAINT `FK_RELATIONSHIP_1` FOREIGN KEY (`KATEGORIJA_PROIZVODA_ID`) REFERENCES `KATEGORIJA_PROIZVODA` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
