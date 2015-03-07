-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2014 at 09:53 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hmwk2147`
--

-- --------------------------------------------------------

--
-- Table structure for table `hw8`
--

CREATE TABLE IF NOT EXISTS `hw8` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `uname` varchar(15) NOT NULL,
  `pword` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `prob` varchar(2) NOT NULL,
  `hot` varchar(3) NOT NULL,
  `smart` varchar(3) NOT NULL,
  `beers` varchar(15) NOT NULL,
  `comments` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `hw8`
--

INSERT INTO `hw8` (`id`, `name`, `uname`, `pword`, `email`, `prob`, `hot`, `smart`, `beers`, `comments`) VALUES
(1, 'Bryan', 'bryan', '', '', '', '', '', '', ''),
(2, 'Bryan', 'bryan', '', '', '', '', '', '', ''),
(3, 'Bryan', 'bryan', '', '', '', '', '', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
