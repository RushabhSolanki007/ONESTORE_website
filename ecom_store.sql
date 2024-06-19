-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2022 at 03:07 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_pass` varchar(255) NOT NULL,
  `admin_image` text NOT NULL,
  `admin_country` text NOT NULL,
  `admin_about` text NOT NULL,
  `admin_contact` varchar(255) NOT NULL,
  `admin_job` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_name`, `admin_email`, `admin_pass`, `admin_image`, `admin_country`, `admin_about`, `admin_contact`, `admin_job`) VALUES
(7, 'G 2 Group', 'g2@gmail.com', '1234', 'wallpaperflare.com_wallpaper (3).jpg', 'India', 'it is just for testing.\r\n', '9999999999', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `boxes_section`
--

CREATE TABLE `boxes_section` (
  `box_id` int(10) NOT NULL,
  `box_title` text NOT NULL,
  `box_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(255) NOT NULL,
  `qty` int(10) NOT NULL,
  `p_price` varchar(255) NOT NULL,
  `size` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(10) NOT NULL,
  `cat_title` text NOT NULL,
  `cat_top` text NOT NULL,
  `cat_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`, `cat_top`, `cat_image`) VALUES
(1, 'Man', 'yes', 'men.jpg'),
(2, 'Women', 'yes', 'women.jpg'),
(3, 'Kids', 'no', 'kids2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(10) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_pass` varchar(255) NOT NULL,
  `customer_country` text NOT NULL,
  `customer_city` text NOT NULL,
  `customer_contact` varchar(255) NOT NULL,
  `customer_address` text NOT NULL,
  `customer_image` text NOT NULL,
  `customer_ip` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_email`, `customer_pass`, `customer_country`, `customer_city`, `customer_contact`, `customer_address`, `customer_image`, `customer_ip`) VALUES
(13, 'G 2 Group', 'g2@gmail.com', '1234', 'India', 'surendranagar', '1111111111', 'C. U. Shah government polytechnic ', 'wallpaperflare.com_wallpaper (3).jpg', '::1'),
(15, 'Shaktisinh Parmar', 'sp@gmail.com', '12345', 'India', 'Surendranagar', '9595959595', 'C U Shah govt Polytechnic Surenranagar', 'shaktisinh parmar.png', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `customer_orders`
--

CREATE TABLE `customer_orders` (
  `order_id` int(10) NOT NULL,
  `s_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `due_amount` int(100) NOT NULL,
  `invoice_no` int(100) NOT NULL,
  `qty` int(10) NOT NULL,
  `size` text NOT NULL,
  `order_address` text NOT NULL,
  `order_date` date NOT NULL,
  `order_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
  `manufacturer_id` int(10) NOT NULL,
  `manufacturer_title` text NOT NULL,
  `manufacturer_top` text NOT NULL,
  `manufacturer_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`manufacturer_id`, `manufacturer_title`, `manufacturer_top`, `manufacturer_image`) VALUES
(2, 'ALLEN SOLLY', 'yes', 'allen solly.png'),
(3, 'JACK & JONES', 'yes', 'jack & jones.png'),
(5, 'RAW VALLY', 'no', 'RAW VALLEY.png'),
(7, 'POLO', 'no', 'us polo.png'),
(8, 'TOMMY HILFIGER', 'yes', 'tommey hilfiger.png'),
(9, 'PUMA', 'no', 'puma.png');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(10) NOT NULL,
  `s_id` int(10) NOT NULL,
  `invoice_no` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  `payment_mode` text NOT NULL,
  `ref_no` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `payment_date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `s_id`, `invoice_no`, `amount`, `payment_mode`, `ref_no`, `code`, `payment_date`) VALUES
(1, 0, 1348428620, 1179, 'instramojo', 'a960f47135cd41dab74e8b9ebb39b3f8', 'MOJO2311605A87559534', '2022-03-11 12:33:41'),
(2, 0, 632128597, 799, 'Cash', '', '', ''),
(3, 0, 412296287, 3995, 'instramojo', '212e43715f68413b8c0e8356a8a28ee8', 'MOJO2324V05A02307981', '2022-03-24 11:40:03');

-- --------------------------------------------------------

--
-- Table structure for table `pending_orders`
--

CREATE TABLE `pending_orders` (
  `order_id` int(10) NOT NULL,
  `s_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `invoice_no` int(10) NOT NULL,
  `product_id` text NOT NULL,
  `qty` int(10) NOT NULL,
  `size` text NOT NULL,
  `order_address` text NOT NULL,
  `order_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(10) NOT NULL,
  `s_id` int(10) NOT NULL,
  `p_cat_id` int(10) NOT NULL,
  `cat_id` int(10) NOT NULL,
  `manufacturer_id` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `product_title` text NOT NULL,
  `product_url` text NOT NULL,
  `product_img1` text NOT NULL,
  `product_img2` text NOT NULL,
  `product_img3` text NOT NULL,
  `product_price` int(10) NOT NULL,
  `product_quantity` int(50) NOT NULL,
  `product_keywords` text NOT NULL,
  `product_desc` text NOT NULL,
  `product_features` text NOT NULL,
  `product_video` text NOT NULL,
  `product_label` text NOT NULL,
  `product_sale` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `s_id`, `p_cat_id`, `cat_id`, `manufacturer_id`, `date`, `product_title`, `product_url`, `product_img1`, `product_img2`, `product_img3`, `product_price`, `product_quantity`, `product_keywords`, `product_desc`, `product_features`, `product_video`, `product_label`, `product_sale`) VALUES
(1, 0, 1, 2, 3, '2022-03-28 09:42:39', 'Roadster', 'product-1', 'women jacket-1.jpg', 'women jacket-2.jpg', 'women jacket-3.jpg', 1319, 100, 'Women Red Solid Hooded Padded Jacket', '<p>Red solid Hooded padded jacket, has a stand collar, 2 pockets, zip closure, long sleeves, straight hem, and polyester lining</p>', '', '                                                                                                                                        ', 'sale', 50),
(2, 0, 1, 2, 2, '2022-03-28 07:36:56', 'SASSAFRAS', 'product-2', 'women jacket-4.jpg', 'women jacket-5.jpg', 'women jacket-6.jpg', 759, 10, 'Women Blue Solid Denim Jacket', '<p>Blue solid denim jacket with washed effect, has a spread collar, 2 pockets, button closures, long sleeves, straight hem</p>', '', '                                                                    ', 'sale', 699),
(3, 0, 1, 2, 2, '2022-03-28 07:55:52', 'Nautica', 'product-3', 'Women jacket-9.jpg', 'Women jacket-10.jpg', 'Women jacket-11.jpg', 4019, 0, 'Women Black Solid Sleeveless Padded Jacket', '<p>Black solid padded jacket with zip detail, has a stand collar, 2 pockets ,has a zip closure, sleeveless, straight hemline, polyester lining</p>', '', '                                                                    ', 'new', 3499),
(4, 0, 1, 2, 2, '2022-03-28 07:56:50', 'Tokyo Talkies', 'product-4', 'Women jacket-12.jpg', 'Women jacket-13.jpg', 'Women jacket-14.jpg', 824, 0, 'Women Black Puffer Jacket', '<p>Black checked solid puffer jacket with faux fur trim, has a mock collar, 2 pockets ,has a zip closure, long sleeves, straight hemline, without lining</p>', '', '                                                                    ', 'new', 649),
(5, 0, 1, 2, 2, '2022-03-28 07:57:57', 'Ursense', 'product-5', 'Women jacket-15.jpg', 'Women jacket-16.jpg', 'Women jacket-17.jpg', 899, 50, 'Women Navy Blue Solid Pleated Frayed Hem Front-Open Cotton Denim Jacket', '<p>Navy blue solid denim jacket with pleated detail and frayed hem, has a collarless, pockets three-quarter sleeves, straight hemline, without lining</p>', '', '                                                                    ', 'new', 749),
(6, 0, 1, 2, 2, '2022-03-28 07:58:38', 'SASSAFRAS', 'product-6', 'Women jacket-18.jpg', 'Women jacket-19.jpg', 'Women jacket-20.jpg', 764, 10, 'Women Maroon Solid Tailored Jacket', '<p>Maroon solid tailored jacket, has a mock collar, button closures, long sleeves, panelled flared hem, fleece lining</p>', '', '                                                                    ', 'sale', 699),
(7, 0, 1, 2, 2, '2022-03-28 07:59:20', 'Campus Sutra', 'product-7', 'women jacket-21.jpg', 'women jacket-22.jpg', 'women jacket-23.jpg', 874, 80, 'Women Blue Solid Tailored Jacket', '<p>Blue solid tailored jacket, has a stand collar, 2 pockets, button closure, long sleeves, straight hem, and cotton lining</p>', '', '                                                                    ', 'sale', 689),
(11, 0, 2, 2, 8, '2022-03-28 08:05:59', 'Tommy Hilfiger Handbags', 'product-8', 'Accessories For Women-1.jpg', 'Accessories For Women-2.jpg', 'Accessories For Women-3.jpg', 2249, 53, 'Olive Green Croc Textured Structured Sling Bag', '<p>Olive green croc textured sling bag, with 1 main compartment, has a button closure, 1 inner pocket With a detachable sling strap</p>', '', '                                                                    ', 'new', 1999),
(12, 0, 2, 2, 8, '2022-03-28 08:06:49', 'CARLINGTON', 'product-9', 'Accessories For Women-4.jpg', 'Accessories For Women-5.jpg', 'Accessories For Women-6.jpg', 999, 20, 'Women Rose Gold-Toned Dial Stainless Steel Bracelet Style Straps Analogue Watch', '<p>Pack Contains: single watch<br />Display: analogue<br />Movement: quartz<br />Power Source: battery<br />Dial style: rose gold-toned solid round alloy dial<br />Features: reset time, Strap Style: rose gold toned, bracelet style, stainless steel strap with a button<br />Water resistance: water resistant Comes in a signature CARLINGTON case<br />Warranty: 6 months<br />Warranty provided by brand owner/manufacturer</p>', '', '                                                                                                                                        ', 'sale', 899),
(13, 0, 2, 2, 8, '2022-03-28 08:08:03', 'Daniel Klein', 'product-10', 'Accessories For Women-7.jpg', 'Accessories For Women-7.jpg', 'Accessories For Women-7.jpg', 1785, 80, 'Premium Women Off-White Analogue Watch DK11914-5', '<p>Display: Analogue<br />Movement: Quartz<br />Power source: Battery<br />Dial style: Textured round stainless steel dial<br />Features: Reset Time<br />Strap style: Rose Gold-Toned bracelet style, stainless steel strap with a foldover closure<br />Water resistance: 30 m<br />Warranty: 2 years<br />Warranty provided by brand/manufacturer</p>', '', '                                                                    ', 'sale', 1499),
(14, 0, 2, 2, 8, '2022-03-28 10:17:01', 'Wildcraft', 'product-11', 'Accessories For Women-10.jpg', 'Accessories For Women-11.jpg', 'Accessories For Women-12.jpg', 719, 10, 'Women Orange & Blue Graphic Backpack', '<p>Orange and blue graphic printed backpack Padded haul loop<br />1 main compartment with zip closure<br />Padded Mesh back<br />Zip Pocket<br />Padded shoulder strap: Padded<br />Water-resistance: No<br />Volume: up to 23 litres<br />Warranty: 18 months<br />Warranty provided by brand/manufacturer</p>', '', '                                                                                                                                                                                                            ', 'sale', 549),
(15, 0, 2, 2, 2, '2022-03-28 08:21:11', 'HRX By Hrithik Roshan Outdoor Masks(pack of 3)', 'product-12', 'Accessories For Women-13.jpg', 'Accessories For Women-14.png', 'Accessories For Women-15.jpg', 303, 52, 'Unisex Pack of 3 Protekt-X Reusable 4-Layer Face Masks', '<p>Pack of 3 Black, navy blue and maroon Solid Protekt-X Reusable 4-Layer Face Masks<br />4-Layer Filtration System<br />Layer 1:Premium Breathable Soft-finish fabric<br />Layer 2 and 3: Dual melt blown, non-woven filter<br />Layer 4:Soft breathable poly cotton fabric with antimicrobial wash</p>', '', '                                                                    ', 'new', 249),
(16, 0, 2, 2, 8, '2022-03-28 08:21:58', 'Wings Headphones', 'product-13', 'Accessories For Women-16.jpg', 'Accessories For Women-17.jpg', 'Accessories For Women-16.jpg', 1999, 0, 'PowerPods M Bluetooth 5.0 True Wireless Earbuds', '<p>DIGITAL DISPLAY CASE : The ONLY product in the market to have a unique digital battery display screen . You can check the exact power left in the charging case at all times<br />TOUCH SENSOR CONTROLS - Change songs, adjust volume , answer calls all with simple touch controls on left and right ear buds<br />POWER BANK FUNCTION : A whopping 2500 Mah charging case can be used to charge your mobile as well on the go so you and your mobile never run out of charge<br />50 HOURS PLAYTIME - Each earbud can play upto 5 hours on a single charge. Charging case gives upto 10 full charges<br />LED RING INDICATOR - Each earbud has a stylish LED light around it which is sure to attract attention. Go ahead. Flaunt it.<br />VOICE ASSISTANT FEATURE : Google and Siri voice assitants can easily be enabled using the touch panel on the earbuds<br />STEREO CALLING : Listen through both earbuds while on call with stereo calling feature and in built HD mic<br />1 YEAR BRAND WARRANTY - Provided by the manufacturer from date of purchase<br />Warranty: 1 year Brand Warranty provided by Brand Owner / Manufacturer owner / manufacturer from date of purchase.</p>', '', '                                                                    ', 'sale', 1000),
(17, 0, 2, 2, 2, '2022-03-28 08:22:26', 'DressBerry Handbags', 'product-14', 'Accessories For Women-19.jpg', 'Accessories For Women-20.jpg', 'Accessories For Women-21.jpg', 1399, 20, 'Maroon Solid Shoulder Bag', '<p>Maroon solid shoulder bag, has a zip closure 1 main compartment, 1 external and 3 inner pockets<br />Tablet sleeve: No<br />Two Handles with a detachable sling strap</p>', '', '                                                                    ', 'new', 1199),
(21, 0, 3, 2, 9, '2022-03-28 08:25:15', 'Alishtezia Casual Shoes', 'product-15', 'women Shoes-1.jpg', 'women Shoes-2.jpg', 'women Shoes-3.jpg', 799, 80, 'Women White Colourblocked PU Sneakers', '<p>A pair of round toe white sneakers ,has regular styling, Lace-ups detail Pu upper Cushioned footbed Textured and patterned outsole</p>', '', '                                                                    ', 'sale', 699),
(22, 0, 3, 2, 9, '2022-03-28 08:26:50', 'ZAPATOZ Heels', 'product-16', 'women Shoes-4.jpg', 'women Shoes-5.jpg', 'women Shoes-6.jpg', 689, 120, 'Women Black Solid Heeled Boots', '<p>A pair of black round toe heeled boots, has high-top styling, lace-ups detail<br />PU upper<br />Cushioned footbed<br />Textured and patterned outsole, has a platform heel</p>', '', '                                                                    ', 'sale', 599),
(23, 0, 3, 2, 9, '2022-03-28 08:27:33', 'DressBerry Casual Shoes', 'product-17', 'women Shoes-7.jpg', 'women Shoes-8.jpg', 'women Shoes-9.jpg', 749, 80, 'Women Navy Blue Printed Loafers', '<p>A pair of round toe navy blue printed loafers, has regular styling Slip-on detail Synthetic upper Cushioned footbed Textured and patterned outsole<br />Warranty: 1 month<br />Warranty provided by brand owner/manufacturer</p>', '', '                                                                    ', 'sale', 689),
(24, 0, 5, 2, 7, '2022-03-28 08:34:50', 'HRX By Hrithik Roshan', 'product-18', 'Women T-shirt-1.jpg', 'Women T-shirt-2.jpg', 'Women T-shirt-3.jpg', 299, 40, 'Women Peach Beige Rapid-Dry Running T-shirt', '', 'Set a new record every time you go for a run in the HRX Women\'s Running T-shirt. The Rapid Dry and Anti microbial technology wick always sweat and keep body odor at bay to minimize distractions and keep you focused on crossing the finish line.', '                                                                    ', 'new', 249),
(25, 0, 5, 2, 7, '2022-03-28 08:35:26', 'SASSAFRAS ', 'product-19', 'Women T-shirt-4.jpg', 'Women T-shirt-5.jpg', 'Women T-shirt-6.jpg', 499, 50, 'Women Black Ribbed T-shirt', '<p>Black ribbed T-shirt, has a stylised round neck, and three-quarter sleeves</p>', '', '                                                                    ', 'new', 349),
(26, 0, 5, 2, 3, '2022-03-28 08:41:01', 'Roadster', 'product-20', 'Women T-shirt-7.jpg', 'Women T-shirt-8.jpg', 'Women T-shirt-9,jpg', 359, 0, 'Time Travlr Women Grey Solid Round Neck T-shirt', '<p>Grey solid T-shirt, has a round neck, three-quarter sleeves</p>', '', '                                                                    ', 'sale', 150),
(27, 0, 5, 2, 7, '2022-03-28 08:41:53', 'Roadster', 'product-21', 'Women T-shirt-10.jpg', 'Women T-shirt-11.jpg', 'women T-shirt-12.jpg', 399, 50, 'Women White Solid V-Neck T-shirt', '<p>White solid T-shirt, has an V-neck, and short sleeves</p>', '', '                                                                    ', 'new', 349),
(28, 0, 5, 2, 7, '2022-03-28 08:42:29', 'SASSAFRAS Tshirts', 'product-22', 'Women T-shirt-13.jpg', 'Women T-shirt-14.jpg', 'Women T-shirt-15.jpg', 399, 0, 'Women Fluorescent Green Boxy Fit Crop Cotton T-shirt', '<p>Fluorescent Green solid crop T-shirt with printed detail, has a round neck, and short sleeves</p>', '', '                                                                    ', 'new', 339),
(29, 0, 4, 2, 2, '2022-03-28 08:44:08', 'Athena Coats', 'product-23', 'Women coats-1.jpg', 'Women coats-2.jpg', 'Women coats-3.jpg', 2744, 15, 'Women Black Solid Longline Overcoat', '<p>Black solid longline overcoat, has a spread collar, double-breasted with button closure, long sleeves, two flap pockets, an attached lining Comes with a belt</p>', '', '                                                                    ', 'sale', 2499),
(30, 0, 4, 2, 2, '2022-03-28 08:44:33', 'Zastraa Coats', 'product-24', 'Women coats-4.jpg', 'Women coats-5.jpg', 'Women coats-6.jpg', 959, 50, 'Women Black Self Design Hip-Length Coat', '<p>Black self design hip-length front open coat has notched lapel, long sleeves, three pockets</p>', '', '                                                                    ', 'sale', 899),
(31, 0, 4, 2, 2, '2022-03-28 08:45:08', 'Athena Coats', 'product-25', 'Women coats-7.jpg', 'Women coats-8.jpg', 'Women coats-9.jpg', 2912, 60, 'Women Grey Melange Solid Overcoat', '<p>Grey melange solid single-breasted longline overcoat, has a notched lapel collar, long sleeves, two pockets, button closure, an attached lining Comes with a belt</p>', '', '                                                                    ', 'sale', 2699),
(32, 0, 4, 2, 2, '2022-03-28 08:45:44', 'All About You Coats', 'product-26', 'Women coats-10.jpg', 'Women coats-11.jpg', 'Women coats-12.jpg', 6499, 100, 'Luxe Collection Women Black Solid Double Breasted Longline Trench Coat', '<p>Black solid trench coat, has notched lapel, long sleeves, 3 pockets, button closure with belt detailing</p>', '', '                                                                    ', 'sale', 5999),
(33, 0, 4, 2, 2, '2022-03-28 08:46:38', 'Athena Coats', 'product-27', 'Women coats-13.jpg', 'Women coats-14.jpg', 'Women coats-15.jpg', 2449, 50, 'Luxe Collection Women Black Solid Double Breasted Longline Trench Coat', '<p>Black and grey colorblock overcoat, has a notched lapel collar, two pockets, an attached lining</p>', '', '                                                                    ', 'new', 2199),
(34, 0, 1, 1, 2, '2022-03-28 08:47:27', 'HIGHLANDER Jackets', 'product-28', 'Men jacket-1.jpg', 'Men jacket-2.jpg', 'Men jacket-3.jpg', 1299, 50, 'Men Blue Solid Denim Jacket', '<p>Blue solid denim jacket, has a stand collar, 4 pockets, zip closure, long sleeves, straight hem, and unlined</p>', '', '                                                                    ', 'new', 999),
(35, 0, 1, 1, 3, '2022-03-28 10:03:39', 'OCOMOTIVE Jackets', 'product-29', 'Men jacket-4.jpg', 'Men jacket-5.jpg', 'Men jacket-6.jpg', 1179, 80, 'Men Black Solid Denim Jacket', '<p>Black solid jacket, has a spread collar, 2 pockets, button closure, long sleeves, straight hem, and unlined</p>', '', '                                                                                                                                        ', 'new', 949),
(36, 0, 1, 1, 3, '2022-03-28 08:50:33', 'Campus Sutra Jackets', 'product-30', 'Men jacket-7.jpg', 'Men jacket-8.jpg', 'Men jacket-9.jpg', 839, 20, 'Men Off-White Solid Tailored Jacket', '<p>Off-white solid tailored jacket, has a hooded, 2 pockets, button closure, long sleeves, straight hem, and cotton lining</p>', '', '                                                                                                                                                                                                            ', 'new', 649),
(53, 8, 1, 1, 2, '2022-03-28 08:51:59', 'HERE&NOW', 'product-31', 'man jacket4.jpg', 'man jacket5.jpg', 'man jacket6.jpg', 2019, 30, 'HERE&NOW jackets', '<p>White colourblocked padded jacket, has a hood, 2 pockets , zip closure, long sleeves, straight hemline, polyester lining</p>', '', '                                                                                                                                                                                                                                                                                                                                                    ', 'new', 1899),
(54, 8, 1, 1, 2, '2022-03-28 08:52:33', 'Leather Retail', 'product-32', 'man jacket1.jpg', 'man jacket2.jpg', 'man jacket3.jpg', 2899, 30, 'Men Brown Asymmetric Closure Leather Jacket', '<p>Brown solid asymmetric closure leather jacket with shoulder tabs, has a lapel collar, 5 pockets, has a zip closure, long sleeves, straight hemline, polyester lining</p>', '', '                                                                                                                                                                                                            ', 'new', 2499),
(55, 8, 2, 3, 9, '2022-03-28 08:52:57', 'Puma', 'product-33', 'puma bag1.jpg', 'puma bag2.jpg', 'puma bag3.jpg', 1499, 20, 'Unisex Grey & Black Brand Logo Plus Backpack', '<p>Two-way zip opening into main compartment, zip opening into front pocket, lining laptop compartment inside main compartment, one side mesh pocket, adjustable and padded shoulder straps with reflective PUMA Cat branded loop, webbing carry handle, padded back panel</p>\r\n<p>Durabase material on base panel, PUMA branded 150D Polyester lining with PU backing, branded metal zip puller on main compartment, metal zip puller with webbing tape on front pocket</p>\r\n<p>Reflective Durabase logo tape on front panel</p>\r\n<p>PUMA Cat and PUMA wordmarked logo print on front panel</p>', '', '                                                                    ', 'sale', 1399),
(56, 8, 3, 1, 9, '2022-03-28 08:53:31', 'one8 x PUMA', 'product-34', 'puma1.jpg', 'puma2.jpg', 'puma3.jpg', 3999, 50, 'Men Navy Blue & Grey Virat Kohli Dart IDP Running Shoes', '<p>A pair of navy blue and grey running shoes, has regular styling</p>\r\n<p>Curved strap</p>\r\n<p>one8 insignia at the footbed</p>\r\n<p>one8 Logo</p>\r\n<p>Rubber Outsole</p>\r\n<p>Cushioned footbed</p>\r\n<p>Textured and patterned outsole</p>\r\n<p>Warranty: 3 months</p>\r\n<p>Warranty provided by Brand Owner/Manufacturer</p>', '', '                                                                                                                                        ', 'sale', 3499),
(57, 8, 3, 2, 9, '2022-03-28 08:53:52', 'Denill', 'product-35', 'women shoes1.jpg', 'women shoes2.jpg', 'women shoes3.jpg', 999, 20, 'Peach-Coloured Block Pumps', '<p>A pair of peach-coloured pumps ,has regular ankle and closed back</p>\r\n<p>Synthetic solid upper</p>\r\n<p>Cushioned footbed</p>\r\n<p>Textured and patterend outsole, has a block</p>', '', '                                                                    ', 'new', 899),
(58, 8, 4, 3, 2, '2022-03-28 08:55:17', 'Jeetethnics', 'product-36', 'kid suit1.jpg', 'kid suit2.jpg', 'kid suit3.jpg', 3899, 30, 'Boys Black Checked Coat Suit Set with Waistcoat Shirt and Trousers', '<p>Black Checked Coat Suit Set with Waistcoat Shirt and Trousers</p>\r\n<p>The contents include 1 Coat, 1 Waistcoat, 1 Shirt, 1 Pant and 1 Tie</p>\r\n<p>&nbsp;</p>', '', '                                                                    ', 'sale', 2565),
(59, 8, 1, 3, 2, '2022-03-28 08:55:41', 'BONKIDS', 'product-37', 'kid1.jpg', 'kid2.jpg', 'kid3.jpg', 1456, 49, 'Boys Blue & Red Spider Man Printed Hooded Sweatshirt', '<p>Blue spiderman printed sweatshirt has a hooded, long sleeves and straight hem</p>', '', '                                                                    ', 'sale', 799),
(63, 18, 5, 1, 7, '2022-03-28 13:46:44', 'Blackberrys', 'product-38', 'seller 1.png', 'seller 2.png', 'seller 3.png', 1499, 30, 'Men White Floral Print Polo Collar T-shirt', '<p>White Tshirt for men</p>\r\n<p>Floral printed</p>\r\n<p>Regular length</p>\r\n<p>Polo collar</p>\r\n<p>Short, regular sleeves</p>\r\n<p>Knitted cotton fabric</p>\r\n<p>Button closure</p>', '', '', 'new', 1000),
(64, 18, 4, 1, 7, '2022-03-28 13:50:27', 'Roadster', 'product-39', 'seller 4.png', 'seller 5.png', 'seller 6.png', 499, 55, 'Time Travlr Men Green Solid Polo Collar Pure Cotton T-shirt', '<p>Green solid T-shirt, has a polo collar, short sleeves</p>', '', '', 'sale', 450),
(65, 18, 6, 1, 5, '2022-03-28 14:04:05', 'HIGHLANDER', 'product-40', 'seller 7.png', 'seller 8.png', 'seller 9.png', 478, 55, 'Men White Slim Fit Casual Shirt', '<p>White solid casual shirt, has a mandarin collar, a button placket, 1 pocket, long sleeves with roll-up tab features, curved hem</p>\r\n<p>&nbsp;</p>', '', '                                                                                                                                                                                                                                                                                ', 'new', 450),
(66, 20, 6, 1, 5, '2022-03-28 14:11:50', 'Roadster', 'product-41', 'seller 10.png', 'seller 11.png', 'seller 12.png', 1319, 30, 'Men Blue Regular Fit Faded Casual Denim Sustainable Shirt', '<p>Blue faded casual shirt, has a mandarin collar, long sleeves, button placket, and curved hem</p>', '', '', 'new', 1000),
(67, 20, 6, 1, 5, '2022-03-28 14:17:11', 'WROGN', 'product-42', 'seller 13.png', 'seller 14.png', 'seller 15.png', 1499, 40, 'Men Burgundy Slim Fit Casual Shirt', '<p>Burgundy solid casual shirt, has a spread collar, long sleeves, button placket, curved hem, and 1 patch pocket</p>', '', '', 'sale', 1200),
(68, 20, 6, 1, 5, '2022-03-28 14:22:56', 'Bene Kleed', 'product-43', 'seller 16.png', 'seller 17.png', 'seller 18.png', 2899, 30, 'Men Off-White & Blue Slim Fit Printed Casual Shirt', '<p>Off-White and blue printed casual shirt, has a spread collar, long sleeves, curved hem,</p>', '', '', 'sale', 1000),
(69, 19, 6, 2, 5, '2022-03-28 14:33:22', 'FableStreet', 'product-44', 'seller 19.png', 'seller 20.png', 'seller 21.png', 1895, 7, 'Women Navy Blue Comfort Formal Shirt', '<p>Navy blue solid opaque Formal shirt ,has a mandarin collar, button placket, na pocket, long regular sleeves, curved hem</p>', '', '', 'sale', 1499),
(70, 19, 6, 2, 5, '2022-03-28 14:37:01', 'Roadster', 'product-45', 'seller 22.png', 'seller 23.png', 'seller 24.png', 1299, 71, 'Women Lavender Solid Casual Shirt', '<p>Lavender solid Casual shirt ,has a band collar, button placket, long drop-shoulders sleeves, 2 flap pockets, straight hem</p>', '', '', 'new', 999),
(71, 19, 6, 2, 5, '2022-03-28 15:18:58', 'Tokyo Talkies', 'product-46', 'seller 25.png', 'seller 27.png', 'seller 26.png', 1099, 20, 'Women White Self-Checked Casual Shirt', '<p>White solid casual shirt, has a spread collar, long sleeves, button placket, and curved hem</p>', '', '                                                                    ', 'new', 899),
(72, 17, 6, 3, 5, '2022-03-28 14:52:01', 'Ed-a-Mamma', 'product-47', 'seller 28.png', 'seller 29.png', 'seller 30.png', 699, 20, 'Boys Blue Casual Cotton Shirt', '<p>Blue solid opaque Casual shirt ,has a band collar, button placket, 1 pocket, short regular sleeves, curved hem</p>', '', '', 'new', 0),
(73, 17, 6, 3, 5, '2022-03-28 15:05:48', 'Fame Forever by Lifestyle', 'product-48', 'seller 31.png', 'seller 32.png', 'seller 36.png', 999, 35, 'Boys Blue Casual Shirt', '<p>Blue solid opaque Casual shirt ,has a spread collar, button placket, na pocket, long regular sleeves, curved hem</p>', '', '', 'new', 866),
(74, 17, 6, 3, 5, '2022-03-31 12:52:15', 'Tommy Hilfiger', 'product-49', 'seller 33.png', 'seller 34.png', 'seller 35.png', 2599, 37, 'Boys Navy Blue Twill Weave Cotton Casual Shirt', '<p>Navy blue solid opaque Casual shirt ,has a spread collar, button placket, 1 patch pocket, long regular sleeves, curved hem</p>', '', '', 'sale', 1999);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `p_cat_id` int(10) NOT NULL,
  `p_cat_title` text NOT NULL,
  `p_cat_top` text NOT NULL,
  `p_cat_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`p_cat_id`, `p_cat_title`, `p_cat_top`, `p_cat_image`) VALUES
(1, 'Jackets', 'yes', 'jacket.jpg'),
(2, 'Accessories', 'no', 'acc.jpg'),
(3, 'Shoes', 'no', 'shoes.jpg'),
(4, 'Coats ', 'yes', 'coat.jpg'),
(5, '  T-Shirt  ', 'no', 'Women T-shirt-1.jpg'),
(6, 'SHIRT', 'yes', 'seller 7.png');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `seller_id` int(10) NOT NULL,
  `seller_name` varchar(255) NOT NULL,
  `seller_shop_name` varchar(255) NOT NULL,
  `seller_email` varchar(255) NOT NULL,
  `seller_pass` varchar(255) NOT NULL,
  `seller_image` text NOT NULL,
  `seller_country` text NOT NULL,
  `seller_about` text NOT NULL,
  `seller_contact` varchar(255) NOT NULL,
  `seller_address` text NOT NULL,
  `seller_shop_address` text NOT NULL,
  `seller_ip` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`seller_id`, `seller_name`, `seller_shop_name`, `seller_email`, `seller_pass`, `seller_image`, `seller_country`, `seller_about`, `seller_contact`, `seller_address`, `seller_shop_address`, `seller_ip`) VALUES
(8, 'Divyansh Nandola', 'Divyansh', 'dn@gmail.com', '12345', 'divyansh.png', 'Inida', '  it is just for tesging.', '7894561237', 'surendranagar', 'dall mill road surendranagar', '::1'),
(17, 'Darshit Parmar', 'Darshit', 'dp@gmail.com', '12345', 'darshit.png', 'India', 'About', '9486123584', 'wadhavan', 'c u shah polytechnic', '::1'),
(18, 'Rushabh Solanki', 'Rushabh', 'rs@gmail.com', '12345', 'rushabh.png', 'India', 'About', '9510427264', 'surendranagar', 'c u shah polytechnic', '::1'),
(19, 'Sandip Parmar', 'Sandip', 'sp@gmail.com', '12345', 'sandip.png', 'India', 'About', '7990792478', 'Limbdi', 'c u shah polytechnic', '::1'),
(20, 'G2 Group ', 'ONE STORE', 'onestore7000@gmail.com', '12345', 'g2 group.png', 'India', 'An E-commerce Webstie (ONE STORE) is a website which define as a web site that allow you to buy or sell the product on online through internet.', '9586546845', 'Surendranagar', 'C U Shah Polytechnic', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `slide_id` int(10) NOT NULL,
  `slide_name` varchar(255) NOT NULL,
  `slide_image` text NOT NULL,
  `slide_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`slide_id`, `slide_name`, `slide_image`, `slide_url`) VALUES
(9, 'Slide Number 11', 'slide-7.jpg', 'http://localhost/one store/shop.php'),
(13, 'Editing Slide 12', 'slider-number-12.jpg', 'test.com'),
(14, 'Slide Number 14', 'slider-number-14.jpg', 'http://localhost/one store/checkout.php'),
(15, 'Slide Number 10', 'slider-number-9.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `term_id` int(10) NOT NULL,
  `term_title` varchar(100) NOT NULL,
  `term_link` varchar(100) NOT NULL,
  `term_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`term_id`, `term_title`, `term_link`, `term_desc`) VALUES
(9, 'Rules & Regulations', 'link_1', 'The IT Act 2000 is the sole cyber law in india which also governs,to some extent the online issues of e-commerece in india.\nAlthough the IT Act focuses mainly on digital signature and related aspects,it mandates that the e-commerece enterpreneurs \nand owner must ensure cyber law due diligence in india.'),
(10, 'Promotion', 'link_2', 'Refund policy is not available in our website.'),
(11, 'Refund Condition', 'link_3', 'Refund policy is not available in our website.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `boxes_section`
--
ALTER TABLE `boxes_section`
  ADD PRIMARY KEY (`box_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customer_orders`
--
ALTER TABLE `customer_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `pending_orders`
--
ALTER TABLE `pending_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`p_cat_id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`seller_id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`slide_id`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`term_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `boxes_section`
--
ALTER TABLE `boxes_section`
  MODIFY `box_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `customer_orders`
--
ALTER TABLE `customer_orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `manufacturer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pending_orders`
--
ALTER TABLE `pending_orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `p_cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `seller_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `slide_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `term_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
