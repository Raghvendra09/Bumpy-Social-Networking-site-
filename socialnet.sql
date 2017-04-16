-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2016 at 12:04 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `socialnet`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `c_id` int(11) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `personId` int(11) NOT NULL,
  `postId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`c_id`, `text`, `date`, `personId`, `postId`) VALUES
(1, 'This is a test comment', '2016-11-11 13:22:34', 3, 3),
(4, 'Hello', '2016-11-11 14:54:26', 3, 3),
(10, 'Hello', '2016-11-11 15:01:20', 3, 3),
(11, '', '2016-11-11 15:03:33', 3, 9),
(12, 'Hellloooo', '2016-11-11 15:05:26', 3, 9),
(13, 'Hello this is final comment', '2016-11-12 15:07:04', 3, 4),
(14, 'Hello this is new comment', '2016-11-12 08:42:48', 3, 3),
(15, 'manish', '2016-11-13 19:31:54', 5, 16),
(16, 'manish', '2016-11-13 21:15:49', 5, 17),
(17, 'kslkjslk', '2016-11-14 00:52:33', 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `p_id` int(11) NOT NULL DEFAULT '0',
  `f_id` int(11) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(255) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`p_id`, `f_id`, `date`, `status`) VALUES
(4, 5, '2016-11-10 13:52:59', 'Accepted'),
(5, 4, '2016-11-10 13:55:59', 'Accepted');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `m_id` int(11) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `p_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `n_id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `personId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE `pictures` (
  `pic_id` int(11) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `postId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pic_likes`
--

CREATE TABLE `pic_likes` (
  `l_id` int(11) NOT NULL,
  `personID` int(11) DEFAULT NULL,
  `picId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `p_id` int(11) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `text` varchar(255) DEFAULT NULL,
  `posterId` int(11) NOT NULL,
  `likes` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`p_id`, `date`, `text`, `posterId`, `likes`) VALUES
(3, '2016-11-12 15:40:44', 'this is new status on 12 NOV', 3, 0),
(4, '2016-11-12 16:54:30', 'Hello How are you', 3, 0),
(9, '2016-11-12 17:27:23', 'Hello how are  you this is a new status', 3, 0),
(10, '2016-11-12 18:16:27', '', 3, 0),
(11, '2016-11-12 08:26:57', 'hello i am manish', 5, 0),
(12, '2016-11-11 09:11:30', 'hello how are you', 3, 0),
(13, '2016-11-10 18:52:44', 'vhnn', 3, 0),
(14, '2016-11-11 14:20:37', 'vmkjfkfmed', 4, 0),
(15, '2016-11-13 19:20:11', 'xmsnxsx', 3, 0),
(16, '2016-11-13 19:31:26', 'hey sncsn', 5, 0),
(17, '2016-11-13 21:15:26', 'vijay anand', 5, 0),
(18, '2016-11-14 00:51:41', 'bkjbdsvjlnlnfvnlmk', 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `post_likes`
--

CREATE TABLE `post_likes` (
  `l_id` int(11) NOT NULL,
  `personID` int(11) DEFAULT NULL,
  `postId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post_likes`
--

INSERT INTO `post_likes` (`l_id`, `personID`, `postId`) VALUES
(1, 3, 9),
(2, 3, 9),
(3, 3, 3),
(4, 3, 4),
(5, 3, 4),
(6, 3, 3),
(7, 3, 3),
(8, 3, 11),
(9, 3, 11),
(10, 3, 11),
(11, 3, 13),
(12, 3, 11),
(13, 4, 3),
(14, 5, 16),
(15, 5, 17),
(16, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `t_id` int(11) NOT NULL,
  `personID` int(11) DEFAULT NULL,
  `picId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` int(11) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `dob` varchar(10) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mob` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `firstName`, `lastName`, `dob`, `sex`, `email`, `password`, `mob`) VALUES
(3, 'manish', 'Singla', '12/11/2016', 'Male', 'v@v.com', 'password', '9427036038'),
(4, 'Raghvendra', 'singla', '2016-11-12', 'm', 'vs@v.com', 'password', '9427036038'),
(5, 'vaibhav', 'anand', '2016-11-12', 'm', 'hemant@gmail.com', 'password', '1236547890'),
(6, 'uday', 'kumar', '1996-06-10', 'm', 'uday.u1111@gmail.com', 'udaykumar', '9429452821');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`p_id`,`f_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`n_id`);

--
-- Indexes for table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`pic_id`);

--
-- Indexes for table `pic_likes`
--
ALTER TABLE `pic_likes`
  ADD PRIMARY KEY (`l_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`l_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`),
  ADD UNIQUE KEY `index_people_on_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `n_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `pic_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pic_likes`
--
ALTER TABLE `pic_likes`
  MODIFY `l_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `post_likes`
--
ALTER TABLE `post_likes`
  MODIFY `l_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
