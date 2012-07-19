-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 19, 2012 at 08:02 PM
-- Server version: 5.5.24
-- PHP Version: 5.3.14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `localreport`
--

-- --------------------------------------------------------

--
-- Table structure for table `audio_files`
--

CREATE TABLE IF NOT EXISTS `audio_files` (
  `audio_id` int(10) NOT NULL AUTO_INCREMENT,
  `audio_file` text NOT NULL,
  `audio_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `participant_id` int(11) NOT NULL,
  `performance_id` int(11) NOT NULL,
  PRIMARY KEY (`audio_id`),
  KEY `performance_id` (`performance_id`),
  KEY `audio_ts` (`audio_ts`),
  KEY `participant_id` (`participant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='participant_id and performance_id in case we don''t track participants' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE IF NOT EXISTS `participants` (
  `participant_id` int(10) NOT NULL AUTO_INCREMENT,
  `participant_name` text NOT NULL,
  `performance_id` int(11) NOT NULL,
  PRIMARY KEY (`participant_id`),
  KEY `performance_id` (`performance_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`participant_id`, `participant_name`, `performance_id`) VALUES
(1, 'Default Participant (Testing)', 1);

-- --------------------------------------------------------

--
-- Table structure for table `performances`
--

CREATE TABLE IF NOT EXISTS `performances` (
  `peformance_id` int(10) NOT NULL AUTO_INCREMENT,
  `performance_name` text NOT NULL,
  PRIMARY KEY (`peformance_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `performances`
--

INSERT INTO `performances` (`peformance_id`, `performance_name`) VALUES
(1, 'Testing');

-- --------------------------------------------------------

--
-- Table structure for table `video_files`
--

CREATE TABLE IF NOT EXISTS `video_files` (
  `video_id` int(10) NOT NULL AUTO_INCREMENT,
  `video_file` text NOT NULL,
  `video_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `participant_id` int(10) NOT NULL,
  `performance_id` int(10) NOT NULL,
  PRIMARY KEY (`video_id`),
  KEY `video_ts` (`video_ts`),
  KEY `performance_id` (`performance_id`),
  KEY `participant_id` (`participant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Have both participant_id and performance_id in case we don''t track participants' AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audio_files`
--
ALTER TABLE `audio_files`
  ADD CONSTRAINT `audio_files_ibfk_2` FOREIGN KEY (`performance_id`) REFERENCES `performances` (`peformance_id`),
  ADD CONSTRAINT `audio_files_ibfk_1` FOREIGN KEY (`participant_id`) REFERENCES `participants` (`participant_id`);

--
-- Constraints for table `participants`
--
ALTER TABLE `participants`
  ADD CONSTRAINT `participants_ibfk_1` FOREIGN KEY (`performance_id`) REFERENCES `performances` (`peformance_id`);

--
-- Constraints for table `video_files`
--
ALTER TABLE `video_files`
  ADD CONSTRAINT `video_files_ibfk_2` FOREIGN KEY (`performance_id`) REFERENCES `performances` (`peformance_id`),
  ADD CONSTRAINT `video_files_ibfk_1` FOREIGN KEY (`participant_id`) REFERENCES `participants` (`participant_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
