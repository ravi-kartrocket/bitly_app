-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: multichannel.api:3306
-- Generation Time: Feb 22, 2019 at 10:31 PM
-- Server version: 5.7.10
-- PHP Version: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bitly`
--

-- --------------------------------------------------------

--
-- Table structure for table `coupon_user`
--

CREATE TABLE `coupon_user` (
  `payment_request_id` varchar(100) NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `bitly_link` varchar(255) NOT NULL,
  `response` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupon_user`
--

INSERT INTO `coupon_user` (`payment_request_id`, `payment_id`, `coupon_code`, `bitly_link`, `response`) VALUES
('12345', '', 'hwdjwd', 'wdwd', 'wdwd'),
('2', '', '9b99376e-1dc6-4427-81d3-19dae18a2a8e', 'http://j.mp/2SSlenY', '{\"status_code\":200,\"status_txt\":\"OK\",\"data\":{\"url\":\"http:\\/\\/j.mp\\/2SSlenY\",\"hash\":\"2SSlenY\",\"global_hash\":\"2SXlH8t\",\"long_url\":\"http:\\/\\/knowabout.it\\/?user=2&coupon=9b99376e-1dc6-4427-81d3-19dae18a2a8e\",\"new_hash\":1}}'),
('21', 'wdj', 'ea7cdb19-f5e8-49a5-9143-151740ff0052', 'http://j.mp/2Vk6cUP', '{\"status_code\":200,\"status_txt\":\"OK\",\"data\":{\"url\":\"http:\\/\\/j.mp\\/2Vk6cUP\",\"hash\":\"2Vk6cUP\",\"global_hash\":\"2Vk6dbl\",\"long_url\":\"http:\\/\\/knowabout.it\\/?user=&coupon=ea7cdb19-f5e8-49a5-9143-151740ff0052\",\"new_hash\":1}}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coupon_user`
--
ALTER TABLE `coupon_user`
  ADD PRIMARY KEY (`payment_request_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
