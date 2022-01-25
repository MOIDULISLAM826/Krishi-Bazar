-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2022 at 01:32 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin123'),
(2, 'Shebika', 'shebika@gmail.com', 'shebika123');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Fresh'),
(2, 'Frozen');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(59, 98, '::1', 53, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Fruits'),
(2, 'Vegetables'),
(3, 'Crops'),
(4, 'Dairy Products');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'puneethreddy951@gmail.com'),
(5, 'puneethreddy@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `farmer_info`
--

CREATE TABLE `farmer_info` (
  `farmer_id` int(11) NOT NULL,
  `farmer_name` varchar(50) NOT NULL,
  `farmer_mobile` varchar(11) NOT NULL,
  `farmer_pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `farmer_info`
--

INSERT INTO `farmer_info` (`farmer_id`, `farmer_name`, `farmer_mobile`, `farmer_pass`) VALUES
(1, 'Rahim Uddin', '01784579839', 'rahim123'),
(2, 'Fahim Khan', '01798522856', 'fahim123'),
(3, 'Rahim Uddin', '01784579839', 'rahim123'),
(4, 'Fahim Khan', '01798522856', 'fahim123');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL,
  `odr_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL,
  `odr_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`, `odr_time`) VALUES
(1, 44, 'abc as', 'la@gmail.com', 'kelanajaya', 'selangor', 'dhaka', 123456, 'islami', '6789 0987 6543 4567', '11/23', 1, 5, 332, '2020-12-12 07:33:44'),
(2, 45, 'dcx df', 'we@gmail.com', 'dhaka', 'dhaka', 'dhaka', 123567, 'rhb', '12345679753567', '11/23', 1, 4, 234, '2020-12-12 07:33:44'),
(3, 45, 'dcx df', 'we@gmail.com', 'dhaka', 'dhaka', 'dhaka', 123567, 'rhb', '5466 6464 5646 4654', '12/23', 2, 9, 545, '2020-12-12 08:11:19'),
(4, 53, 'moidul islam', 'moidulislam826@gmail.com', 'kelanajaya', 'selangor', 'malaysia', 470320, 'rhb', '2345234567890666', '11/21', 1, 10, 231, '2020-12-16 09:04:32'),
(5, 58, 'bob b', 'b@gmail.com', 'kelanajaya', 'selangor', 'malaysia', 123456, 'rhb', '1234567890976543', '12/22', 1, 5, 453, '2020-12-21 20:51:38'),
(6, 59, 'moidul islam', 't@gmail.com', 'khairabad, rohanpur, gomostapur', 'selangor', 'dhaka', 123456, 'islami', '1234678905432567', '12/22', 1, 5, 435, '2021-03-16 22:55:22'),
(7, 59, 'moidul islam', 't@gmail.com', 'khairabad, rohanpur, gomostapur', 'selangor', 'dhaka', 123456, 'islami', '1234685324642468', '12/12', 1, 4, 455, '2021-03-16 23:38:49'),
(8, 59, 'moidul islam', 't@gmail.com', 'khairabad, rohanpur, gomostapur', 'selangor', 'dhaka', 123456, 'Moidul Islam', '3232424242424242', '12/12', 1, 40, 313, '2021-03-16 23:47:04'),
(9, 59, 'moidul islam', 't@gmail.com', 'khairabad, rohanpur, gomostapur', 'selangor', 'dhaka', 123456, 'Moidul Islam', '2313131313131313', '10/10', 1, 4, 443, '2021-03-16 23:55:53'),
(10, 59, 'moidul islam', 't@gmail.com', 'khairabad, rohanpur, gomostapur', 'selangor', 'dhaka', 123456, 'rhb', '8765908765432126', '12/23', 1, 5, 342, '2021-03-17 00:02:02'),
(11, 59, 'moidul islam', 't@gmail.com', 'khairabad, rohanpur, gomostapur', 'selangor', 'dhaka', 123456, 'islami', '2345566644434455', '12/22', 2, 9, 234, '2021-03-17 00:06:27'),
(12, 59, 'moidul islam', 't@gmail.com', 'khairabad, rohanpur, gomostapur', 'selangor', 'dhaka', 632045, 'islami', '0988789654443345', '12/22', 2, 9, 543, '2021-03-17 01:32:02'),
(13, 59, 'moidul islam', 't@gmail.com', 'khairabad, rohanpur, gomostapur', 'selangor', 'malaysia', 123456, 'Moidul Islam', '2131313131313131', '10/10', 2, 11, 212, '2021-03-17 01:36:20'),
(14, 59, 'moidul islam', 't@gmail.com', 'khairabad, rohanpur, gomostapur', 'selangor', 'dhaka', 123456, 'Moidul Islam', '3123131313131313', '10/10', 2, 9, 432, '2021-03-17 01:45:32'),
(15, 59, 'moidul islam', 't@gmail.com', 'khairabad, rohanpur, gomostapur', 'selangor', 'dhaka', 123456, 'Moidul Islam', '2311312131313131', '10/10', 2, 9, 3131, '2021-03-17 01:47:37'),
(16, 59, 'moidul islam', 't@gmail.com', 'khairabad, rohanpur, gomostapur', 'selangor', 'malaysia', 123456, 'Moidul Islam', '232323232323232', '10/10', 2, 9, 313, '2021-03-17 01:52:01'),
(17, 59, 'moidul islam', 't@gmail.com', 'khairabad, rohanpur, gomostapur', 'selangor', 'malaysia', 123456, 'Moidul Islam', '1314141414141414', '10/10', 2, 9, 234, '2021-03-17 01:56:25'),
(18, 59, 'moidul islam', 't@gmail.com', 'khairabad, rohanpur, gomostapur', 'selangor', 'dhaka', 123456, 'Moidul Islam', '324324242424244', '10/10', 2, 11, 345, '2021-03-17 02:01:08'),
(19, 60, 'omar musa', 'omar@gmail.com', 'khairabad, rohanpur, gomostapur', 'chapai nawa', 'dhaka', 470320, 'rhb', '9876543567965435', '12/22', 2, 14, 234, '2021-03-17 02:43:42'),
(20, 60, 'omar musa', 'omar@gmail.com', 'khairabad, rohanpur, gomostapur', 'chapai nawa', 'dhaka', 123456, 'Moidul Islam', '5454 3454 3545 4545', '10/10', 2, 9, 543, '2021-03-17 03:14:46'),
(21, 60, 'omar musa', 'omar@gmail.com', 'khairabad, rohanpur, gomostapur', 'chapai nawa', 'dhaka', 123456, 'Moidul Islam', '5454 5454 5454 5454', '12/21', 2, 9, 564, '2021-03-17 03:18:46'),
(22, 60, 'omar musa', 'omar@gmail.com', 'khairabad, rohanpur, gomostapur', 'chapai nawa', 'dhaka', 123456, 'Moidul Islam', '5467 8998 6554 5667', '12/23', 1, 4, 233, '2021-03-17 04:00:09'),
(23, 60, 'omar musa', 'omar@gmail.com', 'khairabad, rohanpur, gomostapur', 'chapai nawa', 'dhaka', 470320, 'Moidul Islam', '2345677788899998', '12/55', 3, 27, 334, '2021-03-17 04:02:17'),
(24, 61, 'amar ali', 'amar@gmail.com', 'khairabad, rohanpur, gomostapur', 'chapai nawa', 'dhaka', 123456, 'Moidul Islam', '6565 6656 5656 5656', '10/12', 3, 18, 543, '2021-03-17 04:38:51'),
(25, 61, 'amar ali', 'amar@gmail.com', 'khairabad, rohanpur, gomostapur', 'chapai nawa', 'dhaka', 123456, 'Moidul Islam', '3242424224242424', '10/10', 1, 5, 423, '2021-03-17 04:47:23'),
(26, 60, 'omar musa', 'omar@gmail.com', 'khairabad, rohanpur, gomostapur', 'chapai nawa', 'dhaka', 123456, 'Moidul Islam', '6456 4546 4646 4646', '10/12', 1, 5, 123, '2021-03-17 05:00:34'),
(27, 60, 'omar musa', 'omar@gmail.com', 'khairabad, rohanpur, gomostapur', 'chapai nawa', 'dhaka', 123456, 'Moidul Islam', '4567 9075 3446 8865', '10/10', 3, 20, 234, '2021-03-17 05:14:59'),
(28, 60, 'omar musa', 'omar@gmail.com', 'khairabad, rohanpur, gomostapur', 'chapai nawabganj', 'dhaka', 632045, 'islami', '2345433433344532', '12/22', 1, 5, 342, '2021-03-22 04:24:44'),
(29, 60, 'omar musa', 'omar@gmail.com', 'khairabad, rohanpur, gomostapur', 'chapai nawa', 'malaysia', 632045, 'islami', '1235667757987654', '12/22', 1, 10, 234, '2021-03-22 04:27:48'),
(30, 53, 'moidul islam', 'moidulislam826@gmail.com', 'kelanajaya', 'selangor', 'malaysia', 470320, 'rhb', '1248957478939876', '12/22', 1, 5, 235, '2021-03-23 21:44:01'),
(31, 53, 'moidul islam', 'moidulislam826@gmail.com', 'kelanajaya', 'selangor', 'dhaka', 632045, 'rhb', '1234798765434567', '12/22', 2, 14, 342, '2021-03-23 22:12:43'),
(32, 53, 'moidul islam', 'moidulislam826@gmail.com', 'kelanajaya', 'selangor', 'dhaka', 632045, 'rhb', '1223432234398765', '12/22', 1, 4, 321, '2021-03-30 02:04:54'),
(33, 66, 'ka ki', 'ka@gmail.com', 'khairabad, rohanpur, gomostapur', 'chapai nawa', 'dhaka', 470320, 'rhb', '1234560987654321', '11/23', 3, 20, 657, '2021-03-30 03:17:53'),
(34, 66, 'ka ki', 'ka@gmail.com', 'khairabad, rohanpur, gomostapur', 'chapai nawa', 'dhaka', 470320, 'rhb', '9876543234567890', '11/22', 1, 5, 345, '2021-03-30 03:27:02'),
(35, 67, 'ales ali', 'al@gmail.com', 'kelanajaya', 'selangor', 'malaysia', 123456, 'rhb', '9876534262626526', '11/23', 2, 11, 456, '2021-03-30 03:36:13'),
(36, 53, 'moidul islam', 'moidulislam826@gmail.com', 'kelanajaya', 'selangor', 'malaysia', 632045, 'rhb', '0987654321234567', '12/23', 2, 9, 897, '2021-04-01 05:40:42'),
(37, 53, 'moidul islam', 'moidulislam826@gmail.com', 'kelanajaya', 'selangor', 'malaysia', 123456, 'rhb', '0987654321234567', '12/23', 1, 4, 98, '2021-04-01 06:26:14'),
(38, 53, 'moidul islam', 'moidulislam826@gmail.com', 'kelanajaya', 'selangor', 'malaysia', 632045, 'rhb', '0987654321234567', '12/23', 1, 10, 134, '2021-04-04 22:40:57'),
(39, 53, 'moidul islam', 'moidulislam826@gmail.com', 'kelanajaya', 'selangor', 'malaysia', 470320, 'rhb', '1234567898765432', '12/22', 1, 10, 342, '2021-04-04 22:47:39'),
(40, 53, 'moidul islam', 'moidulislam826@gmail.com', 'kelanajaya', 'selangor', 'malaysia', 470320, 'rhb', '0987654321234567', '12/22', 1, 10, 345, '2021-04-04 22:55:20'),
(41, 53, 'moidul islam', 'moidulislam826@gmail.com', 'kelanajaya', 'selangor', 'malaysia', 123456, 'rhb', '0987654321234567', '12/22', 1, 4, 234, '2021-04-04 23:05:46'),
(42, 53, 'moidul islam', 'moidulislam826@gmail.com', 'kelanajaya', 'selangor', 'malaysia', 123456, 'rhb', '1111111111111111', '12/23', 1, 4, 234, '2021-04-04 23:22:44'),
(43, 53, 'moidul islam', 'moidulislam826@gmail.com', 'kelanajaya', 'selangor', 'malaysia', 632045, 'rhb', '0987654321234567', '12/22', 1, 4, 654, '2021-04-05 00:11:06'),
(44, 53, 'moidul islam', 'tanjimul500@gmail.com', 'kelanajaya', 'selangor', 'malaysia', 470320, 'rhb', '0987654321234567', '12/22', 1, 4, 453, '2021-04-05 00:12:34'),
(45, 53, 'moidul islam', 'tanjimul500@gmail.com', 'kelanajaya', 'selangor', 'malaysia', 123456, 'rhb', '1234567890987654', '12/22', 1, 10, 342, '2021-04-05 00:17:29'),
(46, 53, 'moidul islam', 'moidulislam826@gmail.com', 'kelanajaya', 'selangor', 'malaysia', 632045, 'rhb', '1234567809876543', '12/23', 1, 4, 345, '2021-04-05 00:42:06'),
(47, 53, 'moidul islam', 'moidulislam826@gmail.com', 'kelanajaya', 'selangor', 'malaysia', 632045, 'rhb', '1234567809876543', '12/23', 1, 4, 345, '2021-04-05 00:55:06'),
(48, 53, 'moidul islam', 'moidulislam826@gmail.com', 'kelanajaya', 'selangor', 'malaysia', 632045, 'rhb', '0987654321234567', '12/23', 1, 10, 234, '2021-04-05 02:12:11'),
(49, 53, 'moidul islam', 'moidulislam826@gmail.com', 'kelanajaya', 'selangor', 'malaysia', 470320, 'rhb', '3475 489302 29874', '12/23', 1, 10, 231, '2021-04-05 02:19:17'),
(50, 53, 'moidul islam', 'moidulislam826@gmail.com', 'kelanajaya', 'selangor', 'malaysia', 470320, 'rhb', '3457 542356 77654', '12/23', 1, 5, 342, '2021-04-05 02:52:29'),
(51, 53, 'moidul islam', 'moidulislam826@gmail.com', 'kelanajaya', 'selangor', 'dhaka', 123456, 'rhb', '1235698765432345', '12/22', 1, 5, 234, '2021-04-05 03:31:49'),
(52, 70, 'omar musa', 'omarunitar@gmail.com', 'kelanajaya', 'selangor', 'malaysia', 632045, 'rhb', '1234698765432345', '12/22', 1, 5, 345, '2021-04-05 03:40:46'),
(53, 70, 'omar musa', 'omarunitar@gmail.com', 'kelanajaya', 'selangor', 'malaysia', 470320, 'rhb', '2356796543234567', '12/23', 2, 25, 345, '2021-04-05 03:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(22, 33, 24, 1, 5),
(23, 33, 33, 1, 5),
(24, 33, 36, 1, 10),
(25, 34, 94, 1, 5),
(26, 35, 24, 1, 5),
(27, 35, 32, 1, 6),
(28, 36, 24, 5, 25),
(29, 36, 25, 7, 28),
(30, 37, 25, 9, 36),
(31, 38, 34, 20, 200),
(32, 39, 34, 25, 250),
(33, 40, 34, 1, 10),
(34, 41, 25, 1, 4),
(35, 42, 25, 1, 4),
(36, 43, 25, 1, 4),
(37, 44, 27, 1, 4),
(38, 45, 34, 1, 10),
(39, 46, 27, 1, 4),
(40, 47, 27, 1, 4),
(41, 48, 36, 1, 10),
(42, 49, 36, 1, 10),
(43, 50, 97, 5, 25),
(44, 51, 94, 1, 5),
(45, 52, 98, 5, 25),
(46, 53, 98, 5, 25),
(47, 53, 99, 10, 200);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_owner` int(11) DEFAULT 32,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_stock` int(11) NOT NULL DEFAULT 0,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_owner`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_stock`, `product_desc`, `product_image`, `product_keywords`) VALUES
(24, 62, 2, 1, 'Onion', 5, 5, 'Vegetable item Onion', 'onion.jpg', 'Onion'),
(25, 62, 2, 1, 'Potato', 4, 68, 'Vegetable- Potato', 'potato.jpg', 'Potato'),
(27, 62, 2, 1, 'Bitter gourd', 4, 75, 'Vegetable- Bitter gourd', 'bittergourd.jpg', 'Bitter gourd'),
(32, 63, 2, 1, 'Bottle gourd', 6, 60, 'Vegetable-Bottle gourd', 'bottleGourd.jpg', 'Fresh bottle gourd'),
(33, 63, 2, 1, 'Fresh Cabbage', 5, 0, 'Vegetable-Cabbage', 'cabbage.jpg', 'Fresh Cabbage'),
(34, 63, 2, 4, 'Carrot', 10, 3, 'Vegetable-Carrot', 'carrot.jpg', 'Carrot'),
(35, 64, 2, 1, 'Cauliflower', 9, 0, 'Vegetable-Cauliflower', 'cauliflower.jpg', 'Fresh Cauliflower'),
(36, 64, 2, 1, 'Green Chili', 10, 3, 'Vegetable-Green Chili', 'greenchili.jpg', 'Green Chili'),
(37, 64, 2, 1, 'Red Chili', 8, 0, 'Vegetable-Red Chili', 'redchili.jpg', 'Redchili'),
(38, 32, 2, 1, 'sweet Potato', 5, 0, 'Vegetable- Sweet Potato', 'sweetPotato.jpg', 'Sweet Potato'),
(39, 32, 2, 1, 'Pumpkin', 6, 0, 'Vegetable-Pumpkin', 'pumpkin.jpg', 'Pumpkin'),
(40, 32, 2, 1, 'White Radish', 4, 0, 'White Radish', 'whiteradish.jpg', 'Vegetable- Whiteradish'),
(45, 32, 2, 1, 'Mushroom', 12, 0, 'Vegetable- Mushroom', 'mushroom.jpg', 'Mashroom'),
(46, 32, 2, 1, 'Lemon', 10, 0, 'Lemon', 'lemon.jpg', 'Lemon'),
(47, 32, 2, 1, 'Ladies\'Finger', 8, 0, 'Vegetable-Ladies\'Finger', 'lf.jpg', 'Ladies\'Finger'),
(48, 32, 2, 1, 'Green pea', 7, 0, 'Vegetable- Green Pea', 'greenPea.jpg', 'Green Pea'),
(49, 32, 2, 1, 'Garlic', 8, 0, 'Vegetable- Garlic', 'garlic.jpg', 'Garlic'),
(50, 32, 2, 1, 'Ginger', 6, 0, 'Ginger', 'ginger.jpg', 'Ginger'),
(51, 32, 3, 1, 'Aus Rice', 30, 0, 'Rice', 'ausRice.jpg', 'Aus Rice'),
(52, 32, 3, 1, 'Boro Rice', 35, 0, 'Rice', 'boroRice.jpg', 'Boro Rice'),
(53, 32, 3, 1, 'Amon Rice', 35, 0, 'Rice', 'redAmon.jpg', 'Red Amon Rice'),
(54, 32, 3, 1, 'Masur Dal', 8, 0, 'Lentil', 'redLentil.jpg', 'Red Lentil'),
(55, 32, 3, 1, 'Mugh Dal', 8, 0, 'Lentil', 'mughDal.jpg', 'Mujh Dal'),
(56, 32, 3, 1, 'khesariDal.jpg', 6, 0, 'Khesari Dal', 'khesariDal.jpg', 'Khesari Dal'),
(57, 32, 3, 1, 'Sunned Rice', 40, 0, 'Rice', 'atopRice.jpg', 'Sunned Rice'),
(58, 32, 3, 1, 'Buter Dal', 70, 0, 'Lentil', 'chanaDal.jpg', 'Buter Dal'),
(59, 32, 4, 1, 'Milk', 7, 0, 'Milk', 'milk.jpg', 'Milk'),
(60, 32, 4, 2, 'Sweet Curd', 9, 0, 'Curd', 'sweetCurd.jpg', 'Sweet Curd'),
(61, 32, 4, 2, 'Yogurt', 7, 0, 'Yogurt', 'yogurt.jpg', 'Yogurt'),
(62, 32, 4, 2, 'Cheese', 6, 0, 'Cheese', 'cheese.jpg', 'Cheese'),
(63, 32, 4, 2, 'Butter', 6, 0, 'Butter', 'butter.jpg', 'Butter'),
(72, 32, 2, 1, 'Fresh Lemon', 4, 0, 'Fresh Lemon', 'lemon.jpg', 'Fruits'),
(73, 32, 4, 2, 'Swiss Cheese', 10, 0, 'Fresh Swiss Cheese', 'cheese.jpg', 'Fresh Swiss Cheese'),
(74, 32, 3, 1, 'Sunned Rice', 40, 0, 'Sunned Rice', 'atopRice.jpg', 'Sunned Rice'),
(87, 32, 1, 2, 'dragon', 6, 0, 'good', '1608046978_dragon.jpg', 'dragon'),
(88, 32, 1, 1, 'Apple', 5, 0, 'nice fruit', '1608124139_apple.jpg', 'Apple'),
(89, 32, 1, 1, 'Mango', 5, 0, 'its a very nice fruit .', '1608124506_mango.jpg', 'Mango'),
(90, 32, 1, 1, 'Jackfruit', 8, 0, 'it is national fruit in Bangladesh.', '1608124667_jackfruit.jpg', 'Jackfruit'),
(94, 65, 1, 1, 'Litchi', 5, 1, 'Its very nice', '1617096241_litchi.jpg', 'LITCHI'),
(97, 62, 2, 2, 'Banana', 5, 0, 'nice', '1617612455_banana.jfif', 'Banana'),
(98, 69, 1, 2, 'Banana', 5, 0, 'nice', '1617615476_banana.jfif', 'Banana'),
(99, 63, 1, 2, 'Banana', 20, 10, 'nice', '1617615934_banana1.jfif', 'Banana');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `user_type` int(11) NOT NULL DEFAULT 2,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `user_type`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(32, 2, 'Tanimul ', 'islam', 'tanjimul@gmail.com', 'Tanvir123@', '01792426831', 'gyrest  tr dtdyfudt', 'hgfdt  rdrd'),
(33, 1, 'Tanimul', 'islam', 'admin@gmail.com', 'Tanvir123@', '01792426831', '12, Madrashapara, Rohanpur, Gomastapur, Chapainawabganj', 'hgfdt  rdrd'),
(44, 3, 'abc', 'as', 'la@gmail.com', '123456789', '01778524292', 'kelanajaya', 'selangor'),
(45, 3, 'dcx', 'df', 'we@gmail.com', '123456789', '01774914681', 'dhaka', 'dhaka'),
(53, 3, 'moidul', 'islam', 'moidulislam826@gmail.com', '123456789', '01778524292', 'kelanajaya', 'selangor'),
(58, 3, 'bob', 'b', 'b@gmail.com', '123456789', '01778524292', 'kelanajaya', 'selangor'),
(59, 3, 'moidul', 'islam', 't@gmail.com', '123456789', '01774914681', 'khairabad, rohanpur, gomostapur', 'selangor'),
(60, 3, 'omar', 'musa', 'omar@gmail.com', '123456789', '01774914681', 'khairabad, rohanpur, gomostapur', 'chapai nawa'),
(61, 3, 'amar', 'ali', 'amar@gmail.com', '123123123', '01778524292', 'khairabad, rohanpur, gomostapur', 'chapai nawa'),
(62, 2, 'Farmer 1', 'islam', 'farmer1@gmail.com', '123456789', '01792426831', 'gyrest  tr dtdyfudt', 'hgfdt  rdrd'),
(63, 2, 'Farmer 2', 'islam', 'farmer2@gmail.com', '123456789', '01792426831', 'gyrest  tr dtdyfudt', 'hgfdt  rdrd'),
(64, 2, 'Farmer 3', 'islam', 'farmer3@gmail.com', '123456789', '01792426831', 'gyrest  tr dtdyfudt', 'hgfdt  rdrd'),
(66, 3, 'ka', 'ki', 'ka@gmail.com', '123456789', '01774914681', 'khairabad, rohanpur, gomostapur', 'chapai nawa'),
(67, 3, 'ales', 'ali', 'al@gmail.com', '123456789', '01774914681', 'kelanajaya', 'selangor'),
(69, 2, 'tuhin', 'fa', 'fa@gmail.com', '123456789', '01774914681', 'kelanajaya', 'selangor'),
(70, 3, 'omar', 'musa', 'omarunitar@gmail.com', '123456789', '01774914681', 'kelanajaya', 'selangor');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', '123456789', '9448121558', '123456789', 'sdcjns,djc'),
(14, 'hemanthu', 'reddy', 'hemanthreddy951@gmail.com', '123456788', '6526436723', 's,dc wfjvnvn', 'b efhfhvvbr'),
(15, 'hemu', 'ajhgdg', 'keeru@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(20, 'pramod', 'vh', 'pramod@gmail.com', '124335353', '9767645653', 'ksbdfcdf', 'sjrgrevgsib'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(26, 'Shebika', 'Sen', 'atoshi@gmail.com', 'shebika123', '0162761297', 'Khilkhet Dhaka-1229', 'Dhaka'),
(27, 'Humaira', 'Jim', 'jim98@gmail.com', 'jim123', '0162761297', 'Sirajgong', 'Sirajgong'),
(28, 'Fahim', 'Khan', 'fahim123@gmail.com', 'fahim123', '0172859642', 'Dhaka', 'Mirpur, Dha'),
(29, 'Shekha', 'Sen', 'shekhasen17@gmail.com', 'shekha123', '0172451983', 'Dhaka', 'Khilkhet Dh'),
(30, 'Shekha', 'Sen', 'shekhasen17@gmail.com', 'shekha123', '0172451983', 'Dhaka', 'Khilkhet Dh'),
(31, 'Shekha', 'Sen', 'shekhasen17@gmail.com', 'shekha123', '0172451983', 'Dhaka', 'Khilkhet Dh'),
(32, 'Tanimul ', 'islam', 'tanjimul@gmail.com', 'Tanvir123@', '0179242683', 'gyrest  tr dtdyfudt', 'hgfdt  rdrd'),
(33, 'Tanimul', 'islam', 'admin@gmail.com', 'Tanvir123@', '0179242683', '12, Madrashapara, Rohanpur, Gomastapur, Chapainawabganj', 'hgfdt  rdrd'),
(35, 'tuhin', 'ali', 'tu2@gmail.com', '123456789', '0177852429', 'khairabad, rohanpur, gomostapur', 'chapai nawa'),
(37, 'khalid', 'islam', 'k@gmail.com', '12345', '0989753225', 'raj', 'rohano'),
(38, 'tasnim', 'tun', 'tas@gmail.com', '12345', '0989753225', 'raj', 'rohano'),
(39, 'khalid', 'islam', 'admin@gmail.com', '12345', '0989753225', 'raj', 'rohano'),
(40, 'tasnim', 'tun', 'admin@gmail.com', 'saferh', '0989753225', 'raj', 'rohano'),
(41, 'test', 'islam', 'ca@gmail.com', '123456789', '0177852429', 'khairabad, rohanpur, gomostapur', 'chapai nawa'),
(42, 'cos two', 'ji', 'cccc@gmail.com', '234567890', '0177491468', 'kelanajaya', 'selangor'),
(43, 'papa', 'lo', 'bika@gmail.com', '123456789', '0177491468', 'kelanajaya', 'selangor'),
(44, 'abc', 'as', 'la@gmail.com', '123456789', '0177852429', 'kelanajaya', 'selangor'),
(45, 'dcx', 'df', 'we@gmail.com', '123456789', '0177491468', 'dhaka', 'dhaka'),
(46, 'titi', 'ti', 'ti@gmail.com', '123456789', '0177852429', 'kelanajaya', 'selangor'),
(47, 'tata', 'ta', 'ta@gmail.com', '123456789', '0177852429', 'kelanajaya', 'selangor'),
(48, 'ahmad', 'ali', 'ali@gmail.com', '123456789', '0177852429', 'kelanajaya', 'selangor'),
(49, 'asd', 'fgh', 'a@gmail.com', '123456789', '0177852429', 'kelanajaya', 'selangor'),
(50, 'zxc', 'zz', 'z@gmail.com', '123456789', '0177852429', 'kelanajaya', 'selangor'),
(51, 'alom', 'ali', 'aa@gmail.com', '123456789', '0177852429', 'kelanajaya', 'selangor'),
(52, 'apu', 'r', 'r@gmail.com', '123456789', '0177852429', 'kelanajaya', 'selangor'),
(53, 'moidul', 'islam', 'moidulislam826@gmail.com', '123456789', '0177852429', 'kelanajaya', 'selangor'),
(54, 'jolil', 'ali', 'jolil@gmail.com', '123456789', '0177852429', 'khairabad, rohanpur, gomostapur', 'chapai nawa'),
(55, 'ala', 'aa', 'aaa@gmail.com', '123456789', '0177852429', 'kelanajaya', 'selangor'),
(56, 'www', 'qw', 'w@gmail.com', '123456789', '0177491468', 'kelanajaya', 'selangor'),
(57, 'alis', 'as', 'ales@gmail.com', '123456789', '0177852429', 'kelanajaya', 'selangor'),
(58, 'bob', 'b', 'b@gmail.com', '123456789', '0177852429', 'kelanajaya', 'selangor'),
(59, 'moidul', 'islam', 't@gmail.com', '123456789', '0177852429', 'khairabad, rohanpur, gomostapur', 'selangor'),
(60, 'omar', 'musa', 'omar@gmail.com', '123456789', '0177491468', 'khairabad, rohanpur, gomostapur', 'chapai nawa'),
(61, 'amar', 'ali', 'amar@gmail.com', '123123123', '0177852429', 'khairabad, rohanpur, gomostapur', 'chapai nawa'),
(62, 'Farmer 1', 'islam', 'farmer1@gmail.com', '123456789', '0179242683', 'gyrest  tr dtdyfudt', 'hgfdt  rdrd'),
(63, 'Farmer 2', 'islam', 'farmer2@gmail.com', '123456789', '0179242683', 'gyrest  tr dtdyfudt', 'hgfdt  rdrd'),
(64, 'Farmer 3', 'islam', 'farmer3@gmail.com', '123456789', '0179242683', 'gyrest  tr dtdyfudt', 'hgfdt  rdrd'),
(65, 'ales', 'wan', 'wan@gmail.com', '123456789', '0177491468', 'khairabad, rohanpur, gomostapur', 'chapai nawa'),
(66, 'ka', 'ki', 'ka@gmail.com', '123456789', '0177491468', 'khairabad, rohanpur, gomostapur', 'chapai nawa'),
(67, 'ales', 'ali', 'al@gmail.com', '123456789', '0177491468', 'kelanajaya', 'selangor'),
(68, 'titu', 'ta', 'ta@gmail.com', '123456789', '0177491468', 'kelanajaya', 'selangor'),
(69, 'tuhin', 'fa', 'fa@gmail.com', '123456789', '0177491468', 'kelanajaya', 'selangor'),
(70, 'omar', 'musa', 'omarunitar@gmail.com', '123456789', '0177491468', 'kelanajaya', 'selangor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `farmer_info`
--
ALTER TABLE `farmer_info`
  ADD PRIMARY KEY (`farmer_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `farmer_info`
--
ALTER TABLE `farmer_info`
  MODIFY `farmer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
