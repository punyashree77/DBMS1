-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2023 at 04:44 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbmslab1`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `title` varchar(40) DEFAULT NULL,
  `publisher_name` varchar(40) DEFAULT NULL,
  `pub_year` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `title`, `publisher_name`, `pub_year`) VALUES
(101, 'python', 'yashu', '2001'),
(102, 'java', 'manju', '2000'),
(103, 'html', 'madhu', '2010'),
(104, 'c++', 'sanju', '2005');

-- --------------------------------------------------------

--
-- Table structure for table `book_authors`
--

CREATE TABLE `book_authors` (
  `book_id` int(11) NOT NULL,
  `author_name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_authors`
--

INSERT INTO `book_authors` (`book_id`, `author_name`) VALUES
(101, 'nagesh'),
(102, 'savitha'),
(103, 'lavanya'),
(104, 'pruthvi');

-- --------------------------------------------------------

--
-- Table structure for table `book_copies`
--

CREATE TABLE `book_copies` (
  `book_id` int(11) NOT NULL,
  `programme_id` int(11) NOT NULL,
  `no_of_copies` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_copies`
--

INSERT INTO `book_copies` (`book_id`, `programme_id`, `no_of_copies`) VALUES
(101, 51, 20),
(102, 52, 15),
(103, 53, 10),
(104, 54, 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `book_copies_view`
-- (See below for the actual view)
--
CREATE TABLE `book_copies_view` (
`book_id` int(11)
,`title` varchar(40)
,`no_of_copies` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `book_lending`
--

CREATE TABLE `book_lending` (
  `book_id` int(11) NOT NULL,
  `programme_id` int(11) NOT NULL,
  `card_no` int(11) NOT NULL,
  `date_out` date DEFAULT NULL,
  `due_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_lending`
--

INSERT INTO `book_lending` (`book_id`, `programme_id`, `card_no`, `date_out`, `due_date`) VALUES
(101, 51, 1, '2017-01-01', '2017-04-03'),
(102, 52, 1, '2017-02-02', '2017-03-15'),
(103, 52, 1, '2017-01-10', '2017-03-15'),
(103, 53, 2, '2017-01-10', '2017-06-01'),
(104, 51, 1, '2017-02-14', '2017-05-14'),
(104, 54, 2, '2018-02-10', '2018-03-15');

-- --------------------------------------------------------

--
-- Stand-in structure for view `book_view`
-- (See below for the actual view)
--
CREATE TABLE `book_view` (
`pub_year` year(4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `book_view1`
-- (See below for the actual view)
--
CREATE TABLE `book_view1` (
`pub_year` year(4)
);

-- --------------------------------------------------------

--
-- Table structure for table `library_programme`
--

CREATE TABLE `library_programme` (
  `programme_id` int(11) NOT NULL,
  `programme_name` varchar(40) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `library_programme`
--

INSERT INTO `library_programme` (`programme_id`, `programme_name`, `address`) VALUES
(51, 'CSE', 'mysore'),
(52, 'ISE', 'jaipur'),
(53, 'EC', 'delhi'),
(54, 'CV', 'kerala'),
(55, 'CSDS', 'mandya');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `name` varchar(40) NOT NULL,
  `addreess` varchar(40) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`name`, `addreess`, `phone`) VALUES
('madhu', 'mandya', 9565656565),
('manju', 'bangalore', 9343434343),
('sanju', 'mysore', 9787878787),
('theju', 'mangalore', 9909090909),
('yashu', 'mandya', 9121212121);

-- --------------------------------------------------------

--
-- Structure for view `book_copies_view`
--
DROP TABLE IF EXISTS `book_copies_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `book_copies_view`  AS SELECT `b`.`book_id` AS `book_id`, `b`.`title` AS `title`, `bc`.`no_of_copies` AS `no_of_copies` FROM (`book` `b` join `book_copies` `bc`) WHERE `b`.`book_id` = `bc`.`book_id` ;

-- --------------------------------------------------------

--
-- Structure for view `book_view`
--
DROP TABLE IF EXISTS `book_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `book_view`  AS SELECT `book`.`pub_year` AS `pub_year` FROM `book` ;

-- --------------------------------------------------------

--
-- Structure for view `book_view1`
--
DROP TABLE IF EXISTS `book_view1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `book_view1`  AS SELECT `book`.`pub_year` AS `pub_year` FROM `book` WHERE `book`.`pub_year` between 2002 and 2011 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `publisher_name` (`publisher_name`);

--
-- Indexes for table `book_authors`
--
ALTER TABLE `book_authors`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `book_copies`
--
ALTER TABLE `book_copies`
  ADD PRIMARY KEY (`book_id`,`programme_id`),
  ADD KEY `programme_id` (`programme_id`);

--
-- Indexes for table `book_lending`
--
ALTER TABLE `book_lending`
  ADD PRIMARY KEY (`book_id`,`programme_id`,`card_no`),
  ADD KEY `programme_id` (`programme_id`);

--
-- Indexes for table `library_programme`
--
ALTER TABLE `library_programme`
  ADD PRIMARY KEY (`programme_id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`publisher_name`) REFERENCES `publisher` (`name`);

--
-- Constraints for table `book_authors`
--
ALTER TABLE `book_authors`
  ADD CONSTRAINT `book_authors_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE;

--
-- Constraints for table `book_copies`
--
ALTER TABLE `book_copies`
  ADD CONSTRAINT `book_copies_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_copies_ibfk_2` FOREIGN KEY (`programme_id`) REFERENCES `library_programme` (`programme_id`) ON DELETE CASCADE;

--
-- Constraints for table `book_lending`
--
ALTER TABLE `book_lending`
  ADD CONSTRAINT `book_lending_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_lending_ibfk_2` FOREIGN KEY (`programme_id`) REFERENCES `library_programme` (`programme_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
