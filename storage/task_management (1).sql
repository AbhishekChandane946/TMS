-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2024 at 02:57 PM
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
-- Database: `task_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_12_16_055319_create_roles_table', 2),
(5, '2024_12_16_055632_create_permissions_table', 2),
(6, '2024_12_16_060007_create_role_permission_table', 2),
(7, '2024_12_16_060225_create_user_role_table', 2),
(8, '2024_12_16_064128_add_slug_to_roles_table', 3),
(9, '2024_12_17_070310_add_user_type_to_user_table', 4),
(10, '2024_12_17_080818_add_role_id_to_users_table', 5),
(11, '2024_12_19_064259_add_deleted_at_to_tasks_table', 6),
(12, '2024_12_19_125259_add_status_to_tasks_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'create_task', 'Create task', '2024-12-16 02:15:19', '2024-12-16 02:15:19'),
(2, 'edit_task', 'Edit task', '2024-12-16 02:18:42', '2024-12-16 02:18:42'),
(3, 'delete_task', 'Delete task', '2024-12-16 02:18:42', '2024-12-16 02:18:42'),
(4, 'view_task', 'View task', '2024-12-16 02:18:42', '2024-12-16 02:18:42');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'Administrator', '2024-12-16 02:03:41', '2024-12-16 02:03:41'),
(2, 'Manager', 'manager', 'Task Manager', '2024-12-16 02:03:41', '2024-12-16 02:03:41'),
(3, 'Team Member', 'team_member', 'Regular User', '2024-12-16 02:03:41', '2024-12-16 02:03:41'),
(4, 'IT', 'it', 'Role for IT/Developers', '2024-12-16 02:03:41', '2024-12-16 02:03:41'),
(5, 'Sales', 'sales', 'Role for Sales team', '2024-12-16 02:03:41', '2024-12-16 02:03:41'),
(6, 'Legal', 'legal', 'Role for Legal team', '2024-12-16 02:03:41', '2024-12-16 02:03:41'),
(7, 'Finance', 'finance', 'Role for Finance team', '2024-12-16 02:03:41', '2024-12-16 02:03:41'),
(8, 'Support', 'support', 'Role for Support team', '2024-12-16 02:03:41', '2024-12-16 02:03:41'),
(9, 'RM', 'rm', 'Role for Relationship Managers', '2024-12-16 02:03:41', '2024-12-16 02:03:41'),
(10, 'Accounts & Recon', 'accounts_recon', 'Role for Accounts and Reconciliation', '2024-12-16 02:03:41', '2024-12-16 02:03:41'),
(11, 'Management', 'management', 'Role for Management', '2024-12-16 02:03:41', '2024-12-16 02:03:41'),
(12, 'API Partner', 'api_partner', 'Role for API Partners', '2024-12-16 02:03:41', '2024-12-16 02:03:41'),
(13, 'Enterprise Partner', 'enterprise_partner', 'Role for Enterprise Partners', '2024-12-16 02:03:41', '2024-12-16 02:03:41'),
(14, 'Whitelabel', 'whitelabel', 'Role for Whitelabel Partners', '2024-12-16 02:03:41', '2024-12-16 02:03:41'),
(15, 'Master Distributor', 'master_distributor', 'Role for Master Distributors', '2024-12-16 02:03:41', '2024-12-16 02:03:41'),
(16, 'Distributor', 'distributor', 'Role for Distributors', '2024-12-16 02:03:41', '2024-12-16 02:03:41'),
(17, 'Retailer', 'retailer', 'Role for Retailers', '2024-12-16 02:03:41', '2024-12-16 02:03:41'),
(18, 'Whitelabel Admin', 'whitelabel_admin', 'Role for Whitelabel Admins', '2024-12-16 02:03:41', '2024-12-16 02:03:41'),
(19, 'WI Admin EMP', 'wi_admin_emp', 'Role for WI Admin Employees', '2024-12-16 02:03:41', '2024-12-16 02:03:41'),
(20, 'ENT Employee', 'ent_employee', 'Role for Enterprise Employees', '2024-12-16 02:03:41', '2024-12-16 02:03:41'),
(21, 'WI Employee', 'wi_employee', 'Role for WI Employees', '2024-12-16 02:03:41', '2024-12-16 02:03:41');

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 1, 2, NULL, NULL),
(4, 2, 2, NULL, NULL),
(5, 1, 3, NULL, NULL),
(6, 1, 4, NULL, NULL),
(7, 2, 4, NULL, NULL),
(8, 3, 4, NULL, NULL),
(9, 4, 4, NULL, NULL),
(10, 5, 4, NULL, NULL),
(11, 6, 4, NULL, NULL),
(12, 7, 4, NULL, NULL),
(13, 8, 4, NULL, NULL),
(14, 9, 4, NULL, NULL),
(15, 10, 4, NULL, NULL),
(16, 11, 4, NULL, NULL),
(17, 12, 4, NULL, NULL),
(18, 13, 4, NULL, NULL),
(19, 14, 4, NULL, NULL),
(20, 15, 4, NULL, NULL),
(21, 16, 4, NULL, NULL),
(22, 17, 4, NULL, NULL),
(23, 18, 4, NULL, NULL),
(24, 19, 4, NULL, NULL),
(25, 20, 4, NULL, NULL),
(26, 21, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('43L3PomUKMT1fVq3CvSLlfkPZ2KdzvMUwR2KvWui', 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUlZBVmRiakFJVjAzZlhtdDBSbEpoT2xPOGN5cmNGbjYxRDNJYXdEaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kaXNwbGF5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NDt9', 1734695715),
('QVyyCosprfoaDKixYfMKiv0kSRcGNLW57CnWvJCp', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaHpxb0hpMEJRaXZWem5XdE5UcnRqYWs5akdjdVNENGRIQXdZeHF2TSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kaXNwbGF5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mzt9', 1734702996);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `task_description` text NOT NULL,
  `assign_to` varchar(255) NOT NULL,
  `task_created_by` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `flag` varchar(100) NOT NULL,
  `priority` varchar(100) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(100) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `task_description`, `assign_to`, `task_created_by`, `start_date`, `end_date`, `flag`, `priority`, `status`, `created_at`, `updated_at`, `user_id`, `deleted_at`) VALUES
(1, 'SSSS', 'SSSS', '1', '3', '2024-12-21', '2024-12-22', 'SSSS', 'high', 'active', '2024-12-20 06:22:27', '2024-12-20 08:26:32', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_type` varchar(255) NOT NULL DEFAULT 'user',
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `role_id`, `user_type`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Danish Shekh', 21, 'internal', 'danish@gmail.com', '2024-12-16 09:12:56', '$2y$12$7fAmf2PP7miajNkjf8eBJuiJ04N2s5kkcM9RaKf4zv5nRpHIa89p2', NULL, '2024-12-16 09:12:56', '2024-12-17 01:39:00'),
(2, 'Sunil Chavan', 21, 'internal', 'sunil@gmail.com', '2024-12-16 09:12:56', 'sales', NULL, '2024-12-16 09:12:56', '2024-12-16 09:12:56'),
(3, 'Pooja Madam', 16, 'internal', 'pooja@gmail.com', '2024-12-16 09:21:39', '$2y$12$0QAKtIGcj9kb2J7yS69dzeTDC3glrcoXohrkH5EW4/Xk8fIkeYr6q', NULL, '2024-12-16 09:21:39', '2024-12-16 07:14:30'),
(4, 'Jyoti Madam', 16, 'internal', 'jyoti@gmail.com', '2024-12-16 09:23:58', '$2y$12$9gIukhN.vnUsk1Jr5Jpgr.ugFa2jIqPRYPyM.3RJ9Elz8NwtU2MoK', NULL, '2024-12-16 09:23:58', '2024-12-16 23:29:30'),
(5, 'Jyoti Madam 2', 21, 'internal', 'jyoti2@gmail.com', '2024-12-17 06:45:11', '$2y$12$7fAmf2PP7miajNkjf8eBJuiJ04N2s5kkcM9RaKf4zv5nRpHIa89p2', NULL, '2024-12-17 06:45:11', '2024-12-17 06:45:11'),
(6, 'Sahil ', 21, 'internal', 'sahil@gmail.com', '2024-12-17 06:45:11', '$2y$12$7fAmf2PP7miajNkjf8eBJuiJ04N2s5kkcM9RaKf4zv5nRpHIa89p2', NULL, '2024-12-17 06:45:11', '2024-12-17 06:45:11'),
(7, 'Saqib', 17, 'internal', 'saquib@gmail.com', '2024-12-17 06:50:04', '$2y$12$7fAmf2PP7miajNkjf8eBJuiJ04N2s5kkcM9RaKf4zv5nRpHIa89p2', NULL, '2024-12-17 06:50:04', '2024-12-17 06:50:04'),
(8, 'Abhishek Chandane', 17, 'internal', 'abhishek@gmail.com', '2024-12-17 06:50:04', '$2y$12$7fAmf2PP7miajNkjf8eBJuiJ04N2s5kkcM9RaKf4zv5nRpHIa89p2', NULL, '2024-12-17 06:50:04', '2024-12-17 06:50:04'),
(9, 'Gussie Terry', 1, 'client', 'manuel.rowe@example.net', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'UCrX8Bh7VS', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(10, 'Prof. Ursula Towne IV', 3, 'internal', 'leuschke.elsa@example.org', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'ukijldpOMr', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(11, 'Adolfo Runte', 3, 'internal', 'karianne68@example.com', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'GDsc51DYfH', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(12, 'Rosa Schultz', 5, 'client', 'rene.streich@example.org', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', '2RJZT4sC49', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(13, 'Forrest Schroeder', 5, 'internal', 'kathleen.bergstrom@example.com', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'pvFXmvXeOu', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(14, 'Gerard Russel Sr.', 3, 'client', 'antonetta69@example.net', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'cJmsDBFEBh', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(15, 'Haylee Dach', 2, 'client', 'savion31@example.org', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'fDxzbXsXt6', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(16, 'Miss Allie Feest III', 2, 'client', 'orion38@example.net', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'W9IbSCwwOL', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(17, 'Steve Armstrong', 2, 'client', 'lauriane81@example.com', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'riSHumVjJw', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(18, 'Shanny Runolfsson', 2, 'internal', 'carter.kayleigh@example.net', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'Bd2X7AvnY5', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(19, 'Stephania Jast III', 4, 'internal', 'von.nadia@example.net', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', '2LSGdbYrqZ', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(20, 'Rosalind Padberg', 3, 'internal', 'lizeth.runte@example.net', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'cHCKYswNNd', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(21, 'Mrs. Mabel Ernser', 5, 'internal', 'winifred.cartwright@example.net', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'WRAFS7seAy', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(22, 'Dr. Kendrick Mayer', 1, 'client', 'collier.franco@example.org', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'mkUrPv1Rq9', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(23, 'Crystel Beier III', 5, 'client', 'terry.eugene@example.com', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'bmJXVMrIbk', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(24, 'Miss Marianna Johnson DVM', 2, 'client', 'ellis.flatley@example.net', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', '2sFKvcycUR', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(25, 'Easton Hessel', 3, 'client', 'rturner@example.net', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', '0jRsqLWpfs', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(26, 'Makenna Littel', 3, 'client', 'qemmerich@example.com', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'JTQQWLU4M3', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(27, 'Mr. Carlo Predovic II', 5, 'internal', 'hansen.geovanny@example.net', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'TLGu7CVf5h', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(28, 'Kayleigh Bechtelar', 1, 'client', 'nolan.rebecca@example.com', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'IaGLUfyabF', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(29, 'Dr. Norval Torp III', 5, 'client', 'jyost@example.org', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', '4DQ0zE16Pe', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(30, 'Chester Schuppe', 3, 'internal', 'shanny15@example.net', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'WwJtEqDaiB', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(31, 'Mrs. Linnie Hansen', 2, 'client', 'becker.matt@example.net', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'GwEBGSFA27', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(32, 'Prof. Alphonso Herman V', 2, 'client', 'marlee.smitham@example.org', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'sdFUHKiEDw', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(33, 'Horacio Morar', 2, 'internal', 'akshlerin@example.com', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', '3dQsYmYWnV', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(34, 'Dr. Laverne Bailey', 4, 'internal', 'jerod78@example.com', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', '1Y7pmFCdkI', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(35, 'Ines Heathcote', 3, 'internal', 'roob.andy@example.org', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'lMcRoWyRra', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(36, 'Annie Pagac', 2, 'internal', 'joanne.miller@example.com', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'H8DlVvyCN6', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(37, 'Mrs. Edna Will', 3, 'client', 'mosciski.leonard@example.org', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'OcjjTqaKCf', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(38, 'Rick Fisher', 3, 'client', 'dickinson.ayana@example.net', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', '7BVH2xmhSw', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(39, 'Jaclyn Koepp', 4, 'internal', 'thaddeus39@example.net', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'ghwBjTkFwJ', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(40, 'Prof. Malachi Waelchi Sr.', 5, 'client', 'bridget25@example.net', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', '9wG8rvDA02', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(41, 'Wava Waters', 4, 'client', 'hrolfson@example.org', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'zICedjC1Kz', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(42, 'Mr. Cedrick Bartoletti DVM', 4, 'internal', 'yschmeler@example.org', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'peAnCLLYMH', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(43, 'Kendrick Turner', 1, 'client', 'hortense82@example.org', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'gNQX569sno', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(44, 'Colby Hessel', 1, 'client', 'osinski.roxanne@example.org', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'og6RIgzuhY', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(45, 'Marty Miller', 5, 'internal', 'rjenkins@example.net', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', '6invLC04Fd', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(46, 'Margret Gusikowski', 4, 'internal', 'bethany78@example.org', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'hB2m8Ym6ZE', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(47, 'Mr. Jeremie Collins IV', 5, 'client', 'derick05@example.org', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'MeIZDxka8M', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(48, 'Prof. Jessy McKenzie DVM', 5, 'client', 'mohamed.stokes@example.com', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'JrLdWH0m7f', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(49, 'Matt Balistreri', 5, 'internal', 'janelle.hodkiewicz@example.org', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', '1Bv20NvI3f', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(50, 'Weston Fay', 2, 'client', 'clementina01@example.com', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'QzoCovhJYv', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(51, 'Ariane Auer', 4, 'internal', 'lillian.okuneva@example.net', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'CrdRxQBR3L', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(52, 'Kelli Tremblay', 5, 'client', 'scot.oberbrunner@example.net', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'mhAwsEKNsD', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(53, 'Layla Bartoletti', 1, 'internal', 'huel.alysha@example.com', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', '7A2pdXygGp', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(54, 'Prof. Nicholaus Towne IV', 1, 'client', 'uzboncak@example.org', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'IVXtDmseFO', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(55, 'Jaunita Kris', 1, 'internal', 'delmer23@example.com', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'TIDJi6JnUl', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(56, 'Carli Altenwerth', 1, 'internal', 'quigley.charlie@example.net', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'tEfpN2KBXG', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(57, 'Prof. Eduardo Moen', 5, 'client', 'trantow.janie@example.org', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'yGIjoTKcXB', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(58, 'Linda Waters', 3, 'internal', 'sporer.madeline@example.org', '2024-12-18 05:26:41', '$2y$12$bmmCY4eLa.DS7hpJkKDs6Oz7IDD.ghEeo3vbAVW9kpPRvou38ZCbm', 'GBzRZ373LJ', '2024-12-18 05:26:41', '2024-12-18 05:26:41'),
(59, 'Miss Tomasa Turcotte Jr.', 3, 'client', 'marion94@example.com', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', '5yGaqxiMEV', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(60, 'Norwood Bradtke V', 4, 'client', 'ukilback@example.net', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'j7TQvSzVfX', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(61, 'Donnie Welch', 3, 'internal', 'jena.berge@example.com', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'OcOJZT755k', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(62, 'Justice Streich', 2, 'client', 'whyatt@example.net', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'x79ZVAWKSX', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(63, 'Vernie Wehner', 1, 'internal', 'pagac.tristin@example.net', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'WP58oQMJUO', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(64, 'Dr. Theresa Bradtke I', 2, 'client', 'dayana17@example.com', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'xyIbEX3Ky0', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(65, 'Karelle Schulist', 4, 'internal', 'rolando.harber@example.com', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'hPVAMSvmel', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(66, 'Mya Cremin', 1, 'internal', 'harmon79@example.net', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', '58pKlciUk9', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(67, 'Robb Von', 2, 'internal', 'armani49@example.org', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'glnd17ccUT', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(68, 'Malika O\'Conner', 2, 'internal', 'rey.herman@example.org', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'rhXfdDmzn1', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(69, 'Giovanna Senger', 1, 'internal', 'fadel.sally@example.org', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'IYSyeLvYQb', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(70, 'Carli Stanton', 4, 'client', 'stroman.quinten@example.com', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'ohvb5AtjMP', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(71, 'Ms. Pearlie Lynch MD', 5, 'client', 'lehner.lazaro@example.net', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'QfMtNrfGM8', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(72, 'Johnpaul Bailey', 3, 'client', 'camille13@example.com', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'X9pnH0k08B', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(73, 'Modesto Dickinson', 5, 'client', 'rosa.howe@example.com', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'fqKcK5QYjX', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(74, 'Miss Maryse Senger', 4, 'internal', 'freeda.rippin@example.org', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'uC2HiolMtt', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(75, 'Denis Beer', 4, 'internal', 'rquigley@example.org', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'SjBhZPf23B', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(76, 'Quinten Hane', 4, 'internal', 'kessler.adaline@example.net', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'vdfT5qvXSt', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(77, 'Everett Dibbert II', 1, 'internal', 'ohara.dayton@example.com', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'CGA6zqO1Ca', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(78, 'Jerrod Haley', 5, 'internal', 'grayce33@example.net', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', '1uHUoqCGTN', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(79, 'Harvey Crona', 1, 'client', 'ashley.heidenreich@example.net', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'UzjlD8mnQH', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(80, 'Junius Bartell', 3, 'internal', 'uferry@example.com', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', '9CGbzxYmHA', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(81, 'Precious Muller', 5, 'internal', 'vlang@example.net', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'TA4XRo1yNj', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(82, 'Mr. Gustave Beahan', 1, 'client', 'rice.javon@example.org', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'I94cPzmNJN', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(83, 'Nova Brown', 5, 'internal', 'tschuster@example.org', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'Z7TDvUCXRM', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(84, 'Prof. Peyton Dietrich', 1, 'client', 'wnitzsche@example.com', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'syFw21vOHk', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(85, 'Selmer Stark', 4, 'client', 'ally.mccullough@example.net', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'ndpW3Ozlru', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(86, 'Hugh Gleason', 2, 'internal', 'nadia46@example.com', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'zEXkOujQPH', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(87, 'Theresa Satterfield', 4, 'client', 'corkery.effie@example.net', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'pGvjCH42Qf', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(88, 'Dr. Seth Hand MD', 4, 'client', 'rwaters@example.net', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'GKaSbUHGaS', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(89, 'Reymundo Bashirian', 3, 'internal', 'ally.swift@example.org', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'xDRytPP8LZ', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(90, 'Adelbert Macejkovic', 2, 'client', 'vergie.cole@example.org', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'WKM2jnlSkx', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(91, 'Easton Schowalter II', 4, 'client', 'melyssa74@example.net', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'kDNEtzkoZZ', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(92, 'Lorenz Doyle III', 2, 'client', 'nrodriguez@example.net', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', '8zqsWFg6n8', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(93, 'Adam Reichel PhD', 3, 'internal', 'janae.gleason@example.com', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'N9O56NaCxP', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(94, 'Edmond Feeney', 2, 'client', 'bogan.jacinthe@example.org', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', '92AbsXlP7B', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(95, 'Miss Shanna Stroman PhD', 4, 'client', 'kuphal.drake@example.com', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'ZTc6WeeABe', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(96, 'Dr. Loyal Brakus', 1, 'client', 'tate41@example.net', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'yoxakzselq', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(97, 'Ramiro Kunze', 5, 'client', 'jessie28@example.org', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', '1sNab1oPDV', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(98, 'Christelle Gutkowski PhD', 3, 'internal', 'joannie.boehm@example.org', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'FofoZthCon', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(99, 'Melvin Armstrong', 2, 'internal', 'jeanne.king@example.net', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'xA7KhyaEcO', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(100, 'Prof. Ludwig Becker MD', 4, 'client', 'jessy74@example.net', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'pU5zteu9YQ', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(101, 'Tyrique Rau', 1, 'client', 'lemke.armando@example.org', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'HCpgGQfUGi', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(102, 'Dr. Kelvin Kertzmann', 5, 'internal', 'davion.witting@example.org', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'ExFxQswknv', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(103, 'Billy Ortiz', 2, 'internal', 'jacklyn46@example.net', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'ScKuEZ2Z1J', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(104, 'Prof. Estevan Pollich I', 1, 'client', 'vlehner@example.com', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'ixRjZ6SWOA', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(105, 'Carlos Koss', 1, 'client', 'dhegmann@example.net', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'm6YAKzEbM2', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(106, 'Madisyn Bechtelar', 3, 'client', 'tsatterfield@example.net', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', '7HAhznjeMx', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(107, 'Simeon Kassulke', 5, 'internal', 'declan72@example.com', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'AtH2nlVHJi', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(108, 'Garrison Konopelski II', 5, 'client', 'adavis@example.net', '2024-12-18 05:31:02', '$2y$12$xw2IyAlfKmAFaPJro.NnZ.zOMt9HJ1khsAmlxN4OKRI/SDWAajBB6', 'zfBE0OUp7c', '2024-12-18 05:31:02', '2024-12-18 05:31:02'),
(109, 'Larry Bauch', 1, 'internal', 'adolfo60@example.com', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'LNN2KlKtCi', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(110, 'Merritt Rempel Jr.', 2, 'client', 'margot01@example.net', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'EBePg0oYWz', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(111, 'Haylie Brakus', 1, 'internal', 'casey83@example.com', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'oOYqfZyeFO', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(112, 'Mr. Thad DuBuque', 3, 'internal', 'barney.wintheiser@example.net', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'TSDYwWCyne', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(113, 'Mrs. Emely Hintz DVM', 4, 'internal', 'cassin.michaela@example.net', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', '7s49MejrMC', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(114, 'Holden Lynch', 2, 'internal', 'tebert@example.org', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', '9CgGBVIBvi', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(115, 'Janelle Schmeler', 4, 'client', 'nolan.maddison@example.net', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'ww5pjkwVCz', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(116, 'Erna Huels', 4, 'client', 'tressa09@example.org', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'Nx8sVhYyno', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(117, 'Evans Gerlach', 2, 'internal', 'lavon94@example.org', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'uI3N8qmVcw', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(118, 'Gonzalo Kozey', 4, 'client', 'blick.frederick@example.com', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', '0TtHAB35ZX', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(119, 'Ludwig Krajcik', 3, 'internal', 'dschneider@example.net', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'fwgsjTgPTn', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(120, 'Mrs. Priscilla Corkery', 4, 'client', 'florine60@example.com', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'f31blehnsX', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(121, 'Jon Crona', 3, 'client', 'nhuels@example.org', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'SZlP95d1ec', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(122, 'Torrance Cole', 2, 'client', 'jovani.feest@example.net', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', '1vozodbrvY', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(123, 'Antone Stanton', 3, 'internal', 'dedric.skiles@example.net', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', '6IpElpe8SO', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(124, 'Lilliana Collins', 2, 'internal', 'maida85@example.org', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'KkiWGyWKx7', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(125, 'Hunter Hermiston', 4, 'internal', 'rippin.genevieve@example.com', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'FcqpZJRTds', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(126, 'Norwood Reichert', 3, 'internal', 'gerard.sanford@example.com', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'Pc8yiazXTt', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(127, 'Prof. Yessenia Lesch', 4, 'client', 'koss.jayda@example.net', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'lPRdpHR1wO', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(128, 'Prof. Devin McLaughlin', 1, 'internal', 'nova.little@example.net', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'psVfHbscfO', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(129, 'Lenora Legros', 4, 'internal', 'luettgen.hayden@example.org', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'CfMjDwhVgC', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(130, 'Mariane Altenwerth', 1, 'client', 'uschaden@example.com', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'bNHXJyr35W', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(131, 'Madie Cole I', 3, 'internal', 'vspinka@example.net', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'zIWNicI4Kx', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(132, 'Enos Bernier', 1, 'internal', 'laurianne.casper@example.net', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'zRNsvvHyG9', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(133, 'Dr. Giuseppe Robel PhD', 1, 'client', 'margaret82@example.com', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'tawUQQmRVC', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(134, 'Darien Bernier', 1, 'internal', 'vschmitt@example.net', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', '5J9YUtlz2K', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(135, 'Raymundo Howell', 4, 'client', 'natalia.yost@example.net', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'e6sDTa3wpY', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(136, 'Adella Davis', 5, 'client', 'agaylord@example.net', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'L2w3qIr6Is', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(137, 'Loren Abernathy PhD', 3, 'internal', 'hallie.huel@example.net', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', '4gUhugYV0z', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(138, 'Albert Batz', 3, 'internal', 'melba96@example.net', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'hSz7BRInRA', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(139, 'Dr. Aleen West', 1, 'client', 'gfisher@example.com', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'W7eeOoFiiK', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(140, 'Dr. Issac Quitzon DDS', 4, 'client', 'maida.kuhn@example.com', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'cjEL5Zyuau', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(141, 'Hans Wunsch', 4, 'client', 'owitting@example.com', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'jnbYjvnMmI', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(142, 'Baron Legros', 4, 'client', 'bode.eleazar@example.org', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'GeQcAdpXDI', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(143, 'Joseph Terry', 5, 'client', 'carter.rhoda@example.net', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', '2aOZ25vvFx', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(144, 'Matilde Gislason', 3, 'internal', 'psawayn@example.com', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'nBC9Bp7PK4', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(145, 'Cloyd Nolan DVM', 5, 'client', 'verdman@example.net', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'WwBYNQXwZP', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(146, 'Freddie Cassin', 2, 'internal', 'iboehm@example.org', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'SFnIglZHL2', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(147, 'Orlo Boyer DDS', 1, 'client', 'schamberger.priscilla@example.org', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'vcgjQW04mM', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(148, 'Brandt Reilly', 3, 'internal', 'qoconner@example.org', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'Cdq1T8miaI', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(149, 'Angelita Mertz', 1, 'client', 'shayne.swift@example.org', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'mpUAwyxmv5', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(150, 'Joseph Hintz', 3, 'internal', 'udibbert@example.org', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'SbksaiEyFK', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(151, 'Amalia Rippin', 2, 'client', 'grady.allene@example.com', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', '0SqP6i6xDL', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(152, 'Dannie Franecki I', 3, 'internal', 'gmurray@example.org', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'MOk97fWr3F', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(153, 'Josiah Lang', 1, 'internal', 'johann.wisoky@example.net', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'UZHeET0afs', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(154, 'Mya Rosenbaum', 1, 'internal', 'alessia.little@example.com', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', '8afSNj7wxi', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(155, 'Kamren Jerde', 5, 'client', 'electa.glover@example.net', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', '4r4PNweBwf', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(156, 'Jaqueline Becker', 1, 'internal', 'xwehner@example.com', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'jP47Hy13Jo', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(157, 'Mallory McKenzie', 1, 'internal', 'xmills@example.com', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'v6ujH6CXPK', '2024-12-18 05:34:52', '2024-12-18 05:34:52'),
(158, 'Missouri Pfannerstill', 2, 'internal', 'anastasia56@example.net', '2024-12-18 05:34:52', '$2y$12$ggyLRMduw6VSjBc1Z6KPiOAJt3HztLXC/n.j73W9PVia3fK378uAe', 'JfDFW32vh1', '2024-12-18 05:34:52', '2024-12-18 05:34:52');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 5, '2024-12-16 09:18:57', '2024-12-16 09:18:57'),
(2, 2, 5, '2024-12-16 09:20:16', '2024-12-16 09:20:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_permission_role_id_foreign` (`role_id`),
  ADD KEY `role_permission_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_role_user_id_foreign` (`user_id`),
  ADD KEY `user_role_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `role_permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permission_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_role_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
