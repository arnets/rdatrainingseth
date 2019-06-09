-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2019 at 08:20 PM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tact`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `about_us` (IN `mission` VARCHAR(1000), IN `details` VARCHAR(1000))  NO SQL
BEGIN
	INSERT INTO tb_about_us (mission,details) VALUES (mission,details);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_activity` (IN `act_code` VARCHAR(50))  NO SQL
BEGIN
	DELETE FROM tb_activities WHERE activity_code = act_code;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_interest` (IN `name` VARCHAR(50))  NO SQL
BEGIN
	DELETE FROM tb_activities_interests WHERE interest_name = name;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_about_us` ()  NO SQL
BEGIN
	SELECT * FROM tb_about_us;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_activities` ()  NO SQL
BEGIN
	SELECT * FROM tb_activities;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_interests` ()  NO SQL
BEGIN
	SELECT * FROM tb_activities_interests;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_home_page_data` ()  NO SQL
BEGIN
	SELECT * FROM tb_home_page;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_interest_with_activity` ()  NO SQL
BEGIN
	SELECT act_inte.interest_name,act.activity_name,act_inte.interest_description FROM tb_activities act INNER JOIN tb_activities_interests act_inte ON act.activity_code = act_inte.activity_code;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_more_details` (IN `userid` INT(100), IN `activity` VARCHAR(50), IN `city` VARCHAR(50))  NO SQL
BEGIN
    SELECT tb_activities_location.location_city,tb_activities_interests.interest_name,tb_activities_interests.interest_description,tb_activities_location.latitude,tb_activities_location.longitude,tb_user_activities_interests.user_id,tb_user_activities_interests.interest_image FROM tb_user_activities_interests INNER JOIN tb_activities_interests ON tb_user_activities_interests.interest_name = tb_activities_interests.interest_name INNER JOIN tb_activities ON tb_activities_interests.activity_code = tb_activities.activity_code INNER JOIN tb_activities_location ON tb_activities.activity_code = tb_activities_location.activity_code WHERE tb_user_activities_interests.user_id = userid AND tb_activities_interests.interest_name = activity AND tb_activities_location.interest_name= activity AND tb_activities_location.location_city = city;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_pages_data` (IN `act_code` VARCHAR(50))  NO SQL
BEGIN
	SELECT tb_activities.activity_name,tb_activities.activity_description,tb_activities_interests.interest_name,tb_activities_interests.interest_description FROM tb_activities INNER JOIN tb_activities_interests ON tb_activities.activity_code = tb_activities_interests.activity_code WHERE tb_activities.activity_code = act_code;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_single_activity` (IN `act_code` VARCHAR(50))  NO SQL
BEGIN
	SELECT * FROM tb_activities WHERE activity_code = act_code;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_single_interest` (IN `int_name` VARCHAR(50))  NO SQL
BEGIN
	SELECT tb_activities_interests.interest_name,tb_activities.activity_code,tb_activities.activity_name,tb_activities_interests.interest_description FROM tb_activities_interests INNER JOIN tb_activities ON tb_activities_interests.activity_code = tb_activities.activity_code WHERE tb_activities_interests.interest_name = int_name;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_tact_users` ()  NO SQL
BEGIN
	SELECT * FROM tb_tact_users;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_activities` (IN `user_ids` INT(100))  NO SQL
BEGIN
	SELECT tb_activities.activity_name, tb_user_activities_interests.interest_name FROM tb_activities INNER JOIN tb_activities_interests ON tb_activities.activity_code = tb_activities_interests.activity_code INNER JOIN tb_user_activities_interests ON tb_activities_interests.interest_name = tb_user_activities_interests.interest_name WHERE tb_user_activities_interests.user_id = user_ids; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_details` (IN `userID` BIGINT(100))  NO SQL
BEGIN
	SELECT * FROM tb_tact_users WHERE user_id = userID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_distinct_activity` (IN `user_ids` INT(100))  NO SQL
BEGIN
	SELECT DISTINCT tb_activities.activity_name FROM tb_activities INNER JOIN tb_activities_interests ON tb_activities.activity_code = tb_activities_interests.activity_code INNER JOIN tb_user_activities_interests ON tb_activities_interests.interest_name = tb_user_activities_interests.interest_name WHERE tb_user_activities_interests.user_id = user_ids; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `home_page` (IN `first_col` VARCHAR(1000), IN `second_col` VARCHAR(1000))  NO SQL
BEGIN
	INSERT INTO tb_home_page(first_column,second_column) VALUES (first_col,second_col);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_activity` (IN `act_code` VARCHAR(50), IN `act_name` VARCHAR(50), IN `act_description` VARCHAR(500))  NO SQL
BEGIN
	INSERT INTO tb_activities(activity_code,activity_name,activity_description) VALUES(act_code,act_name,act_description);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_activity_interests` (IN `int_name` VARCHAR(50), IN `act_code` VARCHAR(50), IN `int_desc` VARCHAR(500))  NO SQL
BEGIN
	INSERT INTO tb_activities_interests (interest_name,activity_code,interest_description) VALUES (int_name,act_code,int_desc);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_activity_location` (IN `userid` INT(100), IN `act_code` VARCHAR(50), IN `lon` FLOAT(50.8), IN `lat` FLOAT(50.8), IN `act_city` VARCHAR(50), IN `act_inte` VARCHAR(50))  NO SQL
BEGIN
	INSERT INTO tb_activities_location (user_ID,activity_code,latitude,longitude,location_city,interest_name) VALUES (userid,act_code,lat,lon,act_city,act_inte);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_user_interest` (IN `user_id` INT(100), IN `int_name` VARCHAR(50))  NO SQL
BEGIN
	INSERT INTO tb_user_activities_interests (user_id,interest_name) VALUES (user_id,int_name);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `register_user` (IN `fname` VARCHAR(50), IN `lname` VARCHAR(50), IN `email` VARCHAR(100), IN `phone` VARCHAR(20), IN `sex` VARCHAR(20), IN `key_word` VARCHAR(100), IN `country` VARCHAR(50), IN `city` VARCHAR(50), IN `image` VARCHAR(50), IN `int_name` VARCHAR(50))  NO SQL
BEGIN
	INSERT INTO tb_tact_users (first_name,surname,email,phone_number,gender,pass_word,country_of_origin,city_of_origin,profile_image) VALUES (fname,lname,email,phone,gender,key_word,country,city,image);
    SET @user_id = LAST_INSERT_ID();
    CALL insert_user_interest(@user_id,int_name);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_activity` (IN `act_code` VARCHAR(50), IN `act_name` VARCHAR(50), IN `act_descrip` VARCHAR(500))  NO SQL
BEGIN
	UPDATE tb_activities SET activity_name = act_name, activity_description = act_descrip WHERE activity_code = act_code;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_interest` (IN `int_name` VARCHAR(50), IN `act_code` VARCHAR(50), IN `int_descrip` VARCHAR(500))  NO SQL
BEGIN
	UPDATE tb_activities_interests SET activity_code = act_code, interest_description = int_descrip WHERE interest_name = int_name;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user_interest` (IN `userid` VARCHAR(100), IN `int_image` VARCHAR(100), IN `int_name` VARCHAR(50))  NO SQL
BEGIN
	UPDATE tb_user_activities_interests SET interest_image = int_image WHERE user_id = userid AND interest_name = int_name;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user_profile` (IN `userid` BIGINT(100), IN `fname` VARCHAR(50), IN `lname` VARCHAR(50), IN `gmail` VARCHAR(100), IN `phone` VARCHAR(20))  NO SQL
BEGIN
	UPDATE tb_tact_users SET first_name = fname, surname = lname, email = gmail, phone_number = phone WHERE user_id = userid;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_about_us`
--

CREATE TABLE `tb_about_us` (
  `about_id` int(100) NOT NULL,
  `mission` varchar(500) NOT NULL,
  `details` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_activities`
--

CREATE TABLE `tb_activities` (
  `activity_code` varchar(50) NOT NULL,
  `activity_name` varchar(50) NOT NULL,
  `activity_description` varchar(500) NOT NULL,
  `recorded_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_activities_interests`
--

CREATE TABLE `tb_activities_interests` (
  `interest_name` varchar(50) NOT NULL,
  `activity_code` varchar(50) NOT NULL,
  `interest_description` varchar(500) NOT NULL,
  `recorded_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_activities_location`
--

CREATE TABLE `tb_activities_location` (
  `user_ID` int(100) NOT NULL,
  `activity_code` varchar(50) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `location_city` varchar(50) NOT NULL,
  `interest_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_cd_customizations`
--

CREATE TABLE `tb_cd_customizations` (
  `role` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu` longtext COLLATE utf8mb4_unicode_ci,
  `submenu` longtext COLLATE utf8mb4_unicode_ci,
  `dashboard` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_cd_customizations`
--

INSERT INTO `tb_cd_customizations` (`role`, `menu`, `submenu`, `dashboard`) VALUES
('preview_administrator', 'a:15:{i:0;a:8:{s:2:\"id\";s:9:\"index.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:9:\"Dashboard\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:19:\"dashicons-dashboard\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:1;a:8:{s:2:\"id\";s:10:\"separator1\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:0:\"\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:0:\"\";s:4:\"type\";s:9:\"separator\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:2;a:8:{s:2:\"id\";s:8:\"edit.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:5:\"Posts\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:20:\"dashicons-admin-post\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:3;a:8:{s:2:\"id\";s:10:\"upload.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:5:\"Media\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:21:\"dashicons-admin-media\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:4;a:8:{s:2:\"id\";s:23:\"edit.php?post_type=page\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:5:\"Pages\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:20:\"dashicons-admin-page\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:5;a:8:{s:2:\"id\";s:17:\"edit-comments.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:8:\"Comments\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:24:\"dashicons-admin-comments\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:6;a:8:{s:2:\"id\";s:10:\"separator2\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:0:\"\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:0:\"\";s:4:\"type\";s:9:\"separator\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:7;a:8:{s:2:\"id\";s:10:\"themes.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:10:\"Appearance\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:26:\"dashicons-admin-appearance\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:8;a:8:{s:2:\"id\";s:11:\"plugins.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"Plugins\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:23:\"dashicons-admin-plugins\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:9;a:8:{s:2:\"id\";s:9:\"users.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:5:\"Users\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:21:\"dashicons-admin-users\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:10;a:8:{s:2:\"id\";s:9:\"tools.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:5:\"Tools\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:21:\"dashicons-admin-tools\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:11;a:8:{s:2:\"id\";s:19:\"options-general.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:8:\"Settings\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:24:\"dashicons-admin-settings\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:12;a:8:{s:2:\"id\";s:14:\"separator-last\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:0:\"\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:0:\"\";s:4:\"type\";s:9:\"separator\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:13;a:8:{s:2:\"id\";s:10:\"clientdash\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:11:\"Client Dash\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:23:\"dashicons-admin-generic\";s:4:\"type\";s:10:\"clientdash\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:14;a:8:{s:2:\"id\";s:12:\"Add Activity\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:12:\"Add activity\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:78:\"http://localhost/wordpress/wp-content/plugins/customized-pluginsimage/icon.png\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}}', 'a:10:{s:9:\"index.php\";a:6:{i:0;a:6:{s:2:\"id\";s:9:\"index.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:4:\"Home\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:1;a:6:{s:2:\"id\";s:15:\"update-core.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"Updates\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:2;a:6:{s:2:\"id\";s:10:\"cd_account\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"Account\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:3;a:6:{s:2:\"id\";s:7:\"cd_help\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:4:\"Help\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:4;a:6:{s:2:\"id\";s:10:\"cd_reports\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"Reports\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:5;a:6:{s:2:\"id\";s:13:\"cd_admin_page\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:10:\"Admin Page\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}}s:10:\"upload.php\";a:2:{i:0;a:6:{s:2:\"id\";s:10:\"upload.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"Library\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:1;a:6:{s:2:\"id\";s:13:\"media-new.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"Add New\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}}s:8:\"edit.php\";a:4:{i:0;a:6:{s:2:\"id\";s:8:\"edit.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:9:\"All Posts\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:1;a:6:{s:2:\"id\";s:12:\"post-new.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"Add New\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:2;a:6:{s:2:\"id\";s:31:\"edit-tags.php?taxonomy=category\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:10:\"Categories\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:3;a:6:{s:2:\"id\";s:31:\"edit-tags.php?taxonomy=post_tag\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:4:\"Tags\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}}s:23:\"edit.php?post_type=page\";a:2:{i:0;a:6:{s:2:\"id\";s:23:\"edit.php?post_type=page\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:9:\"All Pages\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:1;a:6:{s:2:\"id\";s:27:\"post-new.php?post_type=page\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"Add New\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}}s:10:\"themes.php\";a:6:{i:0;a:6:{s:2:\"id\";s:10:\"themes.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:6:\"Themes\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:1;a:6:{s:2:\"id\";s:12:\"wp_customize\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:9:\"Customize\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:2;a:6:{s:2:\"id\";s:11:\"widgets.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"Widgets\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:3;a:6:{s:2:\"id\";s:13:\"nav-menus.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:5:\"Menus\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:4;a:6:{s:2:\"id\";s:155:\"http://localhost/wordpress/wp-admin/customize.php?autofocus[panel]=logincust_panel&url=http%3A%2F%2Flocalhost%2Fwordpress%2Findex.php%2Flogin-customizer%2F\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:16:\"Login Customizer\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:5;a:6:{s:2:\"id\";s:16:\"theme-editor.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:12:\"Theme Editor\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}}s:11:\"plugins.php\";a:3:{i:0;a:6:{s:2:\"id\";s:11:\"plugins.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:17:\"Installed Plugins\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:1;a:6:{s:2:\"id\";s:18:\"plugin-install.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"Add New\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:2;a:6:{s:2:\"id\";s:17:\"plugin-editor.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:13:\"Plugin Editor\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}}s:9:\"users.php\";a:3:{i:0;a:6:{s:2:\"id\";s:9:\"users.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:9:\"All Users\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:1;a:6:{s:2:\"id\";s:12:\"user-new.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"Add New\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:2;a:6:{s:2:\"id\";s:11:\"profile.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:12:\"Your Profile\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}}s:9:\"tools.php\";a:6:{i:0;a:6:{s:2:\"id\";s:9:\"tools.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:15:\"Available Tools\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:1;a:6:{s:2:\"id\";s:10:\"import.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:6:\"Import\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:2;a:6:{s:2:\"id\";s:10:\"export.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:6:\"Export\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:3;a:6:{s:2:\"id\";s:15:\"site-health.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:11:\"Site Health\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:4;a:6:{s:2:\"id\";s:20:\"export_personal_data\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:20:\"Export Personal Data\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:5;a:6:{s:2:\"id\";s:20:\"remove_personal_data\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:19:\"Erase Personal Data\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}}s:19:\"options-general.php\";a:8:{i:0;a:6:{s:2:\"id\";s:19:\"options-general.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"General\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:1;a:6:{s:2:\"id\";s:19:\"options-writing.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"Writing\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:2;a:6:{s:2:\"id\";s:19:\"options-reading.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"Reading\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:3;a:6:{s:2:\"id\";s:22:\"options-discussion.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:10:\"Discussion\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:4;a:6:{s:2:\"id\";s:17:\"options-media.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:5:\"Media\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:5;a:6:{s:2:\"id\";s:21:\"options-permalink.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:10:\"Permalinks\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:6;a:6:{s:2:\"id\";s:11:\"privacy.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"Privacy\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:7;a:6:{s:2:\"id\";s:18:\"adminimize-options\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:10:\"Adminimize\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}}s:10:\"clientdash\";a:5:{i:0;a:6:{s:2:\"id\";s:50:\"http://localhost/wordpress/?clientdash_customize=1\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:15:\"Customize Admin\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:1;a:6:{s:2:\"id\";s:21:\"clientdash_admin_page\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:10:\"Admin Page\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:2;a:6:{s:2:\"id\";s:23:\"clientdash_helper_pages\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:12:\"Helper Pages\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:3;a:6:{s:2:\"id\";s:19:\"clientdash_settings\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:8:\"Settings\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:4;a:6:{s:2:\"id\";s:17:\"clientdash_addons\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:6:\"Addons\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}}}', 'a:8:{i:0;a:6:{s:2:\"id\";s:19:\"dashboard_right_now\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:11:\"At a Glance\";s:3:\"new\";b:0;s:7:\"deleted\";b:0;s:4:\"type\";s:7:\"default\";}i:1;a:6:{s:2:\"id\";s:18:\"dashboard_activity\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:8:\"Activity\";s:3:\"new\";b:0;s:7:\"deleted\";b:0;s:4:\"type\";s:7:\"default\";}i:2;a:6:{s:2:\"id\";s:10:\"cd_account\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"Account\";s:3:\"new\";b:0;s:7:\"deleted\";b:0;s:4:\"type\";s:7:\"default\";}i:3;a:6:{s:2:\"id\";s:7:\"cd_help\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:4:\"Help\";s:3:\"new\";b:0;s:7:\"deleted\";b:0;s:4:\"type\";s:7:\"default\";}i:4;a:6:{s:2:\"id\";s:10:\"cd_reports\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"Reports\";s:3:\"new\";b:0;s:7:\"deleted\";b:0;s:4:\"type\";s:7:\"default\";}i:5;a:6:{s:2:\"id\";s:13:\"cd_admin_page\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:10:\"Admin Page\";s:3:\"new\";b:0;s:7:\"deleted\";b:0;s:4:\"type\";s:7:\"default\";}i:6;a:6:{s:2:\"id\";s:21:\"dashboard_quick_press\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:11:\"Quick Draft\";s:3:\"new\";b:0;s:7:\"deleted\";b:0;s:4:\"type\";s:7:\"default\";}i:7;a:6:{s:2:\"id\";s:17:\"dashboard_primary\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:25:\"WordPress Events and News\";s:3:\"new\";b:0;s:7:\"deleted\";b:0;s:4:\"type\";s:7:\"default\";}}'),
('preview_editor', 'a:11:{i:0;a:8:{s:2:\"id\";s:9:\"index.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:9:\"Dashboard\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:19:\"dashicons-dashboard\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:1;a:8:{s:2:\"id\";s:10:\"separator1\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:0:\"\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:0:\"\";s:4:\"type\";s:9:\"separator\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:2;a:8:{s:2:\"id\";s:8:\"edit.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:5:\"Posts\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:20:\"dashicons-admin-post\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:3;a:8:{s:2:\"id\";s:10:\"upload.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:5:\"Media\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:21:\"dashicons-admin-media\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:4;a:8:{s:2:\"id\";s:23:\"edit.php?post_type=page\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:5:\"Pages\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:20:\"dashicons-admin-page\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:5;a:8:{s:2:\"id\";s:17:\"edit-comments.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:8:\"Comments\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:24:\"dashicons-admin-comments\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:6;a:8:{s:2:\"id\";s:10:\"separator2\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:0:\"\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:0:\"\";s:4:\"type\";s:9:\"separator\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:7;a:8:{s:2:\"id\";s:10:\"themes.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:10:\"Appearance\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:26:\"dashicons-admin-appearance\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:8;a:8:{s:2:\"id\";s:11:\"profile.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"Profile\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:21:\"dashicons-admin-users\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:9;a:8:{s:2:\"id\";s:9:\"tools.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:5:\"Tools\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:21:\"dashicons-admin-tools\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:10;a:8:{s:2:\"id\";s:14:\"separator-last\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:0:\"\";s:4:\"icon\";s:0:\"\";s:13:\"original_icon\";s:0:\"\";s:4:\"type\";s:9:\"separator\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}}', 'a:4:{s:9:\"index.php\";a:4:{i:0;a:6:{s:2:\"id\";s:9:\"index.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:4:\"Home\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:1;a:6:{s:2:\"id\";s:10:\"cd_account\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"Account\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:2;a:6:{s:2:\"id\";s:7:\"cd_help\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:4:\"Help\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:3;a:6:{s:2:\"id\";s:10:\"cd_reports\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"Reports\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}}s:10:\"upload.php\";a:2:{i:0;a:6:{s:2:\"id\";s:10:\"upload.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"Library\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:1;a:6:{s:2:\"id\";s:13:\"media-new.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"Add New\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}}s:8:\"edit.php\";a:3:{i:0;a:6:{s:2:\"id\";s:8:\"edit.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:9:\"All Posts\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:1;a:6:{s:2:\"id\";s:12:\"post-new.php\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"Add New\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}i:2;a:6:{s:2:\"id\";s:31:\"edit-tags.php?taxonomy=post_tag\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:4:\"Tags\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}}s:10:\"themes.php\";a:1:{i:0;a:6:{s:2:\"id\";s:155:\"http://localhost/wordpress/wp-admin/customize.php?autofocus[panel]=logincust_panel&url=http%3A%2F%2Flocalhost%2Fwordpress%2Findex.php%2Flogin-customizer%2F\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:16:\"Login Customizer\";s:4:\"type\";s:9:\"menu_item\";s:7:\"deleted\";b:0;s:3:\"new\";b:0;}}}', 'a:7:{i:0;a:6:{s:2:\"id\";s:19:\"dashboard_right_now\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:11:\"At a Glance\";s:3:\"new\";b:0;s:7:\"deleted\";b:0;s:4:\"type\";s:7:\"default\";}i:1;a:6:{s:2:\"id\";s:18:\"dashboard_activity\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:8:\"Activity\";s:3:\"new\";b:0;s:7:\"deleted\";b:0;s:4:\"type\";s:7:\"default\";}i:2;a:6:{s:2:\"id\";s:10:\"cd_account\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"Account\";s:3:\"new\";b:0;s:7:\"deleted\";b:0;s:4:\"type\";s:7:\"default\";}i:3;a:6:{s:2:\"id\";s:7:\"cd_help\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:4:\"Help\";s:3:\"new\";b:0;s:7:\"deleted\";b:0;s:4:\"type\";s:7:\"default\";}i:4;a:6:{s:2:\"id\";s:10:\"cd_reports\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:7:\"Reports\";s:3:\"new\";b:0;s:7:\"deleted\";b:0;s:4:\"type\";s:7:\"default\";}i:5;a:6:{s:2:\"id\";s:21:\"dashboard_quick_press\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:11:\"Quick Draft\";s:3:\"new\";b:0;s:7:\"deleted\";b:0;s:4:\"type\";s:7:\"default\";}i:6;a:6:{s:2:\"id\";s:17:\"dashboard_primary\";s:5:\"title\";s:0:\"\";s:14:\"original_title\";s:25:\"WordPress Events and News\";s:3:\"new\";b:0;s:7:\"deleted\";b:0;s:4:\"type\";s:7:\"default\";}}');

-- --------------------------------------------------------

--
-- Table structure for table `tb_commentmeta`
--

CREATE TABLE `tb_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_commentmeta`
--

INSERT INTO `tb_commentmeta` (`meta_id`, `comment_id`, `meta_key`, `meta_value`) VALUES
(1, 1, '_wp_trash_meta_status', '1'),
(2, 1, '_wp_trash_meta_time', '1558361158');

-- --------------------------------------------------------

--
-- Table structure for table `tb_comments`
--

CREATE TABLE `tb_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_comments`
--

INSERT INTO `tb_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2019-05-19 16:42:03', '2019-05-19 16:42:03', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.', 0, 'trash', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_home_page`
--

CREATE TABLE `tb_home_page` (
  `home_id` int(10) NOT NULL,
  `first_column` varchar(1000) NOT NULL,
  `second_column` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_messages`
--

CREATE TABLE `tb_messages` (
  `message_id` int(255) NOT NULL,
  `sender` int(100) NOT NULL,
  `receiver` int(100) NOT NULL,
  `message_content` varchar(500) NOT NULL,
  `message_status` enum('0','1') NOT NULL,
  `sent_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_options`
--

CREATE TABLE `tb_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_options`
--

INSERT INTO `tb_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/wordpress', 'yes'),
(2, 'home', 'http://localhost/wordpress', 'yes'),
(3, 'blogname', 'tact', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'sethbientus@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '0', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/index.php/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:74:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:42:\"index.php/feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:37:\"index.php/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:18:\"index.php/embed/?$\";s:21:\"index.php?&embed=true\";s:30:\"index.php/page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:51:\"index.php/comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:46:\"index.php/comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:27:\"index.php/comments/embed/?$\";s:21:\"index.php?&embed=true\";s:54:\"index.php/search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:49:\"index.php/search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:30:\"index.php/search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:42:\"index.php/search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:24:\"index.php/search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:57:\"index.php/author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:52:\"index.php/author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:33:\"index.php/author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:45:\"index.php/author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:27:\"index.php/author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:79:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:74:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:55:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:67:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:49:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:66:\"index.php/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:61:\"index.php/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:42:\"index.php/([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:54:\"index.php/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:36:\"index.php/([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:53:\"index.php/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:48:\"index.php/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:29:\"index.php/([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:41:\"index.php/([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:23:\"index.php/([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:68:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:78:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:98:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:93:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:93:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:74:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:63:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:67:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:87:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:82:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:75:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:82:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:71:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:57:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:67:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:87:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:82:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:82:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:63:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:74:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:61:\"index.php/([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:48:\"index.php/([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:37:\"index.php/.?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:47:\"index.php/.?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:67:\"index.php/.?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"index.php/.?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"index.php/.?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:43:\"index.php/.?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:26:\"index.php/(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:30:\"index.php/(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:50:\"index.php/(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:45:\"index.php/(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:38:\"index.php/(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:45:\"index.php/(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:34:\"index.php/(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:11:{i:0;s:28:\"about_us/about_us_plugin.php\";i:1;s:47:\"activity_location/add_interest_image_plugin.php\";i:2;s:26:\"activity_plugin/plugin.php\";i:3;s:42:\"activity_plugin/update_activity_plugin.php\";i:4;s:35:\"activity_plugin/view_activities.php\";i:5;s:25:\"adminimize/adminimize.php\";i:6;s:30:\"home_page/home_page_plugin.php\";i:7;s:39:\"interest_plugin/Add_interest_plugin.php\";i:8;s:42:\"interest_plugin/update_interest_plugin.php\";i:9;s:34:\"interest_plugin/view_interests.php\";i:10;s:37:\"login-customizer/login-customizer.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:3:{i:0;s:68:\"C:\\xampp\\htdocs\\wordpress/wp-content/themes/twentynineteen/style.css\";i:1;s:64:\"C:\\xampp\\htdocs\\wordpress/wp-content/plugins/akismet/akismet.php\";i:2;s:0:\"\";}', 'no'),
(40, 'template', 'twentynineteen', 'yes'),
(41, 'stylesheet', 'twentynineteen', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '44719', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '0', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'posts', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:1:{s:25:\"adminimize/adminimize.php\";s:24:\"_mw_adminimize_uninstall\";}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '1', 'yes'),
(93, 'initial_db_version', '44719', 'yes'),
(94, 'tb_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:62:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:15:\"customize_admin\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(95, 'fresh_site', '0', 'yes'),
(96, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(97, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'sidebars_widgets', 'a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}', 'yes'),
(102, 'cron', 'a:8:{i:1560105731;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1560141731;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1560141732;a:2:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1560184926;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1560184971;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1560184972;a:1:{s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1560184976;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(103, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'theme_mods_twentynineteen', 'a:1:{s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(114, 'recovery_keys', 'a:1:{s:22:\"t947WZJSxwGIadBZcXnhvk\";a:2:{s:10:\"hashed_key\";s:34:\"$P$BK6980TNVQoGP5n9luSHKDNEOymcMH/\";s:10:\"created_at\";i:1560059805;}}', 'yes'),
(115, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:2:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.2.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.2.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.2.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.2.1-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-5.2.1-partial-0.zip\";s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.2.1\";s:7:\"version\";s:5:\"5.2.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:3:\"5.2\";}i:1;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.2.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.2.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.2.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.2.1-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-5.2.1-partial-0.zip\";s:8:\"rollback\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.2.1-rollback-0.zip\";}s:7:\"current\";s:5:\"5.2.1\";s:7:\"version\";s:5:\"5.2.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:3:\"5.2\";s:9:\"new_files\";s:0:\"\";}}s:12:\"last_checked\";i:1560098625;s:15:\"version_checked\";s:3:\"5.2\";s:12:\"translations\";a:0:{}}', 'no'),
(119, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1560098626;s:7:\"checked\";a:3:{s:14:\"twentynineteen\";s:3:\"1.4\";s:15:\"twentyseventeen\";s:3:\"2.2\";s:13:\"twentysixteen\";s:3:\"2.0\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(123, 'can_compress_scripts', '1', 'no'),
(137, 'recently_activated', 'a:0:{}', 'yes'),
(148, 'widget_akismet_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(153, 'vfb_db_version', '2.9', 'yes'),
(154, 'widget_vfb_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(155, 'vfb_dashboard_widget_options', 'a:1:{s:28:\"vfb_dashboard_recent_entries\";a:1:{s:5:\"items\";i:5;}}', 'yes'),
(163, 'login_customizer_options', 'a:43:{i:0;s:14:\"logincust_logo\";i:1;s:20:\"logincust_logo_width\";i:2;s:21:\"logincust_logo_height\";i:3;s:22:\"logincust_logo_padding\";i:4;s:18:\"logincust_bg_image\";i:5;s:18:\"logincust_bg_color\";i:6;s:17:\"logincust_bg_size\";i:7;s:23:\"logincust_form_bg_image\";i:8;s:23:\"logincust_form_bg_color\";i:9;s:20:\"logincust_form_width\";i:10;s:21:\"logincust_form_height\";i:11;s:22:\"logincust_form_padding\";i:12;s:21:\"logincust_field_width\";i:13;s:22:\"logincust_field_margin\";i:14;s:18:\"logincust_field_bg\";i:15;s:21:\"logincust_field_color\";i:16;s:21:\"logincust_field_label\";i:17;s:19:\"logincust_button_bg\";i:18;s:23:\"logincust_button_border\";i:19;s:23:\"logincust_button_shadow\";i:20;s:22:\"logincust_button_color\";i:21;s:25:\"logincust_button_hover_bg\";i:22;s:29:\"logincust_button_hover_border\";i:23;s:21:\"logincust_other_color\";i:24;s:27:\"logincust_other_color_hover\";i:25;s:19:\"logincust_other_css\";s:22:\"logincust_logo_padding\";s:3:\"0px\";s:14:\"logincust_logo\";s:65:\"http://localhost/wordpress/wp-content/uploads/2019/05/images.jpeg\";s:20:\"logincust_logo_width\";s:5:\"217px\";s:19:\"logincust_logo_show\";i:0;s:21:\"logincust_logo_height\";s:4:\"65px\";s:20:\"logincust_form_width\";s:5:\"304px\";s:21:\"logincust_form_height\";s:5:\"174px\";s:22:\"logincust_form_padding\";s:17:\"10px 7px 68px 9px\";s:28:\"logincust_form_shadow_spread\";s:4:\"24px\";s:21:\"logincust_field_width\";s:4:\"100%\";s:25:\"logincust_field_font_size\";s:4:\"17px\";s:28:\"logincust_field_border_width\";s:3:\"3px\";s:31:\"logincust_field_label_font_size\";s:4:\"16px\";s:19:\"logincust_button_bg\";s:7:\"#2eb0d1\";s:25:\"logincust_button_hover_bg\";s:7:\"#2399ed\";s:29:\"logincust_button_height_width\";s:6:\"custom\";s:25:\"logincust_other_font_size\";s:4:\"21px\";}', 'yes'),
(164, 'login_customizer_settings', 'a:2:{s:4:\"page\";i:5;s:7:\"version\";s:5:\"2.0.1\";}', 'yes');
INSERT INTO `tb_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(169, 'mw_adminimize', 'a:92:{s:29:\"mw_adminimize_admin_bar_nodes\";a:23:{s:12:\"user-actions\";O:8:\"stdClass\":6:{s:2:\"id\";s:12:\"user-actions\";s:5:\"title\";b:0;s:6:\"parent\";s:10:\"my-account\";s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:0:{}}s:9:\"user-info\";O:8:\"stdClass\":6:{s:2:\"id\";s:9:\"user-info\";s:5:\"title\";s:298:\"<img alt=\'\' src=\'http://0.gravatar.com/avatar/90c84dcaf0cd4711b2955c2038935425?s=64&#038;d=mm&#038;r=g\' srcset=\'http://0.gravatar.com/avatar/90c84dcaf0cd4711b2955c2038935425?s=128&#038;d=mm&#038;r=g 2x\' class=\'avatar avatar-64 photo\' height=\'64\' width=\'64\' /><span class=\'display-name\'>admin</span>\";s:6:\"parent\";s:12:\"user-actions\";s:4:\"href\";s:47:\"http://localhost/wordpress/wp-admin/profile.php\";s:5:\"group\";b:0;s:4:\"meta\";a:1:{s:8:\"tabindex\";i:-1;}}s:12:\"edit-profile\";O:8:\"stdClass\":6:{s:2:\"id\";s:12:\"edit-profile\";s:5:\"title\";s:15:\"Edit My Profile\";s:6:\"parent\";s:12:\"user-actions\";s:4:\"href\";s:47:\"http://localhost/wordpress/wp-admin/profile.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:6:\"logout\";O:8:\"stdClass\":6:{s:2:\"id\";s:6:\"logout\";s:5:\"title\";s:7:\"Log Out\";s:6:\"parent\";s:12:\"user-actions\";s:4:\"href\";s:77:\"http://localhost/wordpress/wp-login.php?action=logout&amp;_wpnonce=6b8fb22d9a\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:11:\"menu-toggle\";O:8:\"stdClass\":6:{s:2:\"id\";s:11:\"menu-toggle\";s:5:\"title\";s:73:\"<span class=\"ab-icon\"></span><span class=\"screen-reader-text\">Menu</span>\";s:6:\"parent\";b:0;s:4:\"href\";s:1:\"#\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:10:\"my-account\";O:8:\"stdClass\":6:{s:2:\"id\";s:10:\"my-account\";s:5:\"title\";s:304:\"Howdy, <span class=\"display-name\">admin</span><img alt=\'\' src=\'http://0.gravatar.com/avatar/90c84dcaf0cd4711b2955c2038935425?s=26&#038;d=mm&#038;r=g\' srcset=\'http://0.gravatar.com/avatar/90c84dcaf0cd4711b2955c2038935425?s=52&#038;d=mm&#038;r=g 2x\' class=\'avatar avatar-26 photo\' height=\'26\' width=\'26\' />\";s:6:\"parent\";s:13:\"top-secondary\";s:4:\"href\";s:47:\"http://localhost/wordpress/wp-admin/profile.php\";s:5:\"group\";b:0;s:4:\"meta\";a:1:{s:5:\"class\";s:11:\"with-avatar\";}}s:7:\"wp-logo\";O:8:\"stdClass\":6:{s:2:\"id\";s:7:\"wp-logo\";s:5:\"title\";s:84:\"<span class=\"ab-icon\"></span><span class=\"screen-reader-text\">About WordPress</span>\";s:6:\"parent\";b:0;s:4:\"href\";s:45:\"http://localhost/wordpress/wp-admin/about.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:5:\"about\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"about\";s:5:\"title\";s:15:\"About WordPress\";s:6:\"parent\";s:7:\"wp-logo\";s:4:\"href\";s:45:\"http://localhost/wordpress/wp-admin/about.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:5:\"wporg\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"wporg\";s:5:\"title\";s:13:\"WordPress.org\";s:6:\"parent\";s:16:\"wp-logo-external\";s:4:\"href\";s:22:\"https://wordpress.org/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:13:\"documentation\";O:8:\"stdClass\":6:{s:2:\"id\";s:13:\"documentation\";s:5:\"title\";s:13:\"Documentation\";s:6:\"parent\";s:16:\"wp-logo-external\";s:4:\"href\";s:28:\"https://codex.wordpress.org/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:14:\"support-forums\";O:8:\"stdClass\":6:{s:2:\"id\";s:14:\"support-forums\";s:5:\"title\";s:7:\"Support\";s:6:\"parent\";s:16:\"wp-logo-external\";s:4:\"href\";s:30:\"https://wordpress.org/support/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:8:\"feedback\";O:8:\"stdClass\":6:{s:2:\"id\";s:8:\"feedback\";s:5:\"title\";s:8:\"Feedback\";s:6:\"parent\";s:16:\"wp-logo-external\";s:4:\"href\";s:57:\"https://wordpress.org/support/forum/requests-and-feedback\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:9:\"site-name\";O:8:\"stdClass\":6:{s:2:\"id\";s:9:\"site-name\";s:5:\"title\";s:4:\"tact\";s:6:\"parent\";b:0;s:4:\"href\";s:27:\"http://localhost/wordpress/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:9:\"view-site\";O:8:\"stdClass\":6:{s:2:\"id\";s:9:\"view-site\";s:5:\"title\";s:10:\"Visit Site\";s:6:\"parent\";s:9:\"site-name\";s:4:\"href\";s:27:\"http://localhost/wordpress/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:7:\"updates\";O:8:\"stdClass\":6:{s:2:\"id\";s:7:\"updates\";s:5:\"title\";s:118:\"<span class=\"ab-icon\"></span><span class=\"ab-label\">1</span><span class=\"screen-reader-text\">1 WordPress Update</span>\";s:6:\"parent\";b:0;s:4:\"href\";s:51:\"http://localhost/wordpress/wp-admin/update-core.php\";s:5:\"group\";b:0;s:4:\"meta\";a:1:{s:5:\"title\";s:18:\"1 WordPress Update\";}}s:8:\"comments\";O:8:\"stdClass\":6:{s:2:\"id\";s:8:\"comments\";s:5:\"title\";s:206:\"<span class=\"ab-icon\"></span><span class=\"ab-label awaiting-mod pending-count count-0\" aria-hidden=\"true\">0</span><span class=\"screen-reader-text comments-in-moderation-text\">0 Comments in moderation</span>\";s:6:\"parent\";b:0;s:4:\"href\";s:53:\"http://localhost/wordpress/wp-admin/edit-comments.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:11:\"new-content\";O:8:\"stdClass\":6:{s:2:\"id\";s:11:\"new-content\";s:5:\"title\";s:62:\"<span class=\"ab-icon\"></span><span class=\"ab-label\">New</span>\";s:6:\"parent\";b:0;s:4:\"href\";s:48:\"http://localhost/wordpress/wp-admin/post-new.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:8:\"new-post\";O:8:\"stdClass\":6:{s:2:\"id\";s:8:\"new-post\";s:5:\"title\";s:4:\"Post\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:48:\"http://localhost/wordpress/wp-admin/post-new.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:9:\"new-media\";O:8:\"stdClass\":6:{s:2:\"id\";s:9:\"new-media\";s:5:\"title\";s:5:\"Media\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:49:\"http://localhost/wordpress/wp-admin/media-new.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:8:\"new-page\";O:8:\"stdClass\":6:{s:2:\"id\";s:8:\"new-page\";s:5:\"title\";s:4:\"Page\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:63:\"http://localhost/wordpress/wp-admin/post-new.php?post_type=page\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:8:\"new-user\";O:8:\"stdClass\":6:{s:2:\"id\";s:8:\"new-user\";s:5:\"title\";s:4:\"User\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:48:\"http://localhost/wordpress/wp-admin/user-new.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:13:\"top-secondary\";O:8:\"stdClass\":6:{s:2:\"id\";s:13:\"top-secondary\";s:5:\"title\";b:0;s:6:\"parent\";b:0;s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:1:{s:5:\"class\";s:16:\"ab-top-secondary\";}}s:16:\"wp-logo-external\";O:8:\"stdClass\":6:{s:2:\"id\";s:16:\"wp-logo-external\";s:5:\"title\";b:0;s:6:\"parent\";s:7:\"wp-logo\";s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:1:{s:5:\"class\";s:16:\"ab-sub-secondary\";}}}s:52:\"mw_adminimize_disabled_admin_bar_administrator_items\";a:0:{}s:45:\"mw_adminimize_disabled_admin_bar_editor_items\";a:0:{}s:45:\"mw_adminimize_disabled_admin_bar_author_items\";a:0:{}s:50:\"mw_adminimize_disabled_admin_bar_contributor_items\";a:0:{}s:49:\"mw_adminimize_disabled_admin_bar_subscriber_items\";a:0:{}s:19:\"mw_adminimize_debug\";i:0;s:28:\"mw_adminimize_multiple_roles\";i:0;s:29:\"mw_adminimize_support_bbpress\";i:0;s:33:\"mw_adminimize_prevent_page_access\";i:0;s:38:\"mw_adminimize_admin_bar_frontend_nodes\";a:27:{s:12:\"user-actions\";O:8:\"stdClass\":6:{s:2:\"id\";s:12:\"user-actions\";s:5:\"title\";b:0;s:6:\"parent\";s:10:\"my-account\";s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:0:{}}s:9:\"user-info\";O:8:\"stdClass\":6:{s:2:\"id\";s:9:\"user-info\";s:5:\"title\";s:298:\"<img alt=\'\' src=\'http://0.gravatar.com/avatar/90c84dcaf0cd4711b2955c2038935425?s=64&#038;d=mm&#038;r=g\' srcset=\'http://0.gravatar.com/avatar/90c84dcaf0cd4711b2955c2038935425?s=128&#038;d=mm&#038;r=g 2x\' class=\'avatar avatar-64 photo\' height=\'64\' width=\'64\' /><span class=\'display-name\'>admin</span>\";s:6:\"parent\";s:12:\"user-actions\";s:4:\"href\";s:47:\"http://localhost/wordpress/wp-admin/profile.php\";s:5:\"group\";b:0;s:4:\"meta\";a:1:{s:8:\"tabindex\";i:-1;}}s:12:\"edit-profile\";O:8:\"stdClass\":6:{s:2:\"id\";s:12:\"edit-profile\";s:5:\"title\";s:15:\"Edit My Profile\";s:6:\"parent\";s:12:\"user-actions\";s:4:\"href\";s:47:\"http://localhost/wordpress/wp-admin/profile.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:6:\"logout\";O:8:\"stdClass\":6:{s:2:\"id\";s:6:\"logout\";s:5:\"title\";s:7:\"Log Out\";s:6:\"parent\";s:12:\"user-actions\";s:4:\"href\";s:77:\"http://localhost/wordpress/wp-login.php?action=logout&amp;_wpnonce=6b8fb22d9a\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:6:\"search\";O:8:\"stdClass\":6:{s:2:\"id\";s:6:\"search\";s:5:\"title\";s:313:\"<form action=\"http://localhost/wordpress/\" method=\"get\" id=\"adminbarsearch\"><input class=\"adminbar-input\" name=\"s\" id=\"adminbar-search\" type=\"text\" value=\"\" maxlength=\"150\" /><label for=\"adminbar-search\" class=\"screen-reader-text\">Search</label><input type=\"submit\" class=\"adminbar-button\" value=\"Search\"/></form>\";s:6:\"parent\";s:13:\"top-secondary\";s:4:\"href\";b:0;s:5:\"group\";b:0;s:4:\"meta\";a:2:{s:5:\"class\";s:16:\"admin-bar-search\";s:8:\"tabindex\";i:-1;}}s:10:\"my-account\";O:8:\"stdClass\":6:{s:2:\"id\";s:10:\"my-account\";s:5:\"title\";s:304:\"Howdy, <span class=\"display-name\">admin</span><img alt=\'\' src=\'http://0.gravatar.com/avatar/90c84dcaf0cd4711b2955c2038935425?s=26&#038;d=mm&#038;r=g\' srcset=\'http://0.gravatar.com/avatar/90c84dcaf0cd4711b2955c2038935425?s=52&#038;d=mm&#038;r=g 2x\' class=\'avatar avatar-26 photo\' height=\'26\' width=\'26\' />\";s:6:\"parent\";s:13:\"top-secondary\";s:4:\"href\";s:47:\"http://localhost/wordpress/wp-admin/profile.php\";s:5:\"group\";b:0;s:4:\"meta\";a:1:{s:5:\"class\";s:11:\"with-avatar\";}}s:7:\"wp-logo\";O:8:\"stdClass\":6:{s:2:\"id\";s:7:\"wp-logo\";s:5:\"title\";s:84:\"<span class=\"ab-icon\"></span><span class=\"screen-reader-text\">About WordPress</span>\";s:6:\"parent\";b:0;s:4:\"href\";s:45:\"http://localhost/wordpress/wp-admin/about.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:5:\"about\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"about\";s:5:\"title\";s:15:\"About WordPress\";s:6:\"parent\";s:7:\"wp-logo\";s:4:\"href\";s:45:\"http://localhost/wordpress/wp-admin/about.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:5:\"wporg\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"wporg\";s:5:\"title\";s:13:\"WordPress.org\";s:6:\"parent\";s:16:\"wp-logo-external\";s:4:\"href\";s:22:\"https://wordpress.org/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:13:\"documentation\";O:8:\"stdClass\":6:{s:2:\"id\";s:13:\"documentation\";s:5:\"title\";s:13:\"Documentation\";s:6:\"parent\";s:16:\"wp-logo-external\";s:4:\"href\";s:28:\"https://codex.wordpress.org/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:14:\"support-forums\";O:8:\"stdClass\":6:{s:2:\"id\";s:14:\"support-forums\";s:5:\"title\";s:7:\"Support\";s:6:\"parent\";s:16:\"wp-logo-external\";s:4:\"href\";s:30:\"https://wordpress.org/support/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:8:\"feedback\";O:8:\"stdClass\":6:{s:2:\"id\";s:8:\"feedback\";s:5:\"title\";s:8:\"Feedback\";s:6:\"parent\";s:16:\"wp-logo-external\";s:4:\"href\";s:57:\"https://wordpress.org/support/forum/requests-and-feedback\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:9:\"site-name\";O:8:\"stdClass\":6:{s:2:\"id\";s:9:\"site-name\";s:5:\"title\";s:4:\"tact\";s:6:\"parent\";b:0;s:4:\"href\";s:36:\"http://localhost/wordpress/wp-admin/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:9:\"dashboard\";O:8:\"stdClass\":6:{s:2:\"id\";s:9:\"dashboard\";s:5:\"title\";s:9:\"Dashboard\";s:6:\"parent\";s:9:\"site-name\";s:4:\"href\";s:36:\"http://localhost/wordpress/wp-admin/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:10:\"appearance\";O:8:\"stdClass\":6:{s:2:\"id\";s:10:\"appearance\";s:5:\"title\";b:0;s:6:\"parent\";s:9:\"site-name\";s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:0:{}}s:6:\"themes\";O:8:\"stdClass\":6:{s:2:\"id\";s:6:\"themes\";s:5:\"title\";s:6:\"Themes\";s:6:\"parent\";s:10:\"appearance\";s:4:\"href\";s:46:\"http://localhost/wordpress/wp-admin/themes.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:7:\"widgets\";O:8:\"stdClass\":6:{s:2:\"id\";s:7:\"widgets\";s:5:\"title\";s:7:\"Widgets\";s:6:\"parent\";s:10:\"appearance\";s:4:\"href\";s:47:\"http://localhost/wordpress/wp-admin/widgets.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:5:\"menus\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"menus\";s:5:\"title\";s:5:\"Menus\";s:6:\"parent\";s:10:\"appearance\";s:4:\"href\";s:49:\"http://localhost/wordpress/wp-admin/nav-menus.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:9:\"customize\";O:8:\"stdClass\":6:{s:2:\"id\";s:9:\"customize\";s:5:\"title\";s:9:\"Customize\";s:6:\"parent\";b:0;s:4:\"href\";s:179:\"http://localhost/wordpress/wp-admin/customize.php?url=http%3A%2F%2Flocalhost%2Fwordpress%2Fwp-content%2Fplugins%2Fabout_us..%2F..customized-plugins%2Fjs%2Fbootstrap.js%3Fver%3D5.2\";s:5:\"group\";b:0;s:4:\"meta\";a:1:{s:5:\"class\";s:20:\"hide-if-no-customize\";}}s:8:\"comments\";O:8:\"stdClass\":6:{s:2:\"id\";s:8:\"comments\";s:5:\"title\";s:206:\"<span class=\"ab-icon\"></span><span class=\"ab-label awaiting-mod pending-count count-0\" aria-hidden=\"true\">0</span><span class=\"screen-reader-text comments-in-moderation-text\">0 Comments in moderation</span>\";s:6:\"parent\";b:0;s:4:\"href\";s:53:\"http://localhost/wordpress/wp-admin/edit-comments.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:11:\"new-content\";O:8:\"stdClass\":6:{s:2:\"id\";s:11:\"new-content\";s:5:\"title\";s:62:\"<span class=\"ab-icon\"></span><span class=\"ab-label\">New</span>\";s:6:\"parent\";b:0;s:4:\"href\";s:48:\"http://localhost/wordpress/wp-admin/post-new.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:8:\"new-post\";O:8:\"stdClass\":6:{s:2:\"id\";s:8:\"new-post\";s:5:\"title\";s:4:\"Post\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:48:\"http://localhost/wordpress/wp-admin/post-new.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:9:\"new-media\";O:8:\"stdClass\":6:{s:2:\"id\";s:9:\"new-media\";s:5:\"title\";s:5:\"Media\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:49:\"http://localhost/wordpress/wp-admin/media-new.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:8:\"new-page\";O:8:\"stdClass\":6:{s:2:\"id\";s:8:\"new-page\";s:5:\"title\";s:4:\"Page\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:63:\"http://localhost/wordpress/wp-admin/post-new.php?post_type=page\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:8:\"new-user\";O:8:\"stdClass\":6:{s:2:\"id\";s:8:\"new-user\";s:5:\"title\";s:4:\"User\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:48:\"http://localhost/wordpress/wp-admin/user-new.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:13:\"top-secondary\";O:8:\"stdClass\":6:{s:2:\"id\";s:13:\"top-secondary\";s:5:\"title\";b:0;s:6:\"parent\";b:0;s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:1:{s:5:\"class\";s:16:\"ab-top-secondary\";}}s:16:\"wp-logo-external\";O:8:\"stdClass\":6:{s:2:\"id\";s:16:\"wp-logo-external\";s:5:\"title\";b:0;s:6:\"parent\";s:7:\"wp-logo\";s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:1:{s:5:\"class\";s:16:\"ab-sub-secondary\";}}}s:61:\"mw_adminimize_disabled_admin_bar_frontend_administrator_items\";a:0:{}s:54:\"mw_adminimize_disabled_admin_bar_frontend_editor_items\";a:0:{}s:54:\"mw_adminimize_disabled_admin_bar_frontend_author_items\";a:0:{}s:59:\"mw_adminimize_disabled_admin_bar_frontend_contributor_items\";a:0:{}s:58:\"mw_adminimize_disabled_admin_bar_frontend_subscriber_items\";a:0:{}s:24:\"_mw_adminimize_user_info\";i:0;s:21:\"_mw_adminimize_footer\";i:0;s:21:\"_mw_adminimize_header\";i:0;s:34:\"_mw_adminimize_exclude_super_admin\";i:0;s:24:\"_mw_adminimize_tb_window\";i:0;s:23:\"_mw_adminimize_cat_full\";i:0;s:26:\"_mw_adminimize_db_redirect\";i:0;s:26:\"_mw_adminimize_ui_redirect\";i:0;s:21:\"_mw_adminimize_advice\";i:0;s:25:\"_mw_adminimize_advice_txt\";s:0:\"\";s:24:\"_mw_adminimize_timestamp\";i:0;s:30:\"_mw_adminimize_db_redirect_txt\";s:0:\"\";s:47:\"mw_adminimize_disabled_menu_administrator_items\";a:0:{}s:50:\"mw_adminimize_disabled_submenu_administrator_items\";a:0:{}s:40:\"mw_adminimize_disabled_menu_editor_items\";a:0:{}s:43:\"mw_adminimize_disabled_submenu_editor_items\";a:0:{}s:40:\"mw_adminimize_disabled_menu_author_items\";a:0:{}s:43:\"mw_adminimize_disabled_submenu_author_items\";a:0:{}s:45:\"mw_adminimize_disabled_menu_contributor_items\";a:0:{}s:48:\"mw_adminimize_disabled_submenu_contributor_items\";a:0:{}s:44:\"mw_adminimize_disabled_menu_subscriber_items\";a:0:{}s:47:\"mw_adminimize_disabled_submenu_subscriber_items\";a:0:{}s:28:\"_mw_adminimize_own_menu_slug\";s:0:\"\";s:35:\"_mw_adminimize_own_menu_custom_slug\";s:0:\"\";s:56:\"mw_adminimize_disabled_global_option_administrator_items\";a:0:{}s:57:\"mw_adminimize_disabled_metaboxes_post_administrator_items\";a:0:{}s:57:\"mw_adminimize_disabled_metaboxes_page_administrator_items\";a:0:{}s:54:\"mw_adminimize_disabled_link_option_administrator_items\";a:0:{}s:58:\"mw_adminimize_disabled_nav_menu_option_administrator_items\";a:0:{}s:56:\"mw_adminimize_disabled_widget_option_administrator_items\";a:0:{}s:59:\"mw_adminimize_disabled_dashboard_option_administrator_items\";a:0:{}s:49:\"mw_adminimize_disabled_global_option_editor_items\";a:0:{}s:50:\"mw_adminimize_disabled_metaboxes_post_editor_items\";a:0:{}s:50:\"mw_adminimize_disabled_metaboxes_page_editor_items\";a:0:{}s:47:\"mw_adminimize_disabled_link_option_editor_items\";a:0:{}s:51:\"mw_adminimize_disabled_nav_menu_option_editor_items\";a:0:{}s:49:\"mw_adminimize_disabled_widget_option_editor_items\";a:0:{}s:52:\"mw_adminimize_disabled_dashboard_option_editor_items\";a:0:{}s:49:\"mw_adminimize_disabled_global_option_author_items\";a:0:{}s:50:\"mw_adminimize_disabled_metaboxes_post_author_items\";a:0:{}s:50:\"mw_adminimize_disabled_metaboxes_page_author_items\";a:0:{}s:47:\"mw_adminimize_disabled_link_option_author_items\";a:0:{}s:51:\"mw_adminimize_disabled_nav_menu_option_author_items\";a:0:{}s:49:\"mw_adminimize_disabled_widget_option_author_items\";a:0:{}s:52:\"mw_adminimize_disabled_dashboard_option_author_items\";a:0:{}s:54:\"mw_adminimize_disabled_global_option_contributor_items\";a:0:{}s:55:\"mw_adminimize_disabled_metaboxes_post_contributor_items\";a:0:{}s:55:\"mw_adminimize_disabled_metaboxes_page_contributor_items\";a:0:{}s:52:\"mw_adminimize_disabled_link_option_contributor_items\";a:0:{}s:56:\"mw_adminimize_disabled_nav_menu_option_contributor_items\";a:0:{}s:54:\"mw_adminimize_disabled_widget_option_contributor_items\";a:0:{}s:57:\"mw_adminimize_disabled_dashboard_option_contributor_items\";a:0:{}s:53:\"mw_adminimize_disabled_global_option_subscriber_items\";a:0:{}s:54:\"mw_adminimize_disabled_metaboxes_post_subscriber_items\";a:0:{}s:54:\"mw_adminimize_disabled_metaboxes_page_subscriber_items\";a:0:{}s:51:\"mw_adminimize_disabled_link_option_subscriber_items\";a:0:{}s:55:\"mw_adminimize_disabled_nav_menu_option_subscriber_items\";a:0:{}s:53:\"mw_adminimize_disabled_widget_option_subscriber_items\";a:0:{}s:56:\"mw_adminimize_disabled_dashboard_option_subscriber_items\";a:0:{}s:25:\"_mw_adminimize_own_values\";s:0:\"\";s:26:\"_mw_adminimize_own_options\";s:0:\"\";s:30:\"_mw_adminimize_own_post_values\";s:0:\"\";s:31:\"_mw_adminimize_own_post_options\";s:0:\"\";s:30:\"_mw_adminimize_own_page_values\";s:0:\"\";s:31:\"_mw_adminimize_own_page_options\";s:0:\"\";s:30:\"_mw_adminimize_own_link_values\";s:0:\"\";s:31:\"_mw_adminimize_own_link_options\";s:0:\"\";s:34:\"_mw_adminimize_own_nav_menu_values\";s:0:\"\";s:35:\"_mw_adminimize_own_nav_menu_options\";s:0:\"\";s:32:\"_mw_adminimize_own_widget_values\";s:0:\"\";s:33:\"_mw_adminimize_own_widget_options\";s:0:\"\";s:35:\"_mw_adminimize_own_dashboard_values\";s:0:\"\";s:36:\"_mw_adminimize_own_dashboard_options\";s:0:\"\";s:31:\"mw_adminimize_dashboard_widgets\";a:4:{s:19:\"dashboard_right_now\";a:4:{s:2:\"id\";s:19:\"dashboard_right_now\";s:5:\"title\";s:11:\"At a Glance\";s:7:\"context\";s:6:\"normal\";s:8:\"priority\";s:4:\"core\";}s:18:\"dashboard_activity\";a:4:{s:2:\"id\";s:18:\"dashboard_activity\";s:5:\"title\";s:8:\"Activity\";s:7:\"context\";s:6:\"normal\";s:8:\"priority\";s:4:\"core\";}s:21:\"dashboard_quick_press\";a:4:{s:2:\"id\";s:21:\"dashboard_quick_press\";s:5:\"title\";s:0:\"\";s:7:\"context\";s:4:\"side\";s:8:\"priority\";s:4:\"core\";}s:17:\"dashboard_primary\";a:4:{s:2:\"id\";s:17:\"dashboard_primary\";s:5:\"title\";s:25:\"WordPress Events and News\";s:7:\"context\";s:4:\"side\";s:8:\"priority\";s:4:\"core\";}}s:26:\"mw_adminimize_default_menu\";a:15:{i:2;a:7:{i:0;s:9:\"Dashboard\";i:1;s:4:\"read\";i:2;s:9:\"index.php\";i:3;s:0:\"\";i:4;s:57:\"menu-top menu-top-first menu-icon-dashboard menu-top-last\";i:5;s:14:\"menu-dashboard\";i:6;s:19:\"dashicons-dashboard\";}i:4;a:5:{i:0;s:0:\"\";i:1;s:4:\"read\";i:2;s:10:\"separator1\";i:3;s:0:\"\";i:4;s:17:\"wp-menu-separator\";}i:5;a:7:{i:0;s:5:\"Posts\";i:1;s:10:\"edit_posts\";i:2;s:8:\"edit.php\";i:3;s:0:\"\";i:4;s:52:\"menu-top menu-icon-post open-if-no-js menu-top-first\";i:5;s:10:\"menu-posts\";i:6;s:20:\"dashicons-admin-post\";}i:10;a:7:{i:0;s:5:\"Media\";i:1;s:12:\"upload_files\";i:2;s:10:\"upload.php\";i:3;s:0:\"\";i:4;s:24:\"menu-top menu-icon-media\";i:5;s:10:\"menu-media\";i:6;s:21:\"dashicons-admin-media\";}i:20;a:7:{i:0;s:5:\"Pages\";i:1;s:10:\"edit_pages\";i:2;s:23:\"edit.php?post_type=page\";i:3;s:0:\"\";i:4;s:23:\"menu-top menu-icon-page\";i:5;s:10:\"menu-pages\";i:6;s:20:\"dashicons-admin-page\";}i:25;a:7:{i:0;s:198:\"Comments <span class=\"awaiting-mod count-0\"><span class=\"pending-count\" aria-hidden=\"true\">0</span><span class=\"comments-in-moderation-text screen-reader-text\">0 Comments in moderation</span></span>\";i:1;s:10:\"edit_posts\";i:2;s:17:\"edit-comments.php\";i:3;s:0:\"\";i:4;s:41:\"menu-top menu-icon-comments menu-top-last\";i:5;s:13:\"menu-comments\";i:6;s:24:\"dashicons-admin-comments\";}i:59;a:5:{i:0;s:0:\"\";i:1;s:4:\"read\";i:2;s:10:\"separator2\";i:3;s:0:\"\";i:4;s:17:\"wp-menu-separator\";}i:60;a:7:{i:0;s:10:\"Appearance\";i:1;s:13:\"switch_themes\";i:2;s:10:\"themes.php\";i:3;s:0:\"\";i:4;s:44:\"menu-top menu-icon-appearance menu-top-first\";i:5;s:15:\"menu-appearance\";i:6;s:26:\"dashicons-admin-appearance\";}i:65;a:7:{i:0;s:87:\"Plugins <span class=\'update-plugins count-0\'><span class=\'plugin-count\'>0</span></span>\";i:1;s:16:\"activate_plugins\";i:2;s:11:\"plugins.php\";i:3;s:0:\"\";i:4;s:26:\"menu-top menu-icon-plugins\";i:5;s:12:\"menu-plugins\";i:6;s:23:\"dashicons-admin-plugins\";}i:70;a:7:{i:0;s:5:\"Users\";i:1;s:10:\"list_users\";i:2;s:9:\"users.php\";i:3;s:0:\"\";i:4;s:24:\"menu-top menu-icon-users\";i:5;s:10:\"menu-users\";i:6;s:21:\"dashicons-admin-users\";}i:75;a:7:{i:0;s:5:\"Tools\";i:1;s:10:\"edit_posts\";i:2;s:9:\"tools.php\";i:3;s:0:\"\";i:4;s:24:\"menu-top menu-icon-tools\";i:5;s:10:\"menu-tools\";i:6;s:21:\"dashicons-admin-tools\";}i:80;a:7:{i:0;s:8:\"Settings\";i:1;s:14:\"manage_options\";i:2;s:19:\"options-general.php\";i:3;s:0:\"\";i:4;s:41:\"menu-top menu-icon-settings menu-top-last\";i:5;s:13:\"menu-settings\";i:6;s:24:\"dashicons-admin-settings\";}i:99;a:5:{i:0;s:0:\"\";i:1;s:4:\"read\";i:2;s:14:\"separator-last\";i:3;s:0:\"\";i:4;s:17:\"wp-menu-separator\";}i:100;a:7:{i:0;s:11:\"Client Dash\";i:1;s:14:\"manage_options\";i:2;s:10:\"clientdash\";i:3;s:11:\"Client Dash\";i:4;s:48:\"menu-top toplevel_page_clientdash menu-top-first\";i:5;s:24:\"toplevel_page_clientdash\";i:6;s:23:\"dashicons-admin-generic\";}i:101;a:7:{i:0;s:12:\"Add activity\";i:1;s:14:\"manage_options\";i:2;s:12:\"Add Activity\";i:3;s:12:\"Add activity\";i:4;s:49:\"menu-top toplevel_page_Add Activity menu-top-last\";i:5;s:26:\"toplevel_page_Add Activity\";i:6;s:78:\"http://localhost/wordpress/wp-content/plugins/customized-pluginsimage/icon.png\";}}s:29:\"mw_adminimize_default_submenu\";a:10:{s:9:\"index.php\";a:6:{i:0;a:3:{i:0;s:4:\"Home\";i:1;s:4:\"read\";i:2;s:9:\"index.php\";}i:10;a:3:{i:0;s:87:\"Updates <span class=\'update-plugins count-1\'><span class=\'update-count\'>1</span></span>\";i:1;s:11:\"update_core\";i:2;s:15:\"update-core.php\";}i:11;a:4:{i:0;s:7:\"Account\";i:1;s:4:\"read\";i:2;s:10:\"cd_account\";i:3;s:7:\"Account\";}i:12;a:4:{i:0;s:4:\"Help\";i:1;s:4:\"read\";i:2;s:7:\"cd_help\";i:3;s:4:\"Help\";}i:13;a:4:{i:0;s:7:\"Reports\";i:1;s:4:\"read\";i:2;s:10:\"cd_reports\";i:3;s:7:\"Reports\";}i:14;a:4:{i:0;s:10:\"Admin Page\";i:1;s:4:\"read\";i:2;s:13:\"cd_admin_page\";i:3;s:10:\"Admin Page\";}}s:10:\"upload.php\";a:2:{i:5;a:3:{i:0;s:7:\"Library\";i:1;s:12:\"upload_files\";i:2;s:10:\"upload.php\";}i:10;a:3:{i:0;s:7:\"Add New\";i:1;s:12:\"upload_files\";i:2;s:13:\"media-new.php\";}}s:8:\"edit.php\";a:4:{i:5;a:3:{i:0;s:9:\"All Posts\";i:1;s:10:\"edit_posts\";i:2;s:8:\"edit.php\";}i:10;a:3:{i:0;s:7:\"Add New\";i:1;s:10:\"edit_posts\";i:2;s:12:\"post-new.php\";}i:15;a:3:{i:0;s:10:\"Categories\";i:1;s:17:\"manage_categories\";i:2;s:31:\"edit-tags.php?taxonomy=category\";}i:16;a:3:{i:0;s:4:\"Tags\";i:1;s:16:\"manage_post_tags\";i:2;s:31:\"edit-tags.php?taxonomy=post_tag\";}}s:23:\"edit.php?post_type=page\";a:2:{i:5;a:3:{i:0;s:9:\"All Pages\";i:1;s:10:\"edit_pages\";i:2;s:23:\"edit.php?post_type=page\";}i:10;a:3:{i:0;s:7:\"Add New\";i:1;s:10:\"edit_pages\";i:2;s:27:\"post-new.php?post_type=page\";}}s:10:\"themes.php\";a:6:{i:5;a:3:{i:0;s:6:\"Themes\";i:1;s:13:\"switch_themes\";i:2;s:10:\"themes.php\";}i:6;a:5:{i:0;s:9:\"Customize\";i:1;s:9:\"customize\";i:2;s:94:\"customize.php?return=%2Fwordpress%2Fwp-admin%2Foptions-general.php%3Fpage%3Dadminimize-options\";i:3;s:0:\"\";i:4;s:20:\"hide-if-no-customize\";}i:7;a:3:{i:0;s:7:\"Widgets\";i:1;s:18:\"edit_theme_options\";i:2;s:11:\"widgets.php\";}i:10;a:3:{i:0;s:5:\"Menus\";i:1;s:18:\"edit_theme_options\";i:2;s:13:\"nav-menus.php\";}i:11;a:4:{i:0;s:16:\"Login Customizer\";i:1;s:14:\"manage_options\";i:2;s:155:\"http://localhost/wordpress/wp-admin/customize.php?autofocus[panel]=logincust_panel&url=http%3A%2F%2Flocalhost%2Fwordpress%2Findex.php%2Flogin-customizer%2F\";i:3;s:16:\"login-customizer\";}i:12;a:4:{i:0;s:12:\"Theme Editor\";i:1;s:11:\"edit_themes\";i:2;s:16:\"theme-editor.php\";i:3;s:12:\"Theme Editor\";}}s:11:\"plugins.php\";a:3:{i:5;a:3:{i:0;s:17:\"Installed Plugins\";i:1;s:16:\"activate_plugins\";i:2;s:11:\"plugins.php\";}i:10;a:3:{i:0;s:7:\"Add New\";i:1;s:15:\"install_plugins\";i:2;s:18:\"plugin-install.php\";}i:15;a:3:{i:0;s:13:\"Plugin Editor\";i:1;s:12:\"edit_plugins\";i:2;s:17:\"plugin-editor.php\";}}s:9:\"users.php\";a:3:{i:5;a:3:{i:0;s:9:\"All Users\";i:1;s:10:\"list_users\";i:2;s:9:\"users.php\";}i:10;a:3:{i:0;s:7:\"Add New\";i:1;s:12:\"create_users\";i:2;s:12:\"user-new.php\";}i:15;a:3:{i:0;s:12:\"Your Profile\";i:1;s:4:\"read\";i:2;s:11:\"profile.php\";}}s:9:\"tools.php\";a:6:{i:5;a:3:{i:0;s:15:\"Available Tools\";i:1;s:10:\"edit_posts\";i:2;s:9:\"tools.php\";}i:10;a:3:{i:0;s:6:\"Import\";i:1;s:6:\"import\";i:2;s:10:\"import.php\";}i:15;a:3:{i:0;s:6:\"Export\";i:1;s:6:\"export\";i:2;s:10:\"export.php\";}i:20;a:3:{i:0;s:11:\"Site Health\";i:1;s:15:\"install_plugins\";i:2;s:15:\"site-health.php\";}i:21;a:4:{i:0;s:20:\"Export Personal Data\";i:1;s:27:\"export_others_personal_data\";i:2;s:20:\"export_personal_data\";i:3;s:20:\"Export Personal Data\";}i:22;a:4:{i:0;s:19:\"Erase Personal Data\";i:1;s:26:\"erase_others_personal_data\";i:2;s:20:\"remove_personal_data\";i:3;s:19:\"Erase Personal Data\";}}s:19:\"options-general.php\";a:8:{i:10;a:3:{i:0;s:7:\"General\";i:1;s:14:\"manage_options\";i:2;s:19:\"options-general.php\";}i:15;a:3:{i:0;s:7:\"Writing\";i:1;s:14:\"manage_options\";i:2;s:19:\"options-writing.php\";}i:20;a:3:{i:0;s:7:\"Reading\";i:1;s:14:\"manage_options\";i:2;s:19:\"options-reading.php\";}i:25;a:3:{i:0;s:10:\"Discussion\";i:1;s:14:\"manage_options\";i:2;s:22:\"options-discussion.php\";}i:30;a:3:{i:0;s:5:\"Media\";i:1;s:14:\"manage_options\";i:2;s:17:\"options-media.php\";}i:40;a:3:{i:0;s:10:\"Permalinks\";i:1;s:14:\"manage_options\";i:2;s:21:\"options-permalink.php\";}i:45;a:3:{i:0;s:7:\"Privacy\";i:1;s:22:\"manage_privacy_options\";i:2;s:11:\"privacy.php\";}i:46;a:4:{i:0;s:10:\"Adminimize\";i:1;s:14:\"manage_options\";i:2;s:18:\"adminimize-options\";i:3;s:18:\"Adminimize Options\";}}s:10:\"clientdash\";a:5:{i:0;a:3:{i:0;s:15:\"Customize Admin\";i:1;s:15:\"customize_admin\";i:2;s:50:\"http://localhost/wordpress/?clientdash_customize=1\";}i:1;a:4:{i:0;s:10:\"Admin Page\";i:1;s:14:\"manage_options\";i:2;s:21:\"clientdash_admin_page\";i:3;s:10:\"Admin Page\";}i:2;a:4:{i:0;s:12:\"Helper Pages\";i:1;s:14:\"manage_options\";i:2;s:23:\"clientdash_helper_pages\";i:3;s:12:\"Helper Pages\";}i:3;a:4:{i:0;s:8:\"Settings\";i:1;s:14:\"manage_options\";i:2;s:19:\"clientdash_settings\";i:3;s:8:\"Settings\";}i:4;a:4:{i:0;s:6:\"Addons\";i:1;s:14:\"manage_options\";i:2;s:17:\"clientdash_addons\";i:3;s:6:\"Addons\";}}}}', 'yes'),
(170, 'recovery_mode_email_last_sent', '1560059805', 'yes'),
(193, 'clientdash_db_version', '1.0.0', 'yes'),
(194, 'cd_version', '2.1.4', 'yes'),
(237, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1560103019;s:7:\"checked\";a:7:{s:42:\"activity_plugin/update_activity_plugin.php\";s:5:\"1.0.2\";s:26:\"activity_plugin/plugin.php\";s:5:\"0.0.1\";s:39:\"interest_plugin/Add_interest_plugin.php\";s:5:\"1.0.2\";s:25:\"adminimize/adminimize.php\";s:6:\"1.11.4\";s:37:\"login-customizer/login-customizer.php\";s:5:\"2.0.1\";s:35:\"activity_plugin/view_activities.php\";s:5:\"1.0.2\";s:34:\"interest_plugin/view_interests.php\";s:5:\"1.0.2\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:2:{s:25:\"adminimize/adminimize.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:24:\"w.org/plugins/adminimize\";s:4:\"slug\";s:10:\"adminimize\";s:6:\"plugin\";s:25:\"adminimize/adminimize.php\";s:11:\"new_version\";s:6:\"1.11.4\";s:3:\"url\";s:41:\"https://wordpress.org/plugins/adminimize/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/adminimize.1.11.4.zip\";s:5:\"icons\";a:1:{s:7:\"default\";s:61:\"https://s.w.org/plugins/geopattern-icon/adminimize_000000.svg\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:65:\"https://ps.w.org/adminimize/assets/banner-772x250.png?rev=1118207\";}s:11:\"banners_rtl\";a:0:{}}s:37:\"login-customizer/login-customizer.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:30:\"w.org/plugins/login-customizer\";s:4:\"slug\";s:16:\"login-customizer\";s:6:\"plugin\";s:37:\"login-customizer/login-customizer.php\";s:11:\"new_version\";s:5:\"2.0.1\";s:3:\"url\";s:47:\"https://wordpress.org/plugins/login-customizer/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/plugin/login-customizer.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:61:\"https://ps.w.org/login-customizer/assets/icon.svg?rev=1083443\";s:3:\"svg\";s:61:\"https://ps.w.org/login-customizer/assets/icon.svg?rev=1083443\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:71:\"https://ps.w.org/login-customizer/assets/banner-772x250.png?rev=1083443\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no'),
(338, '_site_transient_timeout_php_check_472f71d2a071d463a95f84346288dc89', '1560423673', 'no'),
(339, '_site_transient_php_check_472f71d2a071d463a95f84346288dc89', 'a:5:{s:19:\"recommended_version\";s:3:\"7.3\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(373, 'auto_updater.lock', '1560059755', 'no'),
(377, 'core_updater.lock', '1560059761', 'no'),
(378, '_site_transient_timeout_community-events-d41d8cd98f00b204e9800998ecf8427e', '1560127077', 'no'),
(379, '_site_transient_community-events-d41d8cd98f00b204e9800998ecf8427e', 'a:2:{s:8:\"location\";a:1:{s:2:\"ip\";b:0;}s:6:\"events\";a:1:{i:0;a:7:{s:4:\"type\";s:8:\"wordcamp\";s:5:\"title\";s:15:\"WordCamp Europe\";s:3:\"url\";s:33:\"https://2019.europe.wordcamp.org/\";s:6:\"meetup\";s:0:\"\";s:10:\"meetup_url\";s:0:\"\";s:4:\"date\";s:19:\"2019-06-20 00:00:00\";s:8:\"location\";a:4:{s:8:\"location\";s:15:\"Berlin, Germany\";s:7:\"country\";s:2:\"DE\";s:8:\"latitude\";d:52.50697;s:9:\"longitude\";d:13.2843064;}}}}', 'no'),
(390, '_transient_timeout_plugin_slugs', '1560189419', 'no'),
(391, '_transient_plugin_slugs', 'a:11:{i:0;s:28:\"about_us/about_us_plugin.php\";i:1;s:42:\"activity_plugin/update_activity_plugin.php\";i:2;s:26:\"activity_plugin/plugin.php\";i:3;s:39:\"interest_plugin/Add_interest_plugin.php\";i:4;s:47:\"activity_location/add_interest_image_plugin.php\";i:5;s:25:\"adminimize/adminimize.php\";i:6;s:37:\"login-customizer/login-customizer.php\";i:7;s:30:\"home_page/home_page_plugin.php\";i:8;s:42:\"interest_plugin/update_interest_plugin.php\";i:9;s:35:\"activity_plugin/view_activities.php\";i:10;s:34:\"interest_plugin/view_interests.php\";}', 'no'),
(394, '_site_transient_timeout_browser_5ac71600cc9c7fa82bbc370cd02eb16b', '1560674916', 'no'),
(395, '_site_transient_browser_5ac71600cc9c7fa82bbc370cd02eb16b', 'a:10:{s:4:\"name\";s:7:\"Firefox\";s:7:\"version\";s:4:\"67.0\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:24:\"https://www.firefox.com/\";s:7:\"img_src\";s:44:\"http://s.w.org/images/browsers/firefox.png?1\";s:11:\"img_src_ssl\";s:45:\"https://s.w.org/images/browsers/firefox.png?1\";s:15:\"current_version\";s:2:\"56\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(398, '_site_transient_timeout_theme_roots', '1560100426', 'no'),
(399, '_site_transient_theme_roots', 'a:3:{s:14:\"twentynineteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}', 'no'),
(401, '_transient_timeout_dash_v2_88ae138922fe95674369b1cb3d215a2b', '1560146506', 'no'),
(402, '_transient_dash_v2_88ae138922fe95674369b1cb3d215a2b', '<div class=\"rss-widget\"><p><strong>RSS Error:</strong> WP HTTP Error: cURL error 6: Could not resolve host: wordpress.org</p></div><div class=\"rss-widget\"><p><strong>RSS Error:</strong> WP HTTP Error: cURL error 6: Could not resolve host: planet.wordpress.org</p></div>', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `tb_postmeta`
--

CREATE TABLE `tb_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_postmeta`
--

INSERT INTO `tb_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 5, '_wp_page_template', 'template-login-customizer.php'),
(4, 6, '_edit_lock', '1558364869:1'),
(5, 7, '_wp_attached_file', '2019/05/images.jpeg'),
(6, 7, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:300;s:6:\"height\";i:168;s:4:\"file\";s:19:\"2019/05/images.jpeg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"images-150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:19:\"images-300x168.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:168;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(7, 6, '_wp_trash_meta_status', 'publish'),
(8, 6, '_wp_trash_meta_time', '1558364892'),
(9, 8, '_edit_lock', '1558364926:1'),
(10, 8, '_wp_trash_meta_status', 'publish'),
(11, 8, '_wp_trash_meta_time', '1558364964'),
(12, 9, '_wp_trash_meta_status', 'publish'),
(13, 9, '_wp_trash_meta_time', '1558365062'),
(14, 10, '_wp_trash_meta_status', 'publish'),
(15, 10, '_wp_trash_meta_time', '1558365134'),
(16, 2, '_edit_lock', '1558466657:2');

-- --------------------------------------------------------

--
-- Table structure for table `tb_posts`
--

CREATE TABLE `tb_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_posts`
--

INSERT INTO `tb_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2019-05-19 16:42:03', '2019-05-19 16:42:03', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2019-05-19 16:42:03', '2019-05-19 16:42:03', '', 0, 'http://localhost/wordpress/?p=1', 0, 'post', '', 0),
(2, 1, '2019-05-19 16:42:03', '2019-05-19 16:42:03', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://localhost/wordpress/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2019-05-19 16:42:03', '2019-05-19 16:42:03', '', 0, 'http://localhost/wordpress/?page_id=2', 0, 'page', '', 0),
(3, 1, '2019-05-19 16:42:03', '2019-05-19 16:42:03', '<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Our website address is: http://localhost/wordpress.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What personal data we collect and why we collect it</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Comments</h3><!-- /wp:heading --><!-- wp:paragraph --><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Media</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Contact forms</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Embedded content from other websites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Analytics</h3><!-- /wp:heading --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Your contact information</h2><!-- /wp:heading --><!-- wp:heading --><h2>Additional information</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>How we protect your data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What data breach procedures we have in place</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What third parties we receive data from</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What automated decision making and/or profiling we do with user data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Industry regulatory disclosure requirements</h3><!-- /wp:heading -->', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2019-05-19 16:42:03', '2019-05-19 16:42:03', '', 0, 'http://localhost/wordpress/?page_id=3', 0, 'page', '', 0),
(5, 1, '2019-05-20 15:01:03', '2019-05-20 15:01:03', 'This page is used for Login Customizer plugin. It will not be visible to your readers. Do not delete it.', 'Login Customizer', '', 'publish', 'closed', 'closed', '', 'login-customizer', '', '', '2019-05-20 15:01:03', '2019-05-20 15:01:03', '', 0, 'http://localhost/wordpress/index.php/login-customizer/', 0, 'page', '', 0),
(6, 1, '2019-05-20 15:08:11', '2019-05-20 15:08:11', '{\n    \"login_customizer_options[logincust_logo_padding]\": {\n        \"value\": \"0px\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-05-20 15:03:47\"\n    },\n    \"login_customizer_options[logincust_logo]\": {\n        \"value\": \"http://localhost/wordpress/wp-content/uploads/2019/05/images.jpeg\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-05-20 15:07:49\"\n    },\n    \"login_customizer_options[logincust_logo_width]\": {\n        \"value\": \"217px\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-05-20 15:07:49\"\n    },\n    \"login_customizer_options[logincust_logo_show]\": {\n        \"value\": false,\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-05-20 15:08:11\"\n    },\n    \"login_customizer_options[logincust_logo_height]\": {\n        \"value\": \"65px\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-05-20 15:08:11\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'b2c8d59d-2237-4e1d-b42c-98d55860f09c', '', '', '2019-05-20 15:08:11', '2019-05-20 15:08:11', '', 0, 'http://localhost/wordpress/?p=6', 0, 'customize_changeset', '', 0),
(7, 1, '2019-05-20 15:07:17', '2019-05-20 15:07:17', '', 'images', '', 'inherit', 'open', 'closed', '', 'images', '', '', '2019-05-20 15:07:17', '2019-05-20 15:07:17', '', 0, 'http://localhost/wordpress/wp-content/uploads/2019/05/images.jpeg', 0, 'attachment', 'image/jpeg', 0),
(8, 1, '2019-05-20 15:09:23', '2019-05-20 15:09:23', '{\n    \"login_customizer_options[logincust_form_width]\": {\n        \"value\": \"304px\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-05-20 15:08:46\"\n    },\n    \"login_customizer_options[logincust_form_height]\": {\n        \"value\": \"174px\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-05-20 15:08:46\"\n    },\n    \"login_customizer_options[logincust_form_padding]\": {\n        \"value\": \"10px 7px 68px 9px\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-05-20 15:09:23\"\n    },\n    \"login_customizer_options[logincust_form_shadow_spread]\": {\n        \"value\": \"24px\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-05-20 15:09:23\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '39e25ac5-0981-4e74-ba70-374a849918f6', '', '', '2019-05-20 15:09:23', '2019-05-20 15:09:23', '', 0, 'http://localhost/wordpress/?p=8', 0, 'customize_changeset', '', 0),
(9, 1, '2019-05-20 15:11:01', '2019-05-20 15:11:01', '{\n    \"login_customizer_options[logincust_field_width]\": {\n        \"value\": \"100%\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-05-20 15:11:01\"\n    },\n    \"login_customizer_options[logincust_field_font_size]\": {\n        \"value\": \"17px\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-05-20 15:11:01\"\n    },\n    \"login_customizer_options[logincust_field_border_width]\": {\n        \"value\": \"3px\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-05-20 15:11:01\"\n    },\n    \"login_customizer_options[logincust_field_label_font_size]\": {\n        \"value\": \"16px\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-05-20 15:11:01\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '72332b18-0ca1-40e0-a6c7-42f69eb2775b', '', '', '2019-05-20 15:11:01', '2019-05-20 15:11:01', '', 0, 'http://localhost/wordpress/index.php/2019/05/20/72332b18-0ca1-40e0-a6c7-42f69eb2775b/', 0, 'customize_changeset', '', 0),
(10, 1, '2019-05-20 15:12:13', '2019-05-20 15:12:13', '{\n    \"login_customizer_options[logincust_button_bg]\": {\n        \"value\": \"#2eb0d1\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-05-20 15:12:13\"\n    },\n    \"login_customizer_options[logincust_button_hover_bg]\": {\n        \"value\": \"#2399ed\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-05-20 15:12:13\"\n    },\n    \"login_customizer_options[logincust_button_height_width]\": {\n        \"value\": \"custom\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-05-20 15:12:13\"\n    },\n    \"login_customizer_options[logincust_other_font_size]\": {\n        \"value\": \"21px\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-05-20 15:12:13\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '3cc4ec62-dc9e-469c-b038-d6581b9edd12', '', '', '2019-05-20 15:12:13', '2019-05-20 15:12:13', '', 0, 'http://localhost/wordpress/index.php/2019/05/20/3cc4ec62-dc9e-469c-b038-d6581b9edd12/', 0, 'customize_changeset', '', 0),
(16, 1, '2019-06-03 09:34:00', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2019-06-03 09:34:00', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=16', 0, 'post', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_tact_users`
--

CREATE TABLE `tb_tact_users` (
  `user_id` int(100) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `pass_word` varchar(50) NOT NULL,
  `role` enum('admin','client') NOT NULL DEFAULT 'client',
  `country_of_origin` varchar(50) NOT NULL,
  `city_of_origin` varchar(50) NOT NULL,
  `profile_image` varchar(100) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_termmeta`
--

CREATE TABLE `tb_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_terms`
--

CREATE TABLE `tb_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_terms`
--

INSERT INTO `tb_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_term_relationships`
--

CREATE TABLE `tb_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_term_relationships`
--

INSERT INTO `tb_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_term_taxonomy`
--

CREATE TABLE `tb_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_term_taxonomy`
--

INSERT INTO `tb_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_usermeta`
--

CREATE TABLE `tb_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_usermeta`
--

INSERT INTO `tb_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'tb_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'tb_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'plugin_editor_notice,theme_editor_notice'),
(15, 1, 'show_welcome_panel', '0'),
(17, 1, 'tb_dashboard_quick_press_last_post_id', '16'),
(18, 1, 'tb_user-settings', 'mfold=o&libraryContent=browse'),
(19, 1, 'tb_user-settings-time', '1558364969'),
(20, 2, 'nickname', 'admin123'),
(21, 2, 'first_name', 'admin'),
(22, 2, 'last_name', 'admin'),
(23, 2, 'description', ''),
(24, 2, 'rich_editing', 'true'),
(25, 2, 'syntax_highlighting', 'true'),
(26, 2, 'comment_shortcuts', 'false'),
(27, 2, 'admin_color', 'fresh'),
(28, 2, 'use_ssl', '0'),
(29, 2, 'show_admin_bar_front', 'true'),
(30, 2, 'locale', ''),
(31, 2, 'tb_capabilities', 'a:1:{s:6:\"editor\";b:1;}'),
(32, 2, 'tb_user_level', '7'),
(33, 2, 'dismissed_wp_pointers', ''),
(35, 2, 'tb_dashboard_quick_press_last_post_id', '11'),
(36, 2, 'tb_user-settings', 'mfold=o'),
(37, 2, 'tb_user-settings-time', '1558366732'),
(39, 1, 'clientdash_hide_customize_tutorial', 'yes'),
(42, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}'),
(43, 2, 'session_tokens', 'a:1:{s:64:\"03769cebfab20f333f606bf10d186bbf1c7567bbc2a23e0bb2ab26695912570a\";a:4:{s:10:\"expiration\";i:1560082439;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0\";s:5:\"login\";i:1559909639;}}');

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BYkhbuJbMuxDeizFUw8AquW40LEteH0', 'admin', 'sethbientus@gmail.com', '', '2019-05-19 16:42:01', '1559909671:$P$BfrI0i47Ss89FFv49f3ECOjzUZ6J5h.', 0, 'admin'),
(2, 'admin123', '$P$BxKprdIyfI7nqiuajLLpxNDTdrPou4/', 'admin123', 'admin@tact.com', 'http://www.tact.com', '2019-05-20 14:13:23', '', 0, 'admin admin');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_activities_interests`
--

CREATE TABLE `tb_user_activities_interests` (
  `user_id` int(100) NOT NULL,
  `interest_name` varchar(50) NOT NULL,
  `interest_image` varchar(100) NOT NULL,
  `recorded_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_about_us`
--
ALTER TABLE `tb_about_us`
  ADD PRIMARY KEY (`about_id`);

--
-- Indexes for table `tb_activities`
--
ALTER TABLE `tb_activities`
  ADD PRIMARY KEY (`activity_code`),
  ADD UNIQUE KEY `activity_name` (`activity_name`,`recorded_time`);

--
-- Indexes for table `tb_activities_interests`
--
ALTER TABLE `tb_activities_interests`
  ADD PRIMARY KEY (`interest_name`),
  ADD KEY `activity_code` (`activity_code`);

--
-- Indexes for table `tb_activities_location`
--
ALTER TABLE `tb_activities_location`
  ADD PRIMARY KEY (`user_ID`,`activity_code`,`latitude`,`longitude`),
  ADD KEY `activity_code` (`activity_code`),
  ADD KEY `interest_name` (`interest_name`);

--
-- Indexes for table `tb_cd_customizations`
--
ALTER TABLE `tb_cd_customizations`
  ADD PRIMARY KEY (`role`),
  ADD UNIQUE KEY `role` (`role`),
  ADD UNIQUE KEY `role_2` (`role`);

--
-- Indexes for table `tb_commentmeta`
--
ALTER TABLE `tb_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `tb_comments`
--
ALTER TABLE `tb_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `tb_home_page`
--
ALTER TABLE `tb_home_page`
  ADD PRIMARY KEY (`home_id`);

--
-- Indexes for table `tb_messages`
--
ALTER TABLE `tb_messages`
  ADD PRIMARY KEY (`message_id`),
  ADD UNIQUE KEY `sent_time` (`sent_time`),
  ADD KEY `sender` (`sender`,`receiver`),
  ADD KEY `receiver` (`receiver`);

--
-- Indexes for table `tb_options`
--
ALTER TABLE `tb_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `tb_postmeta`
--
ALTER TABLE `tb_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `tb_posts`
--
ALTER TABLE `tb_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `tb_tact_users`
--
ALTER TABLE `tb_tact_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone_number` (`phone_number`,`profile_image`);

--
-- Indexes for table `tb_termmeta`
--
ALTER TABLE `tb_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `tb_terms`
--
ALTER TABLE `tb_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `tb_term_relationships`
--
ALTER TABLE `tb_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `tb_term_taxonomy`
--
ALTER TABLE `tb_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `tb_usermeta`
--
ALTER TABLE `tb_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Indexes for table `tb_user_activities_interests`
--
ALTER TABLE `tb_user_activities_interests`
  ADD PRIMARY KEY (`user_id`,`interest_name`),
  ADD KEY `interest_name` (`interest_name`),
  ADD KEY `interest_image` (`recorded_time`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_about_us`
--
ALTER TABLE `tb_about_us`
  MODIFY `about_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_commentmeta`
--
ALTER TABLE `tb_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_comments`
--
ALTER TABLE `tb_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_home_page`
--
ALTER TABLE `tb_home_page`
  MODIFY `home_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_messages`
--
ALTER TABLE `tb_messages`
  MODIFY `message_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_options`
--
ALTER TABLE `tb_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=403;

--
-- AUTO_INCREMENT for table `tb_postmeta`
--
ALTER TABLE `tb_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tb_posts`
--
ALTER TABLE `tb_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tb_tact_users`
--
ALTER TABLE `tb_tact_users`
  MODIFY `user_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_termmeta`
--
ALTER TABLE `tb_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_terms`
--
ALTER TABLE `tb_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_term_taxonomy`
--
ALTER TABLE `tb_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_usermeta`
--
ALTER TABLE `tb_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_activities_interests`
--
ALTER TABLE `tb_activities_interests`
  ADD CONSTRAINT `tb_activities_interests_ibfk_1` FOREIGN KEY (`activity_code`) REFERENCES `tb_activities` (`activity_code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_activities_location`
--
ALTER TABLE `tb_activities_location`
  ADD CONSTRAINT `tb_activities_location_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `tb_tact_users` (`user_id`),
  ADD CONSTRAINT `tb_activities_location_ibfk_2` FOREIGN KEY (`activity_code`) REFERENCES `tb_activities` (`activity_code`),
  ADD CONSTRAINT `tb_activities_location_ibfk_3` FOREIGN KEY (`interest_name`) REFERENCES `tb_activities_interests` (`interest_name`);

--
-- Constraints for table `tb_messages`
--
ALTER TABLE `tb_messages`
  ADD CONSTRAINT `tb_messages_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `tb_tact_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_messages_ibfk_2` FOREIGN KEY (`receiver`) REFERENCES `tb_tact_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_user_activities_interests`
--
ALTER TABLE `tb_user_activities_interests`
  ADD CONSTRAINT `tb_user_activities_interests_ibfk_1` FOREIGN KEY (`interest_name`) REFERENCES `tb_activities_interests` (`interest_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_user_activities_interests_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tb_tact_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
