-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2024 at 06:11 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '5c428d8875d2948607f3e3fe134d71b4', '2017-06-18 12:22:38');

-- --------------------------------------------------------

--
-- Table structure for table `tblbooking`
--

CREATE TABLE `tblbooking` (
  `id` int(11) NOT NULL,
  `BookingNumber` bigint(12) DEFAULT NULL,
  `userEmail` varchar(100) DEFAULT NULL,
  `VehicleId` int(11) DEFAULT NULL,
  `FromDate` varchar(20) DEFAULT NULL,
  `ToDate` varchar(20) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `LastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblbooking`
--

INSERT INTO `tblbooking` (`id`, `BookingNumber`, `userEmail`, `VehicleId`, `FromDate`, `ToDate`, `message`, `Status`, `PostingDate`, `LastUpdationDate`) VALUES
(2, 987456321, 'test@gmail.com', 4, '2020-07-19', '2020-07-24', 'hfghg', 1, '2020-07-09 17:49:21', '2020-07-11 12:20:57'),
(4, 670371162, 'test@gmail.com', 4, '2024-04-12', '2024-04-14', 'hehe\r\n', 2, '2024-04-12 06:24:14', '2024-04-13 05:54:33'),
(6, 693256794, 'testuser@gmail.com', 4, '2024-06-21', '2024-06-30', 'for wedding', 1, '2024-06-21 01:01:45', '2024-06-21 01:02:55'),
(7, 379525821, 'anilp234@gmail.com', 14, '2024-06-21', '2024-06-21', 'for weds', 1, '2024-06-21 01:21:57', '2024-06-21 01:22:57'),
(8, 172945060, 'testuser@gmail.com', 11, '2024-06-22', '2024-06-24', 'family tour', 1, '2024-06-22 12:35:48', '2024-07-20 13:01:14'),
(9, 758182226, 'testuser@gmail.com', 11, '23123-12-31', '0003-12-31', '1sas', 0, '2024-06-24 01:19:09', NULL),
(10, 457480794, 'testuser@gmail.com', 15, '0056-12-31', '0090-07-08', 'ashim pagal', 2, '2024-06-24 01:25:27', '2024-07-17 12:48:17'),
(11, 783156112, 'testuser@gmail.com', 7, '2024-07-21', '2024-07-25', 'for wedding', 0, '2024-07-18 09:58:06', NULL),
(12, 950849798, 'sachintrokchhaaki@gmail.com', 13, '2024-07-18', '2024-07-25', 'tour', 0, '2024-07-18 10:52:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblbrands`
--

CREATE TABLE `tblbrands` (
  `id` int(11) NOT NULL,
  `BrandName` varchar(120) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblbrands`
--

INSERT INTO `tblbrands` (`id`, `BrandName`, `CreationDate`, `UpdationDate`) VALUES
(3, 'Audi', '2017-06-18 16:25:03', NULL),
(4, 'Nissan', '2017-06-18 16:25:13', NULL),
(5, 'Toyota', '2017-06-18 16:25:24', NULL),
(8, 'Tesla', '2024-04-10 16:00:26', NULL),
(9, 'Suzuki', '2024-06-22 15:58:32', NULL),
(10, 'Sedan', '2024-06-26 01:02:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusinfo`
--

CREATE TABLE `tblcontactusinfo` (
  `id` int(11) NOT NULL,
  `Address` tinytext DEFAULT NULL,
  `EmailId` varchar(255) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcontactusinfo`
--

INSERT INTO `tblcontactusinfo` (`id`, `Address`, `EmailId`, `ContactNo`) VALUES
(1, 'Thapathali,ktm', 'info@yatri.com', '9874561236');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusquery`
--

CREATE TABLE `tblcontactusquery` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `ContactNumber` char(11) DEFAULT NULL,
  `Message` longtext DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcontactusquery`
--

INSERT INTO `tblcontactusquery` (`id`, `name`, `EmailId`, `ContactNumber`, `Message`, `PostingDate`, `status`) VALUES
(2, 'TEST1', 'testuser@gmail.com', '9875412215', 'i wnt to know your branch in bhaktapur', '2024-05-26 10:43:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `detail` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `type`, `detail`) VALUES
(1, 'Terms and Conditions', 'terms', '										<p>Welcome to Yatri!</p>\r\n\r\n<p>These terms and conditions outline the rules and regulations for the use of Vehicle Rental/Management system\'s Website, located at http://localhost/carrental/.</p>\r\n\r\n<p>By accessing this website we assume you accept these terms and conditions. Do not continue to use Yatri if you do not agree to take all of the terms and conditions stated on this page.</p>\r\n\r\n<p>The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: \"Client\", \"You\" and \"Your\" refers to you, the person log on this website and compliant to the Company’s terms and conditions. \"The Company\", \"Ourselves\", \"We\", \"Our\" and \"Us\", refers to our Company. \"Party\", \"Parties\", or \"Us\", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client’s needs in respect of provision of the Company’s stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.</p>\r\n\r\n<h3><strong>Cookies</strong></h3>\r\n\r\n<p>We employ the use of cookies. By accessing Yatri, you agreed to use cookies in agreement with the Vehicle Rental/Management system\'s Privacy Policy. </p>\r\n\r\n<p>Most interactive websites use cookies to let us retrieve the user’s details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.</p>\r\n\r\n<h3><strong>License</strong></h3>\r\n\r\n<p>Unless otherwise stated, Vehicle Rental/Management system and/or its licensors own the intellectual property rights for all material on Yatri. All intellectual property rights are reserved. You may access this from Yatri for your own personal use subjected to restrictions set in these terms and conditions.</p>\r\n\r\nYou must not:\r\n<ul types=\"number\">\r\n    <li>Republish material from Yatri</li>\r\n    <li>Sell, rent or sub-license material from Yatri</li>\r\n    <li>Reproduce, duplicate or copy material from Yatri</li>\r\n    <li>Redistribute content from Yatri</li>\r\n</ul>\r\n<p>Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. Vehicle Rental/Management system does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of Vehicle Rental/Management system,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, Vehicle Rental/Management system shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.</p>\r\n\r\n<p>Vehicle Rental/Management system reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.</p>\r\n\r\n<p>You warrant and represent that:</p>\r\n\r\n<ul>\r\n    <li>You are entitled to post the Comments on our website and have all necessary licenses and consents to do so;</li>\r\n    <li>The Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party;</li>\r\n    <li>The Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy</li>\r\n    <li>The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity.</li>\r\n</ul>\r\n\r\n<p>You hereby grant Vehicle Rental/Management system a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.</p>\r\n\r\n<h3><strong>Reservation of Rights</strong></h3>\r\n\r\n<p>We reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amen these terms and conditions and it’s linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions.</p>\r\n\r\n<h3><strong>Removal of links from our website</strong></h3>\r\n\r\n<p>If you find any link on our Website that is offensive for any reason, you are free to contact and inform us any moment. We will consider requests to remove links but we are not obligated to or so or to respond to you directly.</p>\r\n\r\n<p>We do not ensure that the information on this website is correct, we do not warrant its completeness or accuracy; nor do we promise to ensure that the website remains available or that the material on the website is kept up to date.</p>\r\n\r\n<h3><strong>Disclaimer</strong></h3>\r\n\r\n<p>To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will:</p>\r\n\r\n<ul>\r\n    <li>limit or exclude our or your liability for death or personal injury;</li>\r\n    <li>limit or exclude our or your liability for fraud or fraudulent misrepresentation;</li>\r\n    <li>limit any of our or your liabilities in any way that is not permitted under applicable law; or</li>\r\n    <li>exclude any of our or your liabilities that may not be excluded under applicable law.</li>\r\n</ul>\r\n\r\n<p>The limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.</p>\r\n\r\n\r\n										'),
(2, 'Privacy Policy', 'privacy', '<p>At Yatri, accessible from localhost/carrental/, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by Yatri and how we use it.</p>\r\n\r\n<p>If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.</p>\r\n\r\n<p>This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in Yatri. This policy is not applicable to any information collected offline or via channels other than this website. Our Privacy Policy was created with the help of the <a href=\"https://tools.bloggingqna.com/\">Privacy Policy Generator</a>.</p>\r\n'),
(3, 'About Us ', 'aboutus', '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13.3333px;\">We offer a varied fleet of cars, ranging from the compact. All our vehicles have air conditioning, &nbsp;power steering, electric windows. All our vehicles are bought and maintained at official dealerships only. Automatic transmission cars are available in every booking class.&nbsp;</span><span style=\"color: rgb(52, 52, 52); font-family: Arial, Helvetica, sans-serif;\">As we are not affiliated with any specific automaker, we are able to provide a variety of vehicle makes and models for customers to rent.</span><div><span style=\"color: rgb(62, 62, 62); font-family: &quot;Lucida Sans Unicode&quot;, &quot;Lucida Grande&quot;, sans-serif; font-size: 11px;\">ur mission is to be recognised as the global leader in Car Rental for companies and the public and private sector by partnering with our clients to provide the best and most efficient Cab Rental solutions and to achieve service excellence.</span><span style=\"color: rgb(52, 52, 52); font-family: Arial, Helvetica, sans-serif;\"><br></span></div>'),
(11, 'FAQs', 'faqs', '																														<p>How do I rent a vehicle from Yatri?</p>To rent a vehicle, visit our website and select the \" Car Listing\" option. Choose your vehicle type, rental dates, and any additional options. Follow the prompts to complete your reservation and provide the necessary payment information.<p>What documents do I need to rent a vehicle?</p>You will need a valid driver\'s license, a credit card for payment, and proof of insurance if it\'s not included with the rental. International renters may also need to provide an International Driving Permit (IDP).<p>What is your policy on fuel?</p>Our standard policy requires that the vehicle be returned with the same amount of fuel as when it was picked up. If the vehicle is returned with less fuel, a refueling fee will apply.<p>Can I extend my rental period?</p> Yes, you can extend your rental period by contacting our customer support team. Extensions are subject to vehicle availability and may incur additional charges.<p>Where can I pick up a vehicle?</p>You can visit our shop(vehicle rental office), located at Thapathali, Kathmandu, Nepal, to pick up your vehicle.');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubscribers`
--

CREATE TABLE `tblsubscribers` (
  `id` int(11) NOT NULL,
  `SubscriberEmail` varchar(120) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsubscribers`
--

INSERT INTO `tblsubscribers` (`id`, `SubscriberEmail`, `PostingDate`) VALUES
(6, 'testuser@gmail.com', '2024-05-26 10:42:33'),
(7, 'sachintrokchhaaki@gmail.com', '2024-06-23 00:59:07'),
(8, 'anil23@gmail.com', '2024-06-25 01:06:09');

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `id` int(11) NOT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`id`, `FullName`, `EmailId`, `Password`, `ContactNo`, `dob`, `Address`, `City`, `Country`, `RegDate`, `UpdationDate`) VALUES
(1, 'Test', 'test@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '9746366126', '', 'Anamnagar, Kathmandu', 'Kathmandu', 'Nepal', '2020-07-07 14:00:49', '2024-04-11 12:47:26'),
(2, 'Test1', 'testuser@gmail.com', 'c06db68e819be6ec3d26c6038d8e8d1f', '9801234567', '2002/10/14', 'baneshwor', 'kathmandu', 'Nepal', '2024-04-14 05:55:17', '2024-07-18 01:30:15'),
(3, 'mukesh', 'mukesh123@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '9804454552', NULL, NULL, NULL, NULL, '2024-04-15 14:14:00', NULL),
(5, 'anil stha', 'anil253@gmail.com', '25d55ad283aa400af464c76d713c07ad', '9874561236', NULL, NULL, NULL, NULL, '2024-06-20 00:59:26', NULL),
(6, 'Anil Pandey', 'anilp234@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '9841599846', NULL, NULL, NULL, NULL, '2024-06-21 01:20:06', NULL),
(7, 'Sachin Trokchhaki Magar', 'sachintrokchhaaki@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '9844383306', NULL, NULL, NULL, NULL, '2024-07-18 10:50:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblvehicles`
--

CREATE TABLE `tblvehicles` (
  `id` int(11) NOT NULL,
  `VehiclesTitle` varchar(150) DEFAULT NULL,
  `VehiclesBrand` int(11) DEFAULT NULL,
  `VehiclesOverview` longtext DEFAULT NULL,
  `PricePerDay` int(11) DEFAULT NULL,
  `FuelType` varchar(100) DEFAULT NULL,
  `ModelYear` int(6) DEFAULT NULL,
  `SeatingCapacity` int(11) DEFAULT NULL,
  `Vimage1` varchar(120) DEFAULT NULL,
  `Vimage2` varchar(120) DEFAULT NULL,
  `Vimage3` varchar(120) DEFAULT NULL,
  `Vimage4` varchar(120) DEFAULT NULL,
  `Vimage5` varchar(120) DEFAULT NULL,
  `AirConditioner` int(11) DEFAULT NULL,
  `PowerDoorLocks` int(11) DEFAULT NULL,
  `AntiLockBrakingSystem` int(11) DEFAULT NULL,
  `BrakeAssist` int(11) DEFAULT NULL,
  `PowerSteering` int(11) DEFAULT NULL,
  `DriverAirbag` int(11) DEFAULT NULL,
  `PassengerAirbag` int(11) DEFAULT NULL,
  `PowerWindows` int(11) DEFAULT NULL,
  `CDPlayer` int(11) DEFAULT NULL,
  `CentralLocking` int(11) DEFAULT NULL,
  `CrashSensor` int(11) DEFAULT NULL,
  `LeatherSeats` int(11) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblvehicles`
--

INSERT INTO `tblvehicles` (`id`, `VehiclesTitle`, `VehiclesBrand`, `VehiclesOverview`, `PricePerDay`, `FuelType`, `ModelYear`, `SeatingCapacity`, `Vimage1`, `Vimage2`, `Vimage3`, `Vimage4`, `Vimage5`, `AirConditioner`, `PowerDoorLocks`, `AntiLockBrakingSystem`, `BrakeAssist`, `PowerSteering`, `DriverAirbag`, `PassengerAirbag`, `PowerWindows`, `CDPlayer`, `CentralLocking`, `CrashSensor`, `LeatherSeats`, `RegDate`, `UpdationDate`) VALUES
(7, 'Toyota Fortuner', 5, 'Toyota Fortuner Features: It is a premium seven-seater SUV loaded with features such as LED projector headlamps with LED DRLs, LED fog lamp, and power-adjustable and foldable ORVMs.', 7000, 'Petrol', 2020, 5, 'zw-toyota-fortuner-2.jpg', 'toyota-fortuner-3.jpg', 'toyota-fortuner-4.jpg', 'toyota-fortuner-1.jpg', '', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, 1, 1, 1, '2020-07-07 09:17:46', '2024-06-27 06:42:30'),
(11, 'Audi e-tron GT', 3, 'The Audi e-tron GT is a fully electric luxury sedan that combines high performance with advanced technology and premium design', 7000, 'EV', 2022, 5, 'e-tron GT1.jpg', 'e-tron GT2.jpg', 'e-tron GT3.jpg', 'e-tron GT4.jpg', '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2024-06-18 14:21:30', '2024-06-27 06:42:41'),
(12, 'Toyota bZ4X', 5, 'Smooth lines and an athletic SUV stance give bZ4X a look that’s unmistakable. With a long wheelbase, the wheels have been sent further into the corners to emphasize its confidence on any road. ', 5000, 'EV', 2023, 5, 'Toyota bZ4X1.jpg', 'Toyota bZ4X2.jpg', 'Toyota bZ4X3.jpg', 'Toyota bZ4X4.jpg', '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-06-18 14:30:44', '2024-06-27 06:42:51'),
(13, 'Tesla model 3', 8, 'The Tesla Model 3 is a fully electric sedan known for its impressive range, rapid acceleration, and advanced technology, including a minimalist interior with a central touchscreen and semi-autonomous driving features. It offers variants like the Standard Range Plus, Long Range, and Performance models, providing up to 353 miles on a single charge and access to Tesla\'s extensive Supercharger network.', 6000, 'EV', 2017, 3, 'teslam31.jpg', 'teslam33.jpg', 'teslam34.jpg', 'teslam32.jpg', '', 1, NULL, 1, NULL, 1, 1, 1, NULL, NULL, NULL, 1, 1, '2024-06-19 12:14:24', '2024-06-27 06:43:05'),
(14, 'Audi Q8', 3, 'As per ARAI, the mileage of Q8 is 0 kmpl. Real mileage of the vehicle varies depending upon the driving habits. City and highway mileage figures also vary depending upon the road conditions.', 5000, 'Petrol', 2017, 4, 'Audi1.jpg', 'Audi2.jpg', 'Audi3.jpg', 'Audi4.jpg', '', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-20 17:47:35', '2024-06-27 06:43:16'),
(15, 'Nissan GT-R', 4, ' The GT-R packs a 3.8-litre V6 twin-turbocharged petrol, which puts out 570PS of max power at 6800rpm and 637Nm of peak torque. The engine is mated to a 6-speed dual-clutch transmission in an all-wheel-drive setup. The 2+2 seater GT-R sprints from 0-100kmph in less than 3', 6000, 'Petrol', 2017, 4, 'gtr1.jpg', 'gtr2.jpg', 'gtr3.jpg', 'gtr4.jpg', '', 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, '2024-06-20 17:53:24', '2024-06-27 06:43:25'),
(16, 'Model Y', 8, 'The Tesla Model Y is a battery electric mid-size crossover SUV produced by Tesla, Inc.', 6000, 'EV', 2020, 3, 'Model Y1.jpg', 'Model Y2.jpg', 'Model Y3.jpg', 'Model Y4.jpg', '', 1, 1, 1, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, '2024-06-22 15:57:15', '2024-06-27 06:43:35'),
(17, 'Vitara-brezza', 9, 'Maruti Suzuki Offers New Brezza with 1.5L Petrol Engine that offers the best-in-class performance and fuel efficiency. ', 5000, 'Petrol', 2022, 5, 'marutisuzuki-vitara-brezza-right.webp', 'marutisuzuki-vitara-brezza-boot-.webp', 'marutisuzuki-vitara-brezza-dashb.webp', 'marutisuzuki-vitara-brezza-rear-.webp', '', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2024-06-22 16:02:07', '2024-06-27 06:43:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbooking`
--
ALTER TABLE `tblbooking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbrands`
--
ALTER TABLE `tblbrands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubscribers`
--
ALTER TABLE `tblsubscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `EmailId` (`EmailId`);

--
-- Indexes for table `tblvehicles`
--
ALTER TABLE `tblvehicles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblbooking`
--
ALTER TABLE `tblbooking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblbrands`
--
ALTER TABLE `tblbrands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tblsubscribers`
--
ALTER TABLE `tblsubscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblvehicles`
--
ALTER TABLE `tblvehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
