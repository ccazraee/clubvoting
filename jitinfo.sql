-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2016 at 12:14 PM
-- Server version: 5.5.36
-- PHP Version: 5.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jitinfo`
--
CREATE DATABASE IF NOT EXISTS `jitinfo` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `jitinfo`;

-- --------------------------------------------------------

--
-- Table structure for table `audit`
--

DROP TABLE IF EXISTS `audit`;
CREATE TABLE IF NOT EXISTS `audit` (
  `auditID` int(11) NOT NULL AUTO_INCREMENT,
  `audityear` int(11) DEFAULT NULL,
  `issue` varchar(400) DEFAULT NULL,
  `description` varchar(600) DEFAULT NULL,
  `risktype` varchar(20) DEFAULT NULL,
  `risklevel` varchar(20) DEFAULT NULL,
  `jadrecommend` varchar(600) DEFAULT NULL,
  `jitresponse` varchar(600) DEFAULT NULL,
  `ActionPlan` varchar(400) DEFAULT NULL,
  `oic1` int(11) DEFAULT NULL,
  `oic2` int(11) DEFAULT NULL,
  `oic3` int(11) DEFAULT NULL,
  `targetdate` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `Attachment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`auditID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `audittrail`
--

DROP TABLE IF EXISTS `audittrail`;
CREATE TABLE IF NOT EXISTS `audittrail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `script` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `table` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `keyvalue` longtext,
  `oldvalue` longtext,
  `newvalue` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3425 ;

-- --------------------------------------------------------

--
-- Table structure for table `budget`
--

DROP TABLE IF EXISTS `budget`;
CREATE TABLE IF NOT EXISTS `budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectID` int(11) DEFAULT NULL,
  `BudgetYear` year(4) DEFAULT NULL,
  `Amount` decimal(11,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bugreport`
--

DROP TABLE IF EXISTS `bugreport`;
CREATE TABLE IF NOT EXISTS `bugreport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staffid` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `issue` varchar(400) DEFAULT NULL,
  `priority` varchar(20) DEFAULT NULL,
  `category` varchar(20) NOT NULL,
  `attachment` varchar(150) DEFAULT NULL,
  `solution` text,
  `solutiondate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(250) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `allday` varchar(4) DEFAULT NULL,
  `starttime` varchar(20) DEFAULT NULL,
  `endtime` time DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `Venue` varchar(35) DEFAULT NULL,
  `Organizer` varchar(50) DEFAULT NULL,
  `Payment` varchar(1) DEFAULT NULL,
  `Fees` decimal(6,0) DEFAULT NULL,
  `notes` varchar(400) DEFAULT NULL,
  `documents` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `category` (`category`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

-- --------------------------------------------------------

--
-- Table structure for table `committee`
--

DROP TABLE IF EXISTS `committee`;
CREATE TABLE IF NOT EXISTS `committee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(150) DEFAULT NULL,
  `Purpose` text,
  `Active` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_id` int(11) DEFAULT NULL,
  `invoicedate` date DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `amount` decimal(12,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_class_categories`
--

DROP TABLE IF EXISTS `lkp_class_categories`;
CREATE TABLE IF NOT EXISTS `lkp_class_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ClassCategories` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='lkp_project_categories' AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_project_categories`
--

DROP TABLE IF EXISTS `lkp_project_categories`;
CREATE TABLE IF NOT EXISTS `lkp_project_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectCategories` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='lkp_project_categories' AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_status_categories`
--

DROP TABLE IF EXISTS `lkp_status_categories`;
CREATE TABLE IF NOT EXISTS `lkp_status_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `StatusCategories` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='lkp_project_categories' AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Table structure for table `milestones`
--

DROP TABLE IF EXISTS `milestones`;
CREATE TABLE IF NOT EXISTS `milestones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectID` int(11) DEFAULT NULL,
  `MilestoneDate` date DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Reserved` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `mtm_staff_class`
--

DROP TABLE IF EXISTS `mtm_staff_class`;
CREATE TABLE IF NOT EXISTS `mtm_staff_class` (
  `staffID` int(11) NOT NULL DEFAULT '0',
  `classID` int(11) NOT NULL DEFAULT '0',
  `Attendance` varchar(20) DEFAULT NULL,
  `Remark` text,
  `Certificate` varchar(150) DEFAULT NULL,
  `Section` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`staffID`,`classID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mtm_staff_committee`
--

DROP TABLE IF EXISTS `mtm_staff_committee`;
CREATE TABLE IF NOT EXISTS `mtm_staff_committee` (
  `committeeID` int(11) NOT NULL DEFAULT '0',
  `staffID` int(11) NOT NULL DEFAULT '0',
  `role` varchar(20) DEFAULT NULL,
  `TimeSpent` int(3) DEFAULT NULL,
  `ValidDate` date DEFAULT NULL,
  PRIMARY KEY (`committeeID`,`staffID`),
  KEY `committeeID` (`committeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mtm_staff_project`
--

DROP TABLE IF EXISTS `mtm_staff_project`;
CREATE TABLE IF NOT EXISTS `mtm_staff_project` (
  `projID` int(11) NOT NULL DEFAULT '0',
  `staffID` int(11) NOT NULL DEFAULT '0',
  `role` varchar(20) DEFAULT NULL,
  `TimeSpentProject` int(4) DEFAULT NULL,
  PRIMARY KEY (`projID`,`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `plannedleave`
--

DROP TABLE IF EXISTS `plannedleave`;
CREATE TABLE IF NOT EXISTS `plannedleave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(150) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `StaffID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `planned leaves`
--
DROP VIEW IF EXISTS `planned leaves`;
CREATE TABLE IF NOT EXISTS `planned leaves` (
`Name` varchar(50)
,`Description` varchar(150)
,`StartDate` date
,`EndDate` date
);
-- --------------------------------------------------------

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE IF NOT EXISTS `project` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `Category` int(11) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `Active` char(4) DEFAULT NULL,
  `ProjectDescription` text,
  `StartQuarter` varchar(7) DEFAULT NULL,
  `EndQuarter` varchar(7) DEFAULT NULL,
  `EstStartDate` date DEFAULT NULL,
  `EstEndDate` date DEFAULT NULL,
  `ProjectStatus` int(11) DEFAULT NULL,
  `Completion` int(3) DEFAULT NULL,
  `Section` varchar(9) DEFAULT NULL,
  `ProjectMgr1` varchar(200) DEFAULT NULL,
  `ProjectMgr2` varchar(200) DEFAULT NULL,
  `UserProject` char(1) NOT NULL DEFAULT 'N',
  `ProjectOwners` varchar(30) DEFAULT 'JIT',
  `Files` varchar(200) DEFAULT NULL,
  `ApprovedBudget` decimal(11,0) DEFAULT NULL,
  `RevisedBudget` decimal(11,0) DEFAULT NULL,
  `Utilisation` decimal(11,0) DEFAULT NULL,
  `Rebudget` decimal(11,0) DEFAULT NULL,
  `AllocationByYear` varchar(150) DEFAULT NULL,
  `Remark` text,
  `lastmodified` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=79 ;

-- --------------------------------------------------------

--
-- Table structure for table `projectdependency`
--

DROP TABLE IF EXISTS `projectdependency`;
CREATE TABLE IF NOT EXISTS `projectdependency` (
  `DependencyID` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectID` int(11) NOT NULL,
  `Remark` text NOT NULL,
  PRIMARY KEY (`DependencyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `projectmanager`
--

DROP TABLE IF EXISTS `projectmanager`;
CREATE TABLE IF NOT EXISTS `projectmanager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) DEFAULT NULL,
  `Role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `project view`
--
DROP VIEW IF EXISTS `project view`;
CREATE TABLE IF NOT EXISTS `project view` (
`ProjectCategories` varchar(100)
,`StatusCategories` varchar(100)
,`name` varchar(200)
,`Active` char(4)
,`ProjectDescription` text
,`EndQuarter` varchar(7)
,`StartQuarter` varchar(7)
,`Completion` int(3)
,`ProjectMgr1` varchar(200)
,`ProjectMgr2` varchar(200)
,`Section` varchar(9)
,`ProjectOwners` varchar(30)
,`lastmodified` varchar(200)
);
-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `ShortName` varchar(50) DEFAULT NULL,
  `IC` varchar(15) DEFAULT NULL,
  `StaffPIN` varchar(7) DEFAULT NULL,
  `userid` varchar(20) DEFAULT NULL,
  `Designation` varchar(12) DEFAULT NULL,
  `section` varchar(10) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `Location` varchar(6) DEFAULT NULL,
  `Status` varchar(15) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `password` varchar(12) DEFAULT NULL,
  `UserLevel` int(11) NOT NULL,
  `Extension` varchar(20) DEFAULT NULL,
  `Handphone` varchar(20) DEFAULT NULL,
  `EmergencyPhone` varchar(20) DEFAULT NULL,
  `Photo` varchar(150) DEFAULT NULL,
  `EmploymentDate` date DEFAULT NULL,
  `EmploymentStatus` varchar(20) DEFAULT NULL,
  `Skills` text,
  `Remark` text,
  PRIMARY KEY (`id`),
  KEY `Name` (`Name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=127 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `staff - manager view`
--
DROP VIEW IF EXISTS `staff - manager view`;
CREATE TABLE IF NOT EXISTS `staff - manager view` (
`Name` varchar(50)
,`Designation` varchar(12)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `staff and committee view`
--
DROP VIEW IF EXISTS `staff and committee view`;
CREATE TABLE IF NOT EXISTS `staff and committee view` (
`Committee` varchar(150)
,`Active` varchar(20)
,`staffID` int(11)
,`role` varchar(20)
);
-- --------------------------------------------------------

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectID` int(11) NOT NULL,
  `StatusDate` date DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Remark` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `tpec`
--

DROP TABLE IF EXISTS `tpec`;
CREATE TABLE IF NOT EXISTS `tpec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(400) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `chair` varchar(40) DEFAULT NULL,
  `agenda` text,
  `presentation` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `tpecitems`
--

DROP TABLE IF EXISTS `tpecitems`;
CREATE TABLE IF NOT EXISTS `tpecitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tpecid` int(11) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `stage` varchar(20) DEFAULT NULL,
  `section` varchar(20) DEFAULT NULL,
  `value` decimal(20,0) DEFAULT NULL,
  `remark` text,
  `files` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `tpec view`
--
DROP VIEW IF EXISTS `tpec view`;
CREATE TABLE IF NOT EXISTS `tpec view` (
`TPEC` varchar(400)
,`date` date
,`Chairman` varchar(40)
,`agenda` text
,`Items` varchar(400)
,`stage` varchar(20)
,`value` decimal(20,0)
,`section` varchar(20)
,`remark` text
,`Slides` varchar(150)
);
-- --------------------------------------------------------

--
-- Table structure for table `userlevelpermissions`
--

DROP TABLE IF EXISTS `userlevelpermissions`;
CREATE TABLE IF NOT EXISTS `userlevelpermissions` (
  `userlevelid` int(11) NOT NULL,
  `tablename` varchar(255) NOT NULL,
  `permission` int(11) NOT NULL,
  PRIMARY KEY (`userlevelid`,`tablename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userlevels`
--

DROP TABLE IF EXISTS `userlevels`;
CREATE TABLE IF NOT EXISTS `userlevels` (
  `userlevelid` int(11) NOT NULL,
  `userlevelname` varchar(255) NOT NULL,
  PRIMARY KEY (`userlevelid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
CREATE TABLE IF NOT EXISTS `vendor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(200) DEFAULT NULL,
  `Remark` varchar(400) DEFAULT NULL,
  `Address1` varchar(150) DEFAULT NULL,
  `Address2` varchar(150) DEFAULT NULL,
  `City` varchar(150) DEFAULT NULL,
  `State` varchar(150) DEFAULT NULL,
  `Country` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- Table structure for table `vendoragreement`
--

DROP TABLE IF EXISTS `vendoragreement`;
CREATE TABLE IF NOT EXISTS `vendoragreement` (
  `AgreementID` int(11) NOT NULL AUTO_INCREMENT,
  `VendorID` int(11) NOT NULL,
  `AgreementName` varchar(200) DEFAULT NULL,
  `Value` decimal(20,0) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `Section` varchar(20) DEFAULT NULL,
  `Support1` varchar(200) DEFAULT NULL,
  `Support2` varchar(200) DEFAULT NULL,
  `Remark` text,
  PRIMARY KEY (`AgreementID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

-- --------------------------------------------------------

--
-- Table structure for table `vendorassessment`
--

DROP TABLE IF EXISTS `vendorassessment`;
CREATE TABLE IF NOT EXISTS `vendorassessment` (
  `AssessmentID` int(11) NOT NULL AUTO_INCREMENT,
  `VendorID` int(11) DEFAULT NULL,
  `Year` int(4) DEFAULT NULL,
  `FYE` int(11) DEFAULT NULL,
  `StartAssessment` date DEFAULT NULL,
  `EndAssessment` date DEFAULT NULL,
  `ActualRecDate` date DEFAULT NULL,
  `Performance` varchar(20) DEFAULT NULL,
  `PerformanceFile` varchar(200) DEFAULT NULL,
  `Financial` varchar(20) DEFAULT NULL,
  `FinancialFile` varchar(200) DEFAULT NULL,
  `CompletionDate` date DEFAULT NULL,
  `Remark` text,
  PRIMARY KEY (`AssessmentID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `vendorvariation`
--

DROP TABLE IF EXISTS `vendorvariation`;
CREATE TABLE IF NOT EXISTS `vendorvariation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AgreementID` int(11) NOT NULL,
  `Value` decimal(20,0) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `Remark` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `view staff & class`
--
DROP VIEW IF EXISTS `view staff & class`;
CREATE TABLE IF NOT EXISTS `view staff & class` (
`ClassCategories` varchar(100)
,`classname` varchar(250)
,`StartDate` date
,`Name` varchar(50)
,`section` varchar(10)
);
-- --------------------------------------------------------

--
-- Structure for view `planned leaves`
--
DROP TABLE IF EXISTS `planned leaves`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `planned leaves` AS select `staff`.`Name` AS `Name`,`plannedleave`.`Description` AS `Description`,`plannedleave`.`StartDate` AS `StartDate`,`plannedleave`.`EndDate` AS `EndDate` from (`plannedleave` join `staff` on((`plannedleave`.`StaffID` = `staff`.`id`))) group by `staff`.`Name`,`plannedleave`.`Description`,`plannedleave`.`StartDate`,`plannedleave`.`EndDate` order by `plannedleave`.`StartDate`;

-- --------------------------------------------------------

--
-- Structure for view `project view`
--
DROP TABLE IF EXISTS `project view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `project view` AS select `lkp_project_categories`.`ProjectCategories` AS `ProjectCategories`,`lkp_status_categories`.`StatusCategories` AS `StatusCategories`,`project`.`name` AS `name`,`project`.`Active` AS `Active`,`project`.`ProjectDescription` AS `ProjectDescription`,`project`.`EndQuarter` AS `EndQuarter`,`project`.`StartQuarter` AS `StartQuarter`,`project`.`Completion` AS `Completion`,`project`.`ProjectMgr1` AS `ProjectMgr1`,`project`.`ProjectMgr2` AS `ProjectMgr2`,`project`.`Section` AS `Section`,`project`.`ProjectOwners` AS `ProjectOwners`,`project`.`lastmodified` AS `lastmodified` from ((`project` left join `lkp_project_categories` on((`lkp_project_categories`.`id` = `project`.`Category`))) left join `lkp_status_categories` on((`lkp_status_categories`.`id` = `project`.`ProjectStatus`)));

-- --------------------------------------------------------

--
-- Structure for view `staff - manager view`
--
DROP TABLE IF EXISTS `staff - manager view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `staff - manager view` AS select `staff`.`Name` AS `Name`,`staff`.`Designation` AS `Designation` from `staff` where (`staff`.`Designation` = 'MGR');

-- --------------------------------------------------------

--
-- Structure for view `staff and committee view`
--
DROP TABLE IF EXISTS `staff and committee view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `staff and committee view` AS select `committee`.`Name` AS `Committee`,`committee`.`Active` AS `Active`,`mtm_staff_committee`.`staffID` AS `staffID`,`mtm_staff_committee`.`role` AS `role` from (`committee` left join `mtm_staff_committee` on((`committee`.`id` = `mtm_staff_committee`.`committeeID`)));

-- --------------------------------------------------------

--
-- Structure for view `tpec view`
--
DROP TABLE IF EXISTS `tpec view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tpec view` AS select `tpec`.`description` AS `TPEC`,`tpec`.`date` AS `date`,`tpec`.`chair` AS `Chairman`,`tpec`.`agenda` AS `agenda`,`tpecitems`.`description` AS `Items`,`tpecitems`.`stage` AS `stage`,`tpecitems`.`value` AS `value`,`tpecitems`.`section` AS `section`,`tpecitems`.`remark` AS `remark`,`tpec`.`presentation` AS `Slides` from (`tpec` join `tpecitems` on((`tpec`.`id` = `tpecitems`.`tpecid`)));

-- --------------------------------------------------------

--
-- Structure for view `view staff & class`
--
DROP TABLE IF EXISTS `view staff & class`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view staff & class` AS select `lkp_class_categories`.`ClassCategories` AS `ClassCategories`,`class`.`classname` AS `classname`,`class`.`StartDate` AS `StartDate`,`staff`.`Name` AS `Name`,`staff`.`section` AS `section` from (((`class` join `mtm_staff_class` on((`class`.`id` = `mtm_staff_class`.`classID`))) join `staff` on((`mtm_staff_class`.`staffID` = `staff`.`id`))) join `lkp_class_categories` on((`class`.`category` = `lkp_class_categories`.`id`)));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
