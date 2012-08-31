-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 31, 2012 at 05:15 PM
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
  `remote_audio_file` text NOT NULL,
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
  `participant_name` text,
  `participant_device_id` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`participant_id`),
  KEY `participant_device_id` (`participant_device_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`participant_id`, `participant_name`, `participant_device_id`) VALUES
(1, 'Default Participant (Testing)', NULL),
(2, NULL, ''),
(3, NULL, 'c1b0b9e4-cb50-4fc4-add0-9f1a62e34231');

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
  `latitude` varchar(128) DEFAULT NULL,
  `longitude` varchar(128) DEFAULT NULL,
  `participant_id` int(10) NOT NULL,
  `performance_id` int(10) NOT NULL,
  PRIMARY KEY (`video_id`),
  KEY `video_ts` (`video_ts`),
  KEY `performance_id` (`performance_id`),
  KEY `participant_id` (`participant_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Have both participant_id and performance_id in case we don''t track participants' AUTO_INCREMENT=117 ;

--
-- Dumping data for table `video_files`
--

INSERT INTO `video_files` (`video_id`, `video_file`, `video_ts`, `latitude`, `longitude`, `participant_id`, `performance_id`) VALUES
(1, '1344265332_2195_videocapture95696484.3gp', '2012-08-06 15:02:12', NULL, NULL, 1, 1),
(2, '1344265335_5541_videocapture95696484.3gp', '2012-08-06 15:02:15', NULL, NULL, 1, 1),
(3, '1344265349_3194_videocapture95696484.3gp', '2012-08-06 15:02:29', NULL, NULL, 1, 1),
(4, '1344343274_2445_videocapture1207063431.3gp', '2012-08-07 12:41:14', NULL, NULL, 1, 1),
(5, '1344343278_8809_videocapture1207063431.3gp', '2012-08-07 12:41:18', NULL, NULL, 1, 1),
(6, '1344343347_8671_videocapture1207063431.3gp', '2012-08-07 12:42:27', NULL, NULL, 1, 1),
(7, '1344343349_9273_videocapture1207063431.3gp', '2012-08-07 12:42:29', NULL, NULL, 1, 1),
(8, '1344343351_7080_videocapture-468221884.3gp', '2012-08-07 12:42:31', NULL, NULL, 1, 1),
(9, '1344343507_2519_videocapture-1262400998.3gp', '2012-08-07 12:45:07', NULL, NULL, 1, 1),
(10, '1344344137_8586_videocapture-140051661.3gp', '2012-08-07 12:55:37', NULL, NULL, 1, 1),
(11, '1344344152_2097_videocapture-140051661.3gp', '2012-08-07 12:55:52', NULL, NULL, 1, 1),
(12, '1344350121_7249_videocapture-140051661.3gp', '2012-08-07 14:35:21', NULL, NULL, 1, 1),
(13, '1344350218_4775_videocapture-710268240.3gp', '2012-08-07 14:36:58', NULL, NULL, 1, 1),
(14, '1344350218_8453_videocapture-710268240.3gp', '2012-08-07 14:36:58', NULL, NULL, 1, 1),
(15, '1344352070_6216_videocapture1155739589.3gp', '2012-08-07 15:07:50', NULL, NULL, 1, 1),
(16, '1344352121_1320_videocapture1155739589.3gp', '2012-08-07 15:08:41', NULL, NULL, 1, 1),
(21, '1345040551_4110_videocapture-1516134712.3gp', '2012-08-15 14:22:31', NULL, NULL, 1, 1),
(22, '1345040552_3403_videocapture-1516134712.3gp', '2012-08-15 14:22:32', NULL, NULL, 1, 1),
(23, '1345041828_5372_videocapture1281613160.3gp', '2012-08-15 14:43:48', NULL, NULL, 1, 1),
(24, '1345041828_1066_videocapture1281613160.3gp', '2012-08-15 14:43:48', NULL, NULL, 1, 1),
(25, '1345042717_5925_file.mp4', '2012-08-15 15:04:44', NULL, NULL, 1, 1),
(26, '1345054153_6224_videocapture925586652.3gp', '2012-08-15 18:09:13', NULL, NULL, 1, 1),
(27, '1345054153_2910_videocapture925586652.3gp', '2012-08-15 18:09:13', NULL, NULL, 1, 1),
(28, '1345063426_4041_iPhoneVideo.mp4', '2012-08-15 20:43:46', NULL, NULL, 1, 1),
(29, '1345065197_5226_iPhoneVideo.mp4', '2012-08-15 21:13:17', NULL, NULL, 1, 1),
(30, '1345065943_9175_iPhoneVideo.mp4', '2012-08-15 21:25:43', NULL, NULL, 1, 1),
(31, '1345066397_5392_iPhoneVideo.mp4', '2012-08-15 21:33:17', NULL, NULL, 1, 1),
(32, '1345083099_3139_videocapture968580804.3gp', '2012-08-16 02:11:39', NULL, NULL, 1, 1),
(33, '1345083100_5836_videocapture968580804.3gp', '2012-08-16 02:11:40', NULL, NULL, 1, 1),
(34, '1345083144_7242_videocapture1093517022.3gp', '2012-08-16 02:12:24', NULL, NULL, 1, 1),
(35, '1345083144_6045_videocapture1093517022.3gp', '2012-08-16 02:12:24', NULL, NULL, 1, 1),
(36, '1345126733_3769_iPhoneVideo.mp4', '2012-08-16 14:18:53', NULL, NULL, 1, 1),
(37, '1345128335_3355_iPhoneVideo.mp4', '2012-08-16 14:45:35', NULL, NULL, 1, 1),
(38, '1345128526_5617_iPhoneVideo.mp4', '2012-08-16 14:48:46', NULL, NULL, 1, 1),
(39, '1345128951_7736_iPhoneVideo.mp4', '2012-08-16 14:55:51', NULL, NULL, 1, 1),
(40, '1345129245_6373_iPhoneVideo.mp4', '2012-08-16 15:00:45', NULL, NULL, 1, 1),
(41, '1345129288_2543_iPhoneVideo.mp4', '2012-08-16 15:01:28', NULL, NULL, 1, 1),
(42, '1345129347_2966_iPhoneVideo.mp4', '2012-08-16 15:02:27', NULL, NULL, 1, 1),
(43, '1345131205_1348_localreport-1516134712.mp4', '2012-08-16 15:33:25', NULL, NULL, 1, 1),
(44, '1345131663_4582_localreport1281613160.mp4', '2012-08-16 15:41:03', NULL, NULL, 1, 1),
(45, '1345133160_3599_localreport968580804.mp4', '2012-08-16 16:06:00', NULL, NULL, 1, 1),
(46, '1345133203_4694_iPhoneVideo.mp4', '2012-08-16 16:06:43', NULL, NULL, 1, 1),
(47, '1345133218_3135_localreport-1516134712.3gp', '2012-08-16 16:06:58', NULL, NULL, 1, 1),
(48, '1345133518_4879_iPhoneVideo.mp4', '2012-08-16 16:11:59', NULL, NULL, 1, 1),
(49, '1345137236_6016_localreport-384604060.mp4', '2012-08-16 17:13:56', NULL, NULL, 1, 1),
(50, '1345137698_8002_localreport-361664146.mp4', '2012-08-16 17:21:38', NULL, NULL, 1, 1),
(51, '1345137746_5912_localreport-130781868.mp4', '2012-08-16 17:22:26', NULL, NULL, 1, 1),
(52, '1345137777_7960_localreport1637368546.mp4', '2012-08-16 17:22:57', NULL, NULL, 1, 1),
(53, '1345137824_7734_localreport-1535748953.mp4', '2012-08-16 17:23:44', NULL, NULL, 1, 1),
(54, '1345137877_5188_localreport-1402683345.mp4', '2012-08-16 17:24:37', NULL, NULL, 1, 1),
(55, '1345138667_1729_localreport-27509115.mp4', '2012-08-16 17:37:47', NULL, NULL, 1, 1),
(56, '1345138708_2825_localreport-1967091159.mp4', '2012-08-16 17:38:28', NULL, NULL, 1, 1),
(57, '1345138793_5583_localreport784800233.mp4', '2012-08-16 17:39:53', NULL, NULL, 1, 1),
(58, '1345138868_9728_localreport1568054771.mp4', '2012-08-16 17:41:08', NULL, NULL, 1, 1),
(59, '1345139405_4553_localreport2072121937.mp4', '2012-08-16 17:50:05', NULL, NULL, 1, 1),
(60, '1345139454_2020_localreport469850766.mp4', '2012-08-16 17:50:54', NULL, NULL, 1, 1),
(61, '1345139457_9592_localreport-1544865013.mp4', '2012-08-16 17:50:57', NULL, NULL, 1, 1),
(62, '1345139571_6982_localreport321671742.mp4', '2012-08-16 17:52:51', NULL, NULL, 1, 1),
(63, '1345139573_3384_localreport1186311193.3gp', '2012-08-16 17:52:53', NULL, NULL, 1, 1),
(64, '1345139656_6541_localreport-1221211520.mp4', '2012-08-16 17:54:16', NULL, NULL, 1, 1),
(65, '1345139715_6866_localreport-1104734697.mp4', '2012-08-16 17:55:15', NULL, NULL, 1, 1),
(66, '1345140695_8807_iPhoneVideo.mp4', '2012-08-16 18:11:35', NULL, NULL, 1, 1),
(67, '1345140791_2850_iPhoneVideo.mp4', '2012-08-16 18:13:11', NULL, NULL, 1, 1),
(68, '1345141061_6333_localreport-2086615062.mp4', '2012-08-16 18:17:41', NULL, NULL, 1, 1),
(69, '1345141118_4773_iPhoneVideo.mp4', '2012-08-16 18:18:38', NULL, NULL, 1, 1),
(70, '1345141151_3812_iPhoneVideo.mp4', '2012-08-16 18:19:11', NULL, NULL, 1, 1),
(71, '1345141178_5799_localreport130241004.3gp', '2012-08-16 18:19:38', NULL, NULL, 1, 1),
(72, '1345141493_6871_iPhoneVideo.mp4', '2012-08-16 18:24:53', NULL, NULL, 1, 1),
(73, '1345141512_2154_localreport1975625002.3gp', '2012-08-16 18:25:12', NULL, NULL, 1, 1),
(74, '1345141637_5246_iPhoneVideo.mp4', '2012-08-16 18:27:17', NULL, NULL, 1, 1),
(75, '1345142244_6434_localreport1281150522.3gp', '2012-08-16 18:37:24', NULL, NULL, 1, 1),
(76, '1345142335_1325_localreport-823067376.3gp', '2012-08-16 18:38:55', NULL, NULL, 1, 1),
(77, '1345142378_9377_localreport-2047810820.3gp', '2012-08-16 18:39:38', NULL, NULL, 1, 1),
(78, '1345142547_7752_localreport651080998.3gp', '2012-08-16 18:42:27', NULL, NULL, 1, 1),
(79, '1345142755_3699_localreport-254760650.3gp', '2012-08-16 18:45:55', NULL, NULL, 1, 1),
(80, '1345142810_2895_iPhoneVideo.mp4', '2012-08-16 18:46:50', NULL, NULL, 1, 1),
(81, '1345142980_3000_localreport-1263949651.mp4', '2012-08-16 18:49:40', NULL, NULL, 1, 1),
(82, '1345143096_9460_iPhoneVideo.mp4', '2012-08-16 18:51:36', NULL, NULL, 1, 1),
(83, '1345143505_3185_iPhoneVideo.mp4', '2012-08-16 18:58:25', NULL, NULL, 1, 1),
(84, '1345213323_1656_localreport431009878.mp4', '2012-08-17 14:22:03', NULL, NULL, 1, 1),
(85, '1345217612_3850_iPhoneVideo.mp4', '2012-08-17 15:33:32', NULL, NULL, 1, 1),
(86, '1345218311_6979_localreport-267385866.3gp', '2012-08-17 15:45:11', NULL, NULL, 1, 1),
(87, '1345218557_5627_localreport-2116292271.mp4', '2012-08-17 15:49:17', NULL, NULL, 1, 1),
(88, '1345219539_2363_localreport-267385866.mp4', '2012-08-17 16:05:39', NULL, NULL, 1, 1),
(89, '1345230540_2112_localreport798136608.mp4', '2012-08-17 19:09:00', NULL, NULL, 1, 1),
(90, '1345575292_1882_localreport-680985734.mp4', '2012-08-21 18:54:52', NULL, NULL, 1, 1),
(91, '1345575990_1778_localreport-444592203.mp4', '2012-08-21 19:06:30', NULL, NULL, 1, 1),
(92, '1345576041_9753_iPhoneVideo.mp4', '2012-08-21 19:07:21', NULL, NULL, 1, 1),
(93, '1345676425_4504_iPhoneVideo.mp4', '2012-08-22 23:00:25', NULL, NULL, 1, 1),
(94, '1345762637_9078_iPhoneVideo.mp4', '2012-08-23 22:57:17', NULL, NULL, 1, 1),
(95, '1345762819_6278_iPhoneVideo.mp4', '2012-08-23 23:00:19', NULL, NULL, 1, 1),
(96, '1345762925_6601_iPhoneVideo.mp4', '2012-08-23 23:02:05', NULL, NULL, 1, 1),
(97, '1345763064_7902_iPhoneVideo.mp4', '2012-08-23 23:04:24', NULL, NULL, 1, 1),
(98, '1345765239_6758_iPhoneVideo.mp4', '2012-08-23 23:40:39', NULL, NULL, 1, 1),
(99, '1346175960_2706_localreport-1888849764.mp4', '2012-08-28 17:46:00', NULL, NULL, 1, 1),
(100, '1346178704_9764_localreport1220530131.mp4', '2012-08-28 18:31:44', NULL, NULL, 1, 1),
(101, '1346184328_9141_localreport1235092270.mp4', '2012-08-28 20:05:28', NULL, NULL, 1, 1),
(102, '1346185245_4144_localreport-2097754774.mp4', '2012-08-28 20:20:45', NULL, NULL, 1, 1),
(103, '1346185419_5446_localreport977352610.mp4', '2012-08-28 20:23:39', NULL, NULL, 1, 1),
(104, '1346201925_5538_localreport-369287411.mp4', '2012-08-29 00:58:45', NULL, NULL, 1, 1),
(105, '1346202071_5799_localreport1600505187.mp4', '2012-08-29 01:01:11', NULL, NULL, 1, 1),
(106, '1346267954_7996_localreport-1152879313.mp4', '2012-08-29 19:19:14', NULL, NULL, 1, 1),
(107, '1346268541_7127_localreport-335154572.mp4', '2012-08-29 19:29:01', NULL, NULL, 1, 1),
(108, '1346269675_3239_localreport-1018115482.mp4', '2012-08-29 19:47:55', NULL, NULL, 1, 1),
(109, '1346272631_1559_iPhoneVideo.mp4', '2012-08-29 20:37:11', NULL, NULL, 1, 1),
(110, '1346272940_9099_iPhoneVideo.mp4', '2012-08-29 20:42:20', NULL, NULL, 1, 1),
(111, '1346341946_5899_localreport-1518942038.mp4', '2012-08-30 15:52:26', NULL, NULL, 1, 1),
(112, '1346351264_1390_localreport-48558476.mp4', '2012-08-30 18:27:44', NULL, NULL, 2, 1),
(113, '1346351614_4306_localreport-722181177.mp4', '2012-08-30 18:33:34', NULL, NULL, 2, 1),
(114, '1346351807_9063_localreport-375687478.mp4', '2012-08-30 18:36:47', NULL, NULL, 2, 1),
(115, '1346352566_6472_localreport817741566.mp4', '2012-08-30 18:49:27', NULL, NULL, 3, 1),
(116, '1346354095_3701_localreport-1053948114.mp4', '2012-08-30 19:14:55', NULL, NULL, 3, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audio_files`
--
ALTER TABLE `audio_files`
  ADD CONSTRAINT `audio_files_ibfk_1` FOREIGN KEY (`participant_id`) REFERENCES `participants` (`participant_id`),
  ADD CONSTRAINT `audio_files_ibfk_2` FOREIGN KEY (`performance_id`) REFERENCES `performances` (`peformance_id`);

--
-- Constraints for table `video_files`
--
ALTER TABLE `video_files`
  ADD CONSTRAINT `video_files_ibfk_1` FOREIGN KEY (`participant_id`) REFERENCES `participants` (`participant_id`),
  ADD CONSTRAINT `video_files_ibfk_2` FOREIGN KEY (`performance_id`) REFERENCES `performances` (`peformance_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
