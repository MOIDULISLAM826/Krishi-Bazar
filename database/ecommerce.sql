-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2020 at 06:39 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

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
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1),
(147, 51, '::1', 26, 1),
(148, 6, '::1', 26, 1),
(149, 60, '::1', 26, 1);

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
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

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
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Puneeth', 'puneethreddy951@gmail.com', 'Bangalore, Kumbalagodu, Karnataka', 'Bangalore', 'Karnataka', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 77000, 1234);

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
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 1, 'Green Coconut', 50, 'Green Coconut', 'greencoconut.jpg', 'Green Coconut'),
(2, 1, 1, 'Fresh cucumber', 70, 'Nutrients. Cucumbers are packed with them. In just a single cup of cucumber slices, you\'ll get 14% to 19% of the vitamin K you need for the day. You\'ll also get vitamins B and C along with minerals like copper, phosphorus, potassium, and magnesium.', 'cucumber.jpg', 'Fresh Cucumber'),
(3, 1, 1, 'coconut', 65, 'Coconut is the fruit of the coconut palm (Cocos nucifera). It\'s used for its water, milk, oil, and tasty meat. Coconuts have been grown in tropical regions for more than 4,500 years but recently increased in popularity for their flavor, culinary uses, and potential health benefits', 'coconut.jpg', 'Coconut'),
(4, 1, 1, 'Pomelo fruit (jumbura)', 40, 'The pomelo is a large citrus fruit, 15–25 centimetres (6–10 in) in diameter, usually weighing 1–2 kilograms (2–4 lb). It has a thicker rind than a grapefruit. Containing 11–18 segments, the flesh tastes like a mild grapefruit (believed to be a hybrid of Citrus maxima and the orange).jambura', 'jambura(pomelo).jpg', 'Pomelo fruit (jumbura)'),
(5, 1, 1, 'Dragon Fruit', 750, 'A pitaya or pitahaya is the fruit of several different cactus species indigenous to the Americas. Pitaya usually refers to fruit of the genus Stenocereus, while pitahaya or dragon fruit refers to fruit of the genus Hylocereus, both in the family Cactaceae.', 'dragon.jpg', 'Dragon Fruits'),
(6, 1, 1, 'Fresh Banana', 80, 'A banana is an elongated, edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa. In some countries, bananas used for cooking may be called \"plantains\", distinguishing them from dessert bananas.', 'banana.jpg', 'Fresh Banana'),
(7, 1, 1, 'Fresh Apple', 150, '    Apples Are Nutritious. Apples May Be Good for Weight Loss. Apples May Be Good for Your Heart.They\'re Linked to a Lower Risk of Diabetes.They May Have Prebiotic Effects and Promote Good Gut Bacteria. Substances in Apples May Help Prevent Cancer. Apples Contain Compounds That Can Help Fight Asthma.', 'apple.jpg', 'Fresh Apple'),
(8, 1, 1, 'Grapes', 300, 'Grapes are a good source of potassium, a mineral that helps balance fluids in your body. Potassium can help bring down high blood pressure and lower your risk of heart disease and stroke. Most people don\'t get enough of this nutrient, so eating grapes can help fill the gap.', 'grapes.jpg', 'Fresh Grapes'),
(9, 1, 1, 'Fresh Guava', 60, 'guava leaves are used as an herbal tea and the leaf extract as a supplement. Guava fruits are amazingly rich in antioxidants, vitamin C, potassium, and fiber.', 'guava.jpg', 'Fresh Guava'),
(10, 1, 1, 'Fresh Jackfruit', 120, 'Constipation. Jackfruit is a good source of fiber, so it could help you feel fuller for longer and help keep your bowel movements regular.', 'jackfruit.jpg', 'Fresh Jackfruit'),
(11, 1, 1, 'Fresh White Jamrul', 80, 'It is a tropical fruit that grows in south-east Asia, including southern India, Indonesia and Malaysia. ... It has a glossy, thin, green or red skin, though a variety of the fruit in Indonesia has a white skin.', 'jamrul.jpg', 'Fresh White Jamrul'),
(12, 1, 1, 'Fresh Red Jamrul ', 85, 'It is a tropical fruit that grows in south-east Asia, including southern India, Indonesia and Malaysia. ... It has a glossy, thin, green or red skin, though a variety of the fruit in Indonesia has a white skin.', 'redJamrul.jpg', 'Fresh Red Jamrul'),
(13, 1, 1, 'Fresh Boroi', 75, 'Fresh Boroi Fruit,', 'jujbue(boroi).jpg', 'Fresh Boroi'),
(14, 1, 1, 'Litchi', 250, 'A small rounded fruit with sweet white scented flesh, a large central stone, and a thin rough skin.', 'litchi.jpg', 'Litchi Fruit\r\n'),
(15, 1, 1, 'Fresh Orange', 120, 'Orange', 'orange.jpg', 'Fresh Orange'),
(16, 1, 1, 'Fresh Mango', 70, 'Fresh Mango of Rajsahi', 'mango.jpg', 'Fresh Mango'),
(17, 1, 1, 'Olive', 60, 'Fresh olive', 'olive.jpg', 'Fresh Olive'),
(19, 1, 1, 'Papaya', 20, 'Fresh Rip Papaya', 'papaya.jpg', 'Fresh Rip Papaya'),
(20, 1, 1, 'Pineapple', 50, 'Fresh Pineapple', 'pineapple.jpg', 'Fresh Pineapple'),
(21, 1, 1, 'Watermelon', 100, 'ssds', 'watermelon.jpg', 'Fresh Watermelon'),
(22, 1, 1, 'Sugarcane', 30, 'Sugarcane ', 'sugarcane.jpg', 'Fresh Sugarcane'),
(23, 1, 1, 'Pomegranate', 1900, 'Fresh Pomegranate', 'pomegranate.jpg', 'Fresh Pomegranate'),
(24, 2, 1, 'Onion', 30, 'Vegetable item Onion', 'onion.jpg', 'Onion'),
(25, 2, 1, 'Potato', 15, 'Vegetable- Potato', 'potato.jpg', 'Potato'),
(27, 2, 1, 'Bitter gourd', 40, 'Vegetable- Bitter gourd', 'bittergourd.jpg', 'Bitter gourd'),
(32, 2, 1, 'Bottle gourd', 65, 'Vegetable-Bottle gourd', 'bottleGourd.jpg', 'Fresh bottle gourd'),
(33, 2, 1, 'Fresh Cabbage', 20, 'Vegetable-Cabbage', 'cabbage.jpg', 'Fresh Cabbage'),
(34, 2, 4, 'Carrot', 1000, 'Vegetable-Carrot', 'carrot.jpg', 'Carrot'),
(35, 2, 1, 'Cauliflower', 20, 'Vegetable-Cauliflower', 'cauliflower.jpg', 'Fresh Cauliflower'),
(36, 2, 1, 'Green Chili', 200, 'Vegetable-Green Chili', 'greenchili.jpg', 'Green Chili'),
(37, 2, 1, 'Red Chili', 250, 'Vegetable-Red Chili', 'redchili.jpg', 'Redchili'),
(38, 2, 1, 'sweet Potato', 25, 'Vegetable- Sweet Potato', 'sweetPotato.jpg', 'Sweet Potato'),
(39, 2, 1, 'Pumpkin', 60, 'Vegetable-Pumpkin', 'pumpkin.jpg', 'Pumpkin'),
(40, 2, 1, 'White Radish', 40, 'White Radish', 'whiteradish.jpg', 'Vegetable- Whiteradish'),
(45, 2, 1, 'Mushroom', 300, 'Vegetable- Mushroom', 'mushroom.jpg', 'Mashroom'),
(46, 2, 1, 'Lemon', 10, 'Lemon', 'lemon.jpg', 'Lemon'),
(47, 2, 1, 'Ladies\'Finger', 30, 'Vegetable-Ladies\'Finger', 'lf.jpg', 'Ladies\'Finger'),
(48, 2, 1, 'Green pea', 120, 'Vegetable- Green Pea', 'greenPea.jpg', 'Green Pea'),
(49, 2, 1, 'Garlic', 120, 'Vegetable- Garlic', 'garlic.jpg', 'Garlic'),
(50, 2, 1, 'Ginger', 150, 'Ginger', 'ginger.jpg', 'Ginger'),
(51, 3, 1, 'Aus Rice', 30, 'Rice', 'ausRice.jpg', 'Aus Rice'),
(52, 3, 1, 'Boro Rice', 35, 'Rice', 'boroRice.jpg', 'Boro Rice'),
(53, 3, 1, 'Amon Rice', 35, 'Rice', 'redAmon.jpg', 'Red Amon Rice'),
(54, 3, 1, 'Masur Dal', 90, 'Lentil', 'redLentil.jpg', 'Red Lentil'),
(55, 3, 1, 'Mugh Dal', 100, 'Lentil', 'mughDal.jpg', 'Mujh Dal'),
(56, 3, 1, 'khesariDal.jpg', 60, 'Khesari Dal', 'khesariDal.jpg', 'Khesari Dal'),
(57, 3, 1, 'Sunned Rice', 60, 'Rice', 'atopRice.jpg', 'Sunned Rice'),
(58, 3, 1, 'Buter Dal', 70, 'Lentil', 'chanaDal.jpg', 'Buter Dal'),
(59, 4, 1, 'Milk', 70, 'Milk', 'milk.jpg', 'Milk'),
(60, 4, 2, 'Sweet Curd', 150, 'Curd', 'sweetCurd.jpg', 'Sweet Curd'),
(61, 4, 2, 'Yogurt', 100, 'Yogurt', 'yogurt.jpg', 'Yogurt'),
(62, 4, 2, 'Cheese', 1200, 'Cheese', 'cheese.jpg', 'Cheese'),
(63, 4, 2, 'Butter', 2000, 'Butter', 'butter.jpg', 'Butter'),
(70, 1, 1, 'Fresh guava', 50, 'fruits', 'guava.JPG', 'Fresh Guava'),
(71, 1, 1, 'Fresh Dragon Fruit', 500, 'Fresh Dragon Fruit', 'dragon.jpg', 'Fruits'),
(72, 2, 1, 'Fresh Lemon', 20, 'Fresh Lemon', 'lemon.jpg', 'Fruits'),
(73, 4, 2, 'Swiss Cheese', 2000, 'Fresh Swiss Cheese', 'cheese.jpg', 'Fresh Swiss Cheese'),
(74, 3, 1, 'Sunned Rice', 40, 'Sunned Rice', 'atopRice.jpg', 'Sunned Rice'),
(75, 1, 1, 'Mango', 80, 'Fresh Mango', 'mango.jpg', 'Fresh Mango'),
(83, 1, 1, 'Fresh Kotbel', 10, 'Kotbel is a Testy Bangladeshi fruit.', '1602187065_kotbel.JPG', 'Kotbel');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
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

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', 'puneeth', '9448121558', '123456789', 'sdcjns,djc'),
(15, 'hemu', 'ajhgdg', 'puneethreddy951@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(26, 'Shebika', 'Sen', 'atoshi@gmail.com', 'shebika123', '0162761297', 'Khilkhet Dhaka-1229', 'Dhaka'),
(27, 'Humaira', 'Jim', 'jim98@gmail.com', 'jim123', '0162761297', 'Sirajgong', 'Sirajgong'),
(28, 'Fahim', 'Khan', 'fahim123@gmail.com', 'fahim123', '01728596421', 'Dhaka', 'Mirpur, Dha'),
(29, 'Shekha', 'Sen', 'shekhasen17@gmail.com', 'shekha123', '01724519838', 'Dhaka', 'Khilkhet Dh'),
(30, 'Shekha', 'Sen', 'shekhasen17@gmail.com', 'shekha123', '01724519838', 'Dhaka', 'Khilkhet Dh'),
(31, 'Shekha', 'Sen', 'shekhasen17@gmail.com', 'shekha123', '01724519838', 'Dhaka', 'Khilkhet Dh');

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
(31, 'Shekha', 'Sen', 'shekhasen17@gmail.com', 'shekha123', '0172451983', 'Dhaka', 'Khilkhet Dh');

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

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
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
