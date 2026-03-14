-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 23, 2023 at 10:50 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fakejobdetectionproject`
--
CREATE DATABASE IF NOT EXISTS `fakejobdetectionproject` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `fakejobdetectionproject`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user model', 7, 'add_usermodel'),
(26, 'Can change user model', 7, 'change_usermodel'),
(27, 'Can delete user model', 7, 'delete_usermodel'),
(28, 'Can view user model', 7, 'view_usermodel'),
(29, 'Can add dataset', 8, 'add_dataset'),
(30, 'Can change dataset', 8, 'change_dataset'),
(31, 'Can delete dataset', 8, 'delete_dataset'),
(32, 'Can view dataset', 8, 'view_dataset'),
(33, 'Can add job model', 9, 'add_jobmodel'),
(34, 'Can change job model', 9, 'change_jobmodel'),
(35, 'Can delete job model', 9, 'delete_jobmodel'),
(36, 'Can view job model', 9, 'view_jobmodel'),
(37, 'Can add predict model', 10, 'add_predictmodel'),
(38, 'Can change predict model', 10, 'change_predictmodel'),
(39, 'Can delete predict model', 10, 'delete_predictmodel'),
(40, 'Can view predict model', 10, 'view_predictmodel');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dataset`
--

DROP TABLE IF EXISTS `dataset`;
CREATE TABLE IF NOT EXISTS `dataset` (
  `data_id` int(11) NOT NULL AUTO_INCREMENT,
  `data_set` varchar(100) NOT NULL,
  `dt_Accuracy` double DEFAULT NULL,
  `dt_Precision` double DEFAULT NULL,
  `dt_Recall` double DEFAULT NULL,
  `dt_F1_Score` double DEFAULT NULL,
  `dt_algo` varchar(50) DEFAULT NULL,
  `lr_Accuracy` double DEFAULT NULL,
  `lr_F1_Score` double DEFAULT NULL,
  `lr_Precision` double DEFAULT NULL,
  `lr_Recall` double DEFAULT NULL,
  `lr_algo` varchar(50) DEFAULT NULL,
  `nb_Accuracy` double DEFAULT NULL,
  `nb_F1_Score` double DEFAULT NULL,
  `nb_Precision` double DEFAULT NULL,
  `nb_Recall` double DEFAULT NULL,
  `nb_algo` varchar(50) DEFAULT NULL,
  `rf_Accuracy` double DEFAULT NULL,
  `rf_F1_Score` double DEFAULT NULL,
  `rf_Precision` double DEFAULT NULL,
  `rf_Recall` double DEFAULT NULL,
  `rf_algo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`data_id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'mainapp', 'usermodel'),
(8, 'adminapp', 'dataset'),
(9, 'userapp', 'jobmodel'),
(10, 'userapp', 'predictmodel');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-02-16 09:23:05.068821'),
(2, 'auth', '0001_initial', '2023-02-16 09:23:05.402381'),
(3, 'admin', '0001_initial', '2023-02-16 09:23:05.547750'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-02-16 09:23:05.560125'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-02-16 09:23:05.572180'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-02-16 09:23:05.628225'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-02-16 09:23:05.650529'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-02-16 09:23:05.675882'),
(9, 'auth', '0004_alter_user_username_opts', '2023-02-16 09:23:05.683359'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-02-16 09:23:05.708770'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-02-16 09:23:05.711136'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-02-16 09:23:05.718204'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-02-16 09:23:05.746751'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-02-16 09:23:05.768344'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-02-16 09:23:05.796327'),
(16, 'auth', '0011_update_proxy_permissions', '2023-02-16 09:23:05.803877'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-02-16 09:23:05.829064'),
(18, 'sessions', '0001_initial', '2023-02-16 09:23:05.865433'),
(19, 'mainapp', '0001_initial', '2023-02-16 10:17:47.130923'),
(20, 'mainapp', '0002_remove_usermodel_user_address_and_more', '2023-02-16 10:22:55.542142'),
(21, 'mainapp', '0003_usermodel_user_status', '2023-02-16 16:16:20.811305'),
(22, 'adminapp', '0001_initial', '2023-02-17 05:43:07.282706'),
(23, 'userapp', '0001_initial', '2023-02-19 16:41:22.502870'),
(24, 'userapp', '0002_jobmodel_user_url', '2023-02-19 17:01:32.434904'),
(25, 'userapp', '0003_predictmodel', '2023-02-20 03:17:46.410568'),
(26, 'userapp', '0004_jobmodel_job_status', '2023-02-21 13:16:56.421653'),
(27, 'userapp', '0005_alter_jobmodel_job_benefits_and_more', '2023-02-25 11:17:11.241964'),
(28, 'userapp', '0006_alter_jobmodel_job_benefits_and_more', '2023-02-25 11:23:17.354907'),
(29, 'adminapp', '0002_rename_accuracy_dataset_dt_accuracy_and_more', '2023-03-23 08:48:45.533312');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('hig97uafdqtq1xdp52ft6s2c6wu11mxg', 'eyJ1c2VyX2lkIjoxfQ:1pSgwD:yKs5uyeMf7yd8jU9ChKg3EvQKzdoCViR4UYJNsX0cd0', '2023-03-02 16:16:49.324461'),
('g8ugew1ll6rcn6k8ch73wy2266annqph', 'eyJ1c2VyX2lkIjoxfQ:1pTllv:B3hAJiygYepiZSeq5mWsdAMuGYFDObnJLC8ib61APrc', '2023-03-05 15:38:39.395921'),
('mfcj68wyna2c6sczyszmyiur83iy8phn', 'eyJ1c2VyX2lkIjoxfQ:1pU68h:HsvoWxVl7-EECh7R2j3MBrEMdFVwWOmfs15yNZIvKIY', '2023-03-06 13:23:31.958345'),
('w9vtlsci4s71rqyatlt0xh1ok6fqv7ln', 'eyJ1c2VyX2lkIjoxfQ:1pUL5F:JM4jSJOf3g_r7FuUCyPg8ZpDCuEmptTiB7sNnKTSLjE', '2023-03-07 05:20:57.326787'),
('q5nen3bdbe6kjpnr0p6xks3ar0hrl8r5', 'eyJ1c2VyX2lkIjoxfQ:1pUS2v:xWsQ8JBJLox3NiY2eZVyn-5DU6dJYvDM4HwUmThUVRM', '2023-03-07 12:47:01.788887'),
('nbxudkb0ylnp3ua898h3w18orf8wsnfv', 'eyJ1c2VyX2lkIjoxfQ:1pUjPP:FqKudKhdMkNVaUkY_DGO-Qz0ghzQJL-OUM6UaA1uGCU', '2023-03-08 07:19:23.191320'),
('d6q76byb0ta7btbmzbcd4yu8am3829fx', 'eyJ1c2VyX2lkIjoxfQ:1pUos5:qBxO1gVV971LM_g-xUeSH8zGj_f65Xx-UNiYhWvrdno', '2023-03-08 13:09:21.166232'),
('9e6jldtkf2w3wy2wsidf8mhbc83hpz9z', 'eyJ1c2VyX2lkIjoxfQ:1pVZIo:G6QbXrH1EEfeVBQbTMxoDhedC3AH7rsdKcYEiDB_Wos', '2023-03-10 14:44:02.715172'),
('vst4x7dk65pw3s6ns9ppaj0ypfiazwow', 'eyJ1c2VyX2lkIjozfQ:1pVsES:joHpQ7oOArayEJpJiBnHnqrdzYFvaT4vZlZkDyeSWg4', '2023-03-11 10:56:48.816033'),
('gefgxhvns9x5qsuxczhwnirn3hd6gmwf', 'eyJ1c2VyX2lkIjozfQ:1pfFHn:3NBOn4zsOuCwvjc3Ctdjca09j0iED9oxXsd-cohlrwU', '2023-04-06 07:22:59.897467');

-- --------------------------------------------------------

--
-- Table structure for table `job_details`
--

DROP TABLE IF EXISTS `job_details`;
CREATE TABLE IF NOT EXISTS `job_details` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_title` longtext NOT NULL,
  `job_location` longtext NOT NULL,
  `job_dept` longtext NOT NULL,
  `job_com_profile` longtext NOT NULL,
  `job_description` longtext NOT NULL,
  `job_requirement` longtext NOT NULL,
  `job_benefits` longtext NOT NULL,
  `job_req_experience` longtext NOT NULL,
  `job_req_education` longtext NOT NULL,
  `job_industry` longtext NOT NULL,
  `job_function` longtext NOT NULL,
  `job_salary_range` longtext NOT NULL,
  `job_emp_type` longtext NOT NULL,
  `user_url_id` int(11) DEFAULT NULL,
  `job_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`job_id`),
  KEY `job_Details_user_url_id_8a7654f2` (`user_url_id`)
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_details`
--

INSERT INTO `job_details` (`job_id`, `job_title`, `job_location`, `job_dept`, `job_com_profile`, `job_description`, `job_requirement`, `job_benefits`, `job_req_experience`, `job_req_education`, `job_industry`, `job_function`, `job_salary_range`, `job_emp_type`, `user_url_id`, `job_status`) VALUES
(1, 'Marketing ', 'US, NY, New York', 'Marketing', 'We help teachers get safe', 'Food52, a fast-growing', 'content management systems', 'food', 'content management systems ', 'Bachelor\'s Degree', 'IT', 'Sales', '20000', 'Full-time', NULL, NULL),
(2, 'Marketing Intern', ' New York', 'Finance', 'We help team get safe', 'Food52, a fast-growing', 'Experience with financial management systems', 'food,accomidation', '4years', 'Bachelor\'s Degree', 'IT', 'finance', '40000', 'Full-time', NULL, NULL),
(3, 'Marketing Intern', 'US, NY, New York', 'Marketing', 'We help team get safe', 'Food52, a fast-growing', 'Experience with content management systems', 'food', '7years', 'Bachelor\'s Degree', 'IT', 'Sales', '60000', 'Full-time', NULL, NULL),
(4, 'Marketing Intern', 'US, NY, New York', 'Marketing', 'We help team get safe', 'Food52, a fast-growing', 'Experience with content management systems', 'food', '7years', 'Bachelor\'s Degree', 'IT', 'Sales', '60000', 'Full-time', NULL, NULL),
(5, 'Marketing Intern', 'US, NY, New York', 'Marketing', 'We help teachers get safe', 'Food52, a fast-growing', 'Experience with content management systems', 'food', '3years', 'Bachelor\'s Degree', 'IT', 'Sales', '20000', 'Full-time', NULL, NULL),
(6, 'Marketing Intern', 'US, NY, New York', 'Marketing', 'We help teachers get safe', 'Food52, a fast-growing', 'Experience with content management systems', 'food', '3years', 'Bachelor\'s Degree', 'IT', 'Sales', '20000', 'Full-time', 1, NULL),
(7, 'Marketing Intern', 'US, NY, New York', 'Marketing', 'We help teachers get safe', 'Food52, a fast-growing', 'Experience with content management systems', 'food', '3years', 'Bachelor\'s Degree', 'IT', 'Sales', '20000', 'Full-time', 1, NULL),
(8, 'Marketing Intern', 'US, NY, New York', 'Marketing', 'We help teachers get safe', 'Food52, a fast-growing', 'Experience with content management systems', 'food', '3years', 'Bachelor\'s Degree', 'IT', 'Sales', '20000', 'Full-time', 1, NULL),
(9, 'Marketing Intern', 'US, NY, New York', 'Marketing', 'We help teachers get safe', 'Food52, a fast-growing', 'Experience with content management systems', 'food', '3years', 'Bachelor\'s Degree', 'IT', 'Sales', '20000', 'Full-time', 1, NULL),
(10, 'Marketing Intern', 'US, NY, New York', 'Marketing', 'We help teachers get safe', 'Food52, a fast-growing', 'Experience with content management systems', 'food', '3years', 'Bachelor\'s Degree', 'IT', 'Sales', '20000', 'Full-time', 1, NULL),
(11, 'Marketing Intern', 'US, NY, New York', 'Marketing', 'We help teachers get safe', 'Food52, a fast-growing', 'Experience with content management systems', 'food', '3years', 'Bachelor\'s Degree', 'IT', 'Sales', '10000', 'Full-time', 1, NULL),
(12, 'Marketing ', 'US', 'SALES', 'safe', 'fast-growing', 'marketing', 'food,accomidation', '5 years', 'Bachelor\'s Degree', 'IT', 'Sales', '2000', 'part-time', 1, NULL),
(13, 'Marketing ', 'US', 'SALES', 'safe', 'fast-growing', 'marketing', 'food,accomidation', '5 years', 'Bachelor\'s Degree', 'IT', 'Sales', '2000', 'part-time', 1, NULL),
(14, 'Developer', 'UK', 'IT', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '5years', 'Bachelor\'s Degree', 'IT', 'sales', '70000', 'Full-time', 1, NULL),
(15, 'Developer', 'UK', 'IT', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '5years', 'Bachelor\'s Degree', 'IT', 'sales', '70000', 'Full-time', 1, NULL),
(16, 'Developer', 'UK', 'IT', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '5years', 'Bachelor\'s Degree', 'IT', 'sales', '70000', 'Full-time', 1, NULL),
(17, 'Marketing Intern', 'US, NY, New York', 'Marketing', 'We help team get safe', 'fast-growing', 'experience in developing website', 'twowaycab', '2years', 'Bachelor Degree', 'IT', 'Sales', '20000', 'part-time', 1, NULL),
(18, 'Marketing Intern', 'New York', 'Marketing', 'We help team get safe', 'fast-growing', 'experience in developing website', 'twowaycab', '2years', 'Bachelor Degree', 'IT', 'Sales', '20000', 'part-time', 1, NULL),
(19, 'Developer', 'UK', 'IT', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '5years', 'Bachelor\'s Degree', 'IT', 'sales', '70000', 'Full-time', 1, NULL),
(20, 'Developer', 'UK', 'IT', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '5years', 'Bachelor\'s Degree', 'IT', 'sales', '70000', 'Full-time', 1, NULL),
(21, 'Developer', 'UK', 'IT', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '5years', 'Bachelor\'s Degree', 'IT', 'sales', '70000', 'Full-time', 1, NULL),
(22, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', ' a fast-growing', 'Experience with content management systems', 'food', '7years', 'Bachelor Degree', 'IT', 'Sales', '200000', 'Full-time', 1, NULL),
(23, 'Marketing Intern', 'UK', 'Marketing', 'safe', 'fast-growing', 'experience in developing website', 'twowaycab', '5 years', 'Bachelor Degree', 'IT', 'Sales', '100000', 'Full-time', 1, NULL),
(24, 'Marketing Intern', 'UK', 'SALES', 'safe', 'Development', 'experience in developing website', 'food', '3years', 'Bachelor Degree', 'IT', 'sales', '100000', 'part-time', 1, NULL),
(25, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', 'Development', 'Experience with content management systems', 'food', '3years', 'Bachelor Degree', 'IT', 'sales', '10000', 'Full-time', 1, NULL),
(26, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'Development', 'marketing', 'food', '3years', 'Bachelor Degree', 'IT', 'Sales', '20000', 'part-time', 1, NULL),
(27, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', 'Development', 'Experience with content management systems', 'food,accomidation', '7years', 'Bachelor Degree', 'IT', 'sales', '30000', 'part-time', 1, NULL),
(28, 'Marketing Intern', 'UK', 'SALES', 'We help team get safe', 'fast-growing', 'Experience with content management systems', 'twowaycab', '3years', 'Bachelor Degree', 'IT', 'sales', '100000', 'part-time', 1, NULL),
(29, 'Marketing Intern', 'US, NY, New York', 'Marketing', 'we help developers', 'Food52, a fast-growing', 'marketing experience', 'twowaycab', '5years', 'Bachelor Degree', 'IT', 'Sales', '10000', 'part-time', 1, NULL),
(30, 'Marketing', 'New York', 'Marketing', 'We help teachers get safe', 'Food52, a fast-growing', 'marketing', 'food', '3years', 'Bachelor Degree', 'IT', 'sales', '20000', 'part-time', 1, NULL),
(31, 'Marketing Intern', 'US, NY, New York', 'IT', 'We help teachers get safe', 'Development', 'experience in developing website', 'twowaycab', '3years', 'Bachelor Degree', 'IT', 'sales', '10000', 'Full-time', 1, NULL),
(32, 'Marketing', 'UK', 'IT', 'we help developers', 'fast-growing', 'Experience with content management systems', 'food', '3years', 'Bachelor Degree', 'IT', 'Sales', '90000', 'Full-time', 1, NULL),
(33, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'fast-growing', 'marketing', 'twowaycab', '3years', 'Bachelor Degree', 'IT', 'sales', '30000', 'Full-time', 1, NULL),
(34, 'Marketing ', 'UK', 'Marketing', 'We help teachers get safe', 'fast-growing', 'experience in developing website', 'food,accomidation', '5 years', 'Bachelor Degree', 'IT', 'sales', '30000', 'Full-time', 1, NULL),
(35, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'Development', 'experience in developing website', 'twowaycab', '3years', 'Bachelor Degree', 'IT', 'Sales', '10000', 'part-time', 1, NULL),
(36, 'Marketing Intern', 'UK', 'IT', 'we help developers', 'Food52, a fast-growing', 'experience in developing website', 'food', '3years', 'Bachelor Degree', 'IT', 'sales', '50000', 'part-time', 1, NULL),
(37, 'Marketing Intern', 'US, NY, New York', 'SALES', 'We help teachers get safe', 'Development', 'marketing', 'twowaycab', '7years', 'Bachelor Degree', 'IT', 'Sales', '5000', 'Full-time', 1, NULL),
(38, 'Well Paid Cash Jobs To Start Immediately. ', 'AU, NSW, Sydney', '0', '0', 'Well Paid Cash Jobs To Start Immediately', 'No requirement', '0', 'No exp required', '0', 'Hospital', 'Outsourcing', '0', 'part-time', 1, NULL),
(39, 'Online Typist From Home', 'Dallas', '0', 'Must be able to work from home', 'self motivated individual', '0', '0', 'entrylevel', 'High School or equivalent', 'Customer Service', 'Customer Service', '30000', 'Full-time', 1, NULL),
(40, 'Data Entry', 'phoenix', 'as a data entry', '0', 'administrative assistant', 'unspecified', '0', 'Entrylevel', 'Entry level', 'Accounting', 'administration', '0', 'Full-time', 1, NULL),
(41, 'Job for freelancer ', 'SA', 'IT Administrator / Developer', 'working in saudiarabia', 'freelance', 'Hundreds of Freelance Jobs', '0', 'Entry level', 'Master\'s Degree', 'Computer Networking', 'Information Technology', '0', 'Full-time', 1, NULL),
(42, 'dataentry', 'sa', 'IT', 'xxx', 'enter data', 'entrylevel', 'highbenefits', '0', 'highschool', 'Customer Service', 'administration', '1000000', 'Full-time', 1, NULL),
(43, 'Marketing Intern', 'UK', 'IT', 'We help teachers get safe', 'Development', 'Experience with content management systems', 'food,accomidation', '7years', 'Bachelor Degree', 'IT', 'Sales', '30000', 'Full-time', 1, NULL),
(44, 'Marketing Intern', 'UK', 'SALES', 'We help teachers get safe', 'fast-growing', 'Experience with content management systems', 'food,accomidation', '7years', 'Bachelor Degree', 'IT', 'Sales', '9000', 'Full-time', 1, NULL),
(45, 'Marketing Intern', 'UK', 'SALES', 'We help teachers get safe', 'fast-growing', 'Experience with content management systems', 'food,accomidation', '7years', 'Bachelor Degree', 'IT', 'Sales', '9000', 'Full-time', 1, NULL),
(46, 'Marketing Intern', 'UK', 'SALES', 'We help teachers get safe', 'fast-growing', 'Experience with content management systems', 'food,accomidation', '7years', 'Bachelor Degree', 'IT', 'Sales', '9000', 'Full-time', 1, NULL),
(47, 'Marketing Intern', 'UK', 'SALES', 'We help teachers get safe', 'fast-growing', 'Experience with content management systems', 'food,accomidation', '7years', 'Bachelor Degree', 'IT', 'Sales', '9000', 'Full-time', 1, NULL),
(48, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'Development', 'Experience with content management systems', 'twowaycab', '3years', 'Bachelor Degree', 'IT', 'Sales', '30000', 'Full-time', 1, NULL),
(49, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'Development', 'Experience with content management systems', 'twowaycab', '3years', 'Bachelor Degree', 'IT', 'Sales', '30000', 'Full-time', 1, NULL),
(50, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'Development', 'Experience with content management systems', 'twowaycab', '3years', 'Bachelor Degree', 'IT', 'Sales', '30000', 'Full-time', 1, NULL),
(51, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'fast-growing', 'Experience with content management systems', 'food', '3years', 'Bachelor Degree', 'IT', 'Sales', '10000', 'part-time', 1, NULL),
(52, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'fast-growing', 'Experience with content management systems', 'food', '3years', 'Bachelor Degree', 'IT', 'Sales', '10000', 'part-time', 1, NULL),
(53, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'Development', 'Experience with content management systems', 'food', '3years', 'Bachelor Degree', 'Customer Service', 'Sales', '30000', 'part-time', 1, NULL),
(54, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'Development', 'marketing', 'food', '3years', 'Bachelor Degree', 'Customer Service', 'administration', '30000', 'Full-time', 1, NULL),
(55, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'Development', 'experience in developing website', 'food', '3years', 'Bachelor Degree', 'Customer Service', 'administration', '30000', 'part-time', 1, NULL),
(56, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'fast-growing', 'Experience with content ', 'twowaycab', '7years', 'Bachelor Degree', 'IT', 'administration', '50000', 'Full-time', 1, NULL),
(57, 'Marketing Intern', 'UK', 'SALES', 'We help teachers get safe', 'Development', 'experience in developing website', 'food', '3years', 'Bachelor Degree', 'Customer Service', 'Sales', '4000', 'part-time', 1, NULL),
(58, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'Development', 'Experience with content management systems', 'food,accomidation', '5 years', 'Bachelor Degree', 'IT', 'Sales', '5000', 'part-time', 1, NULL),
(59, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'Development', 'Experience with content management systems', 'food,accomidation', '5 years', 'Bachelor Degree', 'IT', 'Sales', '5000', 'part-time', 1, NULL),
(60, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'Development', 'experience in developing website', 'food', '3years', 'Bachelor Degree', 'Customer Service', 'sales', '20000', 'part-time', 1, NULL),
(61, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'fast-growing', 'Experience with content management systems', 'twowaycab', '5years', 'Bachelor Degree', 'Customer Service', 'Sales', '10000', 'Full-time', 1, NULL),
(62, 'Developer', 'US, NY, New York', 'IT', 'we help developers', 'Food52, a fast-growing', 'experience in developing website', 'twowaycab', '7years', 'Bachelor Degree', 'IT', 'administration', '80000', 'Full-time', 1, NULL),
(63, 'Developer', 'US, NY, New York', 'Marketing', 'We help teachers get safe', 'Development', 'experience in developing website', 'twowaycab', '3years', 'Bachelor Degree', 'Customer Service', 'administration', '30000', 'part-time', 1, NULL),
(64, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', 'fast-growing', 'experience in developing website', 'twowaycab', '5years', 'Bachelor Degree', 'IT', 'Sales', '30000', 'Full-time', 1, NULL),
(65, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', 'Development', 'marketing', 'twowaycab', '3years', 'Bachelor Degree', 'IT', 'sales', '40000', 'Full-time', 1, NULL),
(66, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', 'fast-growing', 'Experience with content management systems', 'food', '5 years', 'Bachelor Degree', 'IT', 'sales', '40000', 'Full-time', 1, NULL),
(67, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', 'Food52, a fast-growing', 'experience in developing website', 'twowaycab', '3years', 'Bachelor Degree', 'Customer Service', 'administration', '40000', 'part-time', 1, NULL),
(68, 'Marketing Intern', 'UK', 'Marketing', 'We help team get safe', 'fast-growing', 'Experience with content management systems', 'food', '3years', 'Bachelor Degree', 'IT', 'sales', '60000', 'Full-time', 1, NULL),
(69, 'Developer', 'UK', 'Marketing', 'we help developers', 'fast-growing', 'experience in developing website', 'food', '5 years', 'Bachelor Degree', 'IT', 'sales', '50000', 'part-time', 1, NULL),
(70, 'Marketing Intern', 'UK', 'IT', 'We help teachers get safe', 'Development', 'experience in developing website', 'twowaycab', '7years', 'Bachelor\'s Degree', 'Customer Service', 'administration', '4000', 'part-time', 1, NULL),
(71, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', 'Development', 'Experience with content management systems', 'twowaycab', '3years', 'Bachelor Degree', 'IT', 'administration', '10000', 'Full-time', 1, NULL),
(72, 'Developer', 'UK', 'SALES', 'we help developers', 'Food52, a fast-growing', 'experience in developing website', 'twowaycab', '5years', 'Bachelor Degree', 'IT', 'Sales', '15000', 'part-time', 1, NULL),
(73, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', 'fast-growing', 'experience in developing website', 'food', '3years', 'Bachelor Degree', 'Customer Service', 'sales', '200000', 'part-time', 1, NULL),
(74, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '7years', 'Bachelor Degree', 'IT', 'sales', '100000', 'part-time', 1, NULL),
(75, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', 'Development', 'marketing', 'twowaycab', '7years', 'Bachelor Degree', 'IT', 'Sales', '70000', 'Full-time', 1, NULL),
(76, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', 'Development', 'marketing', 'twowaycab', '7years', 'Bachelor Degree', 'IT', 'Sales', '70000', 'Full-time', 1, NULL),
(77, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '7years', 'Bachelor Degree', 'IT', 'Sales', '90000', 'Full-time', 1, NULL),
(78, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '3years', 'Bachelor Degree', 'Customer Service', 'Sales', '60000', 'part-time', 1, NULL),
(79, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '3years', 'Bachelor Degree', 'IT', 'Sales', '60000', 'Full-time', 1, NULL),
(80, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '3years', 'Bachelor Degree', 'IT', 'Sales', '60000', 'Full-time', 1, NULL),
(81, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '3years', 'Bachelor Degree', 'IT', 'Sales', '60000', 'Full-time', 1, NULL),
(82, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '3years', 'Bachelor Degree', 'IT', 'Sales', '60000', 'Full-time', 1, NULL),
(83, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '3years', 'Bachelor Degree', 'IT', 'Sales', '60000', 'Full-time', 1, NULL),
(84, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '3years', 'Bachelor Degree', 'IT', 'Sales', '60000', 'Full-time', 1, '0'),
(87, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', 'Development', 'experience in developing website', 'food', '5years', 'Bachelor Degree', 'IT', 'sales', '30000', 'Full-time', 1, '0'),
(85, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '3years', 'Bachelor Degree', 'IT', 'Sales', '60000', 'Full-time', 1, '0'),
(86, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '3years', 'Bachelor Degree', 'IT', 'Sales', '60000', 'Full-time', 1, '0'),
(88, 'Jr.Developer', 'IN,AP,Hyderabad', 'Oil & Energy', 'Novitex-software', 'Organised-Focused', 'Univerisity-degree-required', 'See-job-description', 'Not-Applicable', 'Post-Graduation', 'Banking', 'Other', '10000', 'Part-time', 1, '0'),
(89, 'Applications Developer', 'CA,ON,Toronto', 'Design', 'Novitex-software', 'Cleanly-looking-amazon-experience', 'Position-for-Junior-level', 'Bonuses are available.', 'Mid-Senior level', 'Graduation', 'Computer-Software', 'Design', '200000', 'Part-time', 1, '0'),
(90, 'Data Entry', 'US', 'Marketing', 'We-are-food52', 'A-fast-Growing-company-looking-dynamic-person', 'Experience-CRM', 'Full-Benefits-Offered', 'Internship', 'Graduation', 'Computer-Software', 'SALES', '15000', 'Full-time', 1, '0'),
(91, 'Front End Developer', 'GB,LND,London', 'Design', 'Luxury-British-cocoa-grower', 'Organised-Focused', 'Univerisity-degree-required', 'Competative-pay', 'Mid-Senior level', 'Post-Graduation', 'Internet', 'Engineering', '60000', 'Part-time', 1, '0'),
(92, 'Marketing Intern', 'US, NY, New York', 'Marketing', 'We help teachers get safe', 'Food52, a fast-growing', 'Experience with content management systems', 'food', '3years', 'Bachelor\'s Degree', 'IT', 'Sales', '10000', 'Full-time', 3, '0'),
(93, 'IC&E Technician Mt Poso', 'US, NJ, JeUS, CA, Bakersfield, CA / Mt. Posorsey City', 'Oil & Energy', 'Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â Staffing &amp; Recruiting done right for the Oil &amp; Energy Industry!Represented candidates are automatically granted the following perks: Expert negotiations on your behalf, maximizing your compensation package and implimenting ongoing increasesÂ Significant signing bonus by Refined Resources (in addition to any potential signing bonuses our client companies offer)1 Year access to AnyPerk: significant corporate discounts on cell phones, event tickets, house cleaning and everything inbetween. Â You\'ll save thousands on daily expendituresÂ Professional Relocation Services for out of town candidates* All candidates are encouraged to participate in our Referral Bonus Program ranging anywhere from $500 - $1,000 for all successfully hired candidates... referred directly to the Refined Resources teamPlease submit referrals via online Referral FormThank you and we look forward to working with you soon! Â [ Click to enlarge Image ]', 'IC&amp;E Technician | Bakersfield, CA Mt. PosoPrincipal Duties and Responsibilities:Â Calibrates, tests, maintains, troubleshoots, and installs all power plant instrumentation, control systems and electrical equipment.Performs maintenance on motor control centers, motor operated valves, generators, excitation equipment and motors.Performs preventive, predictive and corrective maintenance on equipment, coordinating work with various team members.Designs and installs new equipment and/or system modifications.Troubleshoots and performs maintenance on DC backup power equipment, process controls, programmable logic controls (PLC), and emission monitoring equipment.Uses maintenance reporting system to record time and material use, problem identified and corrected, and further action required; provides complete history of maintenance on equipment.Schedule, coordinate, work with and monitor contractors on specific tasks, as required.Follows safe working practices at all times.Identifies safety hazards and recommends solutions.Follows environmental compliance work practices.Identifies environmental non-compliance problems and assist in implementing solutions.Assists other team members and works with all departments to support generating station in achieving their performance goals.Trains other team members in the areas of instrumentation, control, and electrical systems.Performs housekeeping assignments, as directed.Conduct equipment and system tagging according to company and plant rules and regulations.Perform equipment safety inspections, as required, and record results as appropriate.Â Participate in small construction projects.Â  Read and interpret drawings, sketches, prints, and specifications, as required.Orders parts as needed to affect maintenance and repair.Performs Operations tasks on an as-needed basis and other tasks as assigned.Available within a reasonable response time for emergency call-ins and overtime, plus provide acceptable off-hour contact by phone and company pager.Â Â Â Â Â Â Â Â Â  Excellent Verbal and Written Communications Skills:Ability to coordinate work activities with other team members on technical subjects across job families.Ability to work weekends, holidays, and rotating shifts, as required.Â ', 'Â QualificationsKnowledge, Skills &amp; Abilities:Â A high school diploma or GED is required. Must have a valid driverâ€™s license. Ability to read, write, and communicate effectively in English.Â Â Good math skills.Â Four years of experience as an I&amp;C Technician and/or Electrician in a power plant environment, preferably with a strong electrical background, up to and including, voltages to 15 KV to provide the following:Demonstrated knowledge of electrical equipment, electronics, schematics, basics of chemistry and physics and controls and instrumentation.Demonstrated knowledge of safe work practices associated with a power plant environment.Demonstrated ability to calibrate I&amp;C systems and equipment, including analytic equipment.Demonstrated ability to configure and operate various test instruments and equipment, as necessary, to troubleshoot and repair plant equipment including, but not limited to, distributed control systems, programmable logic controllers, motor control centers, transformers, generators, and continuous emissions monitor (CEM) systems.Demonstrated ability to work with others in a team environment.Â ', 'BENEFITSWhat is offered:Competitive compensation package100% matched retirement fundAnnual vacations paid for by companySignificant bonus structureOpportunity for advancementÂ Full benefits packageAnnual performance reviews and base salary increasesAnnual cost of living increasesÂ Sound, clean, safe and enjoyable working environment &amp; Company CultureWorld renound management and executive team who promote from within, leverage careers and invest in employees for the long-term success of their careers and overall company/employee goalsPlease Apply for Immediate Consideration.Â Qualified candidates contact:Â Darren Lawson | VP of Recruiting |Â #EMAIL_395225df8eed70288fc67310349d63d49d5f2ca6bc14dbb5dcbf9296069ad88c#Â | #PHONE_70128aad0c118273b0c2198a08d528591b932924e165b6a8d1272a6f9e2763d1#Â Â Â Â ', 'Mid-Senior level', 'High School or equivalent', 'Oil & Energy', 'Other', '95000', 'Full-time', 3, '1'),
(94, 'IC&E Technician Mt Poso', 'US, NJ, JeUS, CA, Bakersfield, CA / Mt. Posorsey City', 'Oil & Energy', 'Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â Staffing &amp; Recruiting done right for the Oil &amp; Energy Industry!Represented candidates are automatically granted the following perks: Expert negotiations on your behalf, maximizing your compensation package and implimenting ongoing increasesÂ Significant signing bonus by Refined Resources (in addition to any potential signing bonuses our client companies offer)1 Year access to AnyPerk: significant corporate discounts on cell phones, event tickets, house cleaning and everything inbetween. Â You\'ll save thousands on daily expendituresÂ Professional Relocation Services for out of town candidates* All candidates are encouraged to participate in our Referral Bonus Program ranging anywhere from $500 - $1,000 for all successfully hired candidates... referred directly to the Refined Resources teamPlease submit referrals via online Referral FormThank you and we look forward to working with y', 'IC&amp;E Technician | Bakersfield, CA Mt. PosoPrincipal Duties and Responsibilities:Â Calibrates, tests, maintains, troubleshoots, and installs all power plant instrumentation, control systems and electrical equipment.Performs maintenance on motor control centers, motor operated valves, generators, excitation equipment and motors.Performs preventive, predictive and corrective maintenance on equipment, coordinating work with various team members.Designs and installs new equipment and/or system modifications.Troubleshoots and performs maintenance on DC backup power equipment, process controls, programmable logic controls (PLC), and emission monitoring equipment.Uses maintenance reporting system to record time and material use, problem identified and corrected, and further action required; provides complete history of maintenance on equipment.Schedule, coordinate, work with and monitor contractors on specific tasks, as required.Follows safe working practices at all times.Identifies safety hazards and recommends ', 'Â QualificationsKnowledge, Skills &amp; Abilities:Â A high school diploma or GED is required. Must have a valid driverâ€™s license. Ability to read, write, and communicate effectively in English.Â Â Good math skills.Â Four years of experience as an I&amp;C Technician and/or Electrician in a power plant environment, preferably with a strong electrical background, up to and including, voltages to 15 KV to provide the following:Demonstrated knowledge of electrical equipment, electronics, schematics, basics of chemistry and physics and controls and instrumentation.Demonstrated knowledge of safe work practices associated with a power plant environment.Demonstrated ability to calibrate I&amp;C systems and equipment, including analytic equipment.Demonstrated ability to configure and operate various test instruments and equipment, as necessary, to troubleshoot and repair plant equipment including, but not limited to, distributed control systems, programmable logic controllers, motor control centers, transformers, gen', 'BENEFITSWhat is offered:Competitive compensation package100% matched retirement fundAnnual vacations paid for by companySignificant bonus structureOpportunity for advancementÂ Full benefits packageAnnual performance reviews and base salary increasesAnnual cost of living increasesÂ Sound, clean, safe and enjoyable working environment &amp; Company CultureWorld renound management and executive team who promote from within, leverage careers and invest in employees for the long-term success of their careers and overall company/employee goalsPlease Apply for Immediate Consideration.Â Qualified candidates contact:Â Darren Lawson | VP of Recruiting |Â #EMAIL_395225df8eed70288fc67310349d63d49d5f2ca6bc14dbb5dcbf9296069ad88c#Â | #PHONE_70128aad0c118273b0c2198a08d528591b932924e165b6a8d1272a6f9e2763d1#Â Â Â Â ', 'Mid-Senior level', 'High School or equivalent', 'Oil & Energy', 'Other', '95000', 'Full-time', 3, '0');

-- --------------------------------------------------------

--
-- Table structure for table `predict_details`
--

DROP TABLE IF EXISTS `predict_details`;
CREATE TABLE IF NOT EXISTS `predict_details` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_title` varchar(100) NOT NULL,
  `job_location` varchar(100) NOT NULL,
  `job_dept` varchar(100) NOT NULL,
  `job_com_profile` varchar(100) NOT NULL,
  `job_description` varchar(100) NOT NULL,
  `job_requirement` varchar(100) NOT NULL,
  `job_benefits` varchar(100) NOT NULL,
  `job_req_experience` varchar(100) NOT NULL,
  `job_req_education` varchar(100) NOT NULL,
  `job_industry` varchar(100) NOT NULL,
  `job_function` varchar(100) NOT NULL,
  `job_salary_range` varchar(100) NOT NULL,
  `job_emp_type` varchar(100) NOT NULL,
  `user_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`job_id`),
  KEY `predict_Details_user_id_id_7d6fde9f` (`user_id_id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `predict_details`
--

INSERT INTO `predict_details` (`job_id`, `job_title`, `job_location`, `job_dept`, `job_com_profile`, `job_description`, `job_requirement`, `job_benefits`, `job_req_experience`, `job_req_education`, `job_industry`, `job_function`, `job_salary_range`, `job_emp_type`, `user_id_id`) VALUES
(1, 'Marketing Intern', 'US, NY, New York', 'Marketing', 'We help teachers get safe', 'Food52, a fast-growing', 'Experience with content management systems', 'food', '3years', 'Bachelor\'s Degree', 'IT', 'Sales', '10000', 'Full-time', 1),
(2, 'Marketing ', 'US', 'SALES', 'safe', 'fast-growing', 'marketing', 'food,accomidation', '5 years', 'Bachelor\'s Degree', 'IT', 'Sales', '2000', 'part-time', 1),
(3, 'Marketing ', 'US', 'SALES', 'safe', 'fast-growing', 'marketing', 'food,accomidation', '5 years', 'Bachelor\'s Degree', 'IT', 'Sales', '2000', 'part-time', 1),
(4, 'Marketing ', 'US', 'SALES', 'safe', 'fast-growing', 'marketing', 'food,accomidation', '5 years', 'Bachelor\'s Degree', 'IT', 'Sales', '2000', 'part-time', 1),
(5, 'Developer', 'UK', 'IT', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '5years', 'Bachelor\'s Degree', 'IT', 'sales', '70000', 'Full-time', 1),
(6, 'Developer', 'UK', 'IT', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '5years', 'Bachelor\'s Degree', 'IT', 'sales', '70000', 'Full-time', 1),
(7, 'Developer', 'UK', 'IT', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '5years', 'Bachelor\'s Degree', 'IT', 'sales', '70000', 'Full-time', 1),
(8, 'Marketing Intern', 'US, NY, New York', 'Marketing', 'We help team get safe', 'fast-growing', 'experience in developing website', 'twowaycab', '2years', 'Bachelor Degree', 'IT', 'Sales', '20000', 'part-time', 1),
(9, 'Marketing Intern', 'New York', 'Marketing', 'We help team get safe', 'fast-growing', 'experience in developing website', 'twowaycab', '2years', 'Bachelor Degree', 'IT', 'Sales', '20000', 'part-time', 1),
(10, 'Developer', 'UK', 'IT', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '5years', 'Bachelor\'s Degree', 'IT', 'sales', '70000', 'Full-time', 1),
(11, 'Developer', 'UK', 'IT', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '5years', 'Bachelor\'s Degree', 'IT', 'sales', '70000', 'Full-time', 1),
(12, 'Developer', 'UK', 'IT', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '5years', 'Bachelor\'s Degree', 'IT', 'sales', '70000', 'Full-time', 1),
(13, 'Developer', 'UK', 'IT', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '5years', 'Bachelor\'s Degree', 'IT', 'sales', '70000', 'Full-time', 1),
(14, 'Developer', 'UK', 'IT', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '5years', 'Bachelor\'s Degree', 'IT', 'sales', '70000', 'Full-time', 1),
(15, 'Developer', 'UK', 'IT', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '5years', 'Bachelor\'s Degree', 'IT', 'sales', '70000', 'Full-time', 1),
(16, 'Developer', 'UK', 'IT', 'we help developers', 'Development', 'experience in developing website', 'twowaycab', '5years', 'Bachelor\'s Degree', 'IT', 'sales', '70000', 'Full-time', 1),
(17, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', ' a fast-growing', 'Experience with content management systems', 'food', '7years', 'Bachelor Degree', 'IT', 'Sales', '200000', 'Full-time', 1),
(18, 'Marketing Intern', 'UK', 'Marketing', 'safe', 'fast-growing', 'experience in developing website', 'twowaycab', '5 years', 'Bachelor Degree', 'IT', 'Sales', '100000', 'Full-time', 1),
(19, 'Marketing Intern', 'UK', 'SALES', 'safe', 'Development', 'experience in developing website', 'food', '3years', 'Bachelor Degree', 'IT', 'sales', '100000', 'part-time', 1),
(20, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', 'Development', 'Experience with content management systems', 'food', '3years', 'Bachelor Degree', 'IT', 'sales', '10000', 'Full-time', 1),
(21, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'Development', 'marketing', 'food', '3years', 'Bachelor Degree', 'IT', 'Sales', '20000', 'part-time', 1),
(22, 'Marketing Intern', 'UK', 'Marketing', 'we help developers', 'Development', 'Experience with content management systems', 'food,accomidation', '7years', 'Bachelor Degree', 'IT', 'sales', '30000', 'part-time', 1),
(23, 'Marketing Intern', 'UK', 'SALES', 'We help team get safe', 'fast-growing', 'Experience with content management systems', 'twowaycab', '3years', 'Bachelor Degree', 'IT', 'sales', '100000', 'part-time', 1),
(24, 'Marketing Intern', 'US, NY, New York', 'Marketing', 'we help developers', 'Food52, a fast-growing', 'marketing experience', 'twowaycab', '5years', 'Bachelor Degree', 'IT', 'Sales', '10000', 'part-time', 1),
(25, 'Marketing', 'New York', 'Marketing', 'We help teachers get safe', 'Food52, a fast-growing', 'marketing', 'food', '3years', 'Bachelor Degree', 'IT', 'sales', '20000', 'part-time', 1),
(26, 'Marketing Intern', 'US, NY, New York', 'IT', 'We help teachers get safe', 'Development', 'experience in developing website', 'twowaycab', '3years', 'Bachelor Degree', 'IT', 'sales', '10000', 'Full-time', 1),
(27, 'Marketing', 'UK', 'IT', 'we help developers', 'fast-growing', 'Experience with content management systems', 'food', '3years', 'Bachelor Degree', 'IT', 'Sales', '90000', 'Full-time', 1),
(28, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'fast-growing', 'marketing', 'twowaycab', '3years', 'Bachelor Degree', 'IT', 'sales', '30000', 'Full-time', 1),
(29, 'Marketing ', 'UK', 'Marketing', 'We help teachers get safe', 'fast-growing', 'experience in developing website', 'food,accomidation', '5 years', 'Bachelor Degree', 'IT', 'sales', '30000', 'Full-time', 1),
(30, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'Development', 'experience in developing website', 'twowaycab', '3years', 'Bachelor Degree', 'IT', 'Sales', '10000', 'part-time', 1),
(31, 'Marketing Intern', 'UK', 'IT', 'we help developers', 'Food52, a fast-growing', 'experience in developing website', 'food', '3years', 'Bachelor Degree', 'IT', 'sales', '50000', 'part-time', 1),
(32, 'Marketing Intern', 'US, NY, New York', 'SALES', 'We help teachers get safe', 'Development', 'marketing', 'twowaycab', '7years', 'Bachelor Degree', 'IT', 'Sales', '5000', 'Full-time', 1),
(33, 'Well Paid Cash Jobs To Start Immediately. ', 'AU, NSW, Sydney', '0', '0', 'Well Paid Cash Jobs To Start Immediately', 'No requirement', '0', 'No exp required', '0', 'Hospital', 'Outsourcing', '0', 'part-time', 1),
(34, 'Online Typist From Home', 'Dallas', '0', 'Must be able to work from home', 'self motivated individual', '0', '0', 'entrylevel', 'High School or equivalent', 'Customer Service', 'Customer Service', '30000', 'Full-time', 1),
(35, 'Data Entry', 'phoenix', 'as a data entry', '0', 'administrative assistant', 'unspecified', '0', 'Entrylevel', 'Entry level', 'Accounting', 'administration', '0', 'Full-time', 1),
(36, 'Job for freelancer ', 'SA', 'IT Administrator / Developer', 'working in saudiarabia', 'freelance', 'Hundreds of Freelance Jobs', '0', 'Entry level', 'Master\'s Degree', 'Computer Networking', 'Information Technology', '0', 'Full-time', 1),
(37, 'dataentry', 'sa', 'IT', 'xxx', 'enter data', 'entrylevel', 'highbenefits', '0', 'highschool', 'Customer Service', 'administration', '1000000', 'Full-time', 1),
(38, 'Marketing Intern', 'UK', 'IT', 'We help teachers get safe', 'Development', 'Experience with content management systems', 'food,accomidation', '7years', 'Bachelor Degree', 'IT', 'Sales', '30000', 'Full-time', 1),
(39, 'Marketing Intern', 'UK', 'SALES', 'We help teachers get safe', 'fast-growing', 'Experience with content management systems', 'food,accomidation', '7years', 'Bachelor Degree', 'IT', 'Sales', '9000', 'Full-time', 1),
(40, 'Online Typist From Home', 'Dallas', '0', 'Must be able to work from home', 'self motivated individual', '0', '0', 'entrylevel', 'High School or equivalent', 'Customer Service', 'Customer Service', '30000', 'Full-time', 1),
(41, 'Data Entry', 'phoenix', 'as a data entry', '0', 'administrative assistant', 'unspecified', '0', 'Entrylevel', 'Entry level', 'Accounting', 'administration', '0', 'Full-time', 1),
(42, 'Job for freelancer ', 'SA', 'IT Administrator / Developer', 'working in saudiarabia', 'freelance', 'Hundreds of Freelance Jobs', '0', 'Entry level', 'Master\'s Degree', 'Computer Networking', 'Information Technology', '0', 'Full-time', 1),
(43, 'dataentry', 'sa', 'IT', 'xxx', 'enter data', 'entrylevel', 'highbenefits', '0', 'highschool', 'Customer Service', 'administration', '1000000', 'Full-time', 1),
(44, 'Marketing Intern', 'UK', 'IT', 'We help teachers get safe', 'Development', 'Experience with content management systems', 'food,accomidation', '7years', 'Bachelor Degree', 'IT', 'Sales', '30000', 'Full-time', 1),
(45, 'Marketing Intern', 'UK', 'SALES', 'We help teachers get safe', 'fast-growing', 'Experience with content management systems', 'food,accomidation', '7years', 'Bachelor Degree', 'IT', 'Sales', '9000', 'Full-time', 1),
(46, 'Marketing Intern', 'UK', 'SALES', 'We help teachers get safe', 'fast-growing', 'Experience with content management systems', 'food,accomidation', '7years', 'Bachelor Degree', 'IT', 'Sales', '9000', 'Full-time', 1),
(47, 'Marketing Intern', 'UK', 'SALES', 'We help teachers get safe', 'fast-growing', 'Experience with content management systems', 'food,accomidation', '7years', 'Bachelor Degree', 'IT', 'Sales', '9000', 'Full-time', 1),
(48, 'Marketing Intern', 'UK', 'SALES', 'We help teachers get safe', 'fast-growing', 'Experience with content management systems', 'food,accomidation', '7years', 'Bachelor Degree', 'IT', 'Sales', '9000', 'Full-time', 1),
(49, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'Development', 'Experience with content management systems', 'twowaycab', '3years', 'Bachelor Degree', 'IT', 'Sales', '30000', 'Full-time', 1),
(50, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'Development', 'Experience with content management systems', 'twowaycab', '3years', 'Bachelor Degree', 'IT', 'Sales', '30000', 'Full-time', 1),
(51, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'Development', 'Experience with content management systems', 'twowaycab', '3years', 'Bachelor Degree', 'IT', 'Sales', '30000', 'Full-time', 1),
(52, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'fast-growing', 'Experience with content management systems', 'food', '3years', 'Bachelor Degree', 'IT', 'Sales', '10000', 'part-time', 1),
(53, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'fast-growing', 'Experience with content management systems', 'food', '3years', 'Bachelor Degree', 'IT', 'Sales', '10000', 'part-time', 1),
(54, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'Development', 'Experience with content management systems', 'food', '3years', 'Bachelor Degree', 'Customer Service', 'Sales', '30000', 'part-time', 1),
(55, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'Development', 'marketing', 'food', '3years', 'Bachelor Degree', 'Customer Service', 'administration', '30000', 'Full-time', 1),
(56, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'Development', 'experience in developing website', 'food', '3years', 'Bachelor Degree', 'Customer Service', 'administration', '30000', 'part-time', 1),
(57, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'fast-growing', 'Experience with content ', 'twowaycab', '7years', 'Bachelor Degree', 'IT', 'administration', '50000', 'Full-time', 1),
(58, 'Marketing Intern', 'UK', 'SALES', 'We help teachers get safe', 'Development', 'experience in developing website', 'food', '3years', 'Bachelor Degree', 'Customer Service', 'Sales', '4000', 'part-time', 1),
(59, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'Development', 'Experience with content management systems', 'food,accomidation', '5 years', 'Bachelor Degree', 'IT', 'Sales', '5000', 'part-time', 1),
(60, 'Marketing Intern', 'UK', 'Marketing', 'We help teachers get safe', 'Development', 'Experience with content management systems', 'food,accomidation', '5 years', 'Bachelor Degree', 'IT', 'Sales', '5000', 'part-time', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
CREATE TABLE IF NOT EXISTS `user_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_username` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_contact` varchar(15) NOT NULL,
  `user_image` varchar(100) NOT NULL,
  `user_dob` date DEFAULT NULL,
  `user_occupation` longtext,
  `user_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `user_username`, `user_email`, `user_password`, `user_contact`, `user_image`, `user_dob`, `user_occupation`, `user_status`) VALUES
(1, 'viswa', 'sri961@gmail.com', 'Password3', '9949226084', 'user/images/team-2.jpg', '2023-02-01', 'developer', 'accepted'),
(2, 'Ram', 'ram@email.com', 'Password1', '6677665555', 'user/images/team-3.jpg', '2023-02-02', 'developer', 'pending'),
(3, 'harsha vardhan', 'harshavardhan.hv12@gmail.com', '0000', '9618294480', 'user/images/robbery-concept_700248-12976.jpg', '4864-03-10', 'hadhvjav', 'accepted');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
