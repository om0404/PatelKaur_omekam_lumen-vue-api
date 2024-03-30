-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 28, 2024 at 08:24 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sidhu`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
CREATE TABLE IF NOT EXISTS `album` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `release_date` date DEFAULT NULL,
  `singer_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `singer_id` (`singer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`id`, `title`, `release_date`, `singer_id`, `created_at`, `updated_at`) VALUES
(1, 'Moosetape', '2021-06-04', 1, '2018-03-29 22:18:07', '2018-03-29 22:18:07'),
(2, 'Everybody Hurts', '2021-06-02', 2, '2018-03-29 22:18:07', '2021-03-29 22:18:07');

-- --------------------------------------------------------

--
-- Table structure for table `singer`
--

DROP TABLE IF EXISTS `singer`;
CREATE TABLE IF NOT EXISTS `singer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `origin` varchar(100) DEFAULT NULL,
  `active_years` varchar(50) DEFAULT NULL,
  `biography` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `singer`
--

INSERT INTO `singer` (`id`, `name`, `genre`, `origin`, `active_years`, `biography`, `created_at`, `updated_at`) VALUES
(1, 'Sidhu Moosewala', 'Indian Pop Music', '1. Moosa, Punjab, India\n2. Brampton, Ontario, Canada', '2016–Alive', 'Sidhu Moose Wala, born Shubhdeep Singh Sidhu on June 11, 1993, was an Indian rapper, singer, lyricist, and model. He made a significant impact on the Punjabi music and film industry. Here are some key points about his life and career:\n\nCareer Beginnings:\nMoose Wala started his musical journey in Canada in 2016.\nInitially, he worked as a songwriter, contributing to the song “License” by the Punjabi singer Ninja.\nIn 2017, he emerged as a lead artist with the duet song “G Wagon”, featuring Gurlez Akhtar.\nMusical Achievements:\nHis track “So High” catapulted him to mainstream popularity.\nIn 2018, he released his debut album PBX 1, which reached number 66 on the Billboard Canadian Albums chart.\nMoose Wala’s singles “47” and “Mera Na” also made an impact on the UK Singles Chart.', '2018-03-29 22:18:07', '2024-03-28 04:29:44'),
(2, 'Sidhu Moosewala', 'Punjabi', '1. Moosa, Punjab, India\n2. Brampton, Ontario, Canada', 'Alive', 'Sidhu Moose Wala, born Shubhdeep Singh Sidhu on June 11, 1993, was an Indian rapper, singer, lyricist, and model. He made a significant impact on the Punjabi music and film industry. Here are some key points about his life and career:\n\nCareer Beginnings:\nMoose Wala started his musical journey in Canada in 2016.\nInitially, he worked as a songwriter, contributing to the song “License” by the Punjabi singer Ninja.\nIn 2017, he emerged as a lead artist with the duet song “G Wagon”, featuring Gurlez Akhtar.\nMusical Achievements:\nHis track “So High” catapulted him to mainstream popularity.\nIn 2018, he released his debut album PBX 1, which reached number 66 on the Billboard Canadian Albums chart.\nMoose Wala’s singles “47” and “Mera Na” also made an impact on the UK Singles Chart.', '2018-03-29 22:18:07', '2024-03-28 04:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
CREATE TABLE IF NOT EXISTS `song` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `duration` int DEFAULT NULL,
  `album_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `song`
--

INSERT INTO `song` (`id`, `title`, `duration`, `album_id`, `created_at`, `updated_at`) VALUES
(1, 'Calaboose', 3, 1, '2018-03-29 22:18:07', '2024-03-28 04:30:12'),
(2, 'Celebrity Killer', 4, 2, '2018-03-29 22:18:07', '2018-03-29 22:18:07');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
