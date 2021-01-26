# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: freedb.tech (MySQL 5.7.32-0ubuntu0.18.04.1)
# Database: freedbtech_saitonglassesdb
# Generation Time: 2021-01-26 12:49:05 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table banners
# ------------------------------------------------------------

DROP TABLE IF EXISTS `banners`;

CREATE TABLE `banners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `banners_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'แว่นสายตาคุณภาพ','lorem-ipsum-is','/storage/photos/1/1.jpg','<font color=\"#636363\"><b>ซื้อวันนี้รับส่วนลด 10%</b></font>','active','2020-08-14 08:47:38','2021-01-10 09:52:48'),
	(2,'แว่นสายตาคุณภาพ','lorem-ipsum','/storage/photos/1/2.jpg','<p><span style=\"font-weight: bolder; color: rgb(99, 99, 99);\">ซื้อวันนี้รับส่วนลด 90%</span><br></p>','active','2020-08-14 08:50:23','2021-01-10 09:53:07'),
	(4,'แว่นสายตาคุณภาพ','banner','/storage/photos/1/3.jpeg','<font color=\"#9c00ff\"><b>ซื้อวันนี้ลด 50%</b></font>','active','2020-08-18 03:46:59','2021-01-10 09:53:19');

/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table brands
# ------------------------------------------------------------

DROP TABLE IF EXISTS `brands`;

CREATE TABLE `brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`)
VALUES
	(7,'Ray-Ban','ray-ban','active','2021-01-10 10:09:24','2021-01-10 10:09:24'),
	(8,'Oakley','oakley','active','2021-01-10 10:09:35','2021-01-10 10:09:35'),
	(9,'GUCCI','gucci','active','2021-01-10 10:09:44','2021-01-10 10:09:44'),
	(10,'Burberry','burberry','active','2021-01-10 10:09:55','2021-01-10 10:09:55'),
	(11,'Michael Kors','michael-kors','active','2021-01-10 10:10:03','2021-01-10 10:10:03'),
	(12,'Coach','coach','active','2021-01-10 10:10:11','2021-01-10 10:10:11'),
	(13,'Prada','prada','active','2021-01-10 10:10:20','2021-01-10 10:10:20'),
	(14,'Vogue','vogue','active','2021-01-10 10:10:28','2021-01-10 10:10:28');

/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table carts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `carts`;

CREATE TABLE `carts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_product_id_foreign` (`product_id`),
  KEY `carts_user_id_foreign` (`user_id`),
  KEY `carts_order_id_foreign` (`order_id`),
  CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`)
VALUES
	(13,11,8,30,8055.00,'new',2,17005.00,'2021-01-10 11:20:56','2021-01-20 16:00:28'),
	(14,11,7,31,8055.00,'new',1,8055.00,'2021-01-18 15:10:07','2021-01-18 15:33:19'),
	(15,11,NULL,31,8055.00,'new',1,8950.00,'2021-01-18 15:51:22','2021-01-18 15:51:22'),
	(16,12,9,30,5600.00,'new',1,5600.00,'2021-01-20 16:01:10','2021-01-20 16:01:25'),
	(17,12,10,30,5600.00,'new',1,5600.00,'2021-01-20 16:03:14','2021-01-20 16:03:38'),
	(18,12,11,30,5600.00,'new',1,5600.00,'2021-01-20 16:05:19','2021-01-20 16:05:38');

/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `added_by` bigint(20) unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  KEY `categories_added_by_foreign` (`added_by`),
  CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`)
VALUES
	(12,'แว่นตาสำหรับผู้ชาย','','<p>แว่นตาสำหรับผู้ชาย</p>','/storage/photos/1/แว่นกันแดดผู้ชาย.jpg',1,NULL,NULL,'active','2021-01-10 10:01:48','2021-01-18 15:42:36'),
	(13,'แว่นสำหรับผู้หญิง','-2101100448-264','<p>แว่นตาสำหรับผู้หญิง</p>','/storage/photos/1/11-2.jpg',1,NULL,NULL,'active','2021-01-10 10:04:48','2021-01-10 10:04:48'),
	(14,'แว่นตาสำหรับเด็ก','-2101100625-673','<p>แว่นตาสำหรับเด็ก<br></p>','/storage/photos/1/แว่นตากันแดดเด็ก.jpg',1,NULL,NULL,'active','2021-01-10 10:06:25','2021-01-10 10:06:25');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table coupons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `coupons`;

CREATE TABLE `coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupons_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'abc123','fixed',300.00,'active',NULL,NULL),
	(2,'111111','percent',10.00,'active',NULL,NULL),
	(5,'abcd','fixed',250.00,'active','2020-08-18 03:54:58','2020-08-18 03:54:58');

/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`)
VALUES
	(1,'Prajwal Rai','About price','prajwal.iar@gmail.com',NULL,'9807009999','Hello sir i am from kathmandu nepal.','2020-08-14 15:25:46','2020-08-14 15:00:01','2020-08-14 15:25:46'),
	(2,'Prajwal Rai','About Price','prajwal.iar@gmail.com',NULL,'9800099000','Hello i am Prajwal Rai','2020-08-18 10:04:15','2020-08-15 14:52:39','2020-08-18 10:04:16'),
	(3,'Prajwal Rai','lorem ipsum','prajwal.iar@gmail.com',NULL,'1200990009','hello sir sdfdfd dfdjf ;dfjd fd ldkfd',NULL,'2020-08-18 04:15:12','2020-08-18 04:15:12'),
	(4,'Discount for member','reward points','beeze001@gmail.com',NULL,'0827623720','dsadasdsasdfsaf dsfdsfsdfsdfsdf',NULL,'2021-01-20 15:50:59','2021-01-20 15:50:59');

/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2019_08_19_000000_create_failed_jobs_table',1),
	(4,'2020_07_10_021010_create_brands_table',1),
	(5,'2020_07_10_025334_create_banners_table',1),
	(6,'2020_07_10_112147_create_categories_table',1),
	(7,'2020_07_11_063857_create_products_table',1),
	(8,'2020_07_12_073132_create_post_categories_table',1),
	(9,'2020_07_12_073701_create_post_tags_table',1),
	(10,'2020_07_12_083638_create_posts_table',1),
	(11,'2020_07_13_151329_create_messages_table',1),
	(12,'2020_07_14_023748_create_shippings_table',1),
	(13,'2020_07_15_054356_create_orders_table',1),
	(14,'2020_07_15_102626_create_carts_table',1),
	(15,'2020_07_16_041623_create_notifications_table',1),
	(16,'2020_07_16_053240_create_coupons_table',1),
	(17,'2020_07_23_143757_create_wishlists_table',1),
	(18,'2020_07_24_074930_create_product_reviews_table',1),
	(19,'2020_07_24_131727_create_post_comments_table',1),
	(20,'2020_08_01_143408_create_settings_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table notifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`)
VALUES
	('146423ac-1138-4b25-985b-5321ec436a38','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}',NULL,'2021-01-10 09:24:18','2021-01-10 09:24:18'),
	('2145a8e3-687d-444a-8873-b3b2fb77a342','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}',NULL,'2020-08-15 14:31:21','2020-08-15 14:31:21'),
	('3af39f84-cab4-4152-9202-d448435c67de','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}',NULL,'2020-08-15 14:54:52','2020-08-15 14:54:52'),
	('4a0afdb0-71ad-4ce6-bc70-c92ef491a525','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}',NULL,'2020-08-18 04:13:51','2020-08-18 04:13:51'),
	('540ca3e9-0ff9-4e2e-9db3-6b5abc823422','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}','2020-08-15 14:30:44','2020-08-14 14:12:28','2020-08-15 14:30:44'),
	('5da09dd1-3ffc-43b0-aba2-a4260ba4cc76','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage\",\"fas\":\"fas fa-comment\"}',NULL,'2020-08-15 14:51:02','2020-08-15 14:51:02'),
	('5e6089fa-24b1-4a83-8473-4269bbcb6295','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/9\",\"fas\":\"fa-file-alt\"}',NULL,'2021-01-20 16:01:25','2021-01-20 16:01:25'),
	('5e91e603-024e-45c5-b22f-36931fef0d90','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/white-sports-casual-t\",\"fas\":\"fa-star\"}',NULL,'2020-08-15 14:44:07','2020-08-15 14:44:07'),
	('73a3b51a-416a-4e7d-8ca2-53b216d9ad8e','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}',NULL,'2020-08-14 14:11:03','2020-08-14 14:11:03'),
	('8605db5d-1462-496e-8b5f-8b923d88912c','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}',NULL,'2020-08-14 14:20:44','2020-08-14 14:20:44'),
	('984a9ef4-d5b2-4e55-800f-938f0bb6a9ed','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/11\",\"fas\":\"fa-file-alt\"}',NULL,'2021-01-20 16:05:38','2021-01-20 16:05:38'),
	('a3df6b27-d6a7-48dc-9cc3-cfba285ec2ce','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/10\",\"fas\":\"fa-file-alt\"}',NULL,'2021-01-20 16:03:38','2021-01-20 16:03:38'),
	('a6ec5643-748c-4128-92e2-9a9f293f53b5','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}',NULL,'2020-08-18 04:17:03','2020-08-18 04:17:03'),
	('b186a883-42f2-4a05-8fc5-f0d3e10309ff','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}','2020-08-15 11:17:24','2020-08-15 05:14:55','2020-08-15 11:17:24'),
	('d2fd7c33-b0fe-47d6-8bc6-f377d404080d','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}',NULL,'2020-08-14 14:08:50','2020-08-14 14:08:50'),
	('d682b865-04d9-4e21-ba79-b0638f4a126a','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/7\",\"fas\":\"fa-file-alt\"}',NULL,'2021-01-18 15:33:19','2021-01-18 15:33:19'),
	('dff78b90-85c8-42ee-a5b1-de8ad0b21be4','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}',NULL,'2020-08-15 13:40:54','2020-08-15 13:40:54'),
	('e28b0a73-4819-4016-b915-0e525d4148f5','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fa-star\"}',NULL,'2020-08-18 04:08:16','2020-08-18 04:08:16'),
	('e47f728d-5b5d-41a5-a1c8-3692583360a4','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/8\",\"fas\":\"fa-file-alt\"}',NULL,'2021-01-20 16:00:28','2021-01-20 16:00:28'),
	('ffffa177-c54e-4dfe-ba43-27c466ff1f4b','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}',NULL,'2020-08-18 04:13:29','2020-08-18 04:13:29');

/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint(20) unsigned DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_number_unique` (`order_number`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_shipping_id_foreign` (`shipping_id`),
  CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`)
VALUES
	(1,'ORD-PMIQF5MYPK',3,14399.00,1,573.90,13925.10,6,'cod','unpaid','delivered','Prajwal','Rai','prajwal.iar@gmail.com','9800887778','NP','44600','Koteshwor','Kathmandu','2020-08-14 14:20:44','2020-08-14 16:37:37'),
	(2,'ORD-YFF8BF0YBK',2,1939.03,1,NULL,2039.03,1,'cod','unpaid','delivered','Sandhya','Rai','user@gmail.com','90000000990','NP',NULL,'Lalitpur',NULL,'2020-08-15 05:14:49','2020-08-15 05:15:19'),
	(3,'ORD-1CKWRWTTIK',3,200.00,1,NULL,300.00,1,'paypal','paid','process','Prajwal','Rai','prajwal.iar@gmail.com','9807009999','NP','44600','Kathmandu','Kadaghari','2020-08-15 13:40:49','2020-08-18 03:52:40'),
	(4,'ORD-HVO0KX0YHW',3,23660.00,3,150.00,23910.00,6,'paypal','paid','new','Prajwal','Rai','prajwal.iar@gmail.com','9800098878','NP','44600','Pokhara',NULL,'2020-08-15 14:54:52','2020-08-15 14:54:52'),
	(6,'ORD-UKFEINMG93',30,300.00,NULL,NULL,300.00,1,'cod','unpaid','delivered','fsdf','dsfdsf','beeze001@gmail.com','0827623720','TH','50000','80/11 watgate soi 1 road',NULL,'2021-01-10 09:24:18','2021-01-10 09:26:41'),
	(7,'ORD-ZZCCVZWIJR',31,8055.00,NULL,NULL,8055.00,1,'cod','unpaid','process','Supavadee','Jaichumjai','beeze001@gmail.com','0827623720','TH','50000','80/11 watgate soi 1 road',NULL,'2021-01-18 15:33:19','2021-01-18 15:34:35'),
	(8,'ORD-J4OOWFDAUT',30,17005.00,4,NULL,17055.00,2,'cod','unpaid','new','thanapon','prunktan','beeze001@gmail.com','0827623720','TH','50000','80/11 watgate soi 1 road',NULL,'2021-01-20 16:00:28','2021-01-20 16:00:28'),
	(9,'ORD-Q8V8QCIOTB',30,5600.00,NULL,NULL,5600.00,1,'cod','unpaid','new','thanapon','prunktan','beeze001@gmail.com','0827623720','TH','50000','80/11 watgate soi 1 road',NULL,'2021-01-20 16:01:25','2021-01-20 16:01:25'),
	(10,'ORD-WRXR9WA6WQ',30,5600.00,2,NULL,5900.00,1,'cod','unpaid','new','thanapon','prunktan','beeze001@gmail.com','0827623720','TH','50000','80/11 watgate soi 1 road',NULL,'2021-01-20 16:03:38','2021-01-20 16:03:38'),
	(11,'ORD-8LXYBVI2XS',30,5600.00,4,NULL,5650.00,1,'cod','unpaid','new','thanapon','prunktan','beeze001@gmail.com','0827623720','TH','50000','80/11 watgate soi 1 road',NULL,'2021-01-20 16:05:38','2021-01-20 16:05:38');

/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table post_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_categories`;

CREATE TABLE `post_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_categories_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'Travel','contrary','active','2020-08-14 08:51:03','2020-08-14 08:51:39'),
	(2,'Electronics','richard','active','2020-08-14 08:51:22','2020-08-14 08:52:00'),
	(3,'Cloths','cloths','active','2020-08-14 08:52:22','2020-08-14 08:52:22'),
	(4,'enjoy','enjoy','active','2020-08-14 10:16:10','2020-08-14 10:16:10'),
	(5,'Post Category','post-category','active','2020-08-15 13:59:04','2020-08-15 13:59:04');

/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table post_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_comments`;

CREATE TABLE `post_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_comments_user_id_foreign` (`user_id`),
  KEY `post_comments_post_id_foreign` (`post_id`),
  CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `post_comments` WRITE;
/*!40000 ALTER TABLE `post_comments` DISABLE KEYS */;

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`)
VALUES
	(1,1,2,'Testing comment edited','active',NULL,NULL,'2020-08-14 14:08:42','2020-08-15 13:59:58'),
	(2,3,2,'testing 2','active',NULL,1,'2020-08-14 14:11:03','2020-08-14 14:11:03'),
	(3,2,2,'That\'s cool','active',NULL,2,'2020-08-14 14:12:27','2020-08-14 14:12:27'),
	(4,1,2,'nice','active',NULL,NULL,'2020-08-15 14:31:19','2020-08-15 14:31:19'),
	(5,3,5,'nice blog','active',NULL,NULL,'2020-08-15 14:51:01','2020-08-15 14:51:01'),
	(6,2,3,'nice','active',NULL,NULL,'2020-08-18 04:13:29','2020-08-18 04:13:29'),
	(7,2,3,'really','active',NULL,6,'2020-08-18 04:13:51','2020-08-18 04:13:51');

/*!40000 ALTER TABLE `post_comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table post_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_tags`;

CREATE TABLE `post_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_tags_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'Enjoy','enjoy','active','2020-08-14 08:53:52','2020-08-14 08:53:52'),
	(2,'2020','2020','active','2020-08-14 08:54:09','2020-08-14 08:54:09'),
	(3,'Visit nepal 2020','visit-nepal-2020','active','2020-08-14 08:54:33','2020-08-14 08:54:33'),
	(4,'Tag','tag','active','2020-08-15 13:59:31','2020-08-15 13:59:31');

/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `quote` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint(20) unsigned DEFAULT NULL,
  `post_tag_id` bigint(20) unsigned DEFAULT NULL,
  `added_by` bigint(20) unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  KEY `posts_added_by_foreign` (`added_by`),
  CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'Where does it come from?','where-does-it-come-from','<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Contrary to popular belief, Lorem Ipsum is not simply random text.&nbsp;</span><br></p>','<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>','<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.</span><br></p>','/storage/photos/1/Blog/blog1.jpg','2020,Visit nepal 2020',1,NULL,2,'active','2020-08-14 08:55:55','2020-08-14 11:29:56'),
	(2,'Where can I get some?','where-can-i-get-some','<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\"><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">It is a long established fact that a reader</span><br></h2>','<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain;\">Why do we use it?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain;\">Why do we use it?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>',NULL,'/storage/photos/1/Blog/blog2.jpg','Enjoy',2,NULL,1,'active','2020-08-14 08:58:52','2020-08-14 14:08:14'),
	(3,'The standard Lorem Ipsum passage, used since the 1500s','the-standard-lorem-ipsum-passage-used-since-the-1500s','<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit,</span><br></p>','<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>',NULL,'/storage/photos/1/Blog/blog3.jpg','',3,NULL,3,'active','2020-08-14 09:59:33','2020-08-14 11:29:44'),
	(5,'The standard Lorem Ipsum passage,','the-standard-lorem-ipsum-passage','<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,</span><br></p>','<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">The standard Lorem Ipsum passage, used since the 1500s</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>','<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,</span><br></p>','/storage/photos/1/Blog/blog2.jpg',',Enjoy,2020,Visit nepal 2020',1,NULL,1,'active','2020-08-15 13:58:45','2020-08-15 13:58:45'),
	(6,'Lorem Ipsum is simply','lorem-ipsum-is-simply','<p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry.</span><br></p>','<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><hr><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p>',NULL,'/storage/photos/1/Blog/blog3.jpg','Enjoy,2020',2,NULL,1,'active','2020-08-18 03:54:19','2020-08-18 03:54:19');

/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_reviews
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_reviews`;

CREATE TABLE `product_reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT '0',
  `review` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_reviews_user_id_foreign` (`user_id`),
  KEY `product_reviews_product_id_foreign` (`product_id`),
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `product_reviews` WRITE;
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`)
VALUES
	(1,3,NULL,5,'nice product','active','2020-08-15 14:44:05','2020-08-15 14:44:05'),
	(2,2,NULL,5,'nice','active','2020-08-18 04:08:14','2020-08-18 04:18:31');

/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT '1',
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) unsigned DEFAULT NULL,
  `child_cat_id` bigint(20) unsigned DEFAULT NULL,
  `brand_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_brand_id_foreign` (`brand_id`),
  KEY `products_cat_id_foreign` (`cat_id`),
  KEY `products_child_cat_id_foreign` (`child_cat_id`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`)
VALUES
	(11,'RAY-BAN รุ่น AVIATOR RB3025','ray-ban-aviator-rb3025','<p><span style=\"color: rgb(51, 51, 51); font-family: Gotham, sukhumvit_tadmaitext, sans-serif; font-size: 18px;\">แว่นกันแดด RAY-BAN รุ่น AVIATOR RB3025 เลนส์โพลาไรซ์สีฟ้าไล่เฉด</span><br></p>','<p><span style=\"color: rgb(51, 51, 51); font-family: Gotham, sukhumvit_tadmaitext, sans-serif; font-size: 18px;\">แว่นกันแดด RAY-BAN รุ่น AVIATOR RB3025 เลนส์โพลาไรซ์สีฟ้าไล่เฉด</span><br></p>','/storage/photos/1/product1/2971daff522f7b32c628ee1a0f65fb81acec6dc9_7a4d647e8bf74d5d960aaeddfefd46b9dummy_2-removebg-preview.png',10,'','new','active',8950.00,10.00,1,12,NULL,7,'2021-01-10 11:10:30','2021-01-10 11:11:37'),
	(12,'RAYBAN แว่นตา รุ่น 0RX1971V-2501','rayban-0rx1971v-2501','<h1 style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.4rem; margin-left: 0px; font-family: Mitr, sans-serif; line-height: 1.3; color: rgb(10, 10, 10); font-size: 1.6em;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">RAYBAN แว่นตา รุ่น 0RX1971V-2501 54</span></h1><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Rayban สี GOLD</span><br style=\"box-sizing: inherit;\">FRONT COLOR FAMILY: gold<br style=\"box-sizing: inherit;\">LENSES COLOR: demo lens</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\">CATEGORY: Optical<br style=\"box-sizing: inherit;\">GENDER: Woman<br style=\"box-sizing: inherit;\">SHAPE: Square<br style=\"box-sizing: inherit;\">FRONT MATERIAL: Metal<br style=\"box-sizing: inherit;\">TEMPLE:<br style=\"box-sizing: inherit;\">BRIDGE DESIGN:<br style=\"box-sizing: inherit;\">GEOFIT: GLOBAL<br style=\"box-sizing: inherit;\">BASE: Base 6<br style=\"box-sizing: inherit;\">RX-ABLE:</p>','<h1 style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.4rem; margin-left: 0px; font-family: Mitr, sans-serif; line-height: 1.3; color: rgb(10, 10, 10); font-size: 1.6em;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">RAYBAN แว่นตา รุ่น 0RX1971V-2501 54</span></h1><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Rayban สี GOLD</span><br style=\"box-sizing: inherit;\">FRONT COLOR FAMILY: gold<br style=\"box-sizing: inherit;\">LENSES COLOR: demo lens</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\">CATEGORY: Optical<br style=\"box-sizing: inherit;\">GENDER: Woman<br style=\"box-sizing: inherit;\">SHAPE: Square<br style=\"box-sizing: inherit;\">FRONT MATERIAL: Metal<br style=\"box-sizing: inherit;\">TEMPLE:<br style=\"box-sizing: inherit;\">BRIDGE DESIGN:<br style=\"box-sizing: inherit;\">GEOFIT: GLOBAL<br style=\"box-sizing: inherit;\">BASE: Base 6<br style=\"box-sizing: inherit;\">RX-ABLE:</p>','/storage/photos/1/0RX1971V-2501-1-1-removebg-preview.png',10,'','default','active',5600.00,0.00,1,12,NULL,7,'2021-01-18 16:03:33','2021-01-18 16:03:33'),
	(13,'RAYBAN แว่นตา รุ่น 0RX5315D 2000','rayban-0rx5315d-2000','<h1 style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.4rem; margin-left: 0px; font-family: Mitr, sans-serif; line-height: 1.3; color: rgb(10, 10, 10); font-size: 1.6em;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">RAYBAN แว่นตา รุ่น 0RX5315D 2000</span></h1><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\"><span style=\"box-sizing: inherit; font-size: 16px;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">rayban</span></span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\">SHINY BLACK<br style=\"box-sizing: inherit;\">FRONT COLOR FAMILY: black<br style=\"box-sizing: inherit;\">LENSES COLOR: demo lens</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\">CATEGORY: Optical<br style=\"box-sizing: inherit;\">GENDER: Unisex<br style=\"box-sizing: inherit;\">SHAPE: Square<br style=\"box-sizing: inherit;\">FRONT MATERIAL: Plastic<br style=\"box-sizing: inherit;\">TEMPLE: Plastic<br style=\"box-sizing: inherit;\">BRIDGE DESIGN: Standard<br style=\"box-sizing: inherit;\">GEOFIT: ASIAN<br style=\"box-sizing: inherit;\">BASE: Base 4<br style=\"box-sizing: inherit;\">RX-ABLE:</p>','<h1 style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.4rem; margin-left: 0px; font-family: Mitr, sans-serif; line-height: 1.3; color: rgb(10, 10, 10); font-size: 1.6em;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">RAYBAN แว่นตา รุ่น 0RX5315D 2000</span></h1><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\"><span style=\"box-sizing: inherit; font-size: 16px;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">rayban</span></span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\">SHINY BLACK<br style=\"box-sizing: inherit;\">FRONT COLOR FAMILY: black<br style=\"box-sizing: inherit;\">LENSES COLOR: demo lens</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\">CATEGORY: Optical<br style=\"box-sizing: inherit;\">GENDER: Unisex<br style=\"box-sizing: inherit;\">SHAPE: Square<br style=\"box-sizing: inherit;\">FRONT MATERIAL: Plastic<br style=\"box-sizing: inherit;\">TEMPLE: Plastic<br style=\"box-sizing: inherit;\">BRIDGE DESIGN: Standard<br style=\"box-sizing: inherit;\">GEOFIT: ASIAN<br style=\"box-sizing: inherit;\">BASE: Base 4<br style=\"box-sizing: inherit;\">RX-ABLE:</p>','/storage/photos/1/0RX5315D-2000-2-removebg-preview.png',10,'','new','active',3338.00,0.00,1,13,NULL,7,'2021-01-18 16:04:21','2021-01-18 16:04:21'),
	(14,'RAYBAN แว่นตา รุ่น 0RX5349D 2000','rayban-0rx5349d-2000','<h1 style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.4rem; margin-left: 0px; font-family: Mitr, sans-serif; line-height: 1.3; color: rgb(10, 10, 10); font-size: 1.6em;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">RAYBAN แว่นตา รุ่น 0RX5349D 2000</span></h1><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Rayban สี SHINY BLACK</span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\">FRONT COLOR FAMILY: black<br style=\"box-sizing: inherit;\">LENSES COLOR: demo lens</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\">CATEGORY: Optical<br style=\"box-sizing: inherit;\">GENDER: Unisex<br style=\"box-sizing: inherit;\">SHAPE: Square<br style=\"box-sizing: inherit;\">FRONT MATERIAL: Plastic<br style=\"box-sizing: inherit;\">TEMPLE: Metal<br style=\"box-sizing: inherit;\">BRIDGE DESIGN: Key bridge (high)<br style=\"box-sizing: inherit;\">GEOFIT: ASIAN<br style=\"box-sizing: inherit;\">BASE: Base 4<br style=\"box-sizing: inherit;\">RX-ABLE:</p>','<h1 style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.4rem; margin-left: 0px; font-family: Mitr, sans-serif; line-height: 1.3; color: rgb(10, 10, 10); font-size: 1.6em;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">RAYBAN แว่นตา รุ่น 0RX5349D 2000</span></h1><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Rayban สี SHINY BLACK</span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\">FRONT COLOR FAMILY: black<br style=\"box-sizing: inherit;\">LENSES COLOR: demo lens</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\">CATEGORY: Optical<br style=\"box-sizing: inherit;\">GENDER: Unisex<br style=\"box-sizing: inherit;\">SHAPE: Square<br style=\"box-sizing: inherit;\">FRONT MATERIAL: Plastic<br style=\"box-sizing: inherit;\">TEMPLE: Metal<br style=\"box-sizing: inherit;\">BRIDGE DESIGN: Key bridge (high)<br style=\"box-sizing: inherit;\">GEOFIT: ASIAN<br style=\"box-sizing: inherit;\">BASE: Base 4<br style=\"box-sizing: inherit;\">RX-ABLE:</p>','/storage/photos/1/0RX5349D-2000-1-removebg-preview.png',10,'','hot','active',4250.00,50.00,1,14,NULL,7,'2021-01-18 16:05:29','2021-01-18 16:05:29'),
	(15,'RAYBAN แว่นตา รุ่น 0RX7082D 2012','rayban-0rx7082d-2012','<h1 style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.4rem; margin-left: 0px; font-family: Mitr, sans-serif; line-height: 1.3; color: rgb(10, 10, 10); font-size: 1.6em;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">RAYBAN แว่นตา รุ่น 0RX7082D 2012 Size 54</span></h1><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Rayban สี HAVANA</span><br style=\"box-sizing: inherit;\">FRONT COLOR FAMILY: havana<br style=\"box-sizing: inherit;\">LENSES COLOR: demo lens</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\">CATEGORY: Optical<br style=\"box-sizing: inherit;\">GENDER: Unisex<br style=\"box-sizing: inherit;\">SHAPE: Pillow<br style=\"box-sizing: inherit;\">FRONT MATERIAL: Plastic<br style=\"box-sizing: inherit;\">TEMPLE: Plastic<br style=\"box-sizing: inherit;\">BRIDGE DESIGN: Standard<br style=\"box-sizing: inherit;\">GEOFIT: ASIAN<br style=\"box-sizing: inherit;\">BASE: Base 4<br style=\"box-sizing: inherit;\">RX-ABLE:</p>','<h1 style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.4rem; margin-left: 0px; font-family: Mitr, sans-serif; line-height: 1.3; color: rgb(10, 10, 10); font-size: 1.6em;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">RAYBAN แว่นตา รุ่น 0RX7082D 2012 Size 54</span></h1><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Rayban สี HAVANA</span><br style=\"box-sizing: inherit;\">FRONT COLOR FAMILY: havana<br style=\"box-sizing: inherit;\">LENSES COLOR: demo lens</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\">CATEGORY: Optical<br style=\"box-sizing: inherit;\">GENDER: Unisex<br style=\"box-sizing: inherit;\">SHAPE: Pillow<br style=\"box-sizing: inherit;\">FRONT MATERIAL: Plastic<br style=\"box-sizing: inherit;\">TEMPLE: Plastic<br style=\"box-sizing: inherit;\">BRIDGE DESIGN: Standard<br style=\"box-sizing: inherit;\">GEOFIT: ASIAN<br style=\"box-sizing: inherit;\">BASE: Base 4<br style=\"box-sizing: inherit;\">RX-ABLE:</p>','/storage/photos/1/0RX7149D-2000-1-1-removebg-preview.png',10,'','new','active',3350.00,10.00,1,12,NULL,7,'2021-01-18 16:06:19','2021-01-18 16:06:28'),
	(16,'RAYBAN แว่นตา รุ่น 0RX7149D-2000','rayban-0rx7149d-2000','<h1 style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.4rem; margin-left: 0px; font-family: Mitr, sans-serif; line-height: 1.3; color: rgb(10, 10, 10); font-size: 1.6em;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">RAYBAN&nbsp;</span><span style=\"box-sizing: inherit; font-weight: bolder;\">แว่นตา&nbsp;</span><span style=\"box-sizing: inherit; font-weight: bolder;\">รุ่น 0RX7149D-2000 55</span></h1><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Rayban สี BLACK</span><br style=\"box-sizing: inherit;\">FRONT COLOR FAMILY: black<br style=\"box-sizing: inherit;\">LENSES COLOR: demo lens</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\">CATEGORY: Optical<br style=\"box-sizing: inherit;\">GENDER: Unisex<br style=\"box-sizing: inherit;\">SHAPE: Pillow<br style=\"box-sizing: inherit;\">FRONT MATERIAL: Plastic<br style=\"box-sizing: inherit;\">TEMPLE: Plastic<br style=\"box-sizing: inherit;\">BRIDGE DESIGN: Key bridge (high)<br style=\"box-sizing: inherit;\">GEOFIT: ASIAN<br style=\"box-sizing: inherit;\">BASE: Base 4<br style=\"box-sizing: inherit;\">RX-ABLE:</p>','<h1 style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.4rem; margin-left: 0px; font-family: Mitr, sans-serif; line-height: 1.3; color: rgb(10, 10, 10); font-size: 1.6em;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">RAYBAN&nbsp;</span><span style=\"box-sizing: inherit; font-weight: bolder;\">แว่นตา&nbsp;</span><span style=\"box-sizing: inherit; font-weight: bolder;\">รุ่น 0RX7149D-2000 55</span></h1><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Rayban สี BLACK</span><br style=\"box-sizing: inherit;\">FRONT COLOR FAMILY: black<br style=\"box-sizing: inherit;\">LENSES COLOR: demo lens</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\">CATEGORY: Optical<br style=\"box-sizing: inherit;\">GENDER: Unisex<br style=\"box-sizing: inherit;\">SHAPE: Pillow<br style=\"box-sizing: inherit;\">FRONT MATERIAL: Plastic<br style=\"box-sizing: inherit;\">TEMPLE: Plastic<br style=\"box-sizing: inherit;\">BRIDGE DESIGN: Key bridge (high)<br style=\"box-sizing: inherit;\">GEOFIT: ASIAN<br style=\"box-sizing: inherit;\">BASE: Base 4<br style=\"box-sizing: inherit;\">RX-ABLE:</p>','/storage/photos/1/RX7082D-2012-1-e1581320388731-removebg-preview.png',10,'','default','active',3350.00,20.00,1,13,NULL,7,'2021-01-18 16:07:20','2021-01-18 16:07:20'),
	(17,'OAKLEY แว่นกันแดด 0OO9379 HOLBROOK R','oakley-0oo9379-holbrook-r','<h1 style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.4rem; margin-left: 0px; font-family: Mitr, sans-serif; line-height: 1.3; color: rgb(10, 10, 10); font-size: 1.6em;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">กรอบแว่น&nbsp;OAKLEY&nbsp;0OO9379 HOLBROOK R</span></h1><div class=\"info-product\" style=\"box-sizing: inherit; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\"><p class=\"model-name\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px;\"><span style=\"box-sizing: inherit; font-size: 20px;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">แว่นกันแดด OAKLEY สี MATTE BLACK</span></span></p><p class=\"model-name\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px;\">FRONT COLOR FAMILY: black<br style=\"box-sizing: inherit;\">LENSES MATERIAL: plastic<br style=\"box-sizing: inherit;\">LENSES PROPERTIES: standard<br style=\"box-sizing: inherit;\">LENSES COLOR: prizm ruby<br style=\"box-sizing: inherit;\">INFORMATION NOTE 3n<br style=\"box-sizing: inherit;\">% TRANSMISSION LENS 17<br style=\"box-sizing: inherit;\">CATEGORY: Sun<br style=\"box-sizing: inherit;\">GENDER: Man<br style=\"box-sizing: inherit;\">SHAPE: Square<br style=\"box-sizing: inherit;\">FRONT MATERIAL: Plastic<br style=\"box-sizing: inherit;\">TEMPLE: Plastic<br style=\"box-sizing: inherit;\">BRIDGE DESIGN: Key bridge (high)<br style=\"box-sizing: inherit;\">GEOFIT: ASIAN<br style=\"box-sizing: inherit;\">BASE: Base 6<br style=\"box-sizing: inherit;\">RX-ABLE: Yes</p></div>','<h1 style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.4rem; margin-left: 0px; font-family: Mitr, sans-serif; line-height: 1.3; color: rgb(10, 10, 10); font-size: 1.6em;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">กรอบแว่น&nbsp;OAKLEY&nbsp;0OO9379 HOLBROOK R</span></h1><div class=\"info-product\" style=\"box-sizing: inherit; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\"><p class=\"model-name\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px;\"><span style=\"box-sizing: inherit; font-size: 20px;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">แว่นกันแดด OAKLEY สี MATTE BLACK</span></span></p><p class=\"model-name\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px;\">FRONT COLOR FAMILY: black<br style=\"box-sizing: inherit;\">LENSES MATERIAL: plastic<br style=\"box-sizing: inherit;\">LENSES PROPERTIES: standard<br style=\"box-sizing: inherit;\">LENSES COLOR: prizm ruby<br style=\"box-sizing: inherit;\">INFORMATION NOTE 3n<br style=\"box-sizing: inherit;\">% TRANSMISSION LENS 17<br style=\"box-sizing: inherit;\">CATEGORY: Sun<br style=\"box-sizing: inherit;\">GENDER: Man<br style=\"box-sizing: inherit;\">SHAPE: Square<br style=\"box-sizing: inherit;\">FRONT MATERIAL: Plastic<br style=\"box-sizing: inherit;\">TEMPLE: Plastic<br style=\"box-sizing: inherit;\">BRIDGE DESIGN: Key bridge (high)<br style=\"box-sizing: inherit;\">GEOFIT: ASIAN<br style=\"box-sizing: inherit;\">BASE: Base 6<br style=\"box-sizing: inherit;\">RX-ABLE: Yes</p></div>','/storage/photos/1/0OO9379-937903-1-removebg-preview.png',5,'','hot','active',6900.00,5.00,1,12,NULL,8,'2021-01-18 16:11:43','2021-01-18 16:11:43'),
	(18,'OAKLEY แว่นกันแดด 0OO9391 CROSSRANGE','oakley-0oo9391-crossrange','<h1 style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.4rem; margin-left: 0px; line-height: 1.3; color: inherit; font-size: 1.6em; font-family: Mitr, sans-serif !important;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">กรอบแว่น&nbsp;OAKLEY&nbsp;0OO9391 CROSSRANGE</span></h1><div class=\"info-product\" style=\"box-sizing: inherit;\"><p class=\"model-name\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\"><span style=\"box-sizing: inherit; font-size: 20px;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">แว่นกันแดด OAKLEY สี MATTE BLACK</span></span></p><p class=\"model-name\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\">FRONT COLOR FAMILY: black<br style=\"box-sizing: inherit;\">LENSES MATERIAL: plastic<br style=\"box-sizing: inherit;\">LENSES PROPERTIES: standard<br style=\"box-sizing: inherit;\">LENSES COLOR: prizm black<br style=\"box-sizing: inherit;\">INFORMATION NOTE 3n<br style=\"box-sizing: inherit;\">% TRANSMISSION LENS 13<br style=\"box-sizing: inherit;\">CATEGORY: Sun<br style=\"box-sizing: inherit;\">GENDER: Man<br style=\"box-sizing: inherit;\">SHAPE: Rectangle<br style=\"box-sizing: inherit;\">FRONT MATERIAL: Plastic<br style=\"box-sizing: inherit;\">TEMPLE: Plastic<br style=\"box-sizing: inherit;\">BRIDGE DESIGN: Standard<br style=\"box-sizing: inherit;\">GEOFIT: ASIAN<br style=\"box-sizing: inherit;\">BASE: 4X2TOR<br style=\"box-sizing: inherit;\">RX-ABLE: Yes</p><div><br></div></div>','<h1 style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.4rem; margin-left: 0px; line-height: 1.3; color: inherit; font-size: 1.6em; font-family: Mitr, sans-serif !important;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">กรอบแว่น&nbsp;OAKLEY&nbsp;0OO9391 CROSSRANGE</span></h1><div class=\"info-product\" style=\"box-sizing: inherit;\"><p class=\"model-name\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\"><span style=\"box-sizing: inherit; font-size: 20px;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">แว่นกันแดด OAKLEY สี MATTE BLACK</span></span></p><p class=\"model-name\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\">FRONT COLOR FAMILY: black<br style=\"box-sizing: inherit;\">LENSES MATERIAL: plastic<br style=\"box-sizing: inherit;\">LENSES PROPERTIES: standard<br style=\"box-sizing: inherit;\">LENSES COLOR: prizm black<br style=\"box-sizing: inherit;\">INFORMATION NOTE 3n<br style=\"box-sizing: inherit;\">% TRANSMISSION LENS 13<br style=\"box-sizing: inherit;\">CATEGORY: Sun<br style=\"box-sizing: inherit;\">GENDER: Man<br style=\"box-sizing: inherit;\">SHAPE: Rectangle<br style=\"box-sizing: inherit;\">FRONT MATERIAL: Plastic<br style=\"box-sizing: inherit;\">TEMPLE: Plastic<br style=\"box-sizing: inherit;\">BRIDGE DESIGN: Standard<br style=\"box-sizing: inherit;\">GEOFIT: ASIAN<br style=\"box-sizing: inherit;\">BASE: 4X2TOR<br style=\"box-sizing: inherit;\">RX-ABLE: Yes</p><div><br></div></div>','/storage/photos/1/0OO9391-939102-1-removebg-preview.png',4,'','default','active',7350.00,10.00,1,13,NULL,8,'2021-01-18 16:12:38','2021-01-18 16:12:38'),
	(19,'OAKLEY แว่นกันแดด 0OO9391 CROSSRANGE PATCH','oakley-0oo9391-crossrange-patch','<h1 style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.4rem; margin-left: 0px; font-family: Mitr, sans-serif; line-height: 1.3; color: rgb(10, 10, 10); font-size: 1.6em;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">แว่นกันแดด OAKLEY&nbsp;0OO9391 CROSSRANGE PATCH</span></h1><div class=\"info-product\" style=\"box-sizing: inherit; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\"><p class=\"model-name\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px;\"><span style=\"box-sizing: inherit; font-size: 20px;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">แว่นกันแดด OAKLEY สี MATTE BROWN TORTOISE</span></span></p><p class=\"model-name\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px;\">FRONT COLOR FAMILY: havana<br style=\"box-sizing: inherit;\">LENSES MATERIAL: plastic<br style=\"box-sizing: inherit;\">LENSES PROPERTIES: standard<br style=\"box-sizing: inherit;\">LENSES COLOR: 24k iridium<br style=\"box-sizing: inherit;\">INFORMATION NOTE 3n<br style=\"box-sizing: inherit;\">% TRANSMISSION LENS 11<br style=\"box-sizing: inherit;\">CATEGORY: Sun<br style=\"box-sizing: inherit;\">GENDER: Man<br style=\"box-sizing: inherit;\">SHAPE: Rectangle<br style=\"box-sizing: inherit;\">FRONT MATERIAL: Plastic<br style=\"box-sizing: inherit;\">TEMPLE: Plastic<br style=\"box-sizing: inherit;\">BRIDGE DESIGN: Standard<br style=\"box-sizing: inherit;\">GEOFIT: ASIAN<br style=\"box-sizing: inherit;\">BASE: 4X2TOR<br style=\"box-sizing: inherit;\">RX-ABLE: Yes</p></div>','<h1 style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.4rem; margin-left: 0px; font-family: Mitr, sans-serif; line-height: 1.3; color: rgb(10, 10, 10); font-size: 1.6em;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">แว่นกันแดด OAKLEY&nbsp;0OO9391 CROSSRANGE PATCH</span></h1><div class=\"info-product\" style=\"box-sizing: inherit; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\"><p class=\"model-name\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px;\"><span style=\"box-sizing: inherit; font-size: 20px;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">แว่นกันแดด OAKLEY สี MATTE BROWN TORTOISE</span></span></p><p class=\"model-name\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px;\">FRONT COLOR FAMILY: havana<br style=\"box-sizing: inherit;\">LENSES MATERIAL: plastic<br style=\"box-sizing: inherit;\">LENSES PROPERTIES: standard<br style=\"box-sizing: inherit;\">LENSES COLOR: 24k iridium<br style=\"box-sizing: inherit;\">INFORMATION NOTE 3n<br style=\"box-sizing: inherit;\">% TRANSMISSION LENS 11<br style=\"box-sizing: inherit;\">CATEGORY: Sun<br style=\"box-sizing: inherit;\">GENDER: Man<br style=\"box-sizing: inherit;\">SHAPE: Rectangle<br style=\"box-sizing: inherit;\">FRONT MATERIAL: Plastic<br style=\"box-sizing: inherit;\">TEMPLE: Plastic<br style=\"box-sizing: inherit;\">BRIDGE DESIGN: Standard<br style=\"box-sizing: inherit;\">GEOFIT: ASIAN<br style=\"box-sizing: inherit;\">BASE: 4X2TOR<br style=\"box-sizing: inherit;\">RX-ABLE: Yes</p></div>','/storage/photos/1/0OO9391-939101-1-removebg-preview.png',6,'','hot','active',6950.00,15.00,1,14,NULL,8,'2021-01-18 16:13:37','2021-01-18 16:13:37'),
	(20,'OAKLEY แว่นกันแดด 0OO9398 TARGETLINE','oakley-0oo9398-targetline','<h1 style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.4rem; margin-left: 0px; font-family: Mitr, sans-serif; line-height: 1.3; color: rgb(10, 10, 10); font-size: 1.6em;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">แว่นกันแดด OAKLEY OAKLEY&nbsp;0OO9398 TARGETLINE</span></h1><div class=\"info-product\" style=\"box-sizing: inherit; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\"><p class=\"model-name\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px;\"><span style=\"box-sizing: inherit; font-size: 20px;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">แว่นกันแดด OAKLEY สี CARBON</span></span></p><p class=\"model-name\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px;\">FRONT COLOR FAMILY: black<br style=\"box-sizing: inherit;\">LENSES MATERIAL: plastic<br style=\"box-sizing: inherit;\">LENSES PROPERTIES: standard<br style=\"box-sizing: inherit;\">LENSES COLOR: prizm black<br style=\"box-sizing: inherit;\">INFORMATION NOTE 3n<br style=\"box-sizing: inherit;\">% TRANSMISSION LENS 13<br style=\"box-sizing: inherit;\">CATEGORY: Sun<br style=\"box-sizing: inherit;\">GENDER: Man<br style=\"box-sizing: inherit;\">SHAPE: Square<br style=\"box-sizing: inherit;\">FRONT MATERIAL: Plastic<br style=\"box-sizing: inherit;\">TEMPLE: Plastic<br style=\"box-sizing: inherit;\">BRIDGE DESIGN: Standard<br style=\"box-sizing: inherit;\">GEOFIT: ASIAN<br style=\"box-sizing: inherit;\">BASE: Base 6<br style=\"box-sizing: inherit;\">RX-ABLE: Yes</p></div>','<h1 style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.4rem; margin-left: 0px; font-family: Mitr, sans-serif; line-height: 1.3; color: rgb(10, 10, 10); font-size: 1.6em;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">แว่นกันแดด OAKLEY OAKLEY&nbsp;0OO9398 TARGETLINE</span></h1><div class=\"info-product\" style=\"box-sizing: inherit; color: rgb(10, 10, 10); font-family: Mitr, sans-serif; font-size: 14px;\"><p class=\"model-name\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px;\"><span style=\"box-sizing: inherit; font-size: 20px;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">แว่นกันแดด OAKLEY สี CARBON</span></span></p><p class=\"model-name\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px;\">FRONT COLOR FAMILY: black<br style=\"box-sizing: inherit;\">LENSES MATERIAL: plastic<br style=\"box-sizing: inherit;\">LENSES PROPERTIES: standard<br style=\"box-sizing: inherit;\">LENSES COLOR: prizm black<br style=\"box-sizing: inherit;\">INFORMATION NOTE 3n<br style=\"box-sizing: inherit;\">% TRANSMISSION LENS 13<br style=\"box-sizing: inherit;\">CATEGORY: Sun<br style=\"box-sizing: inherit;\">GENDER: Man<br style=\"box-sizing: inherit;\">SHAPE: Square<br style=\"box-sizing: inherit;\">FRONT MATERIAL: Plastic<br style=\"box-sizing: inherit;\">TEMPLE: Plastic<br style=\"box-sizing: inherit;\">BRIDGE DESIGN: Standard<br style=\"box-sizing: inherit;\">GEOFIT: ASIAN<br style=\"box-sizing: inherit;\">BASE: Base 6<br style=\"box-sizing: inherit;\">RX-ABLE: Yes</p></div>','/storage/photos/1/0OO9398-939802-1-removebg-preview.png',7,'','new','active',6050.00,5.00,1,14,NULL,8,'2021-01-18 16:14:24','2021-01-18 16:14:24');

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`)
VALUES
	(1,'บริการตรวจวัดสายตาและประกอบแว่นสายตา โดยช่างผู้เชี่ยวชาญเฉพาะด้านกับประสบการณ์มากกว่า 40 ปี การตรวจวัดสายตา เป็นการตรวจหาค่าสายตา เพื่อให้ได้ค่าสายตาที่เหมาะสมที่สุดสำหรับการตัดแว่นสายตา รวมไปถึงการทดสอบการมองเห็นโดยรวมอื่น ๆ เพื่อให้ทราบถึงประสิทธิภาพในการมองเห็น โดยในขั้นตอนการตรวจวัด จะมีตัวอักษร ตัวเลข หรือสัญลักษณ์ต่างๆ จากระยะห่างที่กำหนดในระยะใกล้ หรือไกล','บริการตรวจวัดสายตาและประกอบแว่นสายตา โดยช่างผู้เชี่ยวชาญเฉพาะด้านกับประสบการณ์มากกว่า 40 ปี','/storage/photos/1/15027420_671026813106308_2097136568327154633_n.jpg','/storage/photos/1/3.jpeg','Thanon Rat Chiang Saen, Tambon Phra Sing, Amphoe Mueang Chiang Mai, Chang Wat Chiang Mai 50100','053 270 930','glasses@glasses',NULL,'2021-01-18 14:19:45');

/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shippings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shippings`;

CREATE TABLE `shippings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `shippings` WRITE;
/*!40000 ALTER TABLE `shippings` DISABLE KEYS */;

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'เชียงใหม่',100.00,'active','2020-08-14 11:22:17','2021-01-20 15:55:01'),
	(2,'ยะลา',300.00,'active','2020-08-14 11:22:41','2021-01-20 15:54:53'),
	(3,'ขอนแก่น',400.00,'active','2020-08-15 13:54:04','2021-01-20 15:55:19'),
	(4,'กรุงเทพ',50.00,'active','2020-08-18 03:50:48','2021-01-20 15:55:30');

/*!40000 ALTER TABLE `shippings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Admin','admin@gmail.com',NULL,'$2y$10$NDsp.XgpgWCaiaRabEi40OdkZslJt/dktCEhcAMxPYGJkMwaTROQW','/storage/photos/1/users/user1.jpg','admin',NULL,NULL,'active','HDrGbLd4tW4i2afWGTYcAjsUIuDLxoH73pscn414tEofz0CAyXxzOFmWIQPU',NULL,'2021-01-20 15:56:51'),
	(2,'User','user@gmail.com',NULL,'$2y$10$10jB2lupSfvAUfocjguzSeN95LkwgZJUM7aQBdb2Op7XzJ.BhNoHq','/storage/photos/1/users/user2.jpg','user',NULL,NULL,'active',NULL,NULL,'2020-08-15 14:30:07'),
	(3,'Prajwal Rai','prajwal.iar@gmail.com',NULL,'$2y$10$15ZVMgH040v4Ukf9KSAFiucPJcfDwmeRKCaguVJBXplTs93m48F1G','/storage/photos/1/users/user3.jpg','user',NULL,NULL,'active',NULL,'2020-08-11 11:20:58','2020-08-15 14:56:58'),
	(4,'Cynthia Beier','ernestina.wehner@example.net','2020-08-15 04:18:52','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'user',NULL,NULL,'active','fzmQDfEoaP','2020-08-15 04:18:52','2020-08-15 04:18:52'),
	(5,'Prof. Maybell Zulauf','wolf.harvey@example.org','2020-08-15 04:18:52','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'user',NULL,NULL,'active','B8cYq4huyT','2020-08-15 04:18:54','2020-08-15 04:18:54'),
	(6,'Diego Lind II','schroeder.emile@example.net','2020-08-15 04:18:52','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'user',NULL,NULL,'active','xLUaF26dE1','2020-08-15 04:18:54','2020-08-15 04:18:54'),
	(7,'Ian Macejkovic','ashlee16@example.com','2020-08-15 04:18:52','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'user',NULL,NULL,'active','i2ZIKbiM9O','2020-08-13 04:18:54','2020-08-15 04:18:54'),
	(8,'Perry McClure DDS','mayer.ashlynn@example.org','2020-08-15 04:18:52','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'user',NULL,NULL,'active','VD1MlsvW3I','2020-08-15 04:18:55','2020-08-15 04:18:55'),
	(9,'Juana Yost','carter47@example.net','2020-08-15 04:19:50','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'user',NULL,NULL,'active','kARxoay0FT','2020-08-12 04:19:50','2020-08-15 04:19:50'),
	(10,'Louvenia Will DDS','lowell06@example.net','2020-08-15 04:19:50','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'user',NULL,NULL,'active','QkbNNnO7ZG','2020-08-11 04:19:50','2020-08-15 04:19:50'),
	(11,'Miss Layla McClure','dcummings@example.com','2020-08-15 04:19:50','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'user',NULL,NULL,'active','DFnCS0bKFa','2020-08-09 04:19:51','2020-08-15 04:19:51'),
	(12,'Mrs. Taya Ziemann','anderson.luz@example.net','2020-08-15 04:19:50','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'user',NULL,NULL,'active','4Xgvb1HnFT','2020-08-10 04:19:51','2020-08-15 04:19:51'),
	(13,'Porter Olson','jaden24@example.com','2020-08-15 04:19:50','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'user',NULL,NULL,'active','gFX2w4WaMj','2020-08-15 04:19:51','2020-08-15 04:19:51'),
	(29,'Prajwal Rai','rae.prajwal@gmail.com',NULL,NULL,NULL,'user','google','110717103019405487938','active',NULL,'2020-08-15 14:36:29','2020-08-15 14:36:29'),
	(30,'thanapon','beeze001@gmail.com',NULL,'$2y$10$NDsp.XgpgWCaiaRabEi40OdkZslJt/dktCEhcAMxPYGJkMwaTROQW',NULL,'user',NULL,NULL,'active',NULL,'2021-01-10 09:22:40','2021-01-10 09:22:40'),
	(31,'may','calamella_may@hotmail.com',NULL,'$2y$10$aC6OVq20fX5Xcpcp6/TqkuMd/tJCyXslluXWilEhfUCQcQZTpS2gC',NULL,'user',NULL,NULL,'active',NULL,'2021-01-18 15:09:33','2021-01-18 15:09:33');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wishlists
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wishlists`;

CREATE TABLE `wishlists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `cart_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlists_product_id_foreign` (`product_id`),
  KEY `wishlists_user_id_foreign` (`user_id`),
  KEY `wishlists_cart_id_foreign` (`cart_id`),
  CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
