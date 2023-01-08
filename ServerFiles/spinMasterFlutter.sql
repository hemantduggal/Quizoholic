-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 04, 2022 at 10:26 AM
-- Server version: 5.7.36-cll-lve
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spinMasterFlutter`
--

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `sno` int(11) NOT NULL,
  `img` varchar(300) NOT NULL,
  `link` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`sno`, `img`, `link`) VALUES
(1, 'https://www.techno-scrap.com/media/1.jpg', 'https://378.win.predchamp.com/'),
(2, 'https://www.techno-scrap.com/media/2.jpg', 'https://theforyou.xyz/personal-loan-in-10-sec/'),
(3, 'https://www.techno-scrap.com/media/3.jpg', 'https://www.freenewlyrics.com/earn-money-online-apps-2021/');

-- --------------------------------------------------------

--
-- Table structure for table `gameBanner`
--

CREATE TABLE `gameBanner` (
  `sno` int(11) NOT NULL,
  `img` varchar(300) NOT NULL,
  `link` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gameBanner`
--

INSERT INTO `gameBanner` (`sno`, `img`, `link`) VALUES
(1, 'https://www.techno-scrap.com/media/bb1.png', 'https://www.freenewlyrics.com/earn-money-online-apps-2021/'),
(2, 'https://www.techno-scrap.com/media/bb2.png', 'https://10.go.mglgamez.com/'),
(3, 'https://www.techno-scrap.com/media/bb3.png', 'https://quizzop.com/?id=3464'),
(4, 'https://www.techno-scrap.com/media/bb4.png', 'https://378.win.predchamp.com/');

-- --------------------------------------------------------

--
-- Table structure for table `morecoin`
--

CREATE TABLE `morecoin` (
  `sno` int(11) NOT NULL,
  `task` int(11) NOT NULL,
  `icon` varchar(300) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `link` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `morecoin`
--

INSERT INTO `morecoin` (`sno`, `task`, `icon`, `title`, `description`, `link`) VALUES
(11, 1, 'https://www.techno-scrap.com/wp-content/uploads/2022/02/CashBazz-Logo.jpg', 'CashBazz', '', 'https://play.google.com/store/apps/details?id=com.Developersoft.Earnmoneyonline'),
(12, 1, 'https://www.techno-scrap.com/wp-content/uploads/2022/02/spin-winner-logo.jpg', 'Spin Winner', '', 'https://play.google.com/store/apps/details?id=com.Developersoft.spinandwinspinwinner'),
(13, 2, 'https://www.techno-scrap.com/wp-content/uploads/2022/02/Task-Icon-1.jpg', 'Article Reading', 'Read Article and Get 200 Coins', 'https://www.freenewlyrics.com/earn-money-online-apps-2021/'),
(14, 2, 'https://www.techno-scrap.com/wp-content/uploads/2022/02/Task-Icon-1.jpg', 'Read Article', 'Read Article and Get 200 Coins', 'https://www.freenewlyrics.com/cashbazz-earn-money-online-2021/'),
(15, 2, 'https://www.techno-scrap.com/wp-content/uploads/2022/02/Task-Icon-1.jpg', 'Read Article', 'Read Article and Get 200 Coins', 'https://www.freenewlyrics.com/spin-winner-earn-money-online-from-home/'),
(16, 2, 'https://www.techno-scrap.com/wp-content/uploads/2022/02/Task-Icon-1.jpg', 'Read Article', 'Read Article and Get 200 Coins', 'https://theforyou.xyz/personal-loan-in-10-sec/');

-- --------------------------------------------------------

--
-- Table structure for table `otherAdsLinks`
--

CREATE TABLE `otherAdsLinks` (
  `sno` int(11) NOT NULL,
  `place` varchar(100) NOT NULL,
  `link` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otherAdsLinks`
--

INSERT INTO `otherAdsLinks` (`sno`, `place`, `link`) VALUES
(1, 'splash', 'https://378.win.predchamp.com/'),
(2, 'win bonus', 'https://play202.atmequiz.com/'),
(3, 'mega win', 'https://378.win.predchamp.com/'),
(4, 'history', 'https://www.freenewlyrics.com/transaction-history-updates/'),
(5, 'instant Redeem', 'https://www.freenewlyrics.com/thank-you-for-submitting-your-info-we-will-contact-you-please-wait/'),
(6, 'home footer ad', 'https://quizzop.com/?id=3464'),
(7, 'daily1', 'https://378.win.predchamp.com/'),
(8, 'daily2', 'https://378.win.qureka.com/'),
(9, 'daily3', 'https://play202.atmequiz.com/'),
(10, 'daily4', 'https://quizzop.com/?id=OOJyvNKqv'),
(11, 'daily5', 'https://10.go.mglgamez.com/'),
(12, 'daily6', 'https://quizzop.com/?id=3464'),
(13, 'play get- Slider 1', 'https://play.google.com/store/apps/details?id=com.Developersoft.Earnmoneyonline'),
(14, 'play get- Slider 2', 'https://play.google.com/store/apps/details?id=com.Developersoft.spinandwinspinwinner'),
(15, 'play get- Slider 3', 'https://play.google.com/store/apps/details?id=com.earnmoneyonline.earnsy'),
(16, 'contact us', 'https://www.freenewlyrics.com/contact-us/'),
(17, 'privacy policy', 'https://www.freenewlyrics.com/cashbazz-privacy-policy/'),
(18, 'top icon left', 'https://378.win.predchamp.com/'),
(19, 'top icon right', 'https://play202.atmequiz.com/'),
(20, 'games banner below slider', 'https://quizzop.com/?id=OOJyvNKqv'),
(21, 'gamesLink1', 'https://10.go.mglgamez.com/'),
(22, 'gamesLink2', 'https://10.go.mglgamez.com/'),
(23, 'gamesLink3', 'https://10.go.mglgamez.com/'),
(24, 'gamesLink4', 'https://10.go.mglgamez.com/'),
(25, 'Hide-App 23-feb', '1'),
(26, 'share app', 'https://www.apple.com'),
(27, 'quiz 1', 'https://www.facebook.com'),
(28, 'quiz 2', 'https://www.apple.com'),
(29, 'quiz 3', 'https://www.facebook.com'),
(30, 'games link 5', 'https://www.apple.com'),
(31, 'games link 6', 'https://www.youtube.com'),
(32, 'games link 7', 'https://www.apple.com'),
(33, 'games link 8', 'https://www.youtube.com'),
(34, 'hide-app 28-feb', '1');

-- --------------------------------------------------------

--
-- Table structure for table `website`
--

CREATE TABLE `website` (
  `sno` int(11) NOT NULL,
  `websites` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `website`
--

INSERT INTO `website` (`sno`, `websites`) VALUES
(1, 'https://378.win.qureka.com/'),
(2, 'https://www.freenewlyrics.com/earn-money-online-apps-2021/'),
(3, 'https://378.win.predchamp.com/'),
(4, 'https://10.go.mglgamez.com/'),
(5, 'https://play202.atmequiz.com/'),
(6, 'https://quizzop.com/?id=OOJyvNKqv'),
(7, 'https://quizzop.com/?id=3464'),
(8, 'https://theforyou.xyz/personal-loan-in-10-sec/');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `gameBanner`
--
ALTER TABLE `gameBanner`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `morecoin`
--
ALTER TABLE `morecoin`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `otherAdsLinks`
--
ALTER TABLE `otherAdsLinks`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `website`
--
ALTER TABLE `website`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gameBanner`
--
ALTER TABLE `gameBanner`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `morecoin`
--
ALTER TABLE `morecoin`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `otherAdsLinks`
--
ALTER TABLE `otherAdsLinks`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `website`
--
ALTER TABLE `website`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
