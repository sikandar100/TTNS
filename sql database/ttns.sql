-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2017 at 01:07 PM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ttns`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `Course_Id` int(11) NOT NULL,
  `Course_Code` varchar(10) NOT NULL,
  `Course_Title` varchar(45) NOT NULL,
  `Credit` int(11) NOT NULL,
  `Semester_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `department` (
  `Dept_Id` int(11) NOT NULL,
  `Dept_Name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Dept_Id`, `Dept_Name`) VALUES
(1, 'Computer Science'),
(2, 'Physics'),
(3, 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `enrolled_courses`
--

CREATE TABLE `enrolled_courses` (
  `id` int(10) UNSIGNED NOT NULL,
  `Course_Id` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enrolled_courses`
--

INSERT INTO `enrolled_courses` (`id`, `Course_Id`, `User_Id`) VALUES
(1, 2, 67),
(2, 3, 67),
(3, 1, 67),
(4, 4, 67),
(5, 6, 67),
(6, 23, 67),
(7, 5, 67),
(8, 2, 68),
(9, 3, 68),
(10, 1, 68),
(11, 4, 68),
(12, 12, 68),
(13, 23, 68),
(14, 5, 68);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `Notif_Id` int(11) NOT NULL,
  `Msg` varchar(100) NOT NULL,
  `Checkpoint` tinyint(1) NOT NULL COMMENT '1: Unread, 0: read',
  `User_Id` int(11) NOT NULL,
  `p_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`Notif_Id`, `Msg`, `Checkpoint`, `User_Id`, `p_id`) VALUES
(7, 'Course \'PH-193\' is updated. Check the time table.', 1, 67, NULL),
(8, 'Course \'PH-193\' is updated. Check the time table.', 1, 68, NULL),
(15, 'daosdhalsjl', 0, 67, 5),
(16, 'daosdhalsjl', 0, 68, 5);

-- --------------------------------------------------------

--
-- Table structure for table `notification_statics`
--

CREATE TABLE `notification_statics` (
  `id` int(10) UNSIGNED NOT NULL,
  `notification_type` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1: system Notification, 2: Teacher Notification',
  `course` varchar(512) NOT NULL DEFAULT 'ALL',
  `sender_id` int(11) DEFAULT NULL,
  `sent_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notification_statics`
--

INSERT INTO `notification_statics` (`id`, `notification_type`, `course`, `sender_id`, `sent_date`) VALUES
(5, 2, 'physics Lab (PH-193)', 2, '2017-06-16 13:32:06');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `Profile_Id` int(11) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Address` varchar(40) NOT NULL,
  `ContactNo` varchar(11) NOT NULL,
  `Email` varchar(25) NOT NULL,
  `User_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`Profile_Id`, `Fname`, `Lname`, `Address`, `ContactNo`, `Email`, `User_Id`) VALUES
(1, 'siki', 'sani', 'islamabadian', '03457677996', 'ch.sikandar996@gmail.com', 3);

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `Semester_Id` int(11) NOT NULL,
  `Semester_Name` varchar(10) NOT NULL,
  `Dept_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `timetable` (
  `id` int(10) UNSIGNED NOT NULL,
  `course` varchar(160) NOT NULL,
  `room` varchar(16) NOT NULL,
  `day` varchar(10) NOT NULL,
  `semester` varchar(3) NOT NULL,
  `time` varchar(12) NOT NULL,
  `cstring` varchar(160) NOT NULL,
  `notification` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '1: Send Notification, 0: No Notification',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1: Keep, 2: Delete'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `users` (
  `User_Id` int(11) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Type` int(1) NOT NULL COMMENT '1: Admin, 2: Teacher, 3: Student',
  `Reg_Id` varchar(11) NOT NULL,
  `Semester_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`User_Id`, `Username`, `Password`, `Type`, `Reg_Id`, `Semester_Id`) VALUES
(1, 'sikandar1', 'sikandar1', 1, '01071511011', NULL),
(2, 'sikandar2', 'sikandar2', 2, '01071511022', NULL),
(3, 'sikandar3', 'sikandar3', 3, '01071511033', 2),
(67, 'HIFZA_736', 'HIFZA_736', 3, '04071613001', 2),
(68, 'UMAIRA418', 'UMAIRA418', 3, '04071613002', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`Course_Id`),
  ADD KEY `Semester_Id` (`Semester_Id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Dept_Id`);

--
-- Indexes for table `enrolled_courses`
--
ALTER TABLE `enrolled_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Course_Id` (`Course_Id`),
  ADD KEY `User_Id` (`User_Id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`Notif_Id`),
  ADD KEY `User_Id` (`User_Id`),
  ADD KEY `notification_ibfk_2` (`p_id`);

--
-- Indexes for table `notification_statics`
--
ALTER TABLE `notification_statics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`Profile_Id`),
  ADD KEY `User_Id` (`User_Id`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`Semester_Id`),
  ADD KEY `Dept_Id` (`Dept_Id`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_Id`),
  ADD KEY `Semester_Id` (`Semester_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `Course_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `Dept_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `enrolled_courses`
--
ALTER TABLE `enrolled_courses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `Notif_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `notification_statics`
--
ALTER TABLE `notification_statics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `Profile_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
  MODIFY `Semester_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2052;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `User_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
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
  ADD CONSTRAINT `enrolled_courses_ibfk_1` FOREIGN KEY (`Course_Id`) REFERENCES `courses` (`Course_Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `enrolled_courses_ibfk_2` FOREIGN KEY (`User_Id`) REFERENCES `users` (`User_Id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `users` (`User_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
-- Constraints for table `semester`
--
ALTER TABLE `semester`
  ADD CONSTRAINT `semester_ibfk_1` FOREIGN KEY (`Dept_Id`) REFERENCES `department` (`Dept_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`Semester_Id`) REFERENCES `semester` (`Semester_Id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
