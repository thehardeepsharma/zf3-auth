-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2016 at 04:22 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 7.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mlm`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact_name` varchar(50) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `city` varchar(50) NOT NULL,
  `address` varchar(250) NOT NULL,
  `pincode` varchar(6) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `contact_name`, `contact_number`, `email_id`, `country_id`, `state_id`, `city`, `address`, `pincode`, `logo`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'Meerut', 'Mukesh', '83245325325', 'meerut@lokhitway.com', 100, 35, 'Meerut', 'Block A\r\nPlot No-120', '132131', 'meerut.jpg', '2016-11-11 02:53:51', 0, NULL, NULL, 1),
(2, 'Muzaffarnagar', 'Rahul Kumar', '32424242423', 'rahul@lokhitway.com', 100, 35, 'Muzaffarnagar', 'Block B\r\nPlot No-123', '123114', 'muzaffarnagar.jpg', '2016-11-11 02:54:46', 0, NULL, NULL, 1),
(3, 'Bijnor', 'Mohan', '98324324242', 'bijnor@lokhitway.com', 100, 35, 'Bijnor', 'Block A\r\nPlot No-13', '123242', 'bijnor.jpg', '2016-11-11 02:55:41', 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `branch_products`
--

CREATE TABLE `branch_products` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bundle_products`
--

CREATE TABLE `bundle_products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `point_volume` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bundle_products`
--

INSERT INTO `bundle_products` (`id`, `name`, `point_volume`, `quantity`, `price`, `created_at`, `created_by`, `updated_at`, `updated_by`, `active`) VALUES
(1, 'Home Kit-1192', 1, 10, 1192, '2016-11-11 02:50:03', 0, NULL, NULL, 1),
(2, 'Body Helth Kit-1192', 1, 10, 1192, '2016-11-11 02:50:34', 0, NULL, NULL, 1),
(3, 'Helth Kit-1192', 1, 10, 1192, '2016-11-11 02:50:52', 0, '2016-11-11 02:51:05', NULL, 1),
(4, 'Home Kit-2197', 2, 10, 2197, '2016-11-11 02:51:32', 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bundle_product_relations`
--

CREATE TABLE `bundle_product_relations` (
  `id` int(11) NOT NULL,
  `bundle_product_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bundle_product_relations`
--

INSERT INTO `bundle_product_relations` (`id`, `bundle_product_id`, `product_id`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 2, 1),
(4, 2, 4),
(5, 3, 1),
(6, 3, 2),
(7, 4, 2),
(8, 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `active` tinyint(4) DEFAULT '1' COMMENT '1=>Active,0=>Inactive',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `description`, `active`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'FMCH', 0, 'This is FMCH', 1, '2016-11-11 02:14:41', 0, NULL, NULL),
(2, 'Buity Product', 0, 'This is Buity Product for man and woman', 1, '2016-11-11 02:15:19', 0, NULL, NULL),
(3, 'Ayurveda', 0, 'This is Ayurveda category for Ayurveda products', 1, '2016-11-11 02:16:13', 0, NULL, NULL),
(4, 'Food Suplimentary ', 0, 'This is Food Suplimentary category', 1, '2016-11-11 02:16:51', 0, '2016-11-11 02:17:11', 0);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`) VALUES
(1, 'Andorra', 'AD'),
(2, 'United Arab Emirates', 'AE'),
(3, 'Afghanistan', 'AF'),
(4, 'Antigua and Barbuda', 'AG'),
(5, 'Anguilla', 'AI'),
(6, 'Albania', 'AL'),
(7, 'Armenia', 'AM'),
(8, 'Netherlands Antilles', 'AN'),
(9, 'Angola', 'AO'),
(10, 'Antarctica', 'AQ'),
(11, 'Argentina', 'AR'),
(12, 'American Samoa', 'AS'),
(13, 'Austria', 'AT'),
(14, 'Australia', 'AU'),
(15, 'Aruba', 'AW'),
(16, 'Azerbaijan', 'AZ'),
(17, 'Bosnia and Herzegowina', 'BA'),
(18, 'Barbados', 'BB'),
(19, 'Bangladesh', 'BD'),
(20, 'Belgium', 'BE'),
(21, 'Burkina Faso', 'BF'),
(22, 'Bulgaria', 'BG'),
(23, 'Bahrain', 'BH'),
(24, 'Burundi', 'BI'),
(25, 'Benin', 'BJ'),
(26, 'Bermuda', 'BM'),
(27, 'Brunei Darussalam', 'BN'),
(28, 'Bolivia', 'BO'),
(29, 'Brazil', 'BR'),
(30, 'Bahamas', 'BS'),
(31, 'Bhutan', 'BT'),
(32, 'Bouvet Island', 'BV'),
(33, 'Botswana', 'BW'),
(34, 'Belarus', 'BY'),
(35, 'Belize', 'BZ'),
(36, 'Canada', 'CA'),
(37, 'Cocos (Keeling) Islands', 'CC'),
(38, 'Central African Republic', 'CF'),
(39, 'Congo', 'CG'),
(40, 'Switzerland', 'CH'),
(41, 'Cote D''Ivoire', 'CI'),
(42, 'Cook Islands', 'CK'),
(43, 'Chile', 'CL'),
(44, 'Cameroon', 'CM'),
(45, 'China', 'CN'),
(46, 'Colombia', 'CO'),
(47, 'Costa Rica', 'CR'),
(48, 'Cuba', 'CU'),
(49, 'Cape Verde', 'CV'),
(50, 'Christmas Island', 'CX'),
(51, 'Cyprus', 'CY'),
(52, 'Czech Republic', 'CZ'),
(53, 'Germany', 'DE'),
(54, 'Djibouti', 'DJ'),
(55, 'Denmark', 'DK'),
(56, 'Dominica', 'DM'),
(57, 'Dominican Republic', 'DO'),
(58, 'Algeria', 'DZ'),
(59, 'Ecuador', 'EC'),
(60, 'Estonia', 'EE'),
(61, 'Egypt', 'EG'),
(62, 'Western Sahara', 'EH'),
(63, 'Eritrea', 'ER'),
(64, 'Spain', 'ES'),
(65, 'Ethiopia', 'ET'),
(66, 'Finland', 'FI'),
(67, 'Fiji', 'FJ'),
(68, 'Falkland Islands (Malvinas)', 'FK'),
(69, 'Micronesia, Federated States of', 'FM'),
(70, 'Faroe Islands', 'FO'),
(71, 'France', 'FR'),
(72, 'France, Metropolitan', 'FX'),
(73, 'Gabon', 'GA'),
(74, 'United Kingdom', 'GB'),
(75, 'Grenada', 'GD'),
(76, 'Georgia', 'GE'),
(77, 'French Guiana', 'GF'),
(78, 'Ghana', 'GH'),
(79, 'Gibraltar', 'GI'),
(80, 'Greenland', 'GL'),
(81, 'Gambia', 'GM'),
(82, 'Guinea', 'GN'),
(83, 'Guadeloupe', 'GP'),
(84, 'Equatorial Guinea', 'GQ'),
(85, 'Greece', 'GR'),
(86, 'Georgia and Sandwich Islands', 'GS'),
(87, 'Guatemala', 'GT'),
(88, 'Guam', 'GU'),
(89, 'Guinea-bissau', 'GW'),
(90, 'Guyana', 'GY'),
(91, 'Hong Kong', 'HK'),
(92, 'Heard and Mc Donald Islands', 'HM'),
(93, 'Honduras', 'HN'),
(94, 'Croatia', 'HR'),
(95, 'Haiti', 'HT'),
(96, 'Hungary', 'HU'),
(97, 'Indonesia', 'ID'),
(98, 'Ireland', 'IE'),
(99, 'Israel', 'IL'),
(100, 'India', 'IN'),
(101, 'British Indian Ocean Territory', 'IO'),
(102, 'Iraq', 'IQ'),
(103, 'Iran (Islamic Republic of)', 'IR'),
(104, 'Iceland', 'IS'),
(105, 'Italy', 'IT'),
(106, 'Jamaica', 'JM'),
(107, 'Jordan', 'JO'),
(108, 'Japan', 'JP'),
(109, 'Kenya', 'KE'),
(110, 'Kyrgyzstan', 'KG'),
(111, 'Cambodia', 'KH'),
(112, 'Kiribati', 'KI'),
(113, 'Comoros', 'KM'),
(114, 'Saint Kitts and Nevis', 'KN'),
(115, 'Korea,People''s Republic of', 'KP'),
(116, 'Korea, Republic of', 'KR'),
(117, 'Kuwait', 'KW'),
(118, 'Cayman Islands', 'KY'),
(119, 'Kazakhstan', 'KZ'),
(120, 'Lao People''s Democratic Republic', 'LA'),
(121, 'Lebanon', 'LB'),
(122, 'Saint Lucia', 'LC'),
(123, 'Liechtenstein', 'LI'),
(124, 'Sri Lanka', 'LK'),
(125, 'Liberia', 'LR'),
(126, 'Lesotho', 'LS'),
(127, 'Lithuania', 'LT'),
(128, 'Luxembourg', 'LU'),
(129, 'Latvia', 'LV'),
(130, 'Libyan Arab Jamahiriya', 'LY'),
(131, 'Morocco', 'MA'),
(132, 'Monaco', 'MC'),
(133, 'Moldova, Republic of', 'MD'),
(134, 'Madagascar', 'MG'),
(135, 'Marshall Islands', 'MH'),
(136, 'Macedonia, Republic of', 'MK'),
(137, 'Mali', 'ML'),
(138, 'Myanmar', 'MM'),
(139, 'Mongolia', 'MN'),
(140, 'Macau', 'MO'),
(141, 'Northern Mariana Islands', 'MP'),
(142, 'Martinique', 'MQ'),
(143, 'Mauritania', 'MR'),
(144, 'Montserrat', 'MS'),
(145, 'Malta', 'MT'),
(146, 'Mauritius', 'MU'),
(147, 'Maldives', 'MV'),
(148, 'Malawi', 'MW'),
(149, 'Mexico', 'MX'),
(150, 'Malaysia', 'MY'),
(151, 'Mozambique', 'MZ'),
(152, 'Namibia', 'NA'),
(153, 'New Caledonia', 'NC'),
(154, 'Niger', 'NE'),
(155, 'Norfolk Island', 'NF'),
(156, 'Nigeria', 'NG'),
(157, 'Nicaragua', 'NI'),
(158, 'Netherlands', 'NL'),
(159, 'Norway', 'NO'),
(160, 'Nepal', 'NP'),
(161, 'Nauru', 'NR'),
(162, 'Niue', 'NU'),
(163, 'New Zealand', 'NZ'),
(164, 'Oman', 'OM'),
(165, 'Panama', 'PA'),
(166, 'Peru', 'PE'),
(167, 'French Polynesia', 'PF'),
(168, 'Papua New Guinea', 'PG'),
(169, 'Philippines', 'PH'),
(170, 'Pakistan', 'PK'),
(171, 'Poland', 'PL'),
(172, 'St. Pierre and Miquelon', 'PM'),
(173, 'Pitcairn', 'PN'),
(174, 'Puerto Rico', 'PR'),
(175, 'Portugal', 'PT'),
(176, 'Palau', 'PW'),
(177, 'Paraguay', 'PY'),
(178, 'Qatar', 'QA'),
(179, 'Reunion', 'RE'),
(180, 'Romania', 'RO'),
(181, 'Russian Federation', 'RU'),
(182, 'Rwanda', 'RW'),
(183, 'Saudi Arabia', 'SA'),
(184, 'Solomon Islands', 'SB'),
(185, 'Seychelles', 'SC'),
(186, 'Sudan', 'SD'),
(187, 'Sweden', 'SE'),
(188, 'Singapore', 'SG'),
(189, 'St. Helena', 'SH'),
(190, 'Slovenia', 'SI'),
(191, 'Svalbard and Jan Mayen Islands', 'SJ'),
(192, 'Slovakia (Slovak Republic)', 'SK'),
(193, 'Sierra Leone', 'SL'),
(194, 'San Marino', 'SM'),
(195, 'Senegal', 'SN'),
(196, 'Somalia', 'SO'),
(197, 'Suriname', 'SR'),
(198, 'Sao Tome and Principe', 'ST'),
(199, 'El Salvador', 'SV'),
(200, 'Syrian Arab Republic', 'SY'),
(201, 'Swaziland', 'SZ'),
(202, 'Turks and Caicos Islands', 'TC'),
(203, 'Chad', 'TD'),
(204, 'French Southern Territories', 'TF'),
(205, 'Togo', 'TG'),
(206, 'Thailand', 'TH'),
(207, 'Tajikistan', 'TJ'),
(208, 'Tokelau', 'TK'),
(209, 'Turkmenistan', 'TM'),
(210, 'Tunisia', 'TN'),
(211, 'Tonga', 'TO'),
(212, 'East Timor', 'TP'),
(213, 'Turkey', 'TR'),
(214, 'Trinidad and Tobago', 'TT'),
(215, 'Tuvalu', 'TV'),
(216, 'Taiwan', 'TW'),
(217, 'Tanzania, United Republic of', 'TZ'),
(218, 'Ukraine', 'UA'),
(219, 'Uganda', 'UG'),
(220, 'United States Minor Outlying Islands', 'UM'),
(221, 'United States', 'US'),
(222, 'Uruguay', 'UY'),
(223, 'Uzbekistan', 'UZ'),
(224, 'Vatican City State (Holy See)', 'VA'),
(225, 'Saint Vincent and the Grenadines', 'VC'),
(226, 'Venezuela', 'VE'),
(227, 'Virgin Islands (British)', 'VG'),
(228, 'Virgin Islands (U.S.)', 'VI'),
(229, 'Viet Nam', 'VN'),
(230, 'Vanuatu', 'VU'),
(231, 'Wallis and Futuna Islands', 'WF'),
(232, 'Samoa', 'WS'),
(233, 'Yemen', 'YE'),
(234, 'Mayotte', 'YT'),
(235, 'Yugoslavia', 'YU'),
(236, 'South Africa', 'ZA'),
(237, 'Zambia', 'ZM'),
(238, 'Zaire', 'ZR'),
(239, 'Zimbabwe', 'ZW');

-- --------------------------------------------------------

--
-- Table structure for table `kyc_documents`
--

CREATE TABLE `kyc_documents` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `kyc_type` enum('idproof','address') DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kyc_documents`
--

INSERT INTO `kyc_documents` (`id`, `name`, `kyc_type`, `status`) VALUES
(1, 'Passport', 'idproof', 1),
(2, 'Voter''s Identity Card', 'idproof', 1),
(3, 'Driving Licence', 'address', 1),
(4, 'Aadhaar Card', 'address', 1),
(5, 'Ration Card', 'address', 1),
(6, 'PAN Card', 'idproof', 1);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `member_code` varchar(15) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_role` varchar(10) DEFAULT 'member',
  `sponsor` varchar(15) DEFAULT NULL,
  `place_under` varchar(15) NOT NULL,
  `position` char(2) NOT NULL DEFAULT '1' COMMENT '1=>Organization 1 , 2=>Organization 2',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=>Active,0=>Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `member_code`, `username`, `password`, `user_role`, `sponsor`, `place_under`, `position`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, '00000001', 'amit', 'fe01ce2a7fbac8fafaed7c982a04e229', 'Member', NULL, '', '', '2016-10-04 05:26:38', 0, NULL, NULL, 1),
(8, '00000002', 'hardeep', 'fe01ce2a7fbac8fafaed7c982a04e229', 'Member', '00000001', '00000001', 'L', '2016-10-23 12:17:15', 1, NULL, NULL, 1),
(9, '00000009', 'sachin', 'fe01ce2a7fbac8fafaed7c982a04e229', 'Member', '00000001', '00000001', 'R', '2016-10-23 12:19:44', 1, NULL, NULL, 1),
(10, '00000010', 'sameer', 'fe01ce2a7fbac8fafaed7c982a04e229', 'Member', '00000002', '00000002', 'L', '2016-10-23 12:22:45', 1, NULL, NULL, 1),
(11, '00000011', 'test', 'fe01ce2a7fbac8fafaed7c982a04e229', 'member', '00000001', '00000002', '2', '2016-11-06 17:20:47', 1, NULL, NULL, 1),
(12, '00000012', 'qq', '099b3b060154898840f0ebdfb46ec78f', 'member', '00000011', '00000011', '2', '2016-11-09 17:34:02', 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `member_bank_details`
--

CREATE TABLE `member_bank_details` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `ifsc_code` varchar(20) NOT NULL,
  `account_number` varchar(20) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `member_business`
--

CREATE TABLE `member_business` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `registration_fee` int(11) NOT NULL DEFAULT '0',
  `welcome_kit` int(11) NOT NULL DEFAULT '0',
  `business_volume` int(11) NOT NULL DEFAULT '0',
  `total_amount` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member_business`
--

INSERT INTO `member_business` (`id`, `member_id`, `registration_fee`, `welcome_kit`, `business_volume`, `total_amount`, `created_at`) VALUES
(1, 1, 50, 500, 500, 550, '2016-10-04 06:20:34'),
(11, 8, 100, 200, 0, 101, '2016-10-23 12:17:15'),
(12, 9, 0, 300, 0, 2, '2016-10-23 12:19:44'),
(13, 10, 50, 400, 0, 53, '2016-10-23 12:22:45');

-- --------------------------------------------------------

--
-- Table structure for table `member_kyc`
--

CREATE TABLE `member_kyc` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `member_picture` varchar(100) DEFAULT NULL,
  `idproof` int(11) NOT NULL,
  `idproof_name` varchar(100) NOT NULL,
  `idproof_number` varchar(100) NOT NULL,
  `address_proof` int(11) DEFAULT NULL,
  `address_proof_name` varchar(100) DEFAULT NULL,
  `address_proof_number` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member_kyc`
--

INSERT INTO `member_kyc` (`id`, `member_id`, `member_picture`, `idproof`, `idproof_name`, `idproof_number`, `address_proof`, `address_proof_name`, `address_proof_number`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, '00000001.png', 1, '00000001.jpg', 'PASS2324141', 3, '00000001.png', 'DL24214142', '2016-10-06 10:10:07', 1, '2016-10-06 10:10:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `member_pin`
--

CREATE TABLE `member_pin` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `pin` varchar(20) NOT NULL,
  `enable_attampt` char(1) NOT NULL COMMENT 'Y=>Yes,N=>No',
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1=>Active,0=>Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member_pin`
--

INSERT INTO `member_pin` (`id`, `member_id`, `pin`, `enable_attampt`, `created_by`, `created_at`, `status`) VALUES
(1, 11, '2XrC9Q', 'Y', 0, '2016-11-10 18:06:42', 1);

-- --------------------------------------------------------

--
-- Table structure for table `member_profile`
--

CREATE TABLE `member_profile` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country_id` int(11) DEFAULT '100',
  `state_id` int(11) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile_number` varchar(15) DEFAULT NULL,
  `alternate_number` varchar(15) DEFAULT NULL,
  `nominee_name` varchar(100) NOT NULL,
  `nominee_age` int(11) NOT NULL,
  `nominee_relation` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member_profile`
--

INSERT INTO `member_profile` (`id`, `member_id`, `gender`, `email_id`, `first_name`, `last_name`, `father_name`, `address`, `city`, `country_id`, `state_id`, `district`, `pincode`, `dob`, `mobile_number`, `alternate_number`, `nominee_name`, `nominee_age`, `nominee_relation`, `created_at`, `updated_at`) VALUES
(1, 1, 'Male', 'member@in.com', 'First', 'Last', 'Fname', 'Test Address', 'Meerut', 100, 10, 'Meerut', '123123', '2000-11-18', '9800231100', NULL, 'Sumit', 28, 'Brother', '2016-10-04 06:38:18', NULL),
(6, 8, 'male', 'hardeeps@ndtv.com', 'Hardeep', 'Sharma', 'Amresh Sharma', 'Village Balwa', 'Shamli', 100, 35, 'Shamli', '247776', '2006-10-10', '2352527528', '02352527528', 'Pooja Sharma', 27, 'Wife', '2016-10-23 12:17:15', NULL),
(7, 9, 'male', 'sachin@in.com', 'Sachin', 'Tyagi', 'Amar singh', 'Test Address', 'kila', 100, 35, 'Meerut', '325525', '2006-10-11', '2352527528', '02352527528', 'Mamta', 30, 'Wife', '2016-10-23 12:19:44', NULL),
(8, 10, 'male', 'sameer@in.com', 'Sameer', 'Jain', 'Rahul Jain', 'Test Address', 'New Delhi', 100, 10, 'Delhi', '325525', '2006-10-08', '2352527528', '02352527528', 'Shweta Jain', 40, 'wife', '2016-10-23 12:22:45', NULL),
(9, 11, 'male', 'hardeeps@ndtv.com', 'Hardeep Sharma', 'deol', 'munny', 'This is test data', 'Test', 100, 1, 'Shamli', '325525', '2013-11-06', '02352527528', '1427427344732', 'Hardeep Sharma', 10, 'Hardeep Sharma', '2016-11-06 17:20:47', NULL),
(10, 12, 'male', '', 'Dev', 'Khanna', 'devika', 'Test Address', 'meerut', 100, 1, 'Test', '123123', '2010-11-03', '9032424243242', '1241241414141', 'mamta', 12, 'wife', '2016-11-09 17:34:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `role` varchar(50) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `role`, `resource_id`, `status`) VALUES
(94, 'Member', 33, 1),
(95, 'Member', 35, 1),
(96, 'Member', 37, 1),
(97, 'Member', 38, 1),
(98, 'Member', 39, 1),
(99, 'Member', 40, 1),
(100, 'Member', 41, 1),
(101, 'Member', 46, 1),
(102, 'Admin', 1, 1),
(103, 'Admin', 2, 1),
(104, 'Admin', 3, 1),
(105, 'Admin', 4, 1),
(106, 'Admin', 5, 1),
(107, 'Admin', 6, 1),
(108, 'Admin', 7, 1),
(109, 'Admin', 8, 1),
(110, 'Admin', 9, 1),
(111, 'Admin', 55, 1),
(112, 'Admin', 10, 1),
(113, 'Admin', 11, 1),
(114, 'Admin', 12, 1),
(115, 'Admin', 13, 1),
(116, 'Admin', 14, 1),
(117, 'Admin', 15, 1),
(118, 'Admin', 28, 1),
(119, 'Admin', 29, 1),
(120, 'Admin', 30, 1),
(121, 'Admin', 31, 1),
(122, 'Admin', 16, 1),
(123, 'Admin', 17, 1),
(124, 'Admin', 18, 1),
(125, 'Admin', 19, 1),
(126, 'Admin', 20, 1),
(127, 'Admin', 21, 1),
(128, 'Admin', 22, 1),
(129, 'Admin', 23, 1),
(130, 'Admin', 24, 1),
(131, 'Admin', 25, 1),
(132, 'Admin', 26, 1),
(133, 'Admin', 27, 1),
(134, 'Admin', 32, 1),
(135, 'Admin', 33, 1),
(136, 'Admin', 34, 1),
(137, 'Admin', 35, 1),
(138, 'Admin', 36, 1),
(139, 'Admin', 37, 1),
(140, 'Admin', 38, 1),
(141, 'Admin', 56, 1),
(142, 'Admin', 39, 1),
(143, 'Admin', 40, 1),
(144, 'Admin', 41, 1),
(145, 'Admin', 46, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `short_description` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `weight` varchar(10) NOT NULL,
  `price` float(8,2) NOT NULL,
  `distributor_price` float(8,2) NOT NULL,
  `special_price` float(8,2) NOT NULL,
  `special_price_till_date` int(11) NOT NULL,
  `business_volume` int(11) NOT NULL,
  `barcode` varchar(50) NOT NULL,
  `logo` varchar(200) NOT NULL,
  `stock` tinyint(4) NOT NULL COMMENT '1=>In Stock,0=>Out of Stock',
  `active` tinyint(4) NOT NULL COMMENT '1=>Active,0=>Inactive',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `description`, `short_description`, `quantity`, `weight`, `price`, `distributor_price`, `special_price`, `special_price_till_date`, `business_volume`, `barcode`, `logo`, `stock`, `active`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'UG 35', 1, '<p class="textMainBold"><strong>What preparation is required?</strong></p>\r\n<p>As the procedure is performed under general anaesthesia, you should have nothing to eat or drink for 6 hours prior to treatment. Regular medications can be taken with a sip of water with the exception of <span class="textMainBold">blood thinning agents (eg. warfarin, aspirin, clopidogrel) or non-steroidal anti-inflammatories which need to be stopped for 7-10 days</span>. A mid stream urine (MSU) test is required to ensure the urine is sterile before treatment is undertaken.</p>\r\n<p class="textMainBold"><strong>What do I need to bring to surgery?</strong></p>\r\n<ul>\r\n<li>All related imaging such as x-rays, CT scan or ultrasound</li>\r\n<li>Your usual medications</li>\r\n</ul>\r\n<p class="textMainBold"><strong>What happens in the operating room?</strong></p>\r\n<p>You will meet your anaesthetist prior to surgery who will take a thorough medical history. This person will be responsible for your safety whilst you are under general anaesthesia. The procedure will usually take 60 minutes and involves putting a rigid telescope into the drainage tube (ureter) of the kidney and fragmenting the stone with laser. A temporary urinary stent may be left in place for a short period to ensure the kidney drains without risk of blockage.</p>\r\n<p class="textMainBold"><strong>What are the risks?</strong></p>\r\n<p>This is generally considered a very safe operation. Specific risks to surgery include: infection, minor bleeding, and perforation of the ureter (1 in 200).</p>\r\n<p class="textMainBold"><strong>What to expect afterwards?</strong></p>\r\n<p>It is normal to feel the need to pass urine frequently and notice blood in the urine following surgery. This will settle over the ensuing days. An oral over the counter medication called Ural can reduce the stinging sensation during urination. You will sometimes have a temporary urinary stent (see urinary tract stent info sheet) following surgery which allows the swelling in the ureter to settle from where the stone was located. The stent maybe attached to a string coming out from the urethra allowing ease of removal (in the doctor&rsquo;s office) when no longer required. Care needs to be taken so as not to accidently dislodge the stent by pulling on the string or catching it on your underwear.</p>\r\n<p class="textMainBold"><strong>Follow-up</strong></p>\r\n<p>You will be advised after surgery the necessary follow-up arrangements. A script for oral antibiotics will need to be taken for 5 days to prevent infection. You need to drink at least 8 glasses of water a day (2.5L/day). Simple analgesics such as Panadol and Nurofen are usually all that is required, occasionally stronger medication (eg. Panadeine Forte) may be necessary. You will not be able to drive for at least 24 hours after surgery as you have had a general anaesthetic.</p>', 'Kidney Stone removal formulation', 100, '50gm', 130.00, 120.00, 125.00, 2016, 10, '23424242342', 'UG_35.jpg', 1, 1, '2016-11-11 02:28:16', 0, '2016-11-11 02:30:39', 0),
(2, 'Amala Tablet', 3, '<p><strong>The Benefits of Amalaki</strong><br /><br />Amla literally means "sour"; it is the Hindi word for a fruit tree (Emblica officinalis or Phyllanthus emblica) that grows throughout India and bears sour-tasting gooseberry-like fruits.1 Amla is also known by the Sanskrit name "Amalaki." Other Sanskrit nicknames for amla&mdash;names meaning "mother," "nurse," and "immortality"&mdash;are a testament to the healing capacity of its fruits.1, 2 Amla has been used in Ayurveda and other Asian medicinal practices for thousands of years.3 Because Sanskrit is the first language of Ayurveda, Banyan tends to offer herbs according to their Sanskrit names and therefore offers Amla as Amalaki.<br /><br />Amla is one of the three fruits that are contained in Triphala and it is the main ingredient in the nutritive jam Chyavanprash. Amla contains a very high concentration of vitamin C, one of the highest known in the plant kingdom&mdash;twenty times that of an orange.1 More importantly, the vitamin C contained in the amla fruit is stabilized by the presence of tannins, which help amla to maintain its vitamin content even through processing.1<br /><br /><strong>Benefits of Amla</strong><br /><br /></p>\r\n<ul>\r\n<li>&nbsp;&nbsp;&nbsp; Supports healthy metabolism, digestion and elimination*</li>\r\n<li>&nbsp;&nbsp;&nbsp; Promotes anti-inflammatory properties that cool, tone, and nourish tissues and organs*</li>\r\n<li>&nbsp;&nbsp;&nbsp; Nourishes the heart and respiratory system*</li>\r\n<li>&nbsp;&nbsp;&nbsp; Assists natural internal cleansing and maintains regularity*</li>\r\n<li>&nbsp;&nbsp;&nbsp; Natural antioxidant*</li>\r\n<li>&nbsp;&nbsp;&nbsp; Promotes healthy eyes, hair, nails, and skin*</li>\r\n<li>&nbsp;&nbsp;&nbsp; Balances agni (digestive fire)*</li>\r\n<li>&nbsp;&nbsp;&nbsp; Builds ojas to support a healthy immune response and youthfulness*</li>\r\n</ul>\r\n<p><br />Amla pacifies vata, pitta, and kapha, though it is especially calming to pitta. In addition, amla rejuvenates all of the tissues in the body and builds ojas, the essence of immunity and youthfulness. In general, amla is a powerful ally for many systems of the body. It is known to promote energy, reproductive health, and healthy cholesterol levels. Amla is also a tonic for the heart, the arterial system, the respiratory system, the sense organs, and the mind.</p>', 'Amlaâ€™s ability to stimulate microcirculation and to build ojas are thought to help promote healthy blood sugar levels, particularly in conjunction with pitta imbalances', 100, '100gm', 400.00, 350.00, 380.00, 2016, 50, '', 'Amala_Tablet.jpg', 1, 1, '2016-11-11 02:37:28', 0, NULL, NULL),
(3, 'Neem Tablet', 3, '<div class="col-xs-24 col-md-14">\r\n<div class="row item-row">\r\n<div class="col-xs-24">\r\n<h3><strong>Description</strong></h3>\r\n<div>\r\n<ul>\r\n<li>Premium Herbal</li>\r\n<li>Certified 475 mg</li>\r\n<li>Dietary Supplement</li>\r\n</ul>\r\n<p>Health &amp; longevity through the healing power of nature&mdash;that''s what it means to Trust the Leaf.</p>\r\n<p>Neem (Azadirachta indica) is an Ayurvedic herbal from India traditionally used for purifying and cleansing. Its benefits are also similar to Echinacea and Goldenseal.</p>\r\n<p>Our Neem is carefully grown, tested and produced to certified quality standards.</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class="row item-row">\r\n<div class="col-xs-24">\r\n<h3><strong>Suggested Use</strong></h3>\r\n<div class="prodOverviewDetail">\r\n<p><strong>Recommendation:</strong> Take 2 capsules three times daily, preferably with food.</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class="row item-row">\r\n<div class="col-xs-24">\r\n<h3><strong>Other Ingredients</strong></h3>\r\n<div class="prodOverviewIngred">\r\n<p>Gelatin (capsule)</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class="row item-row">\r\n<div class="col-xs-24">\r\n<h3><strong>Warnings</strong></h3>\r\n<div class="prodOverviewDetail">\r\n<p>Freshness &amp; safety sealed with printed outer shrinkwrap and printed inner seal. Do not use if either seal is broken or missing. Keep out of reach of children.</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 'Nature''s Way, Neem, Leaves, 100 Capsules', 100, '100gm', 200.00, 180.00, 190.00, 2016, 60, '', 'Neem_Tablet.jpg', 1, 1, '2016-11-11 02:40:49', 0, NULL, NULL),
(4, 'Sugar Tablet', 3, '<h2 id="TOC_TITLE_HDR_2" class="content_head hl-below-section-disclaimer">Medications for type 1 diabetes</h2>\r\n<div id="TOC_TITLE_2" class="content_body">\r\n<div class="hl-widget-factbox hl-widget-right">\r\n<div class="hl-box-factbox">\r\n<div class="hl-factbox-heading">What is the goal of treatment if I have type 1 diabetes?</div>\r\n<div class="hl-content-copy hl-content-copy-widget-override">If you have type 1 diabetes, your body can&rsquo;t make its own insulin. The goal of treatment is to replace the insulin that your body can&rsquo;t make.</div>\r\n</div>\r\n</div>\r\n<h3>Insulin</h3>\r\n<p>Insulin is the most common type of medication used in type 1 diabetes treatment. It&rsquo;s also used in type 2 diabetes treatment. It&rsquo;s given by injection and comes in different types. The type of insulin you need depends on how severe your insulin depletion is. Options include:</p>\r\n<h4>Short-acting insulin</h4>\r\n<ul>\r\n<li>Regular insuline (Humulin and Novolin)</li>\r\n</ul>\r\n<h4>Rapid-acting insulins</h4>\r\n<ul>\r\n<li>Insulin aspart(NovoLog, FlexPen)</li>\r\n<li>Insulin glulisine</li>\r\n<li>Insulin lispro</li>\r\n</ul>\r\n<h4>Intermediate-acting insulin</h4>\r\n<ul>\r\n<li>insulin isophane (Humulin N, Novolin N)</li>\r\n</ul>\r\n<h4>Long-acting insulins</h4>\r\n<ul>\r\n<li>insulin degludec (Tresiba)</li>\r\n<li>Insulin detemir (Levemir)</li>\r\n<li>insulin glargine</li>\r\n<li>Insulin glargine (Toujeo)</li>\r\n</ul>\r\n<h4>Combination insulins</h4>\r\n<ul>\r\n<li>NovoLog Mix 70/30 (insulin aspart protamine-insulin aspart)</li>\r\n<li>Humalog Mix 75/25 (insulin lispro protamine-insulin lispro)</li>\r\n<li>Humalog Mix 50/50 (insulin lispro protamine-insulin lispro)</li>\r\n<li>Humulin 70/30 (human insulin NPH-human insulin regular)</li>\r\n<li>Novolin 70/30 (human insulin NPH-human insulin regular)</li>\r\n<li>Ryzodeg (insulin degludec-insulin aspart)</li>\r\n</ul>\r\n<h3>Amylinomimetic drug</h3>\r\nPramlintide (SymlinPen 120, SymlinPen 60) is an amylinomimetic drug. It&rsquo;s an injectable drug used before meals. It works by delaying the time your stomach takes to empty itself. It reduces glucagon secretion after meals. This lowers your blood sugar. It also reduces appetite through a central mechanism.</div>', 'Take on diabetes through Diet and Nutrition-control, Yoga and Meditation & Exercise, Nature Cure, Acupressure, Ayurveda/Homeopathy/Herbal Cure and Allopathy.', 150, '100gm', 300.00, 280.00, 290.00, 2016, 20, '', 'Sugar_Tablet.jpg', 1, 1, '2016-11-11 02:48:26', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `route` varchar(100) NOT NULL,
  `parent` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`id`, `name`, `route`, `parent`, `status`) VALUES
(1, 'Acl', '#Acl', 0, 1),
(2, 'Role', 'roles', 1, 1),
(3, 'Delete Role', 'delete-role', 1, 1),
(4, 'Resources', 'resources', 1, 1),
(5, 'Delete Resource', 'delete-resource', 1, 1),
(6, 'Permissions', 'permissions', 1, 1),
(7, 'Add/Edit Permission', 'add-permission', 1, 1),
(8, 'Admin Users', 'admin-users', 1, 1),
(9, 'Delete Admin User', 'delete-admin-user', 1, 1),
(10, 'Branches', '#branches', 0, 1),
(11, 'All Branches', 'branches', 10, 1),
(12, 'Add Branch', 'add-branch', 10, 1),
(13, 'Edit Branch', 'edit-branch', 10, 1),
(14, 'Delete Branch', 'delete-branch', 10, 1),
(15, 'Branche Products', 'branch-products', 10, 1),
(16, 'Inventory', '#Inventory', 0, 1),
(17, 'Categories', '#categories', 16, 1),
(18, 'All Categories', 'categories', 17, 1),
(19, 'Add Category', 'add-category', 17, 1),
(20, 'Edit Category', 'edit-category', 17, 1),
(21, 'Delete Category', 'delete-category', 17, 1),
(22, 'Products', '#products', 16, 1),
(23, 'All Products', 'products', 22, 1),
(24, 'Add Product', 'add-product', 22, 1),
(25, 'Edit Product', 'edit-product', 22, 1),
(26, 'Delete Product', 'delete-product', 22, 1),
(27, 'Bundle Products', '#bundle-products', 16, 1),
(28, 'All Bundle Products', 'bundle-products', 15, 1),
(29, 'Add Bundle Products', 'add-bundle-product', 15, 1),
(30, 'Edit Bundle Products', 'edit-bundle-product', 15, 1),
(31, 'Delete Branche Products', 'delete-bundle-product', 15, 1),
(32, 'Members', '#members', 0, 1),
(33, 'All Member', 'members', 32, 1),
(34, 'Add Member', 'add-member', 32, 1),
(35, 'Edit Member', 'edit-member', 32, 1),
(36, 'Delete Member', 'delete-member', 32, 1),
(37, 'Add Bank Details', 'add-bank-details', 32, 1),
(38, 'Add Kyc Documents', 'add-kyc-documents', 32, 1),
(39, 'Genology', '#Genology', 0, 1),
(40, 'Binary View', 'binary-view', 39, 1),
(41, 'Direct Downline', 'direct-downline', 39, 1),
(42, 'Website', '#website', 0, 1),
(43, 'Home', 'home', 42, 1),
(44, 'About Us', 'about', 42, 1),
(45, 'Contact Us', 'contact', 42, 1),
(46, 'Dashboard', 'dashboard', 42, 1),
(47, 'Registration First Step', 'first-step', 42, 1),
(48, 'Registration Second Step', 'second-step', 42, 1),
(49, 'Registration Third Step', 'third-step', 42, 1),
(50, 'Thank You', 'thank-you', 42, 1),
(51, 'Login Logout', '#login', 0, 1),
(52, 'Admin Login', 'admin', 51, 1),
(53, 'Member Login', 'login', 51, 1),
(54, 'Logout', 'logout', 51, 1),
(55, 'Permission By Role', 'role-permission', 1, 1),
(56, 'Generate Pin', 'generate-pin', 32, 1),
(57, 'Product Details', 'product-details', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `icon`, `created_date`, `status`) VALUES
(1, 'Admin', 'fa fa-user-md', '2016-10-22 18:54:34', 1),
(2, 'Member', 'fa fa-user-md', '2016-10-22 18:54:47', 1),
(3, 'Guest', 'fa fa-user-md', '2016-10-22 18:54:54', 1);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `code` varchar(3) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `code`, `name`) VALUES
(1, 100, '', 'Andhra Pradesh'),
(2, 100, '', 'Arunachal Pradesh'),
(3, 100, '', 'Andaman and Nicobar Islands'),
(4, 100, '', 'Assam'),
(5, 100, '', 'Bihar'),
(6, 100, '', 'Chandigarh'),
(7, 100, '', 'Chhattisgarh'),
(8, 100, '', 'Dadra and Nagar Haveli'),
(9, 100, '', 'Daman and Diu'),
(10, 100, '', 'Delhi'),
(11, 100, '', 'Goa'),
(12, 100, '', 'Gujarat'),
(13, 100, '', 'Haryana'),
(14, 100, '', 'Himachal Pradesh'),
(15, 100, '', 'Jammu and Kashmir'),
(16, 100, '', 'Jharkhand'),
(17, 100, '', 'Karnataka'),
(18, 100, '', 'Kerala'),
(19, 100, '', 'Lakshadweep'),
(20, 100, '', 'Madhya Pradesh'),
(21, 100, '', 'Maharashtra'),
(22, 100, '', 'Manipur'),
(23, 100, '', 'Meghalaya'),
(24, 100, '', 'Mizoram'),
(25, 100, '', 'Nagaland'),
(26, 100, '', 'Orissa'),
(27, 100, '', 'Pondicherry'),
(28, 100, '', 'Punjab'),
(29, 100, '', 'Rajasthan'),
(30, 100, '', 'Sikkim'),
(31, 100, '', 'Tamil Nadu'),
(32, 100, '', 'Telangana'),
(33, 100, '', 'Tripura'),
(34, 100, '', 'Uttaranchal'),
(35, 100, '', 'Uttar Pradesh'),
(36, 100, '', 'West Bengal');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_login` varchar(50) NOT NULL,
  `user_pass` varchar(100) NOT NULL,
  `user_role` varchar(50) NOT NULL COMMENT '''admin'',''viewer'',''editor''',
  `user_nickname` varchar(50) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `registred_date` datetime NOT NULL,
  `display_name` varchar(50) NOT NULL,
  `user_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_login`, `user_pass`, `user_role`, `user_nickname`, `email_id`, `registred_date`, `display_name`, `user_status`) VALUES
(1, 'admin', 'fe01ce2a7fbac8fafaed7c982a04e229', 'Admin', 'Admin', 'admin@admin.com', '2016-09-28 10:25:42', 'Admin', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branch_products`
--
ALTER TABLE `branch_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bundle_products`
--
ALTER TABLE `bundle_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bundle_product_relations`
--
ALTER TABLE `bundle_product_relations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_countriesName` (`name`);

--
-- Indexes for table `kyc_documents`
--
ALTER TABLE `kyc_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `member_bank_details`
--
ALTER TABLE `member_bank_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member_business`
--
ALTER TABLE `member_business`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member_kyc`
--
ALTER TABLE `member_kyc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member_pin`
--
ALTER TABLE `member_pin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `member_id` (`member_id`);

--
-- Indexes for table `member_profile`
--
ALTER TABLE `member_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `member_id` (`member_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `branch_products`
--
ALTER TABLE `branch_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bundle_products`
--
ALTER TABLE `bundle_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `bundle_product_relations`
--
ALTER TABLE `bundle_product_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;
--
-- AUTO_INCREMENT for table `kyc_documents`
--
ALTER TABLE `kyc_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `member_bank_details`
--
ALTER TABLE `member_bank_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `member_business`
--
ALTER TABLE `member_business`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `member_kyc`
--
ALTER TABLE `member_kyc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `member_pin`
--
ALTER TABLE `member_pin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `member_profile`
--
ALTER TABLE `member_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
