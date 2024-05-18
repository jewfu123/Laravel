-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2024-05-18 03:59:08
-- 服务器版本： 10.4.28-MariaDB
-- PHP 版本： 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `laravel`
--

-- --------------------------------------------------------

--
-- 表的结构 `authors`
--

CREATE TABLE `authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `authors`
--

INSERT INTO `authors` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Niao Shan Ming', '2024-05-11 21:06:00', '2024-05-11 21:06:00');

-- --------------------------------------------------------

--
-- 表的结构 `author_book`
--

CREATE TABLE `author_book` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `author_book`
--

INSERT INTO `author_book` (`id`, `book_id`, `author_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `books`
--

INSERT INTO `books` (`id`, `title`, `description`, `price`, `available`, `created_at`, `updated_at`, `deleted_at`, `store_id`, `author_id`) VALUES
(1, 'abcehaha', 'xjp da sha gua', 1.00, 0, '2024-05-11 14:59:05', '2024-05-11 21:27:33', NULL, 1, 1),
(2, 'book no 2', 'book 2 is a good book', 100.00, 0, '2024-05-11 20:23:01', '2024-05-11 20:24:01', NULL, 1, NULL),
(3, 'Rosemary Waelchi', 'Eos et distinctio optio est non deserunt. Ut eligendi qui quae temporibus est officia. Tenetur sed exercitationem quia.', 84.00, 0, '2024-05-11 22:00:55', '2024-05-11 22:00:55', NULL, NULL, NULL),
(4, 'Mr. Julius Block DVM', 'Neque occaecati et iste. Dolorem ut nihil enim dicta rem officiis non. Maiores laboriosam unde harum. Necessitatibus debitis sed impedit vel odio quae quidem maxime.', 119.00, 0, '2024-05-11 22:03:24', '2024-05-11 22:03:24', NULL, NULL, NULL),
(5, 'Waldo Lebsack I', 'Ad ea sed eos voluptatem modi doloremque. Dolor deleniti dolores est occaecati ea. Qui et rerum quis. Ut consectetur facere tenetur necessitatibus sit vitae consequatur iste.', 154.00, 0, '2024-05-11 22:03:24', '2024-05-11 22:03:24', NULL, NULL, NULL),
(6, 'Stephen Boehm PhD', 'Molestias sint blanditiis fugit laboriosam voluptatibus quod quia. Repellat a consequatur laboriosam. Id qui voluptate consequuntur veniam.', 76.00, 0, '2024-05-11 22:03:24', '2024-05-11 22:03:24', NULL, NULL, NULL),
(7, 'Taurean Satterfield', 'Nulla id et accusantium voluptatem quidem officia. Iure dolor architecto vel sint nihil et.', 280.00, 0, '2024-05-11 22:03:24', '2024-05-11 22:03:24', NULL, NULL, NULL),
(8, 'Tyrique Sanford', 'Sint earum dolores provident et ea architecto et. Rerum excepturi qui ex qui. Officiis nam voluptatem dolorum quaerat.', 97.00, 0, '2024-05-11 22:03:24', '2024-05-11 22:03:24', NULL, NULL, NULL),
(9, 'Terrill Leuschke MD', 'Praesentium et est ad qui aut. Et cupiditate assumenda quasi sint repellat. Omnis provident unde molestias et quia reiciendis debitis.', 196.00, 0, '2024-05-11 22:03:24', '2024-05-11 22:03:24', NULL, NULL, NULL),
(10, 'Kristofer Balistreri', 'Sed quo modi cum magnam. Est ad ut quia officia est animi aut. Non ut est non est id aut. Voluptatem consequatur odit voluptatem.', 94.00, 0, '2024-05-11 22:03:24', '2024-05-11 22:03:24', NULL, NULL, NULL),
(11, 'Astrid Daniel PhD', 'Nostrum quia assumenda expedita atque molestias ea. Exercitationem natus voluptatem mollitia voluptas eveniet et rerum. Eaque labore ut delectus aperiam est quasi ducimus.', 223.00, 0, '2024-05-11 22:03:24', '2024-05-11 22:03:24', NULL, NULL, NULL),
(12, 'Danielle Nienow', 'Vel ea asperiores vel sit nihil cum nam. Sapiente voluptatum et voluptatem perferendis. Error velit quia et repellendus non. Quia odio maxime minima non.', 275.00, 0, '2024-05-11 22:03:24', '2024-05-11 22:03:24', NULL, NULL, NULL),
(13, 'Granville Gorczany II', 'Sunt vel et accusantium. Ea itaque doloremque quisquam. Illo molestiae magni cumque dolor omnis explicabo temporibus. Adipisci aut sit dolorem.', 22.00, 0, '2024-05-11 22:03:24', '2024-05-11 22:03:24', NULL, NULL, NULL),
(14, 'Josiane Bayer', 'Ipsam veniam incidunt quia voluptatem. Non sit deserunt aliquid alias eaque. Soluta dolorem omnis ut laboriosam. Aliquam deleniti in saepe pariatur.', 166.00, 0, '2024-05-11 22:03:24', '2024-05-11 22:03:24', NULL, NULL, NULL),
(15, 'Eve Flatley', 'Ipsa enim voluptates voluptatibus repellendus est ab suscipit velit. Enim blanditiis dolorem est quod consequatur rem. Voluptatem eaque dolorem est eum. Officiis eaque explicabo dolores dignissimos.', 46.00, 0, '2024-05-11 22:03:24', '2024-05-11 22:03:24', NULL, NULL, NULL),
(16, 'Helga Morissette Sr.', 'Quod sunt voluptatem sint et maiores quasi. Id nisi amet libero repudiandae sint officia magni. Neque et ad magni culpa velit. Nemo officiis repellat itaque quisquam mollitia quia quis.', 110.00, 0, '2024-05-11 22:03:24', '2024-05-11 22:03:24', NULL, NULL, NULL),
(17, 'Doug O\'Connell III', 'Autem impedit illum odit voluptatum. Sed ut at officiis id quibusdam ut.', 270.00, 0, '2024-05-11 22:03:24', '2024-05-11 22:03:24', NULL, NULL, NULL),
(18, 'Naomie Jakubowski', 'Facilis quaerat non ut et. Quas magni deleniti dolores et voluptate et qui. Rerum et ipsum qui est. Eveniet omnis voluptatem numquam voluptatem soluta et.', 67.00, 0, '2024-05-11 22:03:24', '2024-05-11 22:03:24', NULL, NULL, NULL),
(19, 'Mr. Stephen Pacocha', 'Quos dolores velit dicta nihil eum. Enim tempore cumque consequatur. Dolores accusantium vel nam ullam non quisquam.', 20.00, 0, '2024-05-11 22:03:24', '2024-05-11 22:03:24', NULL, NULL, NULL),
(20, 'Wilmer Smitham', 'Veritatis error voluptatem dolorem iure. Dolor iste debitis eum dolorem reprehenderit sit. Et est atque expedita adipisci deserunt.', 109.00, 0, '2024-05-11 22:03:24', '2024-05-11 22:03:24', NULL, NULL, NULL),
(21, 'Dejuan Rau', 'Harum est perspiciatis aliquam ipsum culpa. Dolorem aperiam cumque et dolores asperiores. Rerum optio illo porro sint incidunt.', 16.00, 0, '2024-05-11 22:03:24', '2024-05-11 22:03:24', NULL, NULL, NULL),
(22, 'Asia Doyle', 'Facere eum quaerat optio eum esse et qui. Laborum soluta cumque ut vitae veritatis.', 174.00, 0, '2024-05-11 22:03:24', '2024-05-11 22:03:24', NULL, NULL, NULL),
(23, 'Aletha Purdy Sr.', 'Aut incidunt praesentium eum cupiditate adipisci. Modi aut maiores inventore sit velit illo. Incidunt cumque non porro vel.', 54.00, 0, '2024-05-11 22:03:24', '2024-05-11 22:03:24', NULL, NULL, NULL),
(24, 'Charles Ratke', 'Quasi distinctio dolor omnis hic odio est. Eum debitis possimus nostrum. Rerum aut sed ratione tenetur. Est vero aut iste nemo ut qui.', 56.00, 0, '2024-05-11 22:16:57', '2024-05-11 22:16:57', NULL, 2, NULL),
(25, 'Aliya Ebert', 'Et consequuntur qui ducimus facere repudiandae ipsum. Nulla odio occaecati quia ea est voluptas. Quo molestiae tempore eaque ut itaque adipisci maxime. Numquam voluptatibus corporis ut quidem.', 41.00, 0, '2024-05-11 22:16:57', '2024-05-11 22:16:57', NULL, 2, NULL),
(26, 'Larissa Ward', 'Architecto adipisci aut delectus officia at est officia. Facilis perferendis maxime harum atque. Qui consequuntur sequi perspiciatis consequatur autem.', 79.00, 0, '2024-05-11 22:16:57', '2024-05-11 22:16:57', NULL, 2, NULL),
(27, 'Lester Steuber', 'Hic suscipit repudiandae laborum ut dicta harum ut. Non facere dolorem qui id non aut. Sequi facere voluptates consectetur odio odit impedit et eveniet. Quam velit voluptatibus nemo.', 126.00, 0, '2024-05-11 22:16:57', '2024-05-11 22:16:57', NULL, 2, NULL),
(28, 'Britney Rodriguez III', 'Ea vel laboriosam dicta nesciunt ad ut. Nihil id qui ratione. Et pariatur et optio tempore ut architecto earum sapiente. Sequi molestiae omnis blanditiis voluptas deserunt placeat.', 233.00, 0, '2024-05-11 22:16:57', '2024-05-11 22:16:57', NULL, 2, NULL),
(29, 'Yessenia Lakin', 'Omnis voluptatem omnis est ut. Voluptas voluptatem quo ab velit eos debitis. Distinctio voluptate reiciendis vero et.', 186.00, 0, '2024-05-11 22:18:15', '2024-05-11 22:18:15', NULL, 3, NULL),
(30, 'Rey Langworth I', 'Harum commodi et aut ex possimus alias ut. Voluptatibus deserunt quia in. Quia nisi ea aspernatur necessitatibus. Et placeat molestias ad odio architecto ut.', 35.00, 0, '2024-05-11 22:18:15', '2024-05-11 22:18:15', NULL, 3, NULL),
(31, 'Amos Kutch', 'Et dolor sequi tempora ea nemo. Veniam quas et ipsam eaque consequatur quas. Maiores repellendus quos sapiente ipsum non in illo.', 205.00, 0, '2024-05-11 22:18:15', '2024-05-11 22:18:15', NULL, 3, NULL),
(32, 'Mr. Ben Roberts', 'Suscipit dolorem eaque corrupti eligendi recusandae ut sed. Autem placeat tempora modi sint quaerat. Voluptate excepturi in laboriosam sint enim ab. Ea exercitationem omnis fuga.', 242.00, 0, '2024-05-11 22:18:15', '2024-05-11 22:18:15', NULL, 3, NULL),
(33, 'Mathew Kunde', 'Voluptatibus placeat et tenetur minus suscipit. Molestias odit dolorum aliquam expedita quo iusto molestiae. Sit illo non culpa error consequatur voluptas.', 53.00, 0, '2024-05-11 22:18:15', '2024-05-11 22:18:15', NULL, 3, NULL),
(34, 'Prof. Tyrell Stoltenberg', 'Amet quod ea veritatis officiis voluptas. Maiores repudiandae velit sunt molestiae fuga quod dolor. Inventore aut molestiae asperiores aut eos. Esse magni tempore facilis in voluptas eius.', 173.00, 0, '2024-05-11 22:18:15', '2024-05-11 22:18:15', NULL, 3, NULL),
(35, 'Dr. Horace Stamm', 'Iste explicabo sed id eum autem illo illo. Sunt consequatur molestiae iste ea. Iste architecto ullam officia laudantium quia. Nulla architecto autem rerum earum magni facilis eveniet.', 94.00, 0, '2024-05-11 22:18:15', '2024-05-11 22:18:15', NULL, 3, NULL),
(36, 'Antonia Schulist V', 'Iste numquam atque debitis. Et adipisci omnis impedit eos harum. Minima unde blanditiis inventore quia et ipsa non accusantium.', 110.00, 0, '2024-05-11 22:18:15', '2024-05-11 22:18:15', NULL, 3, NULL),
(37, 'Waylon Boyer', 'Nisi dolorum nobis aspernatur aut et. Rerum reiciendis dicta modi molestias voluptate consequuntur totam. Esse sed omnis in placeat sed. Similique inventore et excepturi.', 283.00, 0, '2024-05-11 22:18:15', '2024-05-11 22:18:15', NULL, 3, NULL),
(38, 'Lon Ebert', 'Voluptatem modi qui iste sit sunt veniam earum. Eos similique esse ea mollitia et corrupti est. Molestias nobis omnis saepe iusto amet qui est.', 11.00, 0, '2024-05-11 22:18:15', '2024-05-11 22:18:15', NULL, 3, NULL),
(39, 'Darby Dare', 'Qui accusamus eum distinctio molestiae et. Nostrum sunt ullam aspernatur hic voluptas porro tempora.', 52.00, 0, '2024-05-11 22:19:19', '2024-05-11 22:19:19', NULL, 4, NULL),
(40, 'Clement Armstrong I', 'Minus vel placeat ex nam numquam quia. Eligendi culpa accusamus enim in voluptatibus. Dolores nam sed repellendus voluptatem facere.', 60.00, 0, '2024-05-11 22:19:19', '2024-05-11 22:19:19', NULL, 4, NULL),
(41, 'Braxton Mayer', 'Sit et ipsum possimus amet veniam occaecati quos. Itaque voluptas a quo ipsa dolorem. Sed omnis et et libero id perferendis. Facilis nulla nam omnis repellat.', 115.00, 0, '2024-05-11 22:19:19', '2024-05-11 22:19:19', NULL, 4, NULL),
(42, 'Ms. Serenity Greenfelder', 'Nemo rerum provident in labore et. Et distinctio fuga voluptas. Saepe suscipit delectus ut similique sed neque. Aut qui in fuga ut.', 176.00, 0, '2024-05-11 22:19:19', '2024-05-11 22:19:19', NULL, 5, NULL),
(43, 'Kim Hickle', 'Ea voluptates quaerat eaque. Consectetur rerum accusantium libero voluptatem enim recusandae libero. Quae earum aut ut officia at. Quis sunt ab expedita quae.', 244.00, 0, '2024-05-11 22:19:19', '2024-05-11 22:19:19', NULL, 5, NULL),
(44, 'Ms. Lisette Mertz Sr.', 'Fuga quis quaerat illo molestiae. Voluptatibus harum voluptatibus totam. Et fuga consectetur omnis.', 210.00, 0, '2024-05-11 22:19:19', '2024-05-11 22:19:19', NULL, 5, NULL),
(45, 'Miss Reina Leuschke V', 'Vitae veniam dolorem est ratione nihil voluptatem. Est dolorum necessitatibus rem animi tempora ad qui. Vel et dolores maxime sed est iusto.', 89.00, 0, '2024-05-11 22:19:19', '2024-05-11 22:19:19', NULL, 6, NULL),
(46, 'Keira Boyer V', 'Provident et atque et autem blanditiis qui. Et perspiciatis qui in. Tenetur voluptatem aut ratione a suscipit.', 151.00, 0, '2024-05-11 22:19:19', '2024-05-11 22:19:19', NULL, 6, NULL),
(47, 'Evie Blick', 'Necessitatibus in voluptatem eos iusto consequatur neque. Possimus voluptas et laudantium tenetur et. Officia quia repudiandae et dignissimos provident ut incidunt minus.', 190.00, 0, '2024-05-11 22:19:19', '2024-05-11 22:19:19', NULL, 6, NULL),
(48, 'xxx da sha gua', 'Id dolorem qui qui vel nihil qui dolor. Et id non quibusdam et et est adipisci. Numquam in corrupti quas sint.', 272.00, 0, '2024-05-11 22:23:15', '2024-05-11 22:23:15', NULL, 7, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `failed_jobs`
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
-- 表的结构 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_05_10_222931_create_stores_table', 2),
(6, '2024_05_11_121145_abcdtest', 3),
(7, '2024_05_11_121517_create_posts_table', 3),
(8, '2024_05_11_134932_create_books_table', 4),
(9, '2024_05_12_005411_add_deleted_at_to_books', 5),
(10, '2024_05_12_040523_create_stores_table', 6),
(11, '2024_05_12_041113_add_deleted_at_to_stores', 6),
(12, '2024_05_12_043700_add_store_id_to_books', 7),
(13, '2024_05_12_053348_create_authors_table', 8),
(14, '2024_05_12_054305_create_table_author_book', 9),
(15, '2024_05_17_213742_photo', 10);

-- --------------------------------------------------------

--
-- 表的结构 `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `photos`
--

CREATE TABLE `photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo_id` int(5) DEFAULT NULL,
  `title` varchar(15) DEFAULT NULL,
  `content` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `photos`
--

INSERT INTO `photos` (`id`, `photo_id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 'a', 'abc', NULL, NULL),
(2, 2, 'aa', 'abcde', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 'hahahah', 'sdfasfsdfsddf', NULL, NULL),
(2, 'dddd', 'xxx', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `stores`
--

INSERT INTO `stores` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'a store', '2024-05-11 19:29:48', '2024-05-11 19:29:48', NULL),
(2, 'Prof. Stone Stark', '2024-05-11 22:16:57', '2024-05-11 22:16:57', NULL),
(3, 'Myrtis Luettgen', '2024-05-11 22:18:15', '2024-05-11 22:18:15', NULL),
(4, 'Sunny O\'Hara', '2024-05-11 22:19:19', '2024-05-11 22:19:19', NULL),
(5, 'Philip Buckridge', '2024-05-11 22:19:19', '2024-05-11 22:19:19', NULL),
(6, 'Mr. Dalton Brakus DVM', '2024-05-11 22:19:19', '2024-05-11 22:19:19', NULL),
(7, 'Mrs. Faye Conn', '2024-05-11 22:23:15', '2024-05-11 22:23:15', NULL),
(8, 'Marie Gerhold', '2024-05-11 22:46:10', '2024-05-11 22:46:10', NULL),
(9, 'Retta Zieme IV', '2024-05-11 22:46:10', '2024-05-11 22:46:10', NULL),
(10, 'Prof. Sallie Olson V', '2024-05-11 22:46:10', '2024-05-11 22:46:10', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '[value-2]', '[value-3]', '0000-00-00 00:00:00', '[value-5]', '[value-6]', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'jewfu', 'jewfu_123@163.com', NULL, '$2y$12$72CiB.FpWf8.YhRIg1oZruEu9s0gPoafJw8ChsTdB0dZykoe.iEDO', NULL, '2024-05-10 05:29:19', '2024-05-10 05:29:19'),
(3, 'Mrs. Ashlynn Jast DDS', 'uhills@example.net', '2024-05-10 13:11:16', '$2y$12$mN50iBHxmjW4WG5VCQ2pIey9hYkw3lnFz4JIgmmOoPQ52npAgPPeq', 'IN22YWDhnq', '2024-05-10 13:11:16', '2024-05-10 13:11:16'),
(4, 'Gerard Bartoletti', 'sonya89@example.net', '2024-05-10 13:11:16', '$2y$12$mN50iBHxmjW4WG5VCQ2pIey9hYkw3lnFz4JIgmmOoPQ52npAgPPeq', 'WQJJ1khHs8', '2024-05-10 13:11:16', '2024-05-10 13:11:16'),
(5, 'Lenna Gutmann', 'georgette.pacocha@example.org', '2024-05-10 13:11:16', '$2y$12$mN50iBHxmjW4WG5VCQ2pIey9hYkw3lnFz4JIgmmOoPQ52npAgPPeq', 'v8v73Y5uVA', '2024-05-10 13:11:16', '2024-05-10 13:11:16'),
(6, 'Aisha Jacobs PhD', 'kariane99@example.net', '2024-05-10 14:05:22', '$2y$12$OAo4KxzJzEe1eti8c54W2OS8oGuMQB0E24VTb2QYIcMYw3Rx6dUBS', 'NJStFOTqGc', '2024-05-10 14:05:22', '2024-05-10 14:05:22');

--
-- 转储表的索引
--

--
-- 表的索引 `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `author_book`
--
ALTER TABLE `author_book`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- 表的索引 `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- 表的索引 `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- 表的索引 `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `authors`
--
ALTER TABLE `authors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `author_book`
--
ALTER TABLE `author_book`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- 使用表AUTO_INCREMENT `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
