-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 03, 2022 at 02:50 PM
-- Server version: 5.7.34-log
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inguon`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `Id` int(10) UNSIGNED NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `Id` int(10) UNSIGNED NOT NULL,
  `IdVod` int(11) NOT NULL,
  `Author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`Id`, `IdVod`, `Author`, `Content`, `created_at`, `updated_at`) VALUES
(1, 301, 'vinh', 'phim hay', '2022-03-02 17:55:15', '2022-03-02 17:55:15'),
(2, 301, 'vinh', 'phim hay', '2022-03-02 17:55:15', '2022-03-02 17:55:15'),
(3, 301, 'vinh', 'phim hay', '2022-03-01 17:55:15', '2022-03-01 17:55:15'),
(4, 301, 'hiep', 'phim do', '2022-03-02 21:36:57', '2022-03-02 21:36:57'),
(5, 301, 'magiamsinh', 'great movie', '2022-03-02 21:42:09', '2022-03-02 21:42:09'),
(6, 301, 'test', 'test', '2022-03-02 21:56:19', '2022-03-02 21:56:19'),
(7, 301, 'test', 'test', '2022-03-02 22:05:51', '2022-03-02 22:05:51'),
(8, 301, 'vinh', 'vinh', '2022-03-02 22:06:07', '2022-03-02 22:06:07'),
(9, 301, 'sa', 'sa', '2022-03-02 22:07:42', '2022-03-02 22:07:42'),
(10, 301, 'vi', 'vi', '2022-03-02 22:08:12', '2022-03-02 22:08:12'),
(11, 301, 'magiamsinh', 'magiamsinh', '2022-03-02 22:10:35', '2022-03-02 22:10:35'),
(12, 301, 'tranvinh', 'tranvinh', '2022-03-02 22:11:01', '2022-03-02 22:11:01'),
(13, 301, 'test1', 'test1', '2022-03-02 22:11:50', '2022-03-02 22:11:50'),
(14, 301, 'magiamsinh', 'magiamsinh', '2022-03-02 22:14:28', '2022-03-02 22:14:28'),
(15, 301, 'cmt', 'cmt', '2022-03-02 22:14:42', '2022-03-02 22:14:42'),
(16, 301, 'test1', 'tes', '2022-03-02 22:14:50', '2022-03-02 22:14:50'),
(17, 301, 'ngu', 'ngu', '2022-03-02 22:16:27', '2022-03-02 22:16:27'),
(18, 301, 'ngu', 'ngu', '2022-03-02 22:17:23', '2022-03-02 22:17:23'),
(19, 301, 'hah', 'hah', '2022-03-02 22:17:32', '2022-03-02 22:17:32'),
(20, 314, 'ngu', 'ngu', '2022-03-02 22:23:14', '2022-03-02 22:23:14'),
(21, 314, 'test1', 'test1', '2022-03-02 22:24:00', '2022-03-02 22:24:00'),
(22, 314, 'test1', 'abc', '2022-03-02 22:28:42', '2022-03-02 22:28:42'),
(23, 315, 'test1', 'sss', '2022-03-02 22:29:04', '2022-03-02 22:29:04'),
(24, 315, 'test1', 'test2', '2022-03-02 22:36:42', '2022-03-02 22:36:42'),
(25, 315, 'test1', 'test3', '2022-03-02 22:37:12', '2022-03-02 22:37:12'),
(26, 315, 'sss', 'sss', '2022-03-02 22:38:44', '2022-03-02 22:38:44'),
(27, 315, 'test1', 'ssss', '2022-03-02 22:41:58', '2022-03-02 22:41:58'),
(28, 303, 'test1', 'te', '2022-03-02 22:42:25', '2022-03-02 22:42:25'),
(29, 268, 'test1', 'sssss', '2022-03-02 22:44:36', '2022-03-02 22:44:36'),
(30, 294, 'sss', 'sss', '2022-03-02 22:45:35', '2022-03-02 22:45:35'),
(31, 294, 'test1', 'asasa', '2022-03-02 22:45:43', '2022-03-02 22:45:43'),
(32, 289, 'test1', 'wwww', '2022-03-02 22:48:48', '2022-03-02 22:48:48'),
(33, 289, 'w', 'w', '2022-03-02 22:48:52', '2022-03-02 22:48:52'),
(34, 289, 'test1', 'ssss', '2022-03-02 22:49:29', '2022-03-02 22:49:29');

-- --------------------------------------------------------

--
-- Table structure for table `contries`
--

CREATE TABLE `contries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `listfilms`
--

CREATE TABLE `listfilms` (
  `Id` int(10) UNSIGNED NOT NULL,
  `vod_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `type_id_1` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `vod_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_sub` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_status` int(11) NOT NULL,
  `vod_letter` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_pic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_pic_thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_pic_slide` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_pic_screenshot` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_actor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_director` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_writer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_behind` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_blurb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_remarks` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_pubdate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_total` int(11) NOT NULL,
  `vod_serial` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_tv` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_weekday` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_lang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_jumpurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_tpl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_tpl_play` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_tpl_down` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_isend` int(11) NOT NULL,
  `vod_lock` int(11) NOT NULL,
  `vod_level` int(11) NOT NULL,
  `vod_copyright` int(11) NOT NULL,
  `vod_points` int(11) NOT NULL,
  `vod_points_play` int(11) NOT NULL,
  `vod_points_down` int(11) NOT NULL,
  `vod_hits` int(11) NOT NULL,
  `vod_hits_day` int(11) NOT NULL,
  `vod_hits_week` int(11) NOT NULL,
  `vod_hits_month` int(11) NOT NULL,
  `vod_duration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_up` int(11) NOT NULL,
  `vod_down` int(11) NOT NULL,
  `vod_score` decimal(3,1) NOT NULL,
  `vod_score_all` int(11) NOT NULL,
  `vod_score_num` int(11) NOT NULL,
  `vod_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_time_add` int(11) NOT NULL,
  `vod_time_hits` int(11) NOT NULL,
  `vod_time_make` int(11) NOT NULL,
  `vod_trysee` int(11) NOT NULL,
  `vod_douban_id` int(11) NOT NULL,
  `vod_douban_score` decimal(3,1) NOT NULL,
  `vod_reurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_rel_vod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_rel_art` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_pwd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_pwd_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_pwd_play` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_pwd_play_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_pwd_down` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_pwd_down_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_play_from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_play_server` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_play_note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_play_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_down_from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_down_server` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_down_note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_down_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_plot` int(11) NOT NULL,
  `vod_plot_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `vod_plot_detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menufilm`
--

CREATE TABLE `menufilm` (
  `Id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oddfilm`
--

CREATE TABLE `oddfilm` (
  `Id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seriesfilm`
--

CREATE TABLE `seriesfilm` (
  `Id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `year`
--

CREATE TABLE `year` (
  `Id` int(10) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `contries`
--
ALTER TABLE `contries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `listfilms`
--
ALTER TABLE `listfilms`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `menufilm`
--
ALTER TABLE `menufilm`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `oddfilm`
--
ALTER TABLE `oddfilm`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `seriesfilm`
--
ALTER TABLE `seriesfilm`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `year`
--
ALTER TABLE `year`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `contries`
--
ALTER TABLE `contries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `listfilms`
--
ALTER TABLE `listfilms`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menufilm`
--
ALTER TABLE `menufilm`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oddfilm`
--
ALTER TABLE `oddfilm`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seriesfilm`
--
ALTER TABLE `seriesfilm`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `year`
--
ALTER TABLE `year`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
