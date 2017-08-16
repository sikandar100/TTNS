-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2017 at 10:01 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ttns`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
  `Course_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Course_Code` varchar(10) NOT NULL,
  `Course_Title` varchar(45) NOT NULL,
  `Credit` int(11) NOT NULL,
  `Semester_Id` int(11) NOT NULL,
  PRIMARY KEY (`Course_Id`),
  KEY `Semester_Id` (`Semester_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`Course_Id`, `Course_Code`, `Course_Title`, `Credit`, `Semester_Id`) VALUES
(1, 'EN-102', 'English-2', 3, 2),
(2, 'IS-101', 'Islamic Studies', 2, 2),
(3, 'MA-102', 'Calculus & Analytical Geometry-II', 3, 2),
(4, 'PH-103', 'Electricity, Magnetism and Thermal Physics', 3, 2),
(5, 'MA-203', 'Discrete Mathematics', 3, 2),
(6, 'CS-121', 'Object Oriented Programming', 4, 2),
(7, 'EN-101', 'English-1', 3, 1),
(8, 'PS-101', 'Pakistan Studies', 2, 1),
(9, 'MA-101', 'Calculus & Analytical Geometry-I', 3, 1),
(10, 'PH-101', 'Introductory Mechanics & Waves', 3, 1),
(11, 'CS-101', 'Introduction to Computing', 3, 1),
(12, 'CS-105', 'Problem Solving and Programming', 3, 1),
(13, 'EN-201', 'English - 3', 3, 3),
(14, 'PY-101', 'Introdution to Psychology', 3, 3),
(15, 'CS-211', 'Data Structures', 4, 3),
(16, 'CS-103', 'Introduction to Computer Organization', 3, 3),
(17, 'CS-212', 'Human Computer Interaction', 3, 3),
(18, 'CH-100', 'Chemistry-I', 3, 4),
(19, 'CS-225', 'Database System', 3, 4),
(20, 'MA-205', 'Differential Equations & Linear Algebra', 3, 4),
(21, 'CS-213', 'Computer Organization & Assembly Language', 4, 4),
(22, 'CS-222', 'Analysis & Design for Soft. Sys', 3, 4),
(23, 'PH-193', 'physics Lab', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `Dept_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Dept_Name` varchar(20) NOT NULL,
  `short_name` varchar(20) NOT NULL,
  PRIMARY KEY (`Dept_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Dept_Id`, `Dept_Name`, `short_name`) VALUES
(1, 'Computer Science', 'C.Sc'),
(2, 'Physics', 'Phys'),
(3, 'IT', 'I.T');

-- --------------------------------------------------------

--
-- Table structure for table `enrolled_courses`
--

CREATE TABLE IF NOT EXISTS `enrolled_courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Course_Id` int(11) DEFAULT NULL,
  `User_Id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Course_Id` (`Course_Id`),
  KEY `User_Id` (`User_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5508 ;

--
-- Dumping data for table `enrolled_courses`
--

INSERT INTO `enrolled_courses` (`id`, `Course_Id`, `User_Id`) VALUES
(5109, 2, 151),
(5110, 3, 151),
(5111, 1, 151),
(5112, 4, 151),
(5113, 6, 151),
(5114, 23, 151),
(5115, 5, 151),
(5116, 2, 152),
(5117, 3, 152),
(5118, 1, 152),
(5119, 4, 152),
(5120, 12, 152),
(5121, 23, 152),
(5122, 5, 152),
(5123, 2, 153),
(5124, 3, 153),
(5125, 1, 153),
(5126, 4, 153),
(5127, 6, 153),
(5128, 23, 153),
(5129, 5, 153),
(5130, 2, 154),
(5131, 3, 154),
(5132, 1, 154),
(5133, 4, 154),
(5134, 6, 154),
(5135, 23, 154),
(5136, 5, 154),
(5137, 2, 155),
(5138, 3, 155),
(5139, 1, 155),
(5140, 4, 155),
(5141, 6, 155),
(5142, 23, 155),
(5143, 5, 155),
(5144, 2, 156),
(5145, 3, 156),
(5146, 1, 156),
(5147, 4, 156),
(5148, 12, 156),
(5149, 23, 156),
(5150, 5, 156),
(5151, 2, 157),
(5152, 3, 157),
(5153, 1, 157),
(5154, 4, 157),
(5155, 12, 157),
(5156, 23, 157),
(5157, 5, 157),
(5158, 2, 158),
(5159, 3, 158),
(5160, 1, 158),
(5161, 4, 158),
(5162, 12, 158),
(5163, 23, 158),
(5164, 5, 158),
(5165, 2, 159),
(5166, 3, 159),
(5167, 1, 159),
(5168, 4, 159),
(5169, 12, 159),
(5170, 23, 159),
(5171, 5, 159),
(5172, 2, 160),
(5173, 3, 160),
(5174, 1, 160),
(5175, 4, 160),
(5176, 12, 160),
(5177, 23, 160),
(5178, 5, 160),
(5179, 2, 161),
(5180, 3, 161),
(5181, 1, 161),
(5182, 4, 161),
(5183, 12, 161),
(5184, 23, 161),
(5185, 5, 161),
(5186, 2, 162),
(5187, 3, 162),
(5188, 1, 162),
(5189, 4, 162),
(5190, 6, 162),
(5191, 23, 162),
(5192, 5, 162),
(5193, 2, 163),
(5194, 3, 163),
(5195, 1, 163),
(5196, 4, 163),
(5197, 6, 163),
(5198, 23, 163),
(5199, 5, 163),
(5200, 2, 164),
(5201, 3, 164),
(5202, 1, 164),
(5203, 4, 164),
(5204, 12, 164),
(5205, 23, 164),
(5206, 5, 164),
(5207, 2, 165),
(5208, 3, 165),
(5209, 1, 165),
(5210, 4, 165),
(5211, 12, 165),
(5212, 23, 165),
(5213, 5, 165),
(5214, 2, 166),
(5215, 3, 166),
(5216, 1, 166),
(5217, 4, 166),
(5218, 12, 166),
(5219, 23, 166),
(5220, 5, 166),
(5221, 2, 167),
(5222, 3, 167),
(5223, 1, 167),
(5224, 4, 167),
(5225, 6, 167),
(5226, 23, 167),
(5227, 5, 167),
(5228, 2, 168),
(5229, 3, 168),
(5230, 1, 168),
(5231, 4, 168),
(5232, 12, 168),
(5233, 23, 168),
(5234, 5, 168),
(5235, 2, 169),
(5236, 3, 169),
(5237, 1, 169),
(5238, 4, 169),
(5239, 12, 169),
(5240, 23, 169),
(5241, 5, 169),
(5242, 2, 170),
(5243, 3, 170),
(5244, 1, 170),
(5245, 4, 170),
(5246, 6, 170),
(5247, 23, 170),
(5248, 5, 170),
(5249, 2, 171),
(5250, 3, 171),
(5251, 1, 171),
(5252, 4, 171),
(5253, 12, 171),
(5254, 23, 171),
(5255, 5, 171),
(5256, 2, 172),
(5257, 3, 172),
(5258, 1, 172),
(5259, 4, 172),
(5260, 12, 172),
(5261, 23, 172),
(5262, 5, 172),
(5263, 2, 173),
(5264, 3, 173),
(5265, 1, 173),
(5266, 4, 173),
(5267, 12, 173),
(5268, 23, 173),
(5269, 5, 173),
(5270, 2, 174),
(5271, 3, 174),
(5272, 1, 174),
(5273, 4, 174),
(5274, 6, 174),
(5275, 23, 174),
(5276, 5, 174),
(5277, 2, 175),
(5278, 3, 175),
(5279, 1, 175),
(5280, 4, 175),
(5281, 12, 175),
(5282, 23, 175),
(5283, 5, 175),
(5284, 2, 176),
(5285, 3, 176),
(5286, 1, 176),
(5287, 4, 176),
(5288, 6, 176),
(5289, 23, 176),
(5290, 5, 176),
(5291, 2, 177),
(5292, 3, 177),
(5293, 1, 177),
(5294, 4, 177),
(5295, 12, 177),
(5296, 23, 177),
(5297, 5, 177),
(5298, 2, 178),
(5299, 3, 178),
(5300, 1, 178),
(5301, 4, 178),
(5302, 12, 178),
(5303, 23, 178),
(5304, 5, 178),
(5305, 2, 179),
(5306, 3, 179),
(5307, 1, 179),
(5308, 4, 179),
(5309, 12, 179),
(5310, 23, 179),
(5311, 5, 179),
(5312, 2, 180),
(5313, 3, 180),
(5314, 1, 180),
(5315, 4, 180),
(5316, 12, 180),
(5317, 23, 180),
(5318, 5, 180),
(5319, 2, 181),
(5320, 3, 181),
(5321, 1, 181),
(5322, 4, 181),
(5323, 12, 181),
(5324, 23, 181),
(5325, 5, 181),
(5326, 2, 182),
(5327, 3, 182),
(5328, 1, 182),
(5329, 4, 182),
(5330, 6, 182),
(5331, 23, 182),
(5332, 5, 182),
(5333, 2, 183),
(5334, 3, 183),
(5335, 1, 183),
(5336, 4, 183),
(5337, 12, 183),
(5338, 23, 183),
(5339, 5, 183),
(5340, 2, 184),
(5341, 3, 184),
(5342, 1, 184),
(5343, 4, 184),
(5344, 12, 184),
(5345, 23, 184),
(5346, 5, 184),
(5347, 2, 185),
(5348, 3, 185),
(5349, 1, 185),
(5350, 4, 185),
(5351, 12, 185),
(5352, 23, 185),
(5353, 5, 185),
(5354, 2, 186),
(5355, 3, 186),
(5356, 1, 186),
(5357, 4, 186),
(5358, 12, 186),
(5359, 23, 186),
(5360, 5, 186),
(5361, 2, 187),
(5362, 3, 187),
(5363, 1, 187),
(5364, 4, 187),
(5365, 12, 187),
(5366, 23, 187),
(5367, 5, 187),
(5368, 2, 188),
(5369, 3, 188),
(5370, 1, 188),
(5371, 4, 188),
(5372, 6, 188),
(5373, 23, 188),
(5374, 5, 188),
(5375, 2, 189),
(5376, 3, 189),
(5377, 1, 189),
(5378, 4, 189),
(5379, 12, 189),
(5380, 23, 189),
(5381, 5, 189),
(5382, 2, 190),
(5383, 3, 190),
(5384, 1, 190),
(5385, 4, 190),
(5386, 6, 190),
(5387, 23, 190),
(5388, 5, 190),
(5389, 2, 191),
(5390, 3, 191),
(5391, 1, 191),
(5392, 4, 191),
(5393, 12, 191),
(5394, 23, 191),
(5395, 5, 191),
(5396, 2, 192),
(5397, 3, 192),
(5398, 1, 192),
(5399, 4, 192),
(5400, 12, 192),
(5401, 23, 192),
(5402, 5, 192),
(5403, 2, 193),
(5404, 3, 193),
(5405, 1, 193),
(5406, 4, 193),
(5407, 12, 193),
(5408, 23, 193),
(5409, 5, 193),
(5410, 2, 194),
(5411, 3, 194),
(5412, 1, 194),
(5413, 4, 194),
(5414, 12, 194),
(5415, 23, 194),
(5416, 5, 194),
(5417, 2, 195),
(5418, 3, 195),
(5419, 1, 195),
(5420, 4, 195),
(5421, 12, 195),
(5422, 23, 195),
(5423, 5, 195),
(5424, 2, 196),
(5425, 3, 196),
(5426, 1, 196),
(5427, 4, 196),
(5428, 6, 196),
(5429, 23, 196),
(5430, 5, 196),
(5431, 2, 197),
(5432, 3, 197),
(5433, 1, 197),
(5434, 4, 197),
(5435, 12, 197),
(5436, 23, 197),
(5437, 5, 197),
(5438, 2, 198),
(5439, 3, 198),
(5440, 1, 198),
(5441, 4, 198),
(5442, 12, 198),
(5443, 23, 198),
(5444, 5, 198),
(5445, 2, 199),
(5446, 3, 199),
(5447, 1, 199),
(5448, 4, 199),
(5449, 12, 199),
(5450, 23, 199),
(5451, 5, 199),
(5452, 2, 200),
(5453, 3, 200),
(5454, 1, 200),
(5455, 4, 200),
(5456, 6, 200),
(5457, 23, 200),
(5458, 5, 200),
(5459, 2, 201),
(5460, 3, 201),
(5461, 1, 201),
(5462, 4, 201),
(5463, 12, 201),
(5464, 23, 201),
(5465, 5, 201),
(5466, 2, 202),
(5467, 3, 202),
(5468, 1, 202),
(5469, 4, 202),
(5470, 12, 202),
(5471, 23, 202),
(5472, 5, 202),
(5473, 2, 203),
(5474, 3, 203),
(5475, 1, 203),
(5476, 4, 203),
(5477, 12, 203),
(5478, 23, 203),
(5479, 5, 203),
(5480, 2, 204),
(5481, 3, 204),
(5482, 1, 204),
(5483, 4, 204),
(5484, 12, 204),
(5485, 23, 204),
(5486, 5, 204),
(5487, 2, 205),
(5488, 3, 205),
(5489, 1, 205),
(5490, 4, 205),
(5491, 12, 205),
(5492, 23, 205),
(5493, 5, 205),
(5494, 2, 206),
(5495, 3, 206),
(5496, 1, 206),
(5497, 4, 206),
(5498, 12, 206),
(5499, 23, 206),
(5500, 5, 206),
(5501, 2, 207),
(5502, 3, 207),
(5503, 1, 207),
(5504, 4, 207),
(5505, 12, 207),
(5506, 23, 207),
(5507, 5, 207);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `Notif_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Msg` varchar(100) NOT NULL,
  `Checkpoint` tinyint(1) NOT NULL COMMENT '1: Unread, 0: read',
  `User_Id` int(11) NOT NULL,
  `p_id` int(10) unsigned DEFAULT NULL,
  `time_rec` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Notif_Id`),
  KEY `User_Id` (`User_Id`),
  KEY `notification_ibfk_2` (`p_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=76 ;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`Notif_Id`, `Msg`, `Checkpoint`, `User_Id`, `p_id`, `time_rec`) VALUES
(19, 'jhgjgjhgjhgjhghgj', 1, 151, 6, '2017-07-04 08:39:09'),
(20, 'jhgjgjhgjhgjhghgj', 1, 152, 6, '2017-07-04 08:39:09'),
(21, 'jhgjgjhgjhgjhghgj', 1, 153, 6, '2017-07-04 08:39:09'),
(22, 'jhgjgjhgjhgjhghgj', 1, 154, 6, '2017-07-04 08:39:09'),
(23, 'jhgjgjhgjhgjhghgj', 1, 155, 6, '2017-07-04 08:39:09'),
(24, 'jhgjgjhgjhgjhghgj', 1, 156, 6, '2017-07-04 08:39:09'),
(25, 'jhgjgjhgjhgjhghgj', 1, 157, 6, '2017-07-04 08:39:09'),
(26, 'jhgjgjhgjhgjhghgj', 1, 158, 6, '2017-07-04 08:39:09'),
(27, 'jhgjgjhgjhgjhghgj', 1, 159, 6, '2017-07-04 08:39:10'),
(28, 'jhgjgjhgjhgjhghgj', 1, 160, 6, '2017-07-04 08:39:10'),
(29, 'jhgjgjhgjhgjhghgj', 1, 161, 6, '2017-07-04 08:39:10'),
(30, 'jhgjgjhgjhgjhghgj', 1, 162, 6, '2017-07-04 08:39:10'),
(31, 'jhgjgjhgjhgjhghgj', 1, 163, 6, '2017-07-04 08:39:10'),
(32, 'jhgjgjhgjhgjhghgj', 1, 164, 6, '2017-07-04 08:39:10'),
(33, 'jhgjgjhgjhgjhghgj', 1, 165, 6, '2017-07-04 08:39:10'),
(34, 'jhgjgjhgjhgjhghgj', 1, 166, 6, '2017-07-04 08:39:10'),
(35, 'jhgjgjhgjhgjhghgj', 1, 167, 6, '2017-07-04 08:39:10'),
(36, 'jhgjgjhgjhgjhghgj', 1, 168, 6, '2017-07-04 08:39:10'),
(37, 'jhgjgjhgjhgjhghgj', 1, 169, 6, '2017-07-04 08:39:10'),
(38, 'jhgjgjhgjhgjhghgj', 1, 170, 6, '2017-07-04 08:39:10'),
(39, 'jhgjgjhgjhgjhghgj', 1, 171, 6, '2017-07-04 08:39:10'),
(40, 'jhgjgjhgjhgjhghgj', 1, 172, 6, '2017-07-04 08:39:10'),
(41, 'jhgjgjhgjhgjhghgj', 1, 173, 6, '2017-07-04 08:39:10'),
(42, 'jhgjgjhgjhgjhghgj', 1, 174, 6, '2017-07-04 08:39:10'),
(43, 'jhgjgjhgjhgjhghgj', 1, 175, 6, '2017-07-04 08:39:10'),
(44, 'jhgjgjhgjhgjhghgj', 1, 176, 6, '2017-07-04 08:39:10'),
(45, 'jhgjgjhgjhgjhghgj', 1, 177, 6, '2017-07-04 08:39:10'),
(46, 'jhgjgjhgjhgjhghgj', 1, 178, 6, '2017-07-04 08:39:10'),
(47, 'jhgjgjhgjhgjhghgj', 1, 179, 6, '2017-07-04 08:39:10'),
(48, 'jhgjgjhgjhgjhghgj', 1, 180, 6, '2017-07-04 08:39:10'),
(49, 'jhgjgjhgjhgjhghgj', 1, 181, 6, '2017-07-04 08:39:10'),
(50, 'jhgjgjhgjhgjhghgj', 1, 182, 6, '2017-07-04 08:39:10'),
(51, 'jhgjgjhgjhgjhghgj', 1, 183, 6, '2017-07-04 08:39:10'),
(52, 'jhgjgjhgjhgjhghgj', 1, 184, 6, '2017-07-04 08:39:10'),
(53, 'jhgjgjhgjhgjhghgj', 1, 185, 6, '2017-07-04 08:39:10'),
(54, 'jhgjgjhgjhgjhghgj', 1, 186, 6, '2017-07-04 08:39:10'),
(55, 'jhgjgjhgjhgjhghgj', 1, 187, 6, '2017-07-04 08:39:10'),
(56, 'jhgjgjhgjhgjhghgj', 1, 188, 6, '2017-07-04 08:39:10'),
(57, 'jhgjgjhgjhgjhghgj', 1, 189, 6, '2017-07-04 08:39:10'),
(58, 'jhgjgjhgjhgjhghgj', 1, 190, 6, '2017-07-04 08:39:10'),
(59, 'jhgjgjhgjhgjhghgj', 1, 191, 6, '2017-07-04 08:39:10'),
(60, 'jhgjgjhgjhgjhghgj', 1, 192, 6, '2017-07-04 08:39:10'),
(61, 'jhgjgjhgjhgjhghgj', 1, 193, 6, '2017-07-04 08:39:10'),
(62, 'jhgjgjhgjhgjhghgj', 1, 194, 6, '2017-07-04 08:39:10'),
(63, 'jhgjgjhgjhgjhghgj', 1, 195, 6, '2017-07-04 08:39:10'),
(64, 'jhgjgjhgjhgjhghgj', 1, 196, 6, '2017-07-04 08:39:10'),
(65, 'jhgjgjhgjhgjhghgj', 1, 197, 6, '2017-07-04 08:39:10'),
(66, 'jhgjgjhgjhgjhghgj', 1, 198, 6, '2017-07-04 08:39:10'),
(67, 'jhgjgjhgjhgjhghgj', 1, 199, 6, '2017-07-04 08:39:10'),
(68, 'jhgjgjhgjhgjhghgj', 1, 200, 6, '2017-07-04 08:39:10'),
(69, 'jhgjgjhgjhgjhghgj', 1, 201, 6, '2017-07-04 08:39:10'),
(70, 'jhgjgjhgjhgjhghgj', 1, 202, 6, '2017-07-04 08:39:10'),
(71, 'jhgjgjhgjhgjhghgj', 1, 203, 6, '2017-07-04 08:39:10'),
(72, 'jhgjgjhgjhgjhghgj', 1, 204, 6, '2017-07-04 08:39:10'),
(73, 'jhgjgjhgjhgjhghgj', 1, 205, 6, '2017-07-04 08:39:10'),
(74, 'jhgjgjhgjhgjhghgj', 1, 206, 6, '2017-07-04 08:39:10'),
(75, 'jhgjgjhgjhgjhghgj', 1, 207, 6, '2017-07-04 08:39:10');

-- --------------------------------------------------------

--
-- Table structure for table `notification_statics`
--

CREATE TABLE IF NOT EXISTS `notification_statics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notification_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1: system Notification, 2: Teacher Notification',
  `course` varchar(512) NOT NULL DEFAULT 'ALL',
  `sender_id` int(11) DEFAULT NULL,
  `sent_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `notification_statics`
--

INSERT INTO `notification_statics` (`id`, `notification_type`, `course`, `sender_id`, `sent_date`) VALUES
(6, 2, 'Islamic Studies (IS-101)', 2, '2017-07-04 10:39:09');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `Profile_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Address` varchar(40) NOT NULL,
  `ContactNo` varchar(11) NOT NULL,
  `Email` varchar(25) NOT NULL,
  `User_Id` int(11) NOT NULL,
  PRIMARY KEY (`Profile_Id`),
  KEY `User_Id` (`User_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`Profile_Id`, `Fname`, `Lname`, `Address`, `ContactNo`, `Email`, `User_Id`) VALUES
(1, 'siki', 'sani', 'islamabadian', '03457677996', 'ch.sikandar996@gmail.com', 3);

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `all_time` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `teacher` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `student` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `department` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `all_time`, `teacher`, `student`, `department`) VALUES
(1, 10, 3, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `security_keys`
--

CREATE TABLE IF NOT EXISTS `security_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `User_Id` int(11) NOT NULL,
  `key` varchar(256) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`User_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE IF NOT EXISTS `semester` (
  `Semester_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Semester_Name` varchar(10) NOT NULL,
  `Dept_Id` int(11) NOT NULL,
  PRIMARY KEY (`Semester_Id`),
  KEY `Dept_Id` (`Dept_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`Semester_Id`, `Semester_Name`, `Dept_Id`) VALUES
(1, '1st', 1),
(2, '2nd', 1),
(3, '3rd', 1),
(4, '4th', 1),
(5, '1st', 2),
(6, '2nd', 2),
(7, '3rd', 2),
(8, '4th', 2),
(9, '1st', 3),
(10, '2nd', 3),
(11, '3rd', 3),
(12, '4th', 3);

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE IF NOT EXISTS `timetable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` varchar(160) NOT NULL,
  `room` varchar(16) NOT NULL,
  `day` varchar(10) NOT NULL,
  `semester` varchar(3) NOT NULL,
  `time` varchar(12) NOT NULL,
  `cstring` varchar(160) NOT NULL,
  `notification` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1: Send Notification, 0: No Notification',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1: Keep, 2: Delete',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2052 ;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`id`, `course`, `room`, `day`, `semester`, `time`, `cstring`, `notification`, `status`) VALUES
(1847, 'CS-102 (Chem)- Introduction to Programming', 'LT-3', 'MONDAY', '2nd', '09:00-10:30', 'cs102chemintroductiontoprogrammingMONDAY2ndLT-309:00-10:30', 0, 1),
(1848, 'PH-103(Chem)-Electricity, Mag.& Therm. Ph.', 'F-5', 'MONDAY', '2nd', '12:40-14:10', 'ph103chemelectricitymagthermphMONDAY2ndF-512:40-14:10', 0, 1),
(1849, 'EN-102(Chem) Functional English II.', 'LT-1', 'MONDAY', '2nd', '14:20-15:50', 'en102chemfunctionalenglishiiMONDAY2ndLT-114:20-15:50', 0, 1),
(1850, 'MA-203(C.Sc.) Discrete Mathematics', 'F-1', 'MONDAY', '2nd', '09:00-10:30', 'ma203cscdiscretemathematicsMONDAY2ndF-109:00-10:30', 0, 1),
(1851, 'PH-193(C.Sc.)Electricity, Mag.& Therm Phy.Lab.', 'PHL', 'MONDAY', '2nd', '10:40-12:10', 'ph193cscelectricitymagthermphylabMONDAY2ndPHL10:40-12:10', 0, 1),
(1852, 'IS-101(C.Sc.)-Islamic Studies', 'F-1', 'MONDAY', '2nd', '12:40-14:10', 'is101cscislamicstudiesMONDAY2ndF-112:40-14:10', 0, 1),
(1853, 'MA-102 (E.Sc.)Calculus & Anal. Geom-II.', 'AUD', 'MONDAY', '2nd', '09:00-10:30', 'ma102esccalculusanalgeomiiMONDAY2ndAUD09:00-10:30', 0, 1),
(1854, 'CS-102(E.Sc.)Introduction to Programming', 'AUD', 'MONDAY', '2nd', '10:40-12:10', 'cs102escintroductiontoprogrammingMONDAY2ndAUD10:40-12:10', 0, 1),
(1855, 'PH-103 (E.Sc.)Electricity, Mag & Thermal Phy.', 'AUD', 'MONDAY', '2nd', '12:40-14:10', 'ph103escelectricitymagthermalphyMONDAY2ndAUD12:40-14:10', 0, 1),
(1856, 'EN-102(E.Sc.)- Functional English', 'AUD', 'MONDAY', '2nd', '14:20-15:50', 'en102escfunctionalenglishMONDAY2ndAUD14:20-15:50', 0, 1),
(1857, 'PH-103 (Elect.)Electricity, Mag & Therml Phy.', 'F-2', 'MONDAY', '2nd', '09:00-10:30', 'ph103electelectricitymagthermlphyMONDAY2ndF-209:00-10:30', 0, 1),
(1858, 'EN-102(Elect.)Functional English II.', 'F-2', 'MONDAY', '2nd', '10:40-12:10', 'en102electfunctionalenglishiiMONDAY2ndF-210:40-12:10', 0, 1),
(1859, 'PH-193 (Elect.)Electricity, Mag.& Therm Phy.Lab.', 'PHL', 'MONDAY', '2nd', '12:40-14:10', 'ph193electelectricitymagthermphylabMONDAY2ndPHL12:40-14:10', 0, 1),
(1860, 'EN-102(I.T.)Functional English II.', 'F-3', 'MONDAY', '2nd', '09:00-10:30', 'en102itfunctionalenglishiiMONDAY2ndF-309:00-10:30', 0, 1),
(1861, 'PH-103 (I.T.)Electricity, Mag & Thermal Phy.', 'F-3', 'MONDAY', '2nd', '10:40-12:10', 'ph103itelectricitymagthermalphyMONDAY2ndF-310:40-12:10', 0, 1),
(1862, 'IT-101 (I.T.)Fundamental of Inf. Tech.', 'F-2', 'MONDAY', '2nd', '12:40-14:10', 'it101itfundamentalofinftechMONDAY2ndF-212:40-14:10', 0, 1),
(1863, 'MA-102(Math)Calculus & Anal. Geom-II.', 'LT-1', 'MONDAY', '2nd', '09:00-10:30', 'ma102mathcalculusanalgeomiiMONDAY2ndLT-109:00-10:30', 0, 1),
(1864, 'PY-101(Math)Introduction to Psychology', 'F-1', 'MONDAY', '2nd', '10:40-12:10', 'py101mathintroductiontopsychologyMONDAY2ndF-110:40-12:10', 0, 1),
(1865, 'EN-102(Math)Functional English II.', 'F-3', 'MONDAY', '2nd', '12:40-14:10', 'en102mathfunctionalenglishiiMONDAY2ndF-312:40-14:10', 0, 1),
(1866, 'IS-101(Phys)Islamic Studies', 'F-4', 'MONDAY', '2nd', '09:00-10:30', 'is101physislamicstudiesMONDAY2ndF-409:00-10:30', 0, 1),
(1867, 'MA-102(Phys)Calculus & Analytic Geometry-II.', 'F-4', 'MONDAY', '2nd', '10:40-12:10', 'ma102physcalculusanalyticgeometryiiMONDAY2ndF-410:40-12:10', 0, 1),
(1868, 'CS-102 (Phys)Introduction to Programming', 'F-4', 'MONDAY', '2nd', '12:40-14:10', 'cs102physintroductiontoprogrammingMONDAY2ndF-412:40-14:10', 0, 1),
(1869, 'MA-102(Stat) Calculus & Anal. Geometry II.', 'F-6', 'MONDAY', '2nd', '09:00-10:30', 'ma102statcalculusanalgeometryiiMONDAY2ndF-609:00-10:30', 0, 1),
(1870, 'EN-102(Stat)Functional English II.', 'F-6', 'MONDAY', '2nd', '10:40-12:10', 'en102statfunctionalenglishiiMONDAY2ndF-610:40-12:10', 0, 1),
(1871, 'ST-102(Stat)Basic Statistical Inference', 'F-6', 'MONDAY', '2nd', '12:40-14:10', 'st102statbasicstatisticalinferenceMONDAY2ndF-612:40-14:10', 0, 1),
(1872, 'CS-102 (Stat)Introduction to Programming', 'F-2', 'MONDAY', '2nd', '14:20-15:50', 'cs102statintroductiontoprogrammingMONDAY2ndF-214:20-15:50', 0, 1),
(1873, 'ES-202(Chem)Geo-Tectonics', 'LT-02', 'MONDAY', '4th', '09:00-10:30', 'es202chemgeotectonicsMONDAY4thLT-0209:00-10:30', 0, 1),
(1874, 'PY-101(Chem.)Introduction to Psychology', 'LT-2', 'MONDAY', '4th', '14:20-15:50', 'py101chemintroductiontopsychologyMONDAY4thLT-214:20-15:50', 0, 1),
(1875, 'CS-225(C.Sc.) Database Systems.', 'CSL', 'MONDAY', '4th', '09:00-10:30', 'cs225cscdatabasesystemsMONDAY4thCSL09:00-10:30', 0, 1),
(1876, 'CS-222 (C.Sc) ', 'CSL', 'MONDAY', '4th', '10:40-12:10', 'cs222cscMONDAY4thCSL10:40-12:10', 0, 1),
(1877, ' Ec.201(6th )Analysis & Design for Soft. Sys.', 'CSL', 'MONDAY', '4th', '10:40-12:10', 'ec2016thanalysisdesignforsoftsysMONDAY4thCSL10:40-12:10', 0, 1),
(1878, 'CS-213(C.Sc.)Computer Org. & A. Lang.', 'CSL', 'MONDAY', '4th', '12:40-14:10', 'cs213csccomputerorgalangMONDAY4thCSL12:40-14:10', 0, 1),
(1879, 'CH-100(C.Sc.)General Chemistry.', 'F-5', 'MONDAY', '4th', '14:20-15:50', 'ch100cscgeneralchemistryMONDAY4thF-514:20-15:50', 0, 1),
(1880, 'MA-205 (E.Sc.)ESDifferential Equation & Linear A.', 'LT-1', 'MONDAY', '4th', '10:40-12:10', 'ma205escesdifferentialequationlinearaMONDAY4thLT-110:40-12:10', 0, 1),
(1881, 'BY-201(E.Sc.) Introductory Biology', 'LT-1', 'MONDAY', '4th', '12:40-14:10', 'by201escintroductorybiologyMONDAY4thLT-112:40-14:10', 0, 1),
(1882, 'EL-281(Elect.)Signals and Systems', 'LT-2', 'MONDAY', '4th', '10:40-12:10', 'el281electsignalsandsystemsMONDAY4thLT-210:40-12:10', 0, 1),
(1883, 'EL-202(Elect.)Probability, Statistics & R. Vr', 'G-1', 'MONDAY', '4th', '14:20-15:50', 'el202electprobabilitystatisticsrvrMONDAY4thG-114:20-15:50', 0, 1),
(1884, 'IT-202 (I.T.) Data Structure', 'F-5', 'MONDAY', '4th', '09:00-10:30', 'it202itdatastructureMONDAY4thF-509:00-10:30', 0, 1),
(1885, 'MA-205(I.T.) Differential Equation & Linear A', 'G-1', 'MONDAY', '4th', '10:40-12:10', 'ma205itdifferentialequationlinearaMONDAY4thG-110:40-12:10', 0, 1),
(1886, 'IT-232(I.T.) Database Systems', 'G-1', 'MONDAY', '4th', '12:40-14:10', 'it232itdatabasesystemsMONDAY4thG-112:40-14:10', 0, 1),
(1887, 'MA-203 (Math)Discrete Mathematics', 'G-2', 'MONDAY', '4th', '10:40-12:10', 'ma203mathdiscretemathematicsMONDAY4thG-210:40-12:10', 0, 1),
(1888, 'EC-201 (Math)Economics', 'G-2', 'MONDAY', '4th', '14:20-15:50', 'ec201matheconomicsMONDAY4thG-214:20-15:50', 0, 1),
(1889, 'PH-202 (Phys)- Modern Physics', 'G-1', 'MONDAY', '4th', '09:00-10:30', 'ph202physmodernphysicsMONDAY4thG-109:00-10:30', 0, 1),
(1890, 'PH-203 (Phys) Thermal and Statistical Physics', 'LT-3', 'MONDAY', '4th', '10:40-12:10', 'ph203physthermalandstatisticalphysicsMONDAY4thLT-310:40-12:10', 0, 1),
(1891, 'ST-203 (Stat) Bio-Statistics', 'G-2', 'MONDAY', '4th', '09:00-10:30', 'st203statbiostatisticsMONDAY4thG-209:00-10:30', 0, 1),
(1892, 'MA-205 (Stat)Differential Equation & L. A.', 'F-5', 'MONDAY', '4th', '10:40-12:10', 'ma205statdifferentialequationlaMONDAY4thF-510:40-12:10', 0, 1),
(1893, 'EC-201(Stat) Economics', 'G-2', 'MONDAY', '4th', '12:40-14:10', 'ec201stateconomicsMONDAY4thG-212:40-14:10', 0, 1),
(1894, 'PY-101(Stat)Introduction to Psychology', 'LT-3', 'MONDAY', '4th', '14:20-15:50', 'py101statintroductiontopsychologyMONDAY4thLT-314:20-15:50', 0, 1),
(1895, 'PH-103 (Chem)Electricity, Mag. & Thermal P', 'F-5', 'TUESDAY', '2nd', '09:00-10:30', 'ph103chemelectricitymagthermalpTUESDAY2ndF-509:00-10:30', 0, 1),
(1897, 'EN-102 (Chem.)Functional English II.', 'F-5', 'TUESDAY', '2nd', '14:20-15:50', 'en102chemfunctionalenglishiiTUESDAY2ndF-514:20-15:50', 0, 1),
(1898, 'CS-121(C.Sc.)Object Oriented Programming', 'CSL', 'TUESDAY', '2nd', '10:40-12:10', 'cs121cscobjectorientedprogrammingTUESDAY2ndCSL10:40-12:10', 0, 1),
(1899, 'MA-102(C.Sc.)Calculus and Analytic Geo.II.', 'F-1', 'TUESDAY', '2nd', '12:40-14:10', 'ma102csccalculusandanalyticgeoiiTUESDAY2ndF-112:40-14:10', 0, 1),
(1900, 'MA-102 (E.Sc.)Calculus & Anal. Geom-II.', 'AUD', 'TUESDAY', '2nd', '09:00-10:30', 'ma102esccalculusanalgeomiiTUESDAY2ndAUD09:00-10:30', 0, 1),
(1901, 'PH-103 (E.Sc.)Electricity, Mag & Thermal Phy.', 'AUD', 'TUESDAY', '2nd', '10:40-12:10', 'ph103escelectricitymagthermalphyTUESDAY2ndAUD10:40-12:10', 0, 1),
(1902, 'ES-102 (E.Sc.) Introduction to Geophysics', 'AUD', 'TUESDAY', '2nd', '12:40-14:10', 'es102escintroductiontogeophysicsTUESDAY2ndAUD12:40-14:10', 0, 1),
(1903, 'EN-102(E.Sc.)Functional English II.', 'AUD', 'TUESDAY', '2nd', '14:20-15:50', 'en102escfunctionalenglishiiTUESDAY2ndAUD14:20-15:50', 0, 1),
(1904, 'MA-102 (Elect.)Calculus & Anal. Geom-II.', 'F-2', 'TUESDAY', '2nd', '09:00-10:30', 'ma102electcalculusanalgeomiiTUESDAY2ndF-209:00-10:30', 0, 1),
(1905, 'PH-103 (Elect.) Electricity, Mag & Thermal Phy.', 'F-2', 'TUESDAY', '2nd', '10:40-12:10', 'ph103electelectricitymagthermalphyTUESDAY2ndF-210:40-12:10', 0, 1),
(1906, 'EN-102(Elect.)Functional English II.', 'F-2', 'TUESDAY', '2nd', '14:20-15:50', 'en102electfunctionalenglishiiTUESDAY2ndF-214:20-15:50', 0, 1),
(1907, 'EN-102(I.T.)Functional English II.', 'F-3', 'TUESDAY', '2nd', '09:00-10:30', 'en102itfunctionalenglishiiTUESDAY2ndF-309:00-10:30', 0, 1),
(1908, 'PH-103 (I.T.)-F-5Electricity, Mag. & Thermal Phy.', 'F-3', 'TUESDAY', '2nd', '10:40-12:10', 'ph103itf5electricitymagthermalphyTUESDAY2ndF-310:40-12:10', 0, 1),
(1909, 'PH-193(I.T.)Electricity, Mag. & Therml Phy.Lab.', 'PHL', 'TUESDAY', '2nd', '12:40-14:10', 'ph193itelectricitymagthermlphylabTUESDAY2ndPHL12:40-14:10', 0, 1),
(1910, 'PH-104 (Math)Waves & Optics', 'G-1', 'TUESDAY', '2nd', '10:40-12:10', 'ph104mathwavesopticsTUESDAY2ndG-110:40-12:10', 0, 1),
(1911, 'PY-101(Math)Introduction to Psychology', 'F-4', 'TUESDAY', '2nd', '12:40-14:10', 'py101mathintroductiontopsychologyTUESDAY2ndF-412:40-14:10', 0, 1),
(1912, 'CH-102(Phys) Chemistry-II', 'F-6', 'TUESDAY', '2nd', '09:00-10:30', 'ch102physchemistryiiTUESDAY2ndF-609:00-10:30', 0, 1),
(1913, 'CH-192(Phys)Chemistry-I Lab', 'CHL', 'TUESDAY', '2nd', '10:40-12:10', 'ch192physchemistryilabTUESDAY2ndCHL10:40-12:10', 0, 1),
(1914, 'MA-102(Phys) Calculus & Ana G. .II.', 'F-3', 'TUESDAY', '2nd', '14:20-15:50', 'ma102physcalculusanagiiTUESDAY2ndF-314:20-15:50', 0, 1),
(1915, 'MA-102(Stat)Calculus & Anal. Geometry-II.', 'F-1', 'TUESDAY', '2nd', '10:40-12:10', 'ma102statcalculusanalgeometryiiTUESDAY2ndF-110:40-12:10', 0, 1),
(1916, 'IS-101(Stat)Islamic Studies', 'F-3', 'TUESDAY', '2nd', '12:40-14:10', 'is101statislamicstudiesTUESDAY2ndF-312:40-14:10', 0, 1),
(1917, 'EN-102(Stat)Functional English II.', 'F-6', 'TUESDAY', '2nd', '14:20-15:50', 'en102statfunctionalenglishiiTUESDAY2ndF-614:20-15:50', 0, 1),
(1918, 'ES-202(Chem)Geo-Tectonics', 'F-4', 'TUESDAY', '4th', '10:40-12:10', 'es202chemgeotectonicsTUESDAY4thF-410:40-12:10', 0, 1),
(1919, 'PY-101(Chem.)Introduction to Psychology', 'LT-1', 'TUESDAY', '4th', '14:20-15:50', 'py101chemintroductiontopsychologyTUESDAY4thLT-114:20-15:50', 0, 1),
(1920, 'ST-101(C.Sc.)Probability and Statistics', 'LT-1', 'TUESDAY', '4th', '09:00-10:30', 'st101cscprobabilityandstatisticsTUESDAY4thLT-109:00-10:30', 0, 1),
(1921, 'CH-100 (C.Sc.)General Chemistry.', 'F-5', 'TUESDAY', '4th', '10:40-12:10', 'ch100cscgeneralchemistryTUESDAY4thF-510:40-12:10', 0, 1),
(1922, 'CH-190 (C.Sc.)General Chemistry.(Lab.).', 'CHL', 'TUESDAY', '4th', '12:40-14:10', 'ch190cscgeneralchemistrylabTUESDAY4thCHL12:40-14:10', 0, 1),
(1923, 'MA-205 (C.Sc.)Differential Equation & Lin. A.', 'LT-2', 'TUESDAY', '4th', '14:20-15:50', 'ma205cscdifferentialequationlinaTUESDAY4thLT-214:20-15:50', 0, 1),
(1924, 'MA-205 (E.Sc.)Differential Equation & Linear A.', 'LT-3', 'TUESDAY', '4th', '10:40-12:10', 'ma205escdifferentialequationlinearaTUESDAY4thLT-310:40-12:10', 0, 1),
(1925, 'BY-201(E.Sc.)Introductory Biology', 'LT-2', 'TUESDAY', '4th', '12:40-14:10', 'by201escintroductorybiologyTUESDAY4thLT-212:40-14:10', 0, 1),
(1926, 'BY-201(Elect.)General Chemistry (Lab.).', 'LT-1', 'TUESDAY', '4th', '12:40-14:10', 'by201electgeneralchemistrylabTUESDAY4thLT-112:40-14:10', 0, 1),
(1927, 'MA-205 (Elect.)Differential Equation & L. A.', 'F-1', 'TUESDAY', '4th', '14:20-15:50', 'ma205electdifferentialequationlaTUESDAY4thF-114:20-15:50', 0, 1),
(1928, 'ES-101 (I.T.)Introduction to Geology', 'G-1', 'TUESDAY', '4th', '09:00-10:30', 'es101itintroductiontogeologyTUESDAY4thG-109:00-10:30', 0, 1),
(1929, 'IT-202 (I.T.) Data Structure', 'F-6', 'TUESDAY', '4th', '10:40-12:10', 'it202itdatastructureTUESDAY4thF-610:40-12:10', 0, 1),
(1930, 'IT-222 (I.T.) Computer Architecture', 'G-1', 'TUESDAY', '4th', '12:40-14:10', 'it222itcomputerarchitectureTUESDAY4thG-112:40-14:10', 0, 1),
(1931, 'MA-203 (Math)Discrete Mathematics', 'G-2', 'TUESDAY', '4th', '09:00-10:30', 'ma203mathdiscretemathematicsTUESDAY4thG-209:00-10:30', 0, 1),
(1932, 'ST-101 (Math)Probability & Statistics', 'G-2', 'TUESDAY', '4th', '10:40-12:10', 'st101mathprobabilitystatisticsTUESDAY4thG-210:40-12:10', 0, 1),
(1933, 'MA-205 (Math)Differential Equation & Lin. A.', 'LT-3', 'TUESDAY', '4th', '12:40-14:10', 'ma205mathdifferentialequationlinaTUESDAY4thLT-312:40-14:10', 0, 1),
(1934, 'EC-201 (Math)Economics', 'G-1', 'TUESDAY', '4th', '14:20-15:50', 'ec201matheconomicsTUESDAY4thG-114:20-15:50', 0, 1),
(1935, 'MA-205 (Phys)Differential Equation & Linear A.', 'LT-2', 'TUESDAY', '4th', '10:40-12:10', 'ma205physdifferentialequationlinearaTUESDAY4thLT-210:40-12:10', 0, 1),
(1936, 'PY-101 (Phys)Introduction to Psychology', 'LT-3', 'TUESDAY', '4th', '14:20-15:50', 'py101physintroductiontopsychologyTUESDAY4thLT-314:20-15:50', 0, 1),
(1937, 'ST-203 (Stat)Bio-Statistics', 'LT-3', 'TUESDAY', '4th', '09:00-10:30', 'st203statbiostatisticsTUESDAY4thLT-309:00-10:30', 0, 1),
(1938, 'MA-205 (Stat)Differential Equation & L. A.', 'LT-1', 'TUESDAY', '4th', '10:40-12:10', 'ma205statdifferentialequationlaTUESDAY4thLT-110:40-12:10', 0, 1),
(1939, 'PY-101 (Stat)Introduction to Psychology', 'G-2', 'TUESDAY', '4th', '12:40-14:10', 'py101statintroductiontopsychologyTUESDAY4thG-212:40-14:10', 0, 1),
(1940, 'EC-201(Stat)Economics', 'G-2', 'TUESDAY', '4th', '14:20-15:50', 'ec201stateconomicsTUESDAY4thG-214:20-15:50', 0, 1),
(1941, 'CS-102 (Chem)Introduction to Programming', 'CSL', 'WEDNESDAY', '2nd', '09:00-10:30', 'cs102chemintroductiontoprogrammingWEDNESDAY2ndCSL09:00-10:30', 0, 1),
(1942, 'IS-101(Chem)Islamic Studies', 'AUD', 'WEDNESDAY', '2nd', '12:40-14:10', 'is101chemislamicstudiesWEDNESDAY2ndAUD12:40-14:10', 0, 1),
(1943, 'CH-102(Chem) Chemistry-II', 'F-2', 'WEDNESDAY', '2nd', '14:20-15:50', 'ch102chemchemistryiiWEDNESDAY2ndF-214:20-15:50', 0, 1),
(1944, 'MA-203 (C.Sc.)Discrete Mathematics', 'F-1', 'WEDNESDAY', '2nd', '09:00-10:30', 'ma203cscdiscretemathematicsWEDNESDAY2ndF-109:00-10:30', 0, 1),
(1945, 'EN-102 (C.Sc.)Functional English II.', 'F-1', 'WEDNESDAY', '2nd', '10:40-12:10', 'en102cscfunctionalenglishiiWEDNESDAY2ndF-110:40-12:10', 0, 1),
(1946, 'MA-102(C.Sc.)Calculus and Analytic Geo-II.', 'F-1', 'WEDNESDAY', '2nd', '12:40-14:10', 'ma102csccalculusandanalyticgeoiiWEDNESDAY2ndF-112:40-14:10', 0, 1),
(1947, 'IS-101(C.Sc.)Islamic Studies', 'F-1', 'WEDNESDAY', '2nd', '14:20-15:50', 'is101cscislamicstudiesWEDNESDAY2ndF-114:20-15:50', 0, 1),
(1948, 'IS-101(E.Sc.) Islamic Studies', 'AUD', 'WEDNESDAY', '2nd', '09:00-10:30', 'is101escislamicstudiesWEDNESDAY2ndAUD09:00-10:30', 0, 1),
(1949, 'CS-102 (E.Sc.) Introduction to Programming', 'CSL', 'WEDNESDAY', '2nd', '10:40-12:10', 'cs102escintroductiontoprogrammingWEDNESDAY2ndCSL10:40-12:10', 0, 1),
(1950, 'MA-102(Elect.)Calculus & Anal. Geom-II.', 'F-2', 'WEDNESDAY', '2nd', '10:40-12:10', 'ma102electcalculusanalgeomiiWEDNESDAY2ndF-210:40-12:10', 0, 1),
(1951, 'PY-101 (Elect.) Introduction to Psychology', 'F-2', 'WEDNESDAY', '2nd', '12:40-14:10', 'py101electintroductiontopsychologyWEDNESDAY2ndF-212:40-14:10', 0, 1),
(1952, 'IS-101(Elect.)Islamic Studies', 'F-5', 'WEDNESDAY', '2nd', '14:20-15:50', 'is101electislamicstudiesWEDNESDAY2ndF-514:20-15:50', 0, 1),
(1953, 'IT-101 (I.T.)Fundamental of Inf. Tech.', 'F-5', 'WEDNESDAY', '2nd', '09:00-10:30', 'it101itfundamentalofinftechWEDNESDAY2ndF-509:00-10:30', 0, 1),
(1954, 'MA-102(I.T.)-F-5Calculus & Anal. Geom-II..', 'F-5', 'WEDNESDAY', '2nd', '10:40-12:10', 'ma102itf5calculusanalgeomiiWEDNESDAY2ndF-510:40-12:10', 0, 1),
(1955, 'IS-101(I.T.)Islamic Studies', 'F-4', 'WEDNESDAY', '2nd', '12:40-14:10', 'is101itislamicstudiesWEDNESDAY2ndF-412:40-14:10', 0, 1),
(1956, 'PY-101 (I.T.)Introduction to Psychology', 'F-3', 'WEDNESDAY', '2nd', '14:20-15:50', 'py101itintroductiontopsychologyWEDNESDAY2ndF-314:20-15:50', 0, 1),
(1957, 'PH-194 (Math)Waves & Optics Lab.', 'PHL', 'WEDNESDAY', '2nd', '10:40-12:10', 'ph194mathwavesopticslabWEDNESDAY2ndPHL10:40-12:10', 0, 1),
(1958, 'EN-102(Math)Functional English II.', 'F-5', 'WEDNESDAY', '2nd', '12:40-14:10', 'en102mathfunctionalenglishiiWEDNESDAY2ndF-512:40-14:10', 0, 1),
(1959, 'MA-102(Math)-Calculus & Anal. Geom-II.', 'Aud', 'WEDNESDAY', '2nd', '14:20-15:50', 'ma102mathcalculusanalgeomiiWEDNESDAY2ndAud14:20-15:50', 0, 1),
(1960, 'CH-102 (Phys)Chemistry-II', 'F-4', 'WEDNESDAY', '2nd', '09:00-10:30', 'ch102physchemistryiiWEDNESDAY2ndF-409:00-10:30', 0, 1),
(1961, 'MA-102(Phys)Calculus & Anal. Geom-II.', 'F-3', 'WEDNESDAY', '2nd', '10:40-12:10', 'ma102physcalculusanalgeomiiWEDNESDAY2ndF-310:40-12:10', 0, 1),
(1962, 'CS-102 (Phys)Introduction to Prog.', 'CSL', 'WEDNESDAY', '2nd', '12:40-14:10', 'cs102physintroductiontoprogWEDNESDAY2ndCSL12:40-14:10', 0, 1),
(1963, 'EN-102(Phys) Functional English II.', 'F-4', 'WEDNESDAY', '2nd', '14:20-15:50', 'en102physfunctionalenglishiiWEDNESDAY2ndF-414:20-15:50', 0, 1),
(1964, 'ST-102 (Stat)Basic Statistical Inference', 'F-6', 'WEDNESDAY', '2nd', '09:00-10:30', 'st102statbasicstatisticalinferenceWEDNESDAY2ndF-609:00-10:30', 0, 1),
(1965, 'PH-103 (Stat)Electricity, Mag. & Thermal Phy.', 'F-6', 'WEDNESDAY', '2nd', '10:40-12:10', 'ph103statelectricitymagthermalphyWEDNESDAY2ndF-610:40-12:10', 0, 1),
(1966, 'IS-101(Stat)Islamic Studies', 'F-6', 'WEDNESDAY', '2nd', '12:40-14:10', 'is101statislamicstudiesWEDNESDAY2ndF-612:40-14:10', 0, 1),
(1967, 'CS-102 (Stat)Introduction to Programming', 'CSL', 'WEDNESDAY', '2nd', '14:20-15:50', 'cs102statintroductiontoprogrammingWEDNESDAY2ndCSL14:20-15:50', 0, 1),
(1968, 'CH-204 (Chem.) Industrial Chemistry', 'G-2', 'WEDNESDAY', '4th', '09:00-10:30', 'ch204chemindustrialchemistryWEDNESDAY4thG-209:00-10:30', 0, 1),
(1969, 'CH-203 (Chem.)Chemistry-iv', 'LT-2', 'WEDNESDAY', '4th', '12:40-14:10', 'ch203chemchemistryivWEDNESDAY4thLT-212:40-14:10', 0, 1),
(1970, 'BY-201(Chem)Introductory Biology', 'LT-2', 'WEDNESDAY', '4th', '14:20-15:50', 'by201chemintroductorybiologyWEDNESDAY4thLT-214:20-15:50', 0, 1),
(1971, 'CS-225(C.Sc.)Database Systems.', 'LT-1', 'WEDNESDAY', '4th', '09:00-10:30', 'cs225cscdatabasesystemsWEDNESDAY4thLT-109:00-10:30', 0, 1),
(1972, 'CS-222(C.Sc.) ', 'G-2', 'WEDNESDAY', '4th', '10:40-12:10', 'cs222cscWEDNESDAY4thG-210:40-12:10', 0, 1),
(1973, ' Ec.201(6th ) Analysis & Design for Soft.sys.', 'G-2', 'WEDNESDAY', '4th', '10:40-12:10', 'ec2016thanalysisdesignforsoftsysWEDNESDAY4thG-210:40-12:10', 0, 1),
(1974, 'EC-201(C.Sc.)Economics (6th )', 'LT-1-', 'WEDNESDAY', '4th', '12:40-14:10', 'ec201csceconomics6thWEDNESDAY4thLT-1-12:40-14:10', 0, 1),
(1975, 'CS-213(C.Sc.)Computer Org. & Assembly Lang.', 'LT-1', 'WEDNESDAY', '4th', '14:20-15:50', 'cs213csccomputerorgassemblylangWEDNESDAY4thLT-114:20-15:50', 0, 1),
(1976, 'ES-202 (E.Sc.) Geo-Tectonics', 'LT-1', 'WEDNESDAY', '4th', '10:40-12:10', 'es202escgeotectonicsWEDNESDAY4thLT-110:40-12:10', 0, 1),
(1977, 'EC-201(E.Sc.) Economics', 'G-2', 'WEDNESDAY', '4th', '14:20-15:50', 'ec201esceconomicsWEDNESDAY4thG-214:20-15:50', 0, 1),
(1978, 'EL-211(Elect.) Basic Circuit Theory', 'LT-2', 'WEDNESDAY', '4th', '09:00-10:30', 'el211electbasiccircuittheoryWEDNESDAY4thLT-209:00-10:30', 0, 1),
(1979, 'EL-292(Elect.)Basic Circuit Theory Lab.', 'ELL', 'WEDNESDAY', '4th', '10:40-12:10', 'el292electbasiccircuittheorylabWEDNESDAY4thELL10:40-12:10', 0, 1),
(1980, 'BY-201 (Elect.)Introductory Biology', 'G-1', 'WEDNESDAY', '4th', '14:20-15:50', 'by201electintroductorybiologyWEDNESDAY4thG-114:20-15:50', 0, 1),
(1981, 'ES-101 (I.T.)Introduction to Geology', 'LT-3', 'WEDNESDAY', '4th', '09:00-10:30', 'es101itintroductiontogeologyWEDNESDAY4thLT-309:00-10:30', 0, 1),
(1982, 'IT-231 (I.T.) System Analysis and Design', 'LT-2', 'WEDNESDAY', '4th', '10:40-12:10', 'it231itsystemanalysisanddesignWEDNESDAY4thLT-210:40-12:10', 0, 1),
(1983, 'IT-232 (I.T.)Database Systems', 'LT-3.', 'WEDNESDAY', '4th', '14:20-15:50', 'it232itdatabasesystemsWEDNESDAY4thLT-3.14:20-15:50', 0, 1),
(1984, 'CS-111(Math)Programming', 'G-1', 'WEDNESDAY', '4th', '09:00-10:30', 'cs111mathprogrammingWEDNESDAY4thG-109:00-10:30', 0, 1),
(1985, 'MA-205 (Math)Differential Equation & Lin. A.', 'G-1', 'WEDNESDAY', '4th', '10:40-12:10', 'ma205mathdifferentialequationlinaWEDNESDAY4thG-110:40-12:10', 0, 1),
(1986, 'MA-205 (Phys)Differential Equation & L. Alg.', 'F-2', 'WEDNESDAY', '4th', '09:00-10:30', 'ma205physdifferentialequationlalgWEDNESDAY4thF-209:00-10:30', 0, 1),
(1987, 'PH-202 (Phys) Modern Physics', 'LT-3', 'WEDNESDAY', '4th', '10:40-12:10', 'ph202physmodernphysicsWEDNESDAY4thLT-310:40-12:10', 0, 1),
(1988, 'BY-201 (Phys) Introductory Biology', 'LT-3', 'WEDNESDAY', '4th', '12:40-14:10', 'by201physintroductorybiologyWEDNESDAY4thLT-312:40-14:10', 0, 1),
(1989, 'PY-101 (Phys)Introduction to Psychology', 'F-6', 'WEDNESDAY', '4th', '14:20-15:50', 'py101physintroductiontopsychologyWEDNESDAY4thF-614:20-15:50', 0, 1),
(1990, 'IS-101(Ehem) Islamic Studies', 'F-5', 'THURSDAY', '2nd', '09:00-10:30', 'is101ehemislamicstudiesTHURSDAY2ndF-509:00-10:30', 0, 1),
(1991, 'MA-101(Chem)-Calculus & Analytic Geometry-1', 'AUD', 'THURSDAY', '2nd', '12:40-14:10', 'ma101chemcalculusanalyticgeometry1THURSDAY2ndAUD12:40-14:10', 0, 1),
(1992, 'CH-102 (Chem)Chemistry-II', 'F-5', 'THURSDAY', '2nd', '14:20-15:50', 'ch102chemchemistryiiTHURSDAY2ndF-514:20-15:50', 0, 1),
(1993, 'CS-105(C.Sc.)Problems Solving & Prog.', 'CSL', 'THURSDAY', '2nd', '09:00-10:30', 'cs105cscproblemssolvingprogTHURSDAY2ndCSL09:00-10:30', 0, 1),
(1994, 'CS-121(C.Sc.)Object Oriented Prog.Lab.', 'CSL', 'THURSDAY', '2nd', '10:40-12:10', 'cs121cscobjectorientedproglabTHURSDAY2ndCSL10:40-12:10', 0, 1),
(1995, 'PH-103 (C.Sc.)Electricity, Mag. & Ther. Phy.', 'G.1', 'THURSDAY', '2nd', '14:20-15:50', 'ph103cscelectricitymagtherphyTHURSDAY2ndG.114:20-15:50', 0, 1),
(1996, 'ES-102 (E.Sc.)Introduction to Geophysics', 'AUD', 'THURSDAY', '2nd', '09:00-10:30', 'es102escintroductiontogeophysicsTHURSDAY2ndAUD09:00-10:30', 0, 1),
(1997, 'IS-101(E.Sc.) Islamic Studies', 'AUD', 'THURSDAY', '2nd', '14:20-15:50', 'is101escislamicstudiesTHURSDAY2ndAUD14:20-15:50', 0, 1),
(1998, 'CS-121(Elect.)Object Oriented Prog.', 'F-3', 'THURSDAY', '2nd', '09:00-10:30', 'cs121electobjectorientedprogTHURSDAY2ndF-309:00-10:30', 0, 1),
(1999, 'IS-101(Elect.)Islamic Studies', 'F-1', 'THURSDAY', '2nd', '12:40-14:10', 'is101electislamicstudiesTHURSDAY2ndF-112:40-14:10', 0, 1),
(2000, 'PY-101 (Elect.) Introduction to Psychology', 'LT.1', 'THURSDAY', '2nd', '14:20-15:50', 'py101electintroductiontopsychologyTHURSDAY2ndLT.114:20-15:50', 0, 1),
(2001, 'MA-102(I.T.)Calculus and Analytic Geomtry-II.', 'F-5', 'THURSDAY', '2nd', '10:40-12:10', 'ma102itcalculusandanalyticgeomtryiiTHURSDAY2ndF-510:40-12:10', 0, 1),
(2002, 'IS-101(I.T.)Islamic Studies', 'F-5', 'THURSDAY', '2nd', '12:40-14:10', 'is101itislamicstudiesTHURSDAY2ndF-512:40-14:10', 0, 1),
(2003, 'PY-101 (I.T.)Introduction to Psychology', 'F-5', 'THURSDAY', '2nd', '14:20-15:50', 'py101itintroductiontopsychologyTHURSDAY2ndF-514:20-15:50', 0, 1),
(2004, 'PH-104 (Math)Waves & Optics', 'F-2', 'THURSDAY', '2nd', '09:00-10:30', 'ph104mathwavesopticsTHURSDAY2ndF-209:00-10:30', 0, 1),
(2005, 'IS-101(Math)Islamic Studies', 'F-3', 'THURSDAY', '2nd', '12:40-14:10', 'is101mathislamicstudiesTHURSDAY2ndF-312:40-14:10', 0, 1),
(2006, 'PH-104 (Phys)Waves & Optics', 'F-4', 'THURSDAY', '2nd', '12:40-14:10', 'ph104physwavesopticsTHURSDAY2ndF-412:40-14:10', 0, 1),
(2007, 'IS-101(Phys)Islamic Studies', 'F-4', 'THURSDAY', '2nd', '14:20-15:50', 'is101physislamicstudiesTHURSDAY2ndF-414:20-15:50', 0, 1),
(2008, 'PH-103 (Stat)Electricity, Mag. & Therml Phy.', 'F-4', 'THURSDAY', '2nd', '09:00-10:30', 'ph103statelectricitymagthermlphyTHURSDAY2ndF-409:00-10:30', 0, 1),
(2009, 'PH-193 (Stat)Electricity, Mag. & Ther. Phy. Lab', 'PHL', 'THURSDAY', '2nd', '10:40-12:10', 'ph193statelectricitymagtherphylabTHURSDAY2ndPHL10:40-12:10', 0, 1),
(2010, 'CH-204 (Chem)Industrial Chemistry', 'LT-1', 'THURSDAY', '4th', '09:00-10:30', 'ch204chemindustrialchemistryTHURSDAY4thLT-109:00-10:30', 0, 1),
(2011, 'CH-293 (Chem)Chemistry-iv Lab.', 'CHL', 'THURSDAY', '4th', '10:40-12:10', 'ch293chemchemistryivlabTHURSDAY4thCHL10:40-12:10', 0, 1),
(2012, 'CH-203 (Chem)Chemistry-iv', 'LT-2', 'THURSDAY', '4th', '12:40-14:10', 'ch203chemchemistryivTHURSDAY4thLT-212:40-14:10', 0, 1),
(2013, 'BY-201(Chem)Introductory Biology', 'G-2', 'THURSDAY', '4th', '14:20-15:50', 'by201chemintroductorybiologyTHURSDAY4thG-214:20-15:50', 0, 1),
(2014, 'MA-205 (C.Sc.) Differential Equation & Lin. A.', 'LT-1', 'THURSDAY', '4th', '10:40-12:10', 'ma205cscdifferentialequationlinaTHURSDAY4thLT-110:40-12:10', 0, 1),
(2015, 'CS-293(C.Sc.) 13:30 to15:30 2hrsComputer org. & Assem.L. Lab.', 'CSL', 'THURSDAY', '4th', '12:40-14:10', 'cs293csc1330to15302hrscomputerorgassemllabTHURSDAY4thCSL12:40-14:10', 0, 1),
(2016, 'ES-293 (E.Sc.)Geological Particals-1', 'LT-2', 'THURSDAY', '4th', '09:00-10:30', 'es293escgeologicalparticals1THURSDAY4thLT-209:00-10:30', 0, 1),
(2017, 'EC-201(E.Sc.)Economics', 'LT-1', 'THURSDAY', '4th', '14:20-15:50', 'ec201esceconomicsTHURSDAY4thLT-114:20-15:50', 0, 1),
(2018, 'EL-211 (Elect.)Basic Circuit Theory', 'LT-3', 'THURSDAY', '4th', '09:00-10:30', 'el211electbasiccircuittheoryTHURSDAY4thLT-309:00-10:30', 0, 1),
(2019, 'EL-202(Elect.) Probability, Statistics & Rnd. Vr', 'LT-3', 'THURSDAY', '4th', '12:40-14:10', 'el202electprobabilitystatisticsrndvrTHURSDAY4thLT-312:40-14:10', 0, 1),
(2020, 'EC-201 (Elect.) Economics 6th', 'LT-2', 'THURSDAY', '4th', '14:20-15:50', 'ec201electeconomics6thTHURSDAY4thLT-214:20-15:50', 0, 1),
(2021, 'MA-205 (I.T.)Differential Equation & L. A', 'G-1', 'THURSDAY', '4th', '09:00-10:30', 'ma205itdifferentialequationlaTHURSDAY4thG-109:00-10:30', 0, 1),
(2022, 'IT-231 (I.T.)System Analysis and Design', 'G-1', 'THURSDAY', '4th', '10:40-12:10', 'it231itsystemanalysisanddesignTHURSDAY4thG-110:40-12:10', 0, 1),
(2023, 'IT-222 (I.T.)Computer Architecture', 'G-1', 'THURSDAY', '4th', '12:40-14:10', 'it222itcomputerarchitectureTHURSDAY4thG-112:40-14:10', 0, 1),
(2024, 'MA-204 (Math)Introduction to Group &Topology', 'G-2', 'THURSDAY', '4th', '10:40-12:10', 'ma204mathintroductiontogrouptopologyTHURSDAY4thG-210:40-12:10', 0, 1),
(2025, 'CS-111 (Math)Programming.', 'LT-1', 'THURSDAY', '4th', '12:40-14:10', 'cs111mathprogrammingTHURSDAY4thLT-112:40-14:10', 0, 1),
(2026, 'PH-292 (Phys)Modern Physics. (Lab).', 'PHL', 'THURSDAY', '4th', '09:00-10:30', 'ph292physmodernphysicslabTHURSDAY4thPHL09:00-10:30', 0, 1),
(2027, 'PH-203(Phys)Thermal & Statistical Physics', 'G-2', 'THURSDAY', '4th', '12:40-14:10', 'ph203physthermalstatisticalphysicsTHURSDAY4thG-212:40-14:10', 0, 1),
(2028, 'BY-201 (Phys)Introductory Biology', 'LT-3', 'THURSDAY', '4th', '14:20-15:50', 'by201physintroductorybiologyTHURSDAY4thLT-314:20-15:50', 0, 1),
(2029, 'ST-204 (Stat) Official Statistics', 'G-2', 'THURSDAY', '4th', '09:00-10:30', 'st204statofficialstatisticsTHURSDAY4thG-209:00-10:30', 0, 1),
(2030, 'MA-101 (Chem) Calculus & Analytic Geom-1', 'AUD', 'FRIDAY', '2nd', '09:00-10:30', 'ma101chemcalculusanalyticgeom1FRIDAY2ndAUD09:00-10:30', 0, 1),
(2031, 'CH-192(Chem)Chemistry-II Lab', 'CHL', 'FRIDAY', '2nd', '10:40-12:10', 'ch192chemchemistryiilabFRIDAY2ndCHL10:40-12:10', 0, 1),
(2032, 'CS-105(C.Sc.)Problems Solving & Prog. ', 'CSL', 'FRIDAY', '2nd', '09:00-10:30', 'cs105cscproblemssolvingprogFRIDAY2ndCSL09:00-10:30', 0, 1),
(2033, 'CS-121(C.Sc.) Object Oriented Prog.', 'LT-1', 'FRIDAY', '2nd', '09:00-10:30', 'cs121cscobjectorientedprogFRIDAY2ndLT-109:00-10:30', 0, 1),
(2034, 'PH-103 (C.Sc.) Electricity, Mag. & Therm. Phy.', 'G.1', 'FRIDAY', '2nd', '14:20-15:50', 'ph103cscelectricitymagthermphyFRIDAY2ndG.114:20-15:50', 0, 1),
(2035, 'CS-121(Elect.)Object Oriented Prog.', 'F-3', 'FRIDAY', '2nd', '09:00-10:30', 'cs121electobjectorientedprogFRIDAY2ndF-309:00-10:30', 0, 1),
(2036, 'ST-101 (Math)Probability & Statistics', 'F-2', 'FRIDAY', '2nd', '09:00-10:30', 'st101mathprobabilitystatisticsFRIDAY2ndF-209:00-10:30', 0, 1),
(2037, 'IS-101(Math)Islamic Studies ', 'F-3', 'FRIDAY', '2nd', '10:40-12:10', 'is101mathislamicstudiesFRIDAY2ndF-310:40-12:10', 0, 1),
(2038, 'ET-101Non M)', 'F-3', 'FRIDAY', '2nd', '10:40-12:10', 'et101nonmFRIDAY2ndF-310:40-12:10', 0, 1),
(2039, 'PH-104 (Phys)Waves & Optics', 'F-4', 'FRIDAY', '2nd', '09:00-10:30', 'ph104physwavesopticsFRIDAY2ndF-409:00-10:30', 0, 1),
(2040, 'PH-194 (Phys)Waves & Optics Lab.', 'PHL', 'FRIDAY', '2nd', '10:40-12:10', 'ph194physwavesopticslabFRIDAY2ndPHL10:40-12:10', 0, 1),
(2041, 'EN-102 (Phys)Functional English II.', 'F-4', 'FRIDAY', '2nd', '14:20-15:50', 'en102physfunctionalenglishiiFRIDAY2ndF-414:20-15:50', 0, 1),
(2042, 'ST-101 (C.Sc.)Probability and Statistics', 'LT-3', 'FRIDAY', '4th', '09:00-10:30', 'st101cscprobabilityandstatisticsFRIDAY4thLT-309:00-10:30', 0, 1),
(2043, 'EC-201(C.Sc.)Economics (6th )', 'G-1', 'FRIDAY', '4th', '10:40-12:10', 'ec201csceconomics6thFRIDAY4thG-110:40-12:10', 0, 1),
(2044, 'EL-221(Elect.)Digital Logic & comp. Architect Lab ', 'G-2', 'FRIDAY', '4th', '09:00-10:30', 'el221electdigitallogiccomparchitectlabFRIDAY4thG-209:00-10:30', 0, 1),
(2045, ' EL-201 (Elect.)Economics 6th', 'G-2', 'FRIDAY', '4th', '09:00-10:30', 'el201electeconomics6thFRIDAY4thG-209:00-10:30', 0, 1),
(2046, 'MA-205(Elect.)Differential Equation & Lin. A.', 'F-3', 'FRIDAY', '4th', '14:20-15:50', 'ma205electdifferentialequationlinaFRIDAY4thF-314:20-15:50', 0, 1),
(2047, 'MA-204 (Math)Introduction to Group &Top.', 'G-1', 'FRIDAY', '4th', '09:00-10:30', 'ma204mathintroductiontogrouptopFRIDAY4thG-109:00-10:30', 0, 1),
(2048, 'CS-111 (Math)Programming', 'CSL', 'FRIDAY', '4th', '10:40-12:10', 'cs111mathprogrammingFRIDAY4thCSL10:40-12:10', 0, 1),
(2049, 'MA-205 (Phys)Differential Equation & L. Alg.', 'LT-1', 'FRIDAY', '4th', '09:00-10:30', 'ma205physdifferentialequationlalgFRIDAY4thLT-109:00-10:30', 0, 1),
(2050, 'ST-204 (Stat)Official Statistics', 'LT-2', 'FRIDAY', '4th', '10:40-12:10', 'st204statofficialstatisticsFRIDAY4thLT-210:40-12:10', 0, 1),
(2051, 'PH-193(Chem)Electricity, Mag. & Therm.Phy. Lab', 'AUD', 'TUESDAY', '2nd', '10:40-12:10', 'ph193chemelectricitymagthermphylabTUESDAY2ndAUD10:40-12:10', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `User_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(32) NOT NULL,
  `Type` int(1) NOT NULL COMMENT '1: Admin, 2: Teacher, 3: Student',
  `Reg_Id` varchar(11) NOT NULL,
  `Semester_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`User_Id`),
  KEY `Semester_Id` (`Semester_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=208 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`User_Id`, `Username`, `Password`, `Type`, `Reg_Id`, `Semester_Id`) VALUES
(1, 'sikandar1', '55fbdd7f1be43551aeac74cd6a9051a1', 1, '1071511011', NULL),
(2, 'sikandar2', '46a9a68aaa136f713bbe3b18a321ba05', 2, '1071511022', NULL),
(3, 'sikandar3', '38b1e0c0162b6ff97d91a9773134415e', 3, '1071511033', 2),
(151, 'HIFZA_177', 'dc53a6be4836e8b96c262702c7974b8e', 3, '4071613001', 2),
(152, 'UMAIRA230', '0a0c272082b4b155ebd6e720181f03fa', 3, '4071613002', 2),
(153, 'MARYAM223', '019c08c1b98218fa6856b94f9554401b', 3, '4071613003', 2),
(154, 'KHAN_A86', '2b9c1e5080136e747b8b4a08cfd68f58', 3, '4071613004', 2),
(155, 'AIMAL_495', '3db90b83db50b00cbbb03f136bbc9747', 3, '4071613005', 2),
(156, 'SITWAT720', 'd0df1bdde1dbb7b6ac2df9d9f0e7b7a0', 3, '4071613006', 2),
(157, 'MUHAMM395', '9b67286a9983c816eccb799479ba35a3', 3, '4071613007', 2),
(158, 'SEHER_955', '5ce8f9d9e416258ae0c7a41b1ae4bc7b', 3, '4071613008', 2),
(159, 'ALIZAÂ914', '44dd5d3fb40d6575cbf31fbdcd6e4d61', 3, '4071613009', 2),
(160, 'ANAM_I488', '2fdc5c686d7e638db33b8092d6389201', 3, '4071613010', 2),
(161, 'FAIZAN939', '44abe6aaec13d161d7f2454b50094c1c', 3, '4071613011', 2),
(162, 'AMNA_R484', '517dc9b25b754ed7b3dcb2d0e9a7cddd', 3, '4071613012', 2),
(163, 'IBRAR_451', '796b8953947ba1a7274e7f64a6ddbd50', 3, '4071613013', 2),
(164, 'MAHNOO942', '270a78c9ee82a6e893eb6c6eec807bb4', 3, '4071613014', 2),
(165, 'ABDULL975', '0c10c35b934330995b2fd835a0b4e668', 3, '4071613015', 2),
(166, 'HAMZA_924', '5ab69c239ca8cd6c06ac71bcbf91a8f7', 3, '4071613016', 2),
(167, 'SADIA_848', '0101862b4478b50c4aa89d70f900e52d', 3, '4071613017', 2),
(168, 'HAMZA_122', '19036b2da7359ea8f14fd9a79ea67a86', 3, '4071613018', 2),
(169, 'ANEES_830', 'ece47d615b4989a6d33c563bbedb8305', 3, '4071613019', 2),
(170, 'MARYEM392', '7fa259b3d928bac73d876c157b851f90', 3, '4071613020', 2),
(171, 'MUHAMM913', '452f33565c768d0d3c848b2b63de165c', 3, '4071613021', 2),
(172, 'AMNA_S348', '4fa78a1a7d3a275fed71d7ace5838c9b', 3, '4071613022', 2),
(173, 'MUHAMM234', '28dcb1c8488568f10b2acd50cb84f5f9', 3, '4071613023', 2),
(174, 'URWAH_805', 'baea4309ffcf22d9d4588a82c3dc64a0', 3, '4071613024', 2),
(175, 'KHUZAM541', 'c1624bf3c2aaf4af5a1d790d44b1040e', 3, '4071613025', 2),
(176, 'TALAHA885', '021f72de327b1a9aff1c94b3a70b0ea1', 3, '4071613026', 2),
(177, 'ASMA_A534', '68e9e4de66450f863220b8c8c607ab15', 3, '4071613027', 2),
(178, 'SONAIN667', 'cb31a805a4ddcc3c7ec18cf1b427801e', 3, '4071613028', 2),
(179, 'MUHAMM951', 'cd9b9f14e301d4caa35aae9c0e5e0dd3', 3, '4071613029', 2),
(180, 'ZOYA_K947', '12e2ebd674b13c1df819f39550c22216', 3, '4071613030', 2),
(181, 'TABIB_851', '06f74899de4d03092cb99f651d3d773e', 3, '4071613031', 2),
(182, 'MUHAMM959', '617643f1e2ce74cacfe772582a3fd1d0', 3, '4071613032', 2),
(183, 'MUHAMM402', '873c2dd437948d7775064ee5add61b2d', 3, '4071613033', 2),
(184, 'FIZZA_913', '8d82e426974be06f509466f3a5a6490c', 3, '4071613034', 2),
(185, 'MUHAMM986', '65001b45db646471f6c91c9105e065ee', 3, '4071613035', 2),
(186, 'HAMZA_793', 'd3de49f4aa5c101dd3e8afddbe35a2e2', 3, '4071613037', 2),
(187, 'ARSLAN816', '3b0e00db8441dfe1dfaf505b73870962', 3, '4071613038', 2),
(188, 'MIAN_A721', '4867ac49229016d5f020715238515fe6', 3, '4071613039', 2),
(189, 'TALHA_137', '0c872b4842666fb8317bb753d632fadd', 3, '4071613040', 2),
(190, 'USMAN_952', '75cb9bef16125b192a72a18ce5e66244', 3, '4071613041', 2),
(191, 'AHMAD_720', '309cb141b519fbfc9d4dfbf753ca06b4', 3, '4071613042', 2),
(192, 'EHTISH335', '5af858b0afabcc0a393f2d679ef818c2', 3, '4071613043', 2),
(193, 'ALI_HA47', '199911a0bd8282926553c35aa6dfef4d', 3, '4071613044', 2),
(194, 'ABDUL_31', '28e51c19ac378c1d575d81c06ff326c2', 3, '4071613045', 2),
(195, 'AFRASI979', '997da0da2e4895b45e36e6f66941d0f7', 3, '4071613046', 2),
(196, 'GHULAM427', 'cd7f7fb9f6adc9d4457e6bef0a69d8af', 3, '4071613047', 2),
(197, 'MUHAMM618', 'c38622fe48e23c505f1650ce806e0cb9', 3, '4071613048', 2),
(198, 'MUHAMM725', '38c86e6aaa790c08d295f47640a1e947', 3, '4071613049', 2),
(199, 'ZAHABI555', '2d6cffd6ece84351f3e223ea6054e315', 3, '4071613050', 2),
(200, 'AREEFA487', '13d4d0a3d25e0c8f668b21670ef77915', 3, '4071613052', 2),
(201, 'SHAFQA98', '495ebb061ff7344226c3944cba86b78f', 3, '4071613053', 2),
(202, 'JAMSHE206', 'e094b1c9208f77971b303d09025acadb', 3, '4071613054', 2),
(203, 'TAIMOO110', '1f62ab2d496b1f649d6c96b86f2ac7b6', 3, '4071613055', 2),
(204, 'MUZAMI245', '17dcbf15cfe1d2ac82d8ca92d12ef3d6', 3, '4071613058', 2),
(205, 'AQIB_R736', '70fd93cbe6090474f19cd7e2ce33f065', 3, '4071613059', 2),
(206, 'KHALIL599', '8b41189501391bb93fd7f73025f57451', 3, '4071613061', 2),
(207, 'SHAKIR866', '85af5239bd26f53cfb3d6617b69d6ea4', 3, '4071613062', 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`Semester_Id`) REFERENCES `semester` (`Semester_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `enrolled_courses`
--
ALTER TABLE `enrolled_courses`
  ADD CONSTRAINT `enrolled_courses_ibfk_4` FOREIGN KEY (`User_Id`) REFERENCES `users` (`User_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enrolled_courses_ibfk_3` FOREIGN KEY (`Course_Id`) REFERENCES `courses` (`Course_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_3` FOREIGN KEY (`User_Id`) REFERENCES `users` (`User_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `notification_statics` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `notification_statics`
--
ALTER TABLE `notification_statics`
  ADD CONSTRAINT `notification_statics_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`User_Id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `users` (`User_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `security_keys`
--
ALTER TABLE `security_keys`
  ADD CONSTRAINT `security_keys_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`User_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `semester`
--
ALTER TABLE `semester`
  ADD CONSTRAINT `semester_ibfk_1` FOREIGN KEY (`Dept_Id`) REFERENCES `department` (`Dept_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`Semester_Id`) REFERENCES `semester` (`Semester_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
