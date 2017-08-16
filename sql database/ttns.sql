-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2017 at 03:56 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `Notif_Id` int(11) NOT NULL,
  `Msg` varchar(100) NOT NULL,
  `Checkpoint` tinyint(1) NOT NULL COMMENT '1: Unread, 0: read',
  `User_Id` int(11) NOT NULL,
  `p_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Teacher id on custom change in timetable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`Notif_Id`, `Msg`, `Checkpoint`, `User_Id`, `p_id`) VALUES
(1, 'A New Time Table is uploaded', 1, 3, NULL),
(2, 'A New Time Table is uploaded', 1, 65, NULL),
(3, 'A New Time Table is uploaded', 1, 66, NULL);

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
(1, 'Sikandar', 'Waheed', 'amin park Jaranwala', '03047962549', 'sikandar00@outlook.com', 3);

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
(1643, 'CS-102 (Chem)- Introduction to Programming', 'LT-3', 'MONDAY', '2nd', '09:00-10:30', 'cs102chemintroductiontoprogrammingMONDAY2ndLT-309:00-10:30', 0, 1),
(1644, 'PH-103(Chem)-Electricity, Mag.& Therm. Ph.', 'F-5', 'MONDAY', '2nd', '12:40-14:10', 'ph103chemelectricitymagthermphMONDAY2ndF-512:40-14:10', 0, 1),
(1645, 'EN-102(Chem) Functional English II.', 'LT-1', 'MONDAY', '2nd', '14:20-15:50', 'en102chemfunctionalenglishiiMONDAY2ndLT-114:20-15:50', 0, 1),
(1646, 'MA-203(C.Sc.) Discrete Mathematics', 'F-1', 'MONDAY', '2nd', '09:00-10:30', 'ma203cscdiscretemathematicsMONDAY2ndF-109:00-10:30', 0, 1),
(1647, 'PH-193(C.Sc.)Electricity, Mag.& Therm Phy.Lab.', 'PHL', 'MONDAY', '2nd', '10:40-12:10', 'ph193cscelectricitymagthermphylabMONDAY2ndPHL10:40-12:10', 0, 1),
(1648, 'IS-101(C.Sc.)-Islamic Studies', 'F-1', 'MONDAY', '2nd', '12:40-14:10', 'is101cscislamicstudiesMONDAY2ndF-112:40-14:10', 0, 1),
(1649, 'MA-102 (E.Sc.)Calculus & Anal. Geom-II.', 'AUD', 'MONDAY', '2nd', '09:00-10:30', 'ma102esccalculusanalgeomiiMONDAY2ndAUD09:00-10:30', 0, 1),
(1650, 'CS-102(E.Sc.)Introduction to Programming', 'AUD', 'MONDAY', '2nd', '10:40-12:10', 'cs102escintroductiontoprogrammingMONDAY2ndAUD10:40-12:10', 0, 1),
(1651, 'PH-103 (E.Sc.)Electricity, Mag & Thermal Phy.', 'AUD', 'MONDAY', '2nd', '12:40-14:10', 'ph103escelectricitymagthermalphyMONDAY2ndAUD12:40-14:10', 0, 1),
(1652, 'EN-102(E.Sc.)- Functional English', 'AUD', 'MONDAY', '2nd', '14:20-15:50', 'en102escfunctionalenglishMONDAY2ndAUD14:20-15:50', 0, 1),
(1653, 'PH-103 (Elect.)Electricity, Mag & Therml Phy.', 'F-2', 'MONDAY', '2nd', '09:00-10:30', 'ph103electelectricitymagthermlphyMONDAY2ndF-209:00-10:30', 0, 1),
(1654, 'EN-102(Elect.)Functional English II.', 'F-2', 'MONDAY', '2nd', '10:40-12:10', 'en102electfunctionalenglishiiMONDAY2ndF-210:40-12:10', 0, 1),
(1655, 'PH-193 (Elect.)Electricity, Mag.& Therm Phy.Lab.', 'PHL', 'MONDAY', '2nd', '12:40-14:10', 'ph193electelectricitymagthermphylabMONDAY2ndPHL12:40-14:10', 0, 1),
(1656, 'EN-102(I.T.)Functional English II.', 'F-3', 'MONDAY', '2nd', '09:00-10:30', 'en102itfunctionalenglishiiMONDAY2ndF-309:00-10:30', 0, 1),
(1657, 'PH-103 (I.T.)Electricity, Mag & Thermal Phy.', 'F-3', 'MONDAY', '2nd', '10:40-12:10', 'ph103itelectricitymagthermalphyMONDAY2ndF-310:40-12:10', 0, 1),
(1658, 'IT-101 (I.T.)Fundamental of Inf. Tech.', 'F-2', 'MONDAY', '2nd', '12:40-14:10', 'it101itfundamentalofinftechMONDAY2ndF-212:40-14:10', 0, 1),
(1659, 'MA-102(Math)Calculus & Anal. Geom-II.', 'LT-1', 'MONDAY', '2nd', '09:00-10:30', 'ma102mathcalculusanalgeomiiMONDAY2ndLT-109:00-10:30', 0, 1),
(1660, 'PY-101(Math)Introduction to Psychology', 'F-1', 'MONDAY', '2nd', '10:40-12:10', 'py101mathintroductiontopsychologyMONDAY2ndF-110:40-12:10', 0, 1),
(1661, 'EN-102(Math)Functional English II.', 'F-3', 'MONDAY', '2nd', '12:40-14:10', 'en102mathfunctionalenglishiiMONDAY2ndF-312:40-14:10', 0, 1),
(1662, 'IS-101(Phys)Islamic Studies', 'F-4', 'MONDAY', '2nd', '09:00-10:30', 'is101physislamicstudiesMONDAY2ndF-409:00-10:30', 0, 1),
(1663, 'MA-102(Phys)Calculus & Analytic Geometry-II.', 'F-4', 'MONDAY', '2nd', '10:40-12:10', 'ma102physcalculusanalyticgeometryiiMONDAY2ndF-410:40-12:10', 0, 1),
(1664, 'CS-102 (Phys)Introduction to Programming', 'F-4', 'MONDAY', '2nd', '12:40-14:10', 'cs102physintroductiontoprogrammingMONDAY2ndF-412:40-14:10', 0, 1),
(1665, 'MA-102(Stat) Calculus & Anal. Geometry II.', 'F-6', 'MONDAY', '2nd', '09:00-10:30', 'ma102statcalculusanalgeometryiiMONDAY2ndF-609:00-10:30', 0, 1),
(1666, 'EN-102(Stat)Functional English II.', 'F-6', 'MONDAY', '2nd', '10:40-12:10', 'en102statfunctionalenglishiiMONDAY2ndF-610:40-12:10', 0, 1),
(1667, 'ST-102(Stat)Basic Statistical Inference', 'F-6', 'MONDAY', '2nd', '12:40-14:10', 'st102statbasicstatisticalinferenceMONDAY2ndF-612:40-14:10', 0, 1),
(1668, 'CS-102 (Stat)Introduction to Programming', 'F-2', 'MONDAY', '2nd', '14:20-15:50', 'cs102statintroductiontoprogrammingMONDAY2ndF-214:20-15:50', 0, 1),
(1669, 'ES-202(Chem)Geo-Tectonics', 'LT-02', 'MONDAY', '4th', '09:00-10:30', 'es202chemgeotectonicsMONDAY4thLT-0209:00-10:30', 0, 1),
(1670, 'PY-101(Chem.)Introduction to Psychology', 'LT-2', 'MONDAY', '4th', '14:20-15:50', 'py101chemintroductiontopsychologyMONDAY4thLT-214:20-15:50', 0, 1),
(1671, 'CS-225(C.Sc.) Database Systems.', 'CSL', 'MONDAY', '4th', '09:00-10:30', 'cs225cscdatabasesystemsMONDAY4thCSL09:00-10:30', 0, 1),
(1672, 'CS-222 (C.Sc) ', 'CSL', 'MONDAY', '4th', '10:40-12:10', 'cs222cscMONDAY4thCSL10:40-12:10', 0, 1),
(1673, ' Ec.201(6th )Analysis & Design for Soft. Sys.', 'CSL', 'MONDAY', '4th', '10:40-12:10', 'ec2016thanalysisdesignforsoftsysMONDAY4thCSL10:40-12:10', 0, 1),
(1674, 'CS-213(C.Sc.)Computer Org. & A. Lang.', 'CSL', 'MONDAY', '4th', '12:40-14:10', 'cs213csccomputerorgalangMONDAY4thCSL12:40-14:10', 0, 1),
(1675, 'CH-100(C.Sc.)General Chemistry.', 'F-5', 'MONDAY', '4th', '14:20-15:50', 'ch100cscgeneralchemistryMONDAY4thF-514:20-15:50', 0, 1),
(1676, 'MA-205 (E.Sc.)ESDifferential Equation & Linear A.', 'LT-1', 'MONDAY', '4th', '10:40-12:10', 'ma205escesdifferentialequationlinearaMONDAY4thLT-110:40-12:10', 0, 1),
(1677, 'BY-201(E.Sc.) Introductory Biology', 'LT-1', 'MONDAY', '4th', '12:40-14:10', 'by201escintroductorybiologyMONDAY4thLT-112:40-14:10', 0, 1),
(1678, 'EL-281(Elect.)Signals and Systems', 'LT-2', 'MONDAY', '4th', '10:40-12:10', 'el281electsignalsandsystemsMONDAY4thLT-210:40-12:10', 0, 1),
(1679, 'EL-202(Elect.)Probability, Statistics & R. Vr', 'G-1', 'MONDAY', '4th', '14:20-15:50', 'el202electprobabilitystatisticsrvrMONDAY4thG-114:20-15:50', 0, 1),
(1680, 'IT-202 (I.T.) Data Structure', 'F-5', 'MONDAY', '4th', '09:00-10:30', 'it202itdatastructureMONDAY4thF-509:00-10:30', 0, 1),
(1681, 'MA-205(I.T.) Differential Equation & Linear A', 'G-1', 'MONDAY', '4th', '10:40-12:10', 'ma205itdifferentialequationlinearaMONDAY4thG-110:40-12:10', 0, 1),
(1682, 'IT-232(I.T.) Database Systems', 'G-1', 'MONDAY', '4th', '12:40-14:10', 'it232itdatabasesystemsMONDAY4thG-112:40-14:10', 0, 1),
(1683, 'MA-203 (Math)Discrete Mathematics', 'G-2', 'MONDAY', '4th', '10:40-12:10', 'ma203mathdiscretemathematicsMONDAY4thG-210:40-12:10', 0, 1),
(1684, 'EC-201 (Math)Economics', 'G-2', 'MONDAY', '4th', '14:20-15:50', 'ec201matheconomicsMONDAY4thG-214:20-15:50', 0, 1),
(1685, 'PH-202 (Phys)- Modern Physics', 'G-1', 'MONDAY', '4th', '09:00-10:30', 'ph202physmodernphysicsMONDAY4thG-109:00-10:30', 0, 1),
(1686, 'PH-203 (Phys) Thermal and Statistical Physics', 'LT-3', 'MONDAY', '4th', '10:40-12:10', 'ph203physthermalandstatisticalphysicsMONDAY4thLT-310:40-12:10', 0, 1),
(1687, 'ST-203 (Stat) Bio-Statistics', 'G-2', 'MONDAY', '4th', '09:00-10:30', 'st203statbiostatisticsMONDAY4thG-209:00-10:30', 0, 1),
(1688, 'MA-205 (Stat)Differential Equation & L. A.', 'F-5', 'MONDAY', '4th', '10:40-12:10', 'ma205statdifferentialequationlaMONDAY4thF-510:40-12:10', 0, 1),
(1689, 'EC-201(Stat) Economics', 'G-2', 'MONDAY', '4th', '12:40-14:10', 'ec201stateconomicsMONDAY4thG-212:40-14:10', 0, 1),
(1690, 'PY-101(Stat)Introduction to Psychology', 'LT-3', 'MONDAY', '4th', '14:20-15:50', 'py101statintroductiontopsychologyMONDAY4thLT-314:20-15:50', 0, 1),
(1691, 'PH-103 (Chem)Electricity, Mag. & Thermal P', 'F-5', 'TUESDAY', '2nd', '09:00-10:30', 'ph103chemelectricitymagthermalpTUESDAY2ndF-509:00-10:30', 0, 1),
(1692, 'PH-193(Chem)Electricity, Mag. & Therm.Phy. Lab', 'PHL', 'TUESDAY', '2nd', '10:40-12:10', 'ph193chemelectricitymagthermphylabTUESDAY2ndPHL10:40-12:10', 0, 1),
(1693, 'EN-102 (Chem.)Functional English II.', 'F-5', 'TUESDAY', '2nd', '14:20-15:50', 'en102chemfunctionalenglishiiTUESDAY2ndF-514:20-15:50', 0, 1),
(1694, 'CS-121(C.Sc.)Object Oriented Programming', 'CSL', 'TUESDAY', '2nd', '10:40-12:10', 'cs121cscobjectorientedprogrammingTUESDAY2ndCSL10:40-12:10', 0, 1),
(1695, 'MA-102(C.Sc.)Calculus and Analytic Geo.II.', 'F-1', 'TUESDAY', '2nd', '12:40-14:10', 'ma102csccalculusandanalyticgeoiiTUESDAY2ndF-112:40-14:10', 0, 1),
(1696, 'MA-102 (E.Sc.)Calculus & Anal. Geom-II.', 'AUD', 'TUESDAY', '2nd', '09:00-10:30', 'ma102esccalculusanalgeomiiTUESDAY2ndAUD09:00-10:30', 0, 1),
(1697, 'PH-103 (E.Sc.)Electricity, Mag & Thermal Phy.', 'AUD', 'TUESDAY', '2nd', '10:40-12:10', 'ph103escelectricitymagthermalphyTUESDAY2ndAUD10:40-12:10', 0, 1),
(1698, 'ES-102 (E.Sc.) Introduction to Geophysics', 'AUD', 'TUESDAY', '2nd', '12:40-14:10', 'es102escintroductiontogeophysicsTUESDAY2ndAUD12:40-14:10', 0, 1),
(1699, 'EN-102(E.Sc.)Functional English II.', 'AUD', 'TUESDAY', '2nd', '14:20-15:50', 'en102escfunctionalenglishiiTUESDAY2ndAUD14:20-15:50', 0, 1),
(1700, 'MA-102 (Elect.)Calculus & Anal. Geom-II.', 'F-2', 'TUESDAY', '2nd', '09:00-10:30', 'ma102electcalculusanalgeomiiTUESDAY2ndF-209:00-10:30', 0, 1),
(1701, 'PH-103 (Elect.) Electricity, Mag & Thermal Phy.', 'F-2', 'TUESDAY', '2nd', '10:40-12:10', 'ph103electelectricitymagthermalphyTUESDAY2ndF-210:40-12:10', 0, 1),
(1702, 'EN-102(Elect.)Functional English II.', 'F-2', 'TUESDAY', '2nd', '14:20-15:50', 'en102electfunctionalenglishiiTUESDAY2ndF-214:20-15:50', 0, 1),
(1703, 'EN-102(I.T.)Functional English II.', 'F-3', 'TUESDAY', '2nd', '09:00-10:30', 'en102itfunctionalenglishiiTUESDAY2ndF-309:00-10:30', 0, 1),
(1704, 'PH-103 (I.T.)-F-5Electricity, Mag. & Thermal Phy.', 'F-3', 'TUESDAY', '2nd', '10:40-12:10', 'ph103itf5electricitymagthermalphyTUESDAY2ndF-310:40-12:10', 0, 1),
(1705, 'PH-193(I.T.)Electricity, Mag. & Therml Phy.Lab.', 'PHL', 'TUESDAY', '2nd', '12:40-14:10', 'ph193itelectricitymagthermlphylabTUESDAY2ndPHL12:40-14:10', 0, 1),
(1706, 'PH-104 (Math)Waves & Optics', 'G-1', 'TUESDAY', '2nd', '10:40-12:10', 'ph104mathwavesopticsTUESDAY2ndG-110:40-12:10', 0, 1),
(1707, 'PY-101(Math)Introduction to Psychology', 'F-4', 'TUESDAY', '2nd', '12:40-14:10', 'py101mathintroductiontopsychologyTUESDAY2ndF-412:40-14:10', 0, 1),
(1708, 'CH-102(Phys) Chemistry-II', 'F-6', 'TUESDAY', '2nd', '09:00-10:30', 'ch102physchemistryiiTUESDAY2ndF-609:00-10:30', 0, 1),
(1709, 'CH-192(Phys)Chemistry-I Lab', 'CHL', 'TUESDAY', '2nd', '10:40-12:10', 'ch192physchemistryilabTUESDAY2ndCHL10:40-12:10', 0, 1),
(1710, 'MA-102(Phys) Calculus & Ana G. .II.', 'F-3', 'TUESDAY', '2nd', '14:20-15:50', 'ma102physcalculusanagiiTUESDAY2ndF-314:20-15:50', 0, 1),
(1711, 'MA-102(Stat)Calculus & Anal. Geometry-II.', 'F-1', 'TUESDAY', '2nd', '10:40-12:10', 'ma102statcalculusanalgeometryiiTUESDAY2ndF-110:40-12:10', 0, 1),
(1712, 'IS-101(Stat)Islamic Studies', 'F-3', 'TUESDAY', '2nd', '12:40-14:10', 'is101statislamicstudiesTUESDAY2ndF-312:40-14:10', 0, 1),
(1713, 'EN-102(Stat)Functional English II.', 'F-6', 'TUESDAY', '2nd', '14:20-15:50', 'en102statfunctionalenglishiiTUESDAY2ndF-614:20-15:50', 0, 1),
(1714, 'ES-202(Chem)Geo-Tectonics', 'F-4', 'TUESDAY', '4th', '10:40-12:10', 'es202chemgeotectonicsTUESDAY4thF-410:40-12:10', 0, 1),
(1715, 'PY-101(Chem.)Introduction to Psychology', 'LT-1', 'TUESDAY', '4th', '14:20-15:50', 'py101chemintroductiontopsychologyTUESDAY4thLT-114:20-15:50', 0, 1),
(1716, 'ST-101(C.Sc.)Probability and Statistics', 'LT-1', 'TUESDAY', '4th', '09:00-10:30', 'st101cscprobabilityandstatisticsTUESDAY4thLT-109:00-10:30', 0, 1),
(1717, 'CH-100 (C.Sc.)General Chemistry.', 'F-5', 'TUESDAY', '4th', '10:40-12:10', 'ch100cscgeneralchemistryTUESDAY4thF-510:40-12:10', 0, 1),
(1718, 'CH-190 (C.Sc.)General Chemistry.(Lab.).', 'CHL', 'TUESDAY', '4th', '12:40-14:10', 'ch190cscgeneralchemistrylabTUESDAY4thCHL12:40-14:10', 0, 1),
(1719, 'MA-205 (C.Sc.)Differential Equation & Lin. A.', 'LT-2', 'TUESDAY', '4th', '14:20-15:50', 'ma205cscdifferentialequationlinaTUESDAY4thLT-214:20-15:50', 0, 1),
(1720, 'MA-205 (E.Sc.)Differential Equation & Linear A.', 'LT-3', 'TUESDAY', '4th', '10:40-12:10', 'ma205escdifferentialequationlinearaTUESDAY4thLT-310:40-12:10', 0, 1),
(1721, 'BY-201(E.Sc.)Introductory Biology', 'LT-2', 'TUESDAY', '4th', '12:40-14:10', 'by201escintroductorybiologyTUESDAY4thLT-212:40-14:10', 0, 1),
(1722, 'BY-201(Elect.)General Chemistry (Lab.).', 'LT-1', 'TUESDAY', '4th', '12:40-14:10', 'by201electgeneralchemistrylabTUESDAY4thLT-112:40-14:10', 0, 1),
(1723, 'MA-205 (Elect.)Differential Equation & L. A.', 'F-1', 'TUESDAY', '4th', '14:20-15:50', 'ma205electdifferentialequationlaTUESDAY4thF-114:20-15:50', 0, 1),
(1724, 'ES-101 (I.T.)Introduction to Geology', 'G-1', 'TUESDAY', '4th', '09:00-10:30', 'es101itintroductiontogeologyTUESDAY4thG-109:00-10:30', 0, 1),
(1725, 'IT-202 (I.T.) Data Structure', 'F-6', 'TUESDAY', '4th', '10:40-12:10', 'it202itdatastructureTUESDAY4thF-610:40-12:10', 0, 1),
(1726, 'IT-222 (I.T.) Computer Architecture', 'G-1', 'TUESDAY', '4th', '12:40-14:10', 'it222itcomputerarchitectureTUESDAY4thG-112:40-14:10', 0, 1),
(1727, 'MA-203 (Math)Discrete Mathematics', 'G-2', 'TUESDAY', '4th', '09:00-10:30', 'ma203mathdiscretemathematicsTUESDAY4thG-209:00-10:30', 0, 1),
(1728, 'ST-101 (Math)Probability & Statistics', 'G-2', 'TUESDAY', '4th', '10:40-12:10', 'st101mathprobabilitystatisticsTUESDAY4thG-210:40-12:10', 0, 1),
(1729, 'MA-205 (Math)Differential Equation & Lin. A.', 'LT-3', 'TUESDAY', '4th', '12:40-14:10', 'ma205mathdifferentialequationlinaTUESDAY4thLT-312:40-14:10', 0, 1),
(1730, 'EC-201 (Math)Economics', 'G-1', 'TUESDAY', '4th', '14:20-15:50', 'ec201matheconomicsTUESDAY4thG-114:20-15:50', 0, 1),
(1731, 'MA-205 (Phys)Differential Equation & Linear A.', 'LT-2', 'TUESDAY', '4th', '10:40-12:10', 'ma205physdifferentialequationlinearaTUESDAY4thLT-210:40-12:10', 0, 1),
(1732, 'PY-101 (Phys)Introduction to Psychology', 'LT-3', 'TUESDAY', '4th', '14:20-15:50', 'py101physintroductiontopsychologyTUESDAY4thLT-314:20-15:50', 0, 1),
(1733, 'ST-203 (Stat)Bio-Statistics', 'LT-3', 'TUESDAY', '4th', '09:00-10:30', 'st203statbiostatisticsTUESDAY4thLT-309:00-10:30', 0, 1),
(1734, 'MA-205 (Stat)Differential Equation & L. A.', 'LT-1', 'TUESDAY', '4th', '10:40-12:10', 'ma205statdifferentialequationlaTUESDAY4thLT-110:40-12:10', 0, 1),
(1735, 'PY-101 (Stat)Introduction to Psychology', 'G-2', 'TUESDAY', '4th', '12:40-14:10', 'py101statintroductiontopsychologyTUESDAY4thG-212:40-14:10', 0, 1),
(1736, 'EC-201(Stat)Economics', 'G-2', 'TUESDAY', '4th', '14:20-15:50', 'ec201stateconomicsTUESDAY4thG-214:20-15:50', 0, 1),
(1737, 'CS-102 (Chem)Introduction to Programming', 'CSL', 'WEDNESDAY', '2nd', '09:00-10:30', 'cs102chemintroductiontoprogrammingWEDNESDAY2ndCSL09:00-10:30', 0, 1),
(1738, 'IS-101(Chem)Islamic Studies', 'AUD', 'WEDNESDAY', '2nd', '12:40-14:10', 'is101chemislamicstudiesWEDNESDAY2ndAUD12:40-14:10', 0, 1),
(1739, 'CH-102(Chem) Chemistry-II', 'F-2', 'WEDNESDAY', '2nd', '14:20-15:50', 'ch102chemchemistryiiWEDNESDAY2ndF-214:20-15:50', 0, 1),
(1740, 'MA-203 (C.Sc.)Discrete Mathematics', 'F-1', 'WEDNESDAY', '2nd', '09:00-10:30', 'ma203cscdiscretemathematicsWEDNESDAY2ndF-109:00-10:30', 0, 1),
(1741, 'EN-102 (C.Sc.)Functional English II.', 'F-1', 'WEDNESDAY', '2nd', '10:40-12:10', 'en102cscfunctionalenglishiiWEDNESDAY2ndF-110:40-12:10', 0, 1),
(1742, 'MA-102(C.Sc.)Calculus and Analytic Geo-II.', 'F-1', 'WEDNESDAY', '2nd', '12:40-14:10', 'ma102csccalculusandanalyticgeoiiWEDNESDAY2ndF-112:40-14:10', 0, 1),
(1743, 'IS-101(C.Sc.)Islamic Studies', 'F-1', 'WEDNESDAY', '2nd', '14:20-15:50', 'is101cscislamicstudiesWEDNESDAY2ndF-114:20-15:50', 0, 1),
(1744, 'IS-101(E.Sc.) Islamic Studies', 'AUD', 'WEDNESDAY', '2nd', '09:00-10:30', 'is101escislamicstudiesWEDNESDAY2ndAUD09:00-10:30', 0, 1),
(1745, 'CS-102 (E.Sc.) Introduction to Programming', 'CSL', 'WEDNESDAY', '2nd', '10:40-12:10', 'cs102escintroductiontoprogrammingWEDNESDAY2ndCSL10:40-12:10', 0, 1),
(1746, 'MA-102(Elect.)Calculus & Anal. Geom-II.', 'F-2', 'WEDNESDAY', '2nd', '10:40-12:10', 'ma102electcalculusanalgeomiiWEDNESDAY2ndF-210:40-12:10', 0, 1),
(1747, 'PY-101 (Elect.) Introduction to Psychology', 'F-2', 'WEDNESDAY', '2nd', '12:40-14:10', 'py101electintroductiontopsychologyWEDNESDAY2ndF-212:40-14:10', 0, 1),
(1748, 'IS-101(Elect.)Islamic Studies', 'F-5', 'WEDNESDAY', '2nd', '14:20-15:50', 'is101electislamicstudiesWEDNESDAY2ndF-514:20-15:50', 0, 1),
(1749, 'IT-101 (I.T.)Fundamental of Inf. Tech.', 'F-5', 'WEDNESDAY', '2nd', '09:00-10:30', 'it101itfundamentalofinftechWEDNESDAY2ndF-509:00-10:30', 0, 1),
(1750, 'MA-102(I.T.)-F-5Calculus & Anal. Geom-II..', 'F-5', 'WEDNESDAY', '2nd', '10:40-12:10', 'ma102itf5calculusanalgeomiiWEDNESDAY2ndF-510:40-12:10', 0, 1),
(1751, 'IS-101(I.T.)Islamic Studies', 'F-4', 'WEDNESDAY', '2nd', '12:40-14:10', 'is101itislamicstudiesWEDNESDAY2ndF-412:40-14:10', 0, 1),
(1752, 'PY-101 (I.T.)Introduction to Psychology', 'F-3', 'WEDNESDAY', '2nd', '14:20-15:50', 'py101itintroductiontopsychologyWEDNESDAY2ndF-314:20-15:50', 0, 1),
(1753, 'PH-194 (Math)Waves & Optics Lab.', 'PHL', 'WEDNESDAY', '2nd', '10:40-12:10', 'ph194mathwavesopticslabWEDNESDAY2ndPHL10:40-12:10', 0, 1),
(1754, 'EN-102(Math)Functional English II.', 'F-5', 'WEDNESDAY', '2nd', '12:40-14:10', 'en102mathfunctionalenglishiiWEDNESDAY2ndF-512:40-14:10', 0, 1),
(1755, 'MA-102(Math)-Calculus & Anal. Geom-II.', 'Aud', 'WEDNESDAY', '2nd', '14:20-15:50', 'ma102mathcalculusanalgeomiiWEDNESDAY2ndAud14:20-15:50', 0, 1),
(1756, 'CH-102 (Phys)Chemistry-II', 'F-4', 'WEDNESDAY', '2nd', '09:00-10:30', 'ch102physchemistryiiWEDNESDAY2ndF-409:00-10:30', 0, 1),
(1757, 'MA-102(Phys)Calculus & Anal. Geom-II.', 'F-3', 'WEDNESDAY', '2nd', '10:40-12:10', 'ma102physcalculusanalgeomiiWEDNESDAY2ndF-310:40-12:10', 0, 1),
(1758, 'CS-102 (Phys)Introduction to Prog.', 'CSL', 'WEDNESDAY', '2nd', '12:40-14:10', 'cs102physintroductiontoprogWEDNESDAY2ndCSL12:40-14:10', 0, 1),
(1759, 'EN-102(Phys) Functional English II.', 'F-4', 'WEDNESDAY', '2nd', '14:20-15:50', 'en102physfunctionalenglishiiWEDNESDAY2ndF-414:20-15:50', 0, 1),
(1760, 'ST-102 (Stat)Basic Statistical Inference', 'F-6', 'WEDNESDAY', '2nd', '09:00-10:30', 'st102statbasicstatisticalinferenceWEDNESDAY2ndF-609:00-10:30', 0, 1),
(1761, 'PH-103 (Stat)Electricity, Mag. & Thermal Phy.', 'F-6', 'WEDNESDAY', '2nd', '10:40-12:10', 'ph103statelectricitymagthermalphyWEDNESDAY2ndF-610:40-12:10', 0, 1),
(1762, 'IS-101(Stat)Islamic Studies', 'F-6', 'WEDNESDAY', '2nd', '12:40-14:10', 'is101statislamicstudiesWEDNESDAY2ndF-612:40-14:10', 0, 1),
(1763, 'CS-102 (Stat)Introduction to Programming', 'CSL', 'WEDNESDAY', '2nd', '14:20-15:50', 'cs102statintroductiontoprogrammingWEDNESDAY2ndCSL14:20-15:50', 0, 1),
(1764, 'CH-204 (Chem.) Industrial Chemistry', 'G-2', 'WEDNESDAY', '4th', '09:00-10:30', 'ch204chemindustrialchemistryWEDNESDAY4thG-209:00-10:30', 0, 1),
(1765, 'CH-203 (Chem.)Chemistry-iv', 'LT-2', 'WEDNESDAY', '4th', '12:40-14:10', 'ch203chemchemistryivWEDNESDAY4thLT-212:40-14:10', 0, 1),
(1766, 'BY-201(Chem)Introductory Biology', 'LT-2', 'WEDNESDAY', '4th', '14:20-15:50', 'by201chemintroductorybiologyWEDNESDAY4thLT-214:20-15:50', 0, 1),
(1767, 'CS-225(C.Sc.)Database Systems.', 'LT-1', 'WEDNESDAY', '4th', '09:00-10:30', 'cs225cscdatabasesystemsWEDNESDAY4thLT-109:00-10:30', 0, 1),
(1768, 'CS-222(C.Sc.) ', 'G-2', 'WEDNESDAY', '4th', '10:40-12:10', 'cs222cscWEDNESDAY4thG-210:40-12:10', 0, 1),
(1769, ' Ec.201(6th ) Analysis & Design for Soft.sys.', 'G-2', 'WEDNESDAY', '4th', '10:40-12:10', 'ec2016thanalysisdesignforsoftsysWEDNESDAY4thG-210:40-12:10', 0, 1),
(1770, 'EC-201(C.Sc.)Economics (6th )', 'LT-1-', 'WEDNESDAY', '4th', '12:40-14:10', 'ec201csceconomics6thWEDNESDAY4thLT-1-12:40-14:10', 0, 1),
(1771, 'CS-213(C.Sc.)Computer Org. & Assembly Lang.', 'LT-1', 'WEDNESDAY', '4th', '14:20-15:50', 'cs213csccomputerorgassemblylangWEDNESDAY4thLT-114:20-15:50', 0, 1),
(1772, 'ES-202 (E.Sc.) Geo-Tectonics', 'LT-1', 'WEDNESDAY', '4th', '10:40-12:10', 'es202escgeotectonicsWEDNESDAY4thLT-110:40-12:10', 0, 1),
(1773, 'EC-201(E.Sc.) Economics', 'G-2', 'WEDNESDAY', '4th', '14:20-15:50', 'ec201esceconomicsWEDNESDAY4thG-214:20-15:50', 0, 1),
(1774, 'EL-211(Elect.) Basic Circuit Theory', 'LT-2', 'WEDNESDAY', '4th', '09:00-10:30', 'el211electbasiccircuittheoryWEDNESDAY4thLT-209:00-10:30', 0, 1),
(1775, 'EL-292(Elect.)Basic Circuit Theory Lab.', 'ELL', 'WEDNESDAY', '4th', '10:40-12:10', 'el292electbasiccircuittheorylabWEDNESDAY4thELL10:40-12:10', 0, 1),
(1776, 'BY-201 (Elect.)Introductory Biology', 'G-1', 'WEDNESDAY', '4th', '14:20-15:50', 'by201electintroductorybiologyWEDNESDAY4thG-114:20-15:50', 0, 1),
(1777, 'ES-101 (I.T.)Introduction to Geology', 'LT-3', 'WEDNESDAY', '4th', '09:00-10:30', 'es101itintroductiontogeologyWEDNESDAY4thLT-309:00-10:30', 0, 1),
(1778, 'IT-231 (I.T.) System Analysis and Design', 'LT-2', 'WEDNESDAY', '4th', '10:40-12:10', 'it231itsystemanalysisanddesignWEDNESDAY4thLT-210:40-12:10', 0, 1),
(1779, 'IT-232 (I.T.)Database Systems', 'LT-3.', 'WEDNESDAY', '4th', '14:20-15:50', 'it232itdatabasesystemsWEDNESDAY4thLT-3.14:20-15:50', 0, 1),
(1780, 'CS-111(Math)Programming', 'G-1', 'WEDNESDAY', '4th', '09:00-10:30', 'cs111mathprogrammingWEDNESDAY4thG-109:00-10:30', 0, 1),
(1781, 'MA-205 (Math)Differential Equation & Lin. A.', 'G-1', 'WEDNESDAY', '4th', '10:40-12:10', 'ma205mathdifferentialequationlinaWEDNESDAY4thG-110:40-12:10', 0, 1),
(1782, 'MA-205 (Phys)Differential Equation & L. Alg.', 'F-2', 'WEDNESDAY', '4th', '09:00-10:30', 'ma205physdifferentialequationlalgWEDNESDAY4thF-209:00-10:30', 0, 1),
(1783, 'PH-202 (Phys) Modern Physics', 'LT-3', 'WEDNESDAY', '4th', '10:40-12:10', 'ph202physmodernphysicsWEDNESDAY4thLT-310:40-12:10', 0, 1),
(1784, 'BY-201 (Phys) Introductory Biology', 'LT-3', 'WEDNESDAY', '4th', '12:40-14:10', 'by201physintroductorybiologyWEDNESDAY4thLT-312:40-14:10', 0, 1),
(1785, 'PY-101 (Phys)Introduction to Psychology', 'F-6', 'WEDNESDAY', '4th', '14:20-15:50', 'py101physintroductiontopsychologyWEDNESDAY4thF-614:20-15:50', 0, 1),
(1786, 'IS-101(Ehem) Islamic Studies', 'F-5', 'THURSDAY', '2nd', '09:00-10:30', 'is101ehemislamicstudiesTHURSDAY2ndF-509:00-10:30', 0, 1),
(1787, 'MA-101(Chem)-Calculus & Analytic Geometry-1', 'AUD', 'THURSDAY', '2nd', '12:40-14:10', 'ma101chemcalculusanalyticgeometry1THURSDAY2ndAUD12:40-14:10', 0, 1),
(1788, 'CH-102 (Chem)Chemistry-II', 'F-5', 'THURSDAY', '2nd', '14:20-15:50', 'ch102chemchemistryiiTHURSDAY2ndF-514:20-15:50', 0, 1),
(1789, 'CS-105(C.Sc.)Problems Solving & Prog.', 'CSL', 'THURSDAY', '2nd', '09:00-10:30', 'cs105cscproblemssolvingprogTHURSDAY2ndCSL09:00-10:30', 0, 1),
(1790, 'CS-121(C.Sc.)Object Oriented Prog.Lab.', 'CSL', 'THURSDAY', '2nd', '10:40-12:10', 'cs121cscobjectorientedproglabTHURSDAY2ndCSL10:40-12:10', 0, 1),
(1791, 'PH-103 (C.Sc.)Electricity, Mag. & Ther. Phy.', 'G.1', 'THURSDAY', '2nd', '14:20-15:50', 'ph103cscelectricitymagtherphyTHURSDAY2ndG.114:20-15:50', 0, 1),
(1792, 'ES-102 (E.Sc.)Introduction to Geophysics', 'AUD', 'THURSDAY', '2nd', '09:00-10:30', 'es102escintroductiontogeophysicsTHURSDAY2ndAUD09:00-10:30', 0, 1),
(1793, 'IS-101(E.Sc.) Islamic Studies', 'AUD', 'THURSDAY', '2nd', '14:20-15:50', 'is101escislamicstudiesTHURSDAY2ndAUD14:20-15:50', 0, 1),
(1794, 'CS-121(Elect.)Object Oriented Prog.', 'F-3', 'THURSDAY', '2nd', '09:00-10:30', 'cs121electobjectorientedprogTHURSDAY2ndF-309:00-10:30', 0, 1),
(1795, 'IS-101(Elect.)Islamic Studies', 'F-1', 'THURSDAY', '2nd', '12:40-14:10', 'is101electislamicstudiesTHURSDAY2ndF-112:40-14:10', 0, 1),
(1796, 'PY-101 (Elect.) Introduction to Psychology', 'LT.1', 'THURSDAY', '2nd', '14:20-15:50', 'py101electintroductiontopsychologyTHURSDAY2ndLT.114:20-15:50', 0, 1),
(1797, 'MA-102(I.T.)Calculus and Analytic Geomtry-II.', 'F-5', 'THURSDAY', '2nd', '10:40-12:10', 'ma102itcalculusandanalyticgeomtryiiTHURSDAY2ndF-510:40-12:10', 0, 1),
(1798, 'IS-101(I.T.)Islamic Studies', 'F-5', 'THURSDAY', '2nd', '12:40-14:10', 'is101itislamicstudiesTHURSDAY2ndF-512:40-14:10', 0, 1),
(1799, 'PY-101 (I.T.)Introduction to Psychology', 'F-5', 'THURSDAY', '2nd', '14:20-15:50', 'py101itintroductiontopsychologyTHURSDAY2ndF-514:20-15:50', 0, 1),
(1800, 'PH-104 (Math)Waves & Optics', 'F-2', 'THURSDAY', '2nd', '09:00-10:30', 'ph104mathwavesopticsTHURSDAY2ndF-209:00-10:30', 0, 1),
(1801, 'IS-101(Math)Islamic Studies', 'F-3', 'THURSDAY', '2nd', '12:40-14:10', 'is101mathislamicstudiesTHURSDAY2ndF-312:40-14:10', 0, 1),
(1802, 'PH-104 (Phys)Waves & Optics', 'F-4', 'THURSDAY', '2nd', '12:40-14:10', 'ph104physwavesopticsTHURSDAY2ndF-412:40-14:10', 0, 1),
(1803, 'IS-101(Phys)Islamic Studies', 'F-4', 'THURSDAY', '2nd', '14:20-15:50', 'is101physislamicstudiesTHURSDAY2ndF-414:20-15:50', 0, 1),
(1804, 'PH-103 (Stat)Electricity, Mag. & Therml Phy.', 'F-4', 'THURSDAY', '2nd', '09:00-10:30', 'ph103statelectricitymagthermlphyTHURSDAY2ndF-409:00-10:30', 0, 1),
(1805, 'PH-193 (Stat)Electricity, Mag. & Ther. Phy. Lab', 'PHL', 'THURSDAY', '2nd', '10:40-12:10', 'ph193statelectricitymagtherphylabTHURSDAY2ndPHL10:40-12:10', 0, 1),
(1806, 'CH-204 (Chem)Industrial Chemistry', 'LT-1', 'THURSDAY', '4th', '09:00-10:30', 'ch204chemindustrialchemistryTHURSDAY4thLT-109:00-10:30', 0, 1),
(1807, 'CH-293 (Chem)Chemistry-iv Lab.', 'CHL', 'THURSDAY', '4th', '10:40-12:10', 'ch293chemchemistryivlabTHURSDAY4thCHL10:40-12:10', 0, 1),
(1808, 'CH-203 (Chem)Chemistry-iv', 'LT-2', 'THURSDAY', '4th', '12:40-14:10', 'ch203chemchemistryivTHURSDAY4thLT-212:40-14:10', 0, 1),
(1809, 'BY-201(Chem)Introductory Biology', 'G-2', 'THURSDAY', '4th', '14:20-15:50', 'by201chemintroductorybiologyTHURSDAY4thG-214:20-15:50', 0, 1),
(1810, 'MA-205 (C.Sc.) Differential Equation & Lin. A.', 'LT-1', 'THURSDAY', '4th', '10:40-12:10', 'ma205cscdifferentialequationlinaTHURSDAY4thLT-110:40-12:10', 0, 1),
(1811, 'CS-293(C.Sc.) 13:30 to15:30 2hrsComputer org. & Assem.L. Lab.', 'CSL', 'THURSDAY', '4th', '12:40-14:10', 'cs293csc1330to15302hrscomputerorgassemllabTHURSDAY4thCSL12:40-14:10', 0, 1),
(1812, 'ES-293 (E.Sc.)Geological Particals-1', 'LT-2', 'THURSDAY', '4th', '09:00-10:30', 'es293escgeologicalparticals1THURSDAY4thLT-209:00-10:30', 0, 1),
(1813, 'EC-201(E.Sc.)Economics', 'LT-1', 'THURSDAY', '4th', '14:20-15:50', 'ec201esceconomicsTHURSDAY4thLT-114:20-15:50', 0, 1),
(1814, 'EL-211 (Elect.)Basic Circuit Theory', 'LT-3', 'THURSDAY', '4th', '09:00-10:30', 'el211electbasiccircuittheoryTHURSDAY4thLT-309:00-10:30', 0, 1),
(1815, 'EL-202(Elect.) Probability, Statistics & Rnd. Vr', 'LT-3', 'THURSDAY', '4th', '12:40-14:10', 'el202electprobabilitystatisticsrndvrTHURSDAY4thLT-312:40-14:10', 0, 1),
(1816, 'EC-201 (Elect.) Economics 6th', 'LT-2', 'THURSDAY', '4th', '14:20-15:50', 'ec201electeconomics6thTHURSDAY4thLT-214:20-15:50', 0, 1),
(1817, 'MA-205 (I.T.)Differential Equation & L. A', 'G-1', 'THURSDAY', '4th', '09:00-10:30', 'ma205itdifferentialequationlaTHURSDAY4thG-109:00-10:30', 0, 1),
(1818, 'IT-231 (I.T.)System Analysis and Design', 'G-1', 'THURSDAY', '4th', '10:40-12:10', 'it231itsystemanalysisanddesignTHURSDAY4thG-110:40-12:10', 0, 1),
(1819, 'IT-222 (I.T.)Computer Architecture', 'G-1', 'THURSDAY', '4th', '12:40-14:10', 'it222itcomputerarchitectureTHURSDAY4thG-112:40-14:10', 0, 1),
(1820, 'MA-204 (Math)Introduction to Group &Topology', 'G-2', 'THURSDAY', '4th', '10:40-12:10', 'ma204mathintroductiontogrouptopologyTHURSDAY4thG-210:40-12:10', 0, 1),
(1821, 'CS-111 (Math)Programming.', 'LT-1', 'THURSDAY', '4th', '12:40-14:10', 'cs111mathprogrammingTHURSDAY4thLT-112:40-14:10', 0, 1),
(1822, 'PH-292 (Phys)Modern Physics. (Lab).', 'PHL', 'THURSDAY', '4th', '09:00-10:30', 'ph292physmodernphysicslabTHURSDAY4thPHL09:00-10:30', 0, 1),
(1823, 'PH-203(Phys)Thermal & Statistical Physics', 'G-2', 'THURSDAY', '4th', '12:40-14:10', 'ph203physthermalstatisticalphysicsTHURSDAY4thG-212:40-14:10', 0, 1),
(1824, 'BY-201 (Phys)Introductory Biology', 'LT-3', 'THURSDAY', '4th', '14:20-15:50', 'by201physintroductorybiologyTHURSDAY4thLT-314:20-15:50', 0, 1),
(1825, 'ST-204 (Stat) Official Statistics', 'G-2', 'THURSDAY', '4th', '09:00-10:30', 'st204statofficialstatisticsTHURSDAY4thG-209:00-10:30', 0, 1),
(1826, 'MA-101 (Chem) Calculus & Analytic Geom-1', 'AUD', 'FRIDAY', '2nd', '09:00-10:30', 'ma101chemcalculusanalyticgeom1FRIDAY2ndAUD09:00-10:30', 0, 1),
(1827, 'CH-192(Chem)Chemistry-II Lab', 'CHL', 'FRIDAY', '2nd', '10:40-12:10', 'ch192chemchemistryiilabFRIDAY2ndCHL10:40-12:10', 0, 1),
(1828, 'CS-105(C.Sc.)Problems Solving & Prog. ', 'CSL', 'FRIDAY', '2nd', '09:00-10:30', 'cs105cscproblemssolvingprogFRIDAY2ndCSL09:00-10:30', 0, 1),
(1829, 'CS-121(C.Sc.) Object Oriented Prog.', 'LT-1', 'FRIDAY', '2nd', '09:00-10:30', 'cs121cscobjectorientedprogFRIDAY2ndLT-109:00-10:30', 0, 1),
(1830, 'PH-103 (C.Sc.) Electricity, Mag. & Therm. Phy.', 'G.1', 'FRIDAY', '2nd', '14:20-15:50', 'ph103cscelectricitymagthermphyFRIDAY2ndG.114:20-15:50', 0, 1),
(1831, 'CS-121(Elect.)Object Oriented Prog.', 'F-3', 'FRIDAY', '2nd', '09:00-10:30', 'cs121electobjectorientedprogFRIDAY2ndF-309:00-10:30', 0, 1),
(1832, 'ST-101 (Math)Probability & Statistics', 'F-2', 'FRIDAY', '2nd', '09:00-10:30', 'st101mathprobabilitystatisticsFRIDAY2ndF-209:00-10:30', 0, 1),
(1833, 'IS-101(Math)Islamic Studies ', 'F-3', 'FRIDAY', '2nd', '10:40-12:10', 'is101mathislamicstudiesFRIDAY2ndF-310:40-12:10', 0, 1),
(1834, 'ET-101Non M)', 'F-3', 'FRIDAY', '2nd', '10:40-12:10', 'et101nonmFRIDAY2ndF-310:40-12:10', 0, 1),
(1835, 'PH-104 (Phys)Waves & Optics', 'F-4', 'FRIDAY', '2nd', '09:00-10:30', 'ph104physwavesopticsFRIDAY2ndF-409:00-10:30', 0, 1),
(1836, 'PH-194 (Phys)Waves & Optics Lab.', 'PHL', 'FRIDAY', '2nd', '10:40-12:10', 'ph194physwavesopticslabFRIDAY2ndPHL10:40-12:10', 0, 1),
(1837, 'EN-102 (Phys)Functional English II.', 'F-4', 'FRIDAY', '2nd', '14:20-15:50', 'en102physfunctionalenglishiiFRIDAY2ndF-414:20-15:50', 0, 1),
(1838, 'ST-101 (C.Sc.)Probability and Statistics', 'LT-3', 'FRIDAY', '4th', '09:00-10:30', 'st101cscprobabilityandstatisticsFRIDAY4thLT-309:00-10:30', 0, 1),
(1839, 'EC-201(C.Sc.)Economics (6th )', 'G-1', 'FRIDAY', '4th', '10:40-12:10', 'ec201csceconomics6thFRIDAY4thG-110:40-12:10', 0, 1),
(1840, 'EL-221(Elect.)Digital Logic & comp. Architect Lab ', 'G-2', 'FRIDAY', '4th', '09:00-10:30', 'el221electdigitallogiccomparchitectlabFRIDAY4thG-209:00-10:30', 0, 1),
(1841, ' EL-201 (Elect.)Economics 6th', 'G-2', 'FRIDAY', '4th', '09:00-10:30', 'el201electeconomics6thFRIDAY4thG-209:00-10:30', 0, 1),
(1842, 'MA-205(Elect.)Differential Equation & Lin. A.', 'F-3', 'FRIDAY', '4th', '14:20-15:50', 'ma205electdifferentialequationlinaFRIDAY4thF-314:20-15:50', 0, 1),
(1843, 'MA-204 (Math)Introduction to Group &Top.', 'G-1', 'FRIDAY', '4th', '09:00-10:30', 'ma204mathintroductiontogrouptopFRIDAY4thG-109:00-10:30', 0, 1),
(1844, 'CS-111 (Math)Programming', 'CSL', 'FRIDAY', '4th', '10:40-12:10', 'cs111mathprogrammingFRIDAY4thCSL10:40-12:10', 0, 1),
(1845, 'MA-205 (Phys)Differential Equation & L. Alg.', 'LT-1', 'FRIDAY', '4th', '09:00-10:30', 'ma205physdifferentialequationlalgFRIDAY4thLT-109:00-10:30', 0, 1),
(1846, 'ST-204 (Stat)Official Statistics', 'LT-2', 'FRIDAY', '4th', '10:40-12:10', 'st204statofficialstatisticsFRIDAY4thLT-210:40-12:10', 0, 1);

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
(65, 'HIFZA_91', 'HIFZA_91', 3, '04071613001', 2),
(66, 'UMAIRA517', 'UMAIRA517', 3, '04071613002', 2);

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
  ADD KEY `User_Id` (`User_Id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `Notif_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1847;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `User_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
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
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `users` (`User_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
