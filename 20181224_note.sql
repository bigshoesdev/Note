/*
Navicat MySQL Data Transfer

Source Server         : MY
Source Server Version : 100132
Source Host           : localhost:3306
Source Database       : note

Target Server Type    : MYSQL
Target Server Version : 100132
File Encoding         : 65001

Date: 2018-12-24 13:29:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for attention_categories
-- ----------------------------
DROP TABLE IF EXISTS `attention_categories`;
CREATE TABLE `attention_categories` (
  `id` int(11) NOT NULL,
  `display_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of attention_categories
-- ----------------------------
INSERT INTO `attention_categories` VALUES ('8', '7');
INSERT INTO `attention_categories` VALUES ('9', '8');
INSERT INTO `attention_categories` VALUES ('10', '9');
INSERT INTO `attention_categories` VALUES ('7', '10');
INSERT INTO `attention_categories` VALUES ('6', '123');
INSERT INTO `attention_categories` VALUES ('2', '124');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `used` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', 'manga1', '0', '2018-12-11 02:42:55', '2018-12-11 02:42:55', null);
INSERT INTO `categories` VALUES ('2', 'manga', '0', '2018-12-11 02:43:48', '2018-12-11 02:43:48', null);
INSERT INTO `categories` VALUES ('3', 'column', '0', '2018-12-11 02:43:48', '2018-12-11 02:43:48', null);
INSERT INTO `categories` VALUES ('4', 'novel', '0', '2018-12-11 02:43:48', '2018-12-11 02:43:48', null);
INSERT INTO `categories` VALUES ('5', 'Photo', '0', '2018-12-11 02:43:48', '2018-12-11 02:43:48', null);
INSERT INTO `categories` VALUES ('6', 'sound', '0', '2018-12-11 02:43:48', '2018-12-11 02:43:48', null);
INSERT INTO `categories` VALUES ('7', 'business', '1', '2018-12-11 02:43:48', '2018-12-23 05:36:46', null);
INSERT INTO `categories` VALUES ('8', 'Lifestyle', '0', '2018-12-11 02:43:48', '2018-12-11 02:43:48', null);
INSERT INTO `categories` VALUES ('9', 'technology', '0', '2018-12-11 02:43:48', '2018-12-11 02:43:48', null);
INSERT INTO `categories` VALUES ('10', 'Entertainment', '0', '2018-12-11 02:43:48', '2018-12-11 02:43:48', null);
INSERT INTO `categories` VALUES ('11', '#gag', '0', '2018-12-11 02:43:48', '2018-12-11 02:43:48', null);
INSERT INTO `categories` VALUES ('12', '#health', '0', '2018-12-11 02:43:48', '2018-12-11 02:43:48', null);
INSERT INTO `categories` VALUES ('13', '#children', '0', '2018-12-11 02:43:48', '2018-12-11 02:43:48', null);
INSERT INTO `categories` VALUES ('14', 'essay', '0', '2018-12-11 02:43:48', '2018-12-11 02:43:48', null);
INSERT INTO `categories` VALUES ('15', 'study abroad', '0', '2018-12-11 02:43:48', '2018-12-11 02:43:48', null);
INSERT INTO `categories` VALUES ('20', 'NewCategory1', '1', '2018-12-20 20:19:26', '2018-12-24 17:53:57', null);
INSERT INTO `categories` VALUES ('21', 'NewCategory3', '0', '2018-12-25 04:01:57', '2018-12-25 04:04:58', null);

-- ----------------------------
-- Table structure for categories_posts
-- ----------------------------
DROP TABLE IF EXISTS `categories_posts`;
CREATE TABLE `categories_posts` (
  `category_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of categories_posts
-- ----------------------------
INSERT INTO `categories_posts` VALUES ('1', '1');
INSERT INTO `categories_posts` VALUES ('2', '2');
INSERT INTO `categories_posts` VALUES ('3', '3');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `edition_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `cnt_favourite` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1', '1', 'dasdasd', 'asdasdasd', 'hello , hello ', 'open', '1', '0', '2018-12-14 03:33:51', null, '0');
INSERT INTO `comments` VALUES ('2', '2', 'dasdasd', 'asdasdasd', 'goods , goods', 'open', '2', '0', '2018-12-14 03:33:51', null, '0');

-- ----------------------------
-- Table structure for comment_favourites
-- ----------------------------
DROP TABLE IF EXISTS `comment_favourites`;
CREATE TABLE `comment_favourites` (
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of comment_favourites
-- ----------------------------

-- ----------------------------
-- Table structure for editions
-- ----------------------------
DROP TABLE IF EXISTS `editions`;
CREATE TABLE `editions` (
  `id` int(11) NOT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `editions_code_unique` (`code`),
  KEY `editions_id_index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of editions
-- ----------------------------
INSERT INTO `editions` VALUES ('10', '15d44c2e-c7b0-3fc4-bb55-faf1d29abf44', '2018-12-10 05:24:50');
INSERT INTO `editions` VALUES ('8', '2f17d1ed-fd46-30d9-877a-c32c593a5176', '2018-12-10 05:24:50');
INSERT INTO `editions` VALUES ('11', '5a117452-ee11-343c-bf17-d38d60008144', '2018-12-10 05:24:50');
INSERT INTO `editions` VALUES ('2', '7b353b95-cfd2-3214-af38-0677074d49b9', '2018-12-10 05:24:50');
INSERT INTO `editions` VALUES ('3', '98a7f5bb-b458-338e-9ce4-cb02b7fb502a', '2018-12-10 05:24:50');
INSERT INTO `editions` VALUES ('7', 'af82d5c1-a888-39c9-86e3-59ba569ee7cb', '2018-12-10 05:24:50');
INSERT INTO `editions` VALUES ('6', 'bd9e70c5-f226-3adb-9ebb-0b32999ef430', '2018-12-10 05:24:50');
INSERT INTO `editions` VALUES ('5', 'c0fdbfe9-0dbe-334b-814a-291159b82685', '2018-12-10 05:24:50');
INSERT INTO `editions` VALUES ('9', 'd3f2c938-8c7c-31d5-9e5f-6fc009d00793', '2018-12-10 05:24:50');
INSERT INTO `editions` VALUES ('4', 'f194de9e-c229-3f07-ade5-c2c72849d699', '2018-12-10 05:24:50');
INSERT INTO `editions` VALUES ('1', 'hunter', '2018-12-11 15:36:08');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('187', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('188', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('189', '2018_12_10_001900_create_editions_table', '1');
INSERT INTO `migrations` VALUES ('190', '2018_12_10_002821_create_categories_table', '1');
INSERT INTO `migrations` VALUES ('191', '2018_12_10_003506_create_posts_table', '1');
INSERT INTO `migrations` VALUES ('192', '2018_12_10_005001_create_comments_table', '1');
INSERT INTO `migrations` VALUES ('194', '2018_12_11_170506_rename_audio_table', '2');
INSERT INTO `migrations` VALUES ('195', '2018_12_11_171324_add_cnt_to_posts', '3');
INSERT INTO `migrations` VALUES ('196', '2018_12_11_171646_add_cnt_to_comments', '3');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `edition_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `recommended` tinyint(1) NOT NULL,
  `author_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `cnt_favourite` int(11) DEFAULT NULL,
  `cnt_comment` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('1', '7b353b95-cfd2-3214-af38-0677074d49b9', 'bdd45408-636e-36b1-8fa6-5866f0179b2f', 'Nihil nihil eligendi rerum ut est ratione.', 'Iste magni cumque veritatis quo neque et. Est ut officia reprehenderit commodi officia est quia sed. Quos quis voluptas ipsum ex. Nostrum cupiditate sed voluptas sed.', 'close', 'text', '1', '2', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('2', '7b353b95-cfd2-3214-af38-0677074d49b9', '33fa21d2-bc3b-3a07-822b-8f547f6be116', 'Est id aspernatur ullam unde.', 'Dolore officia vel quo ipsam labore. Soluta fugit velit odio et. Consequatur quas autem vel libero ut eum est. Ipsum rerum delectus et dolore qui eos in.', 'open', 'text', '1', '2', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('3', '7b353b95-cfd2-3214-af38-0677074d49b9', '90f3880c-d7be-33a9-9224-31b290a2ae51', 'In voluptatum corrupti dicta ut omnis quasi ea exercitationem.', 'Earum necessitatibus vel quisquam maxime. Deleniti illum voluptatum ullam ratione impedit nisi. Cumque qui cupiditate doloremque.', 'open', 'text', '1', '2', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('4', '7b353b95-cfd2-3214-af38-0677074d49b9', '74bef5b2-ece1-310c-bc04-36f59318c33e', 'Ut sed et qui velit quam vero non.', 'Aut quia non optio quae non nihil et error. Est fuga facere perspiciatis optio. Neque ut vero possimus sequi.', 'open', 'text', '1', '2', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('5', '7b353b95-cfd2-3214-af38-0677074d49b9', '53ead227-289a-3c59-a2d8-4bd9fed18308', 'Esse ut numquam et ut cupiditate sunt.', 'Unde nemo sint minima temporibus voluptate reprehenderit magnam. Aliquam perferendis dolor porro amet voluptatem labore. In deleniti soluta ipsa. Dolorum sed incidunt incidunt.', 'open', 'text', '1', '2', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('6', '7b353b95-cfd2-3214-af38-0677074d49b9', '6e06d44f-6040-3d8a-a674-0e55821a55e0', 'Aperiam iste sed omnis quia itaque est.', 'Ullam impedit quisquam praesentium qui magnam molestiae magni. Impedit atque id qui alias modi assumenda laudantium. Iste voluptates impedit voluptatem. In illum eum expedita accusamus sed quo.', 'open', 'text', '1', '2', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('7', '7b353b95-cfd2-3214-af38-0677074d49b9', 'e27218a8-a53b-37b0-9b25-84e9a7aba0fe', 'Reiciendis exercitationem autem magni et quisquam laudantium.', 'Illum odio dolorum animi iste fuga nesciunt veritatis sequi. Suscipit rem commodi et velit. Rem in qui placeat. Sequi occaecati voluptatum nobis voluptatem et.', 'open', 'text', '1', '2', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('8', '7b353b95-cfd2-3214-af38-0677074d49b9', '67bb5e60-45bd-30ac-93b0-324d15bfa886', 'Recusandae mollitia cumque eligendi cupiditate laborum.', 'Atque occaecati animi perspiciatis veritatis et. Et quas veritatis voluptatem saepe mollitia excepturi. Vitae qui sapiente sit corrupti aliquid.', 'open', 'text', '1', '2', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('9', '7b353b95-cfd2-3214-af38-0677074d49b9', '56a3f220-64d5-3283-b445-195062e2bff4', 'Qui ut vero et quos.', 'Esse aut quidem ipsa provident atque sint vel. Aut distinctio ex error modi labore officia incidunt.', 'open', 'text', '1', '2', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('10', '7b353b95-cfd2-3214-af38-0677074d49b9', 'cbaaabe9-4164-3d13-b785-cf0d463a6a97', 'Itaque eius veniam eum modi amet consequuntur repudiandae repudiandae.', 'Eaque eius non similique laboriosam sit explicabo et. Explicabo deserunt et ut saepe vero. Nesciunt id culpa error sed sed sed.', 'open', 'text', '1', '2', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('11', '98a7f5bb-b458-338e-9ce4-cb02b7fb502a', 'b27810e3-a771-329f-9a68-af2fa357d759', 'Dicta minima at perferendis.', 'Similique aspernatur deserunt omnis deserunt. Eos iste voluptates quidem voluptatem. Ratione pariatur ea nisi fugit assumenda voluptas. Aut at quia minima officiis in.', 'open', 'text', '1', '3', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('12', '98a7f5bb-b458-338e-9ce4-cb02b7fb502a', 'a6ae76f0-8449-3109-b348-ecedd3b34b6e', 'Nemo odit debitis itaque blanditiis assumenda vel.', 'Consectetur dolorum quis tempore eos. Mollitia sint fugit ut ipsam laboriosam. Vero quia omnis enim atque.', 'open', 'text', '1', '3', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('13', '98a7f5bb-b458-338e-9ce4-cb02b7fb502a', 'f52847ea-510e-3afc-a69c-8a523c1a00e0', 'Sunt quia aut et qui.', 'Esse error nobis ut labore commodi incidunt magni cupiditate. Dolorem ad ex explicabo nulla. A asperiores excepturi reprehenderit quisquam sed natus repellat.', 'open', 'text', '1', '3', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('14', '98a7f5bb-b458-338e-9ce4-cb02b7fb502a', 'e9006458-e0c5-3e8d-8a21-0a9da382423b', 'Iure voluptatem et quidem voluptas ea temporibus accusamus.', 'Impedit sint mollitia est sed. Tenetur sequi asperiores aspernatur sequi. Rem nam aut quidem rem recusandae occaecati.', 'open', 'text', '1', '3', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('15', '98a7f5bb-b458-338e-9ce4-cb02b7fb502a', '474f3efe-e749-3dc8-8a3a-9dc1c6f48c3e', 'Rerum ducimus qui quas eos.', 'Voluptatem odit est quidem ratione ut nemo rem. Quo rerum soluta optio aperiam corrupti. Numquam et quo ut voluptatem delectus.', 'open', 'text', '1', '3', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('16', '98a7f5bb-b458-338e-9ce4-cb02b7fb502a', '4d713ba6-f771-3220-bf43-fa3fab6d6b62', 'Veniam facilis modi accusamus et quod nisi in.', 'Rerum veniam perspiciatis dolor sit natus et eum. Harum recusandae et aut libero odit. Hic et quos libero quia ut nostrum. Id officia tenetur ut.', 'open', 'text', '1', '3', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('17', '98a7f5bb-b458-338e-9ce4-cb02b7fb502a', 'c0594a97-dbcb-3d0b-85ab-369a074346e4', 'Voluptas est dolorem temporibus saepe voluptas et quas doloribus.', 'Consequatur in voluptas et delectus. Est enim qui harum voluptas.', 'open', 'text', '1', '3', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('18', '98a7f5bb-b458-338e-9ce4-cb02b7fb502a', '334c6d44-ec1f-3b3e-83d5-e24951d55f19', 'Earum distinctio delectus quo asperiores accusantium.', 'Et quisquam et dolor sed dolores. Omnis qui eum voluptatem consequatur ipsa. Doloremque dicta tempore exercitationem iste eaque quae.', 'open', 'text', '1', '3', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('19', '98a7f5bb-b458-338e-9ce4-cb02b7fb502a', 'ec023cb0-ded3-3b7d-ac38-f58647530454', 'Doloremque ipsam tempora commodi numquam.', 'Impedit et laboriosam temporibus rerum mollitia nisi. Vero tenetur et quo molestias. Iure est blanditiis quia nostrum quas.', 'open', 'text', '1', '3', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('20', '98a7f5bb-b458-338e-9ce4-cb02b7fb502a', 'ca584fa8-73d2-3686-a450-75132f7b9876', 'Omnis eum et cupiditate officia occaecati sit fugiat unde.', 'Facilis ratione rerum et modi soluta commodi quis. Neque dolores excepturi porro. Similique dolore tempora similique labore repellat.', 'open', 'text', '1', '3', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('21', 'f194de9e-c229-3f07-ade5-c2c72849d699', 'ecbd2a63-1ee1-3e81-8f51-98149f908b93', 'Sed voluptas debitis quas optio.', 'In quo molestiae unde voluptatem dignissimos. Labore ab totam sint tenetur. Id voluptas fugit suscipit maiores in vel.', 'open', 'text', '1', '4', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('22', 'f194de9e-c229-3f07-ade5-c2c72849d699', 'ea343cee-f36e-3c2c-ae5f-aa37cfe6f698', 'Odio quia ut earum vitae.', 'Eum sed excepturi consequuntur nulla. Modi veniam iure est id debitis et odio. Rem eius aut non qui. Earum fuga consequuntur nisi facere dolores.', 'open', 'text', '1', '4', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('23', 'f194de9e-c229-3f07-ade5-c2c72849d699', '202a4d85-39bd-3fd7-b561-0a542667b397', 'Autem rerum dolores vel.', 'Nulla est est facilis occaecati. Neque cumque corporis veritatis quae voluptatem. Ipsa omnis optio voluptatem eum animi maxime.', 'open', 'text', '0', '4', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('24', 'f194de9e-c229-3f07-ade5-c2c72849d699', 'f2cab7f3-b42c-3990-937b-13c3ed7adeec', 'Distinctio iure consequatur veritatis sit voluptate rerum.', 'Suscipit earum est suscipit vel alias. Ipsam consequatur eaque sint sunt consequatur reprehenderit corporis qui. Dicta quia voluptate eos asperiores at voluptate.', 'open', 'text', '1', '4', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('25', 'f194de9e-c229-3f07-ade5-c2c72849d699', '8becacf3-91c2-304f-af05-ce2e910b0346', 'Odit enim voluptas fugit delectus officia.', 'Voluptatem et ipsum voluptatem. Assumenda dolores a omnis et recusandae accusantium in nostrum. Numquam quae labore quo debitis voluptatem.', 'open', 'text', '0', '4', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('26', 'f194de9e-c229-3f07-ade5-c2c72849d699', '827388f6-156d-374b-8b04-ca78aae75b1a', 'Autem consectetur ducimus officia aut accusamus et.', 'Neque nostrum omnis ullam voluptas a ut culpa. Voluptas voluptatem sit voluptas dolore. Saepe in aperiam perspiciatis aut. Consequatur dignissimos nihil dolores sunt.', 'open', 'text', '1', '4', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('27', 'f194de9e-c229-3f07-ade5-c2c72849d699', '3f89375a-7116-38a0-90fb-4e11d5fa8777', 'Perspiciatis amet nam aut rerum.', 'Quisquam voluptas qui neque qui ut placeat eaque. Rem deserunt atque sint eius. Illo et doloribus omnis. Quis architecto officia eligendi nihil iure odio. Qui nemo debitis minima.', 'open', 'text', '1', '4', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('28', 'f194de9e-c229-3f07-ade5-c2c72849d699', '73c25c45-a92b-35ab-af84-549c23fc17a6', 'Et qui eos sequi tenetur quibusdam quas.', 'Non neque error rerum mollitia maxime animi. Commodi illo totam fugiat nihil quia eius. Sit deserunt eum dolores nostrum reiciendis. Natus fugiat dolor ut doloremque eum consectetur.', 'open', 'text', '1', '4', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('29', 'f194de9e-c229-3f07-ade5-c2c72849d699', 'ca9fd4c6-fb38-3a9c-9918-04ae607f9e97', 'Accusamus qui sed est quisquam quidem ut blanditiis eum.', 'Nulla et incidunt molestiae alias sit omnis eum cumque. Accusamus et occaecati quo. Perspiciatis inventore id iste a corporis illo. Dolore voluptas ipsam aliquam quod magnam.', 'open', 'text', '1', '4', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('30', 'f194de9e-c229-3f07-ade5-c2c72849d699', 'ba728e75-0844-3feb-b991-d78f85753a0b', 'Harum id velit reiciendis vel et quibusdam possimus.', 'Temporibus ducimus distinctio saepe voluptatem autem. Natus non quibusdam natus. Molestias nobis blanditiis natus. Et qui fugiat rem tempore voluptas repellat eos.', 'open', 'text', '1', '4', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('31', 'c0fdbfe9-0dbe-334b-814a-291159b82685', '56f924ca-71fc-3b08-a02e-167a4f8010e0', 'Tenetur beatae molestiae ducimus quia est voluptas rerum autem.', 'Exercitationem minima eum eum a. Fugiat dolore explicabo enim ea. Quidem ipsam ipsa vel voluptate natus consectetur natus. Omnis iste nemo illo.', 'open', 'text', '1', '5', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('32', 'c0fdbfe9-0dbe-334b-814a-291159b82685', '6c0c15d0-a35d-3cf9-80d8-bc24d40617b0', 'Unde quia atque ut magni ipsa.', 'Sed fuga molestiae hic labore reprehenderit. Fugit fuga deleniti facere recusandae. Vel vel consequuntur et ut et.', 'open', 'text', '1', '5', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('33', 'c0fdbfe9-0dbe-334b-814a-291159b82685', '51440805-a8d3-37ed-b5b5-90d4b3d02252', 'Ut assumenda est ut ipsam.', 'Minus repellendus qui reiciendis nihil corporis eos. Rem vitae et nam ullam. Et dolorum sit incidunt.', 'open', 'text', '1', '5', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('34', 'c0fdbfe9-0dbe-334b-814a-291159b82685', 'aeba0b36-6033-3c76-9ff7-8b9e5a72bfb2', 'Assumenda eum dignissimos tenetur consequatur.', 'Qui ut animi fuga est. Tenetur debitis officiis accusantium ipsa. Corporis et ut ullam dolor corrupti omnis. Voluptatibus aut dolores magnam voluptatem dolore distinctio nam.', 'open', 'text', '1', '5', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('35', 'c0fdbfe9-0dbe-334b-814a-291159b82685', '50895693-f8d1-30c3-be20-6eb66b1278f6', 'Dignissimos qui error vero reiciendis necessitatibus et ea.', 'Recusandae inventore distinctio ducimus quaerat et perferendis autem. Vitae dolores consequatur saepe quibusdam magnam maiores consequuntur. Ex ut dignissimos in iure assumenda voluptatem.', 'open', 'text', '1', '5', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('36', 'c0fdbfe9-0dbe-334b-814a-291159b82685', '0bab0d40-4894-3e2c-ad79-ae1cdf789e3c', 'Sunt atque aperiam sed.', 'Possimus fugit quisquam dolorum totam. Est sit necessitatibus nihil earum. Id placeat et debitis voluptatum a laboriosam. Occaecati ipsa enim quam asperiores consequuntur necessitatibus.', 'open', 'text', '1', '5', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('37', 'c0fdbfe9-0dbe-334b-814a-291159b82685', '28aeed19-b427-3349-a295-b6dfb5418a7b', 'Est aut est consequatur rerum ratione.', 'Repellendus non ullam dolor sed. Saepe quos qui occaecati rerum maxime labore eos. Repellat esse magnam nisi consequuntur et illo non. Omnis aut et voluptatem aut dolores consequatur exercitationem.', 'open', 'text', '1', '5', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('38', 'c0fdbfe9-0dbe-334b-814a-291159b82685', '8ff0fa9a-4bd6-369b-92ae-f0d2774c7d68', 'Deleniti eum maxime quasi explicabo quas omnis corrupti dolorum.', 'Incidunt harum dicta repellat veritatis fugit et ea. Molestias pariatur suscipit tenetur corporis aut sit dolor sequi. Quam deserunt autem consequuntur facere. Eius rerum ut quod nihil quo.', 'open', 'text', '1', '5', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('39', 'c0fdbfe9-0dbe-334b-814a-291159b82685', 'dec6dc4f-b105-3f70-b174-c7c2d834e168', 'Est commodi iure maxime voluptatibus quia debitis quod.', 'Qui quibusdam qui iure et totam. Id porro ea doloremque sint repellendus. Itaque quos non commodi repellat. Et quidem sunt dolor. Ut dolorum incidunt accusamus enim aperiam sed omnis.', 'open', 'text', '1', '5', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('40', 'c0fdbfe9-0dbe-334b-814a-291159b82685', '4a64df3d-5494-34ca-990e-7be63440dc36', 'Totam consequatur eligendi aspernatur.', 'Praesentium incidunt autem illum nam quas. Aut culpa qui dolores dolorum ullam. Et eos quaerat dignissimos facere. Quisquam non perspiciatis voluptas.', 'open', 'text', '1', '5', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('41', 'bd9e70c5-f226-3adb-9ebb-0b32999ef430', 'f63adf1a-21c9-3ecb-953c-584b8dd1b6d2', 'Magnam assumenda velit consectetur est.', 'Ab cupiditate velit placeat mollitia doloremque vero laudantium. Natus pariatur voluptatum in voluptatem voluptatem hic maiores.', 'open', 'text', '1', '6', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('42', 'bd9e70c5-f226-3adb-9ebb-0b32999ef430', '38dbb3b2-fefe-3a22-b694-d27808f01f2a', 'Ex distinctio voluptatum similique dolores corporis.', 'Assumenda molestias officiis et. Voluptate cupiditate asperiores aut a. Eaque quo qui vitae consequuntur. Libero sequi perspiciatis dicta quam eos suscipit sequi quas.', 'open', 'text', '1', '6', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('43', 'bd9e70c5-f226-3adb-9ebb-0b32999ef430', '5b674f9e-5042-352e-9870-ce27a7a048f0', 'Beatae nam ut odio dolorem nemo enim aut.', 'Rerum enim non et ut. Quia praesentium tempora dolor perferendis.', 'open', 'text', '1', '6', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('44', 'bd9e70c5-f226-3adb-9ebb-0b32999ef430', '99b013b5-68c3-3dbd-9f61-888c843975d6', 'Asperiores non aut qui labore fugiat aspernatur et.', 'Nihil sed dolores sunt et recusandae. Quaerat provident possimus aut cupiditate sit ea. Ea optio et veniam ab. Minima fugit rerum qui iure esse ut est.', 'open', 'text', '1', '6', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('45', 'bd9e70c5-f226-3adb-9ebb-0b32999ef430', '64baab4b-c198-3863-9bbf-df7560fdf413', 'Et aut sit animi eos.', 'Ad fugiat maxime alias quas ipsa porro. Minima facere libero voluptatum similique molestiae omnis ex qui. Aspernatur laboriosam veniam doloribus aperiam dolores optio sit.', 'open', 'text', '1', '6', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('46', 'bd9e70c5-f226-3adb-9ebb-0b32999ef430', '55a0be18-5e31-3b71-83d6-1a1fa9aa73c0', 'Vel reprehenderit non velit dolores.', 'Accusantium natus dignissimos et perferendis eligendi nostrum. Et iusto sunt vel sed voluptas. Quas rem aut voluptas odit.', 'open', 'text', '1', '6', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('47', 'bd9e70c5-f226-3adb-9ebb-0b32999ef430', '206c7876-d0c0-3d7d-aec5-74ddcef309ae', 'Qui consequuntur excepturi et repellat velit.', 'Sint similique est ut nulla perspiciatis commodi fugiat. Modi voluptatem facilis provident consequatur. Soluta deserunt sunt vero nisi voluptatibus et. Eos quia aliquam assumenda porro laboriosam.', 'open', 'text', '1', '6', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('48', 'bd9e70c5-f226-3adb-9ebb-0b32999ef430', '5c8778ec-1178-343d-8ddd-5fc62bb57e1e', 'Eos exercitationem eos ducimus aut eligendi eos.', 'Magnam tempore eos quia dolor error maiores placeat fugiat. Accusantium dolores officiis voluptatem illum commodi. Vero et reiciendis deserunt pariatur saepe inventore quia.', 'open', 'text', '1', '6', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('49', 'bd9e70c5-f226-3adb-9ebb-0b32999ef430', '86e503cd-0511-3c98-9f4d-9d74912c3ae9', 'Rerum impedit velit reprehenderit rerum distinctio enim non.', 'Sit assumenda voluptate qui. Sequi voluptas repellat qui commodi enim. Consectetur est eos qui ipsa facilis. Id aut repudiandae earum esse laborum. Quia consequatur sunt eius quasi.', 'open', 'text', '1', '6', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('50', 'bd9e70c5-f226-3adb-9ebb-0b32999ef430', '516347b8-4b30-39a7-9767-1b618631a040', 'Voluptate molestias iste sit inventore quae dignissimos.', 'Ut in voluptatibus velit nesciunt mollitia voluptatem. Ducimus assumenda officia illum ratione. Quos laborum doloremque est totam similique.', 'open', 'text', '1', '6', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('51', 'af82d5c1-a888-39c9-86e3-59ba569ee7cb', 'b7b22909-80d3-3ae7-bd86-2f2e9ed97a0a', 'Iste repudiandae quidem doloribus magnam voluptatem in occaecati maiores.', 'Odit ipsam porro qui enim quae incidunt voluptas. Aut accusamus natus necessitatibus.', 'open', 'text', '1', '7', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('52', 'af82d5c1-a888-39c9-86e3-59ba569ee7cb', 'a8eedaec-4a94-366a-85db-f14b2fb0e836', 'Provident et quod a molestiae accusantium.', 'Aliquid impedit explicabo placeat voluptatum ut sint. Architecto et aut modi. Quod cumque et sit.', 'open', 'text', '1', '7', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('53', 'af82d5c1-a888-39c9-86e3-59ba569ee7cb', '904b1f75-3c76-36ba-9a77-f90462cd44a7', 'Veniam rerum earum sint architecto voluptas.', 'Ut qui nostrum quis. Laboriosam rerum et odio et. Occaecati illum eaque excepturi. Quas nobis culpa qui non suscipit occaecati.', 'open', 'text', '1', '7', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('54', 'af82d5c1-a888-39c9-86e3-59ba569ee7cb', 'c2db4dff-0607-33d2-942c-1268a2e6a2c2', 'Velit explicabo dolores modi.', 'Id nulla vero quasi quis aut. Beatae quis eius autem dicta sequi a saepe. Quos porro maiores at qui quia. Qui perferendis expedita asperiores. Voluptatem architecto id quia perferendis molestiae.', 'open', 'text', '1', '7', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('55', 'af82d5c1-a888-39c9-86e3-59ba569ee7cb', '3877c39c-db05-3e1c-85ec-6ce9ef6f6098', 'Dolorem facilis velit dolores voluptatem quo.', 'Odio repudiandae expedita ullam minima doloremque ullam aperiam dicta. Odio minus cupiditate consequatur amet vero sint beatae. Qui officia officiis quae et.', 'open', 'text', '1', '7', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('56', 'af82d5c1-a888-39c9-86e3-59ba569ee7cb', 'e56d5bc6-b978-33b3-b138-79bca3adfb01', 'Non minima hic quis dolorem facere.', 'Nam consequuntur ea qui nostrum eius. Amet occaecati deleniti velit necessitatibus voluptatem. Facilis nobis vero reiciendis maxime.', 'open', 'text', '1', '7', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('57', 'af82d5c1-a888-39c9-86e3-59ba569ee7cb', '4ebfeeb2-c678-3c0c-922e-734ac5145993', 'Minima autem veritatis aut rem aut veniam quisquam nam.', 'Soluta eaque voluptatum iusto nulla suscipit dicta aut fuga. Rerum alias et ut a maxime iure quis. Rerum quibusdam omnis voluptatem in voluptatem. Eos provident iure qui sapiente labore omnis.', 'open', 'text', '1', '7', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('58', 'af82d5c1-a888-39c9-86e3-59ba569ee7cb', 'de313793-85d1-3423-8dbd-51756d4ee407', 'Cupiditate magnam eveniet deleniti ut cum optio voluptates.', 'Pariatur libero deserunt in rerum eius consequatur minus. Modi exercitationem dolorem ipsum aut. Sit quidem accusantium neque odio blanditiis excepturi.', 'open', 'text', '1', '7', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('59', 'af82d5c1-a888-39c9-86e3-59ba569ee7cb', 'c7d3dc5a-d141-3c53-a0fb-79d0e6a757b6', 'Unde aliquam id dolorum sunt.', 'Amet totam et corrupti beatae autem. Non laborum tempore cumque deserunt aut ea aut. Non inventore quia voluptatem ducimus repudiandae et. Consectetur dolor sed error.', 'open', 'text', '1', '7', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('60', 'af82d5c1-a888-39c9-86e3-59ba569ee7cb', 'e9f29266-e65a-3486-b458-9a49a461c733', 'Et at magnam cupiditate est commodi consequuntur sunt.', 'Id atque voluptatem ut quam quam. Repellat nulla est ratione. Architecto animi qui voluptas quisquam et nostrum.', 'open', 'text', '1', '7', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('61', '2f17d1ed-fd46-30d9-877a-c32c593a5176', '0ec1ac75-33c3-3c2e-b920-ccb365b0cf4a', 'Saepe optio repellat est distinctio.', 'Porro consequatur rerum autem. Et in sed ratione et quisquam iure. Et laborum iure laboriosam soluta et voluptatibus et.', 'open', 'text', '1', '8', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('62', '2f17d1ed-fd46-30d9-877a-c32c593a5176', '8ed073ab-8bb2-3ca3-8c7d-9543d9414ebb', 'Nemo architecto voluptatem provident possimus rerum nostrum aut omnis.', 'Architecto et at placeat enim vitae. Voluptas sequi cum sit et culpa. Nihil sit fuga non labore et eius itaque.', 'open', 'text', '1', '8', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('63', '2f17d1ed-fd46-30d9-877a-c32c593a5176', '27d76c34-a6ba-3acb-a4d6-44f37938168f', 'Iure omnis corrupti harum nostrum.', 'Doloribus soluta commodi a nesciunt quaerat. Optio facilis inventore excepturi tempora deserunt voluptatem. Aut sed id et officia odio in.', 'open', 'text', '1', '8', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('64', '2f17d1ed-fd46-30d9-877a-c32c593a5176', '0a95ca9a-54fd-30ac-b202-6cba4ec421dc', 'Vel harum sed quia adipisci doloribus.', 'Itaque reiciendis quis sunt dolorem alias culpa similique. Eum rerum non et nihil id provident porro natus.', 'open', 'text', '1', '8', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('65', '2f17d1ed-fd46-30d9-877a-c32c593a5176', '7c8e6db9-941c-3662-bde9-573101a2dcfb', 'Hic quidem ipsam beatae est amet aut sint.', 'Quas blanditiis minima alias debitis. Optio commodi voluptatum perferendis repellendus saepe sint excepturi quis. Soluta incidunt aut deserunt quia autem consequatur blanditiis.', 'open', 'text', '0', '8', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('66', '2f17d1ed-fd46-30d9-877a-c32c593a5176', '1eda5c06-9e16-32ef-99c0-8c21f6ef7953', 'Mollitia doloribus accusamus ducimus omnis eos.', 'Dolores autem quod eos. Ut asperiores voluptas minus dolores enim blanditiis. Soluta fugit fugiat ut ducimus.', 'open', 'text', '0', '8', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('67', '2f17d1ed-fd46-30d9-877a-c32c593a5176', '089b5e3c-d852-338e-9d7c-d3ab2996e07b', 'Suscipit aut neque ut cupiditate est.', 'Suscipit inventore beatae neque explicabo. Officia voluptas id non sit dolor eos accusamus. Soluta et rerum corrupti incidunt voluptas sit. Deleniti soluta occaecati qui omnis blanditiis corrupti.', 'open', 'text', '1', '8', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('68', '2f17d1ed-fd46-30d9-877a-c32c593a5176', '2d31e58a-128c-3cd7-92bb-ae7a57a12380', 'Sit laboriosam dolorum qui in.', 'Doloremque alias laboriosam cum. Molestias quasi nostrum reprehenderit laborum illum dignissimos qui. Iure numquam ullam exercitationem distinctio labore.', 'open', 'text', '1', '8', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('69', '2f17d1ed-fd46-30d9-877a-c32c593a5176', '6a61fe95-0418-3006-840a-e4179145a9bf', 'Ea quo architecto aut cumque ipsam dolorum et.', 'Optio aut enim voluptas fugiat nobis omnis. Officiis quasi dicta doloribus commodi ratione nulla. Numquam est qui nisi.', 'open', 'text', '1', '8', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('70', '2f17d1ed-fd46-30d9-877a-c32c593a5176', '02be43ac-fe15-3c26-b011-6c326ede0f61', 'Nisi voluptas dolorum officiis non iusto nostrum.', 'Excepturi ut magnam voluptas. Voluptas vitae sint blanditiis molestiae. Eligendi natus dolorem voluptatum et quia voluptas.', 'open', 'text', '1', '8', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('71', 'd3f2c938-8c7c-31d5-9e5f-6fc009d00793', '354ed517-d9f4-3c61-81dc-54f728f28009', 'Occaecati ducimus quod error molestiae cumque iure.', 'Quo ut est doloribus voluptatem. Magni quis quam consequatur aut. Animi nam dolor voluptate voluptas et sed.', 'open', 'text', '0', '9', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('72', 'd3f2c938-8c7c-31d5-9e5f-6fc009d00793', '12fc5fb6-8e96-309a-98c8-3ca6505657fd', 'Quidem aspernatur saepe distinctio quia aliquid odit.', 'Voluptatem omnis rerum eum eius eos. Non neque fuga quisquam labore recusandae qui rerum laudantium. Cumque dicta non ut perspiciatis consequatur aut qui.', 'open', 'text', '1', '9', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('73', 'd3f2c938-8c7c-31d5-9e5f-6fc009d00793', '2eb56005-5326-3889-9eec-12638d466da3', 'Consectetur et est quasi et.', 'Ea a doloribus aliquid repellendus corrupti aut. Impedit pariatur nulla consectetur optio reiciendis doloribus. Tenetur velit sit repellendus et.', 'open', 'text', '0', '9', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('74', 'd3f2c938-8c7c-31d5-9e5f-6fc009d00793', '56fd31b1-4422-3804-be00-628f81a80c64', 'Iure vel quis dolorum numquam est et.', 'Voluptatem ut qui totam voluptatem maiores qui. Saepe magni minus numquam nisi nihil et ut. Ipsum qui qui at magnam. Natus vitae optio non dolores odio. In voluptatem corporis consequatur tempora ea.', 'open', 'text', '1', '9', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('75', 'd3f2c938-8c7c-31d5-9e5f-6fc009d00793', 'bc9b89f9-e367-351a-8ee3-fe1920183462', 'Reiciendis voluptates deleniti veritatis.', 'Sit ut dignissimos est vel quidem. Aut placeat optio aliquam esse et. Vel id fugiat aspernatur autem sint autem.', 'open', 'text', '1', '9', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('76', 'd3f2c938-8c7c-31d5-9e5f-6fc009d00793', '2c841879-b616-3e74-86b9-b6abcc735fb9', 'Laborum consequatur eum at omnis rerum harum.', 'Consequatur ut a saepe deleniti. Reiciendis totam sapiente dolor iure a neque ut. Facere explicabo ab id cum libero eaque.', 'open', 'text', '0', '9', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('77', 'd3f2c938-8c7c-31d5-9e5f-6fc009d00793', '81999d7c-eb4d-3912-867b-dbb1f6239ff1', 'Officiis sed ea corrupti amet.', 'Sit voluptatem voluptatibus reprehenderit perspiciatis assumenda saepe eos. Quod porro blanditiis tempora veniam quam quo.', 'open', 'text', '1', '9', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('78', 'd3f2c938-8c7c-31d5-9e5f-6fc009d00793', 'f68bb0fa-bb22-3fae-a01c-6192cf2e29e6', 'Qui laborum enim velit eveniet harum occaecati.', 'Aut dolor corrupti corrupti distinctio tenetur corrupti aspernatur id. Consequatur vitae fugit est. Sit qui consequatur voluptatem voluptatem corporis magni quasi.', 'open', 'text', '1', '9', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('79', 'd3f2c938-8c7c-31d5-9e5f-6fc009d00793', '4b2b309e-7a21-3414-a37e-547cb952cc14', 'Aliquam ut et labore adipisci.', 'Quod accusantium quisquam qui cumque. Sunt repellendus aut sunt architecto deleniti. Aliquid a porro quod numquam autem est aut quam. Dolores consequatur quas veritatis.', 'open', 'text', '1', '9', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('80', 'd3f2c938-8c7c-31d5-9e5f-6fc009d00793', '5acd0b52-4dde-3ffe-8f68-081f0a8e3c23', 'Molestiae quae voluptatem totam necessitatibus eum.', 'Et beatae consequatur nam est dicta qui. Doloremque est in rerum quibusdam nostrum. Repellat blanditiis eum minus vitae dolores nulla.', 'open', 'text', '0', '9', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('81', '15d44c2e-c7b0-3fc4-bb55-faf1d29abf44', '7f41debf-c669-3e62-8613-9553a6341896', 'Molestiae ea ex nesciunt repellat.', 'Reprehenderit accusantium iure itaque et. Eveniet occaecati totam id alias. Aut itaque enim porro velit explicabo.', 'open', 'text', '1', '10', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('82', '15d44c2e-c7b0-3fc4-bb55-faf1d29abf44', 'c21c528f-f94d-36b3-8097-7729dd6136d6', 'Non vel ut veniam consectetur natus sint ut.', 'Maiores nihil autem nulla nemo minus. Et aut sed consequuntur sit id qui sed. In est minus sit nihil.', 'open', 'text', '1', '10', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('83', '15d44c2e-c7b0-3fc4-bb55-faf1d29abf44', 'f3e436ce-bd79-3fc0-8924-c12cc4a98ebc', 'Sint et omnis delectus consequatur iure repellat odit.', 'Est voluptate hic id eveniet unde. Perspiciatis fugiat dolores quod eum alias. Esse expedita eum voluptas illum nobis voluptate deleniti.', 'open', 'text', '1', '10', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('84', '15d44c2e-c7b0-3fc4-bb55-faf1d29abf44', '52510ab6-6703-385b-9299-98cfbcb26b7a', 'Quisquam doloremque explicabo eaque dolores.', 'Expedita voluptatem veritatis consectetur quisquam maiores aut error. Voluptate voluptatum quam enim quisquam. Esse rerum assumenda et inventore suscipit.', 'open', 'text', '0', '10', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('85', '15d44c2e-c7b0-3fc4-bb55-faf1d29abf44', '1bb6614c-ecd6-35b8-bf12-b6d14005f3ee', 'Neque earum harum possimus quia eaque rerum in.', 'Reiciendis laboriosam praesentium voluptatem excepturi laudantium. Dolorem ea et sed blanditiis ducimus odit. Molestiae ipsa pariatur dolorem ut. Sint rerum exercitationem dicta.', 'open', 'text', '1', '10', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('86', '15d44c2e-c7b0-3fc4-bb55-faf1d29abf44', 'e8f6fad6-58cb-3eaa-9f57-c32772bde960', 'Voluptate nam ipsum harum esse.', 'Voluptate nihil consequatur enim quo exercitationem dolor. Ab temporibus culpa nobis a. Recusandae vitae esse dolor delectus ad.', 'open', 'text', '0', '10', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('87', '15d44c2e-c7b0-3fc4-bb55-faf1d29abf44', 'b57b2a11-75ac-3460-905e-494d931ee11a', 'Qui corporis tenetur excepturi dolores impedit.', 'Voluptas dolorum molestiae omnis aperiam. Qui est voluptas deserunt vero. Tempora inventore et voluptas aut eum non quisquam.', 'open', 'text', '1', '10', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('88', '15d44c2e-c7b0-3fc4-bb55-faf1d29abf44', 'f1a6ffec-3ef3-3014-853b-be33e6dd1ed7', 'Non quia necessitatibus itaque atque et.', 'Et natus quia iste repudiandae. Et nesciunt officiis alias id sed pariatur. Sed atque est laudantium eum est.', 'open', 'text', '0', '10', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('89', '15d44c2e-c7b0-3fc4-bb55-faf1d29abf44', '130b4e9b-af50-3d6c-9206-268652ba6b9a', 'Deleniti ea itaque molestiae sunt et unde tempora.', 'Laboriosam et est aliquid occaecati vero non. Natus eveniet facere corporis consequatur. A itaque aut architecto totam. Nesciunt delectus ipsam vitae culpa dolorem aperiam sunt.', 'open', 'text', '0', '10', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('90', '15d44c2e-c7b0-3fc4-bb55-faf1d29abf44', 'ecd75d6d-c3ab-31f4-b8d6-4d891a931eba', 'Maxime odio qui quos aut esse est.', 'Esse enim amet omnis ut qui quam enim. Qui dolore nam non in. Est delectus illo laborum perspiciatis.', 'open', 'text', '1', '10', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('91', '5a117452-ee11-343c-bf17-d38d60008144', '8daa140a-814d-3064-a725-fdbbaf356b95', 'Odio nihil id consectetur et aut et unde ab.', 'Itaque quo et ad fuga optio. Suscipit eos assumenda nulla repellendus ipsa impedit eos suscipit. Non in ut voluptatem neque sint soluta perferendis maiores.', 'open', 'text', '0', '11', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('92', '5a117452-ee11-343c-bf17-d38d60008144', '009c2932-0ca5-37ed-ad6b-b3f958b67089', 'Iure illum cumque amet numquam aut.', 'Natus quo accusantium error fugit et. Ipsum asperiores neque aut ullam quidem voluptas impedit. Et laborum accusamus voluptatem voluptatum animi autem ut.', 'open', 'text', '1', '11', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('93', '5a117452-ee11-343c-bf17-d38d60008144', 'ab14d850-6169-3d00-8a2d-65d77b8feb52', 'Voluptates quos eaque totam velit autem iure.', 'Quis ipsum libero omnis repudiandae debitis. Qui ut labore voluptatem ut fugiat. Soluta exercitationem est facere est non id.', 'open', 'text', '1', '11', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('94', '5a117452-ee11-343c-bf17-d38d60008144', '78ddeab0-6c72-3241-88e6-8e98de048613', 'Inventore blanditiis eius nisi et dolorem officia.', 'Dolore cum aut vero consectetur et iste. Consequatur fugiat nesciunt in sint. Laudantium tempore nemo quasi et et. Minima ullam explicabo sed mollitia et.', 'open', 'text', '1', '11', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('95', '5a117452-ee11-343c-bf17-d38d60008144', '679d1728-5d49-31c4-8232-02d3cb7e343d', 'Reiciendis et eaque officiis eos soluta dolorem.', 'Veniam possimus eos voluptatem tempora maiores. Illo neque mollitia illo velit.', 'open', 'text', '0', '11', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('96', '5a117452-ee11-343c-bf17-d38d60008144', 'f278c94c-e87c-38bb-9908-92a025ceacb0', 'Quis tenetur molestias explicabo voluptatem.', 'Nemo nostrum dolor ea ut. Tempora et distinctio eum voluptatem nostrum dolorem sint.', 'open', 'text', '0', '11', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('97', '5a117452-ee11-343c-bf17-d38d60008144', 'c1829ac7-14f5-3759-ba78-7911038ce9ac', 'Reiciendis quidem nemo non recusandae repudiandae.', 'Occaecati culpa ut sit et unde cum voluptatem. Dolorem dolores eum libero qui magni totam. Quis qui corporis placeat et eos illum quae.', 'open', 'text', '1', '11', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('98', '5a117452-ee11-343c-bf17-d38d60008144', '27c1c46c-387f-325f-b2d1-81e3d9d026a4', 'Corrupti eius saepe dolore.', 'Ipsum quis consequatur ipsa voluptatem asperiores dolorem facilis. Excepturi a ut saepe.', 'open', 'text', '1', '11', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('99', '5a117452-ee11-343c-bf17-d38d60008144', '593d2aed-220a-34b6-b9f5-25a8f38b3b50', 'Inventore ducimus qui et omnis praesentium at.', 'Iure porro porro optio. Ipsam quod alias eius eligendi quod minus. Sint ipsam quis et quae id architecto. Ad aut excepturi iusto qui aut distinctio.', 'open', 'text', '1', '11', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);
INSERT INTO `posts` VALUES ('100', '5a117452-ee11-343c-bf17-d38d60008144', 'a0d715ee-c314-357c-a08a-1722db95ae3a', 'Voluptatem dolores qui officia iusto ex autem.', 'Perferendis unde quod tenetur sint occaecati distinctio. Ex optio voluptas sit voluptas. Dolor adipisci ea sunt ut sunt fuga. Nam incidunt sapiente animi.', 'open', 'text', '1', '11', '2018-12-10 05:24:50', '2018-12-10 05:24:50', null, null, null);

-- ----------------------------
-- Table structure for post_audios
-- ----------------------------
DROP TABLE IF EXISTS `post_audios`;
CREATE TABLE `post_audios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mime_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of post_audios
-- ----------------------------

-- ----------------------------
-- Table structure for post_favourites
-- ----------------------------
DROP TABLE IF EXISTS `post_favourites`;
CREATE TABLE `post_favourites` (
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of post_favourites
-- ----------------------------

-- ----------------------------
-- Table structure for post_pictures
-- ----------------------------
DROP TABLE IF EXISTS `post_pictures`;
CREATE TABLE `post_pictures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mime_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of post_pictures
-- ----------------------------

-- ----------------------------
-- Table structure for post_video_links
-- ----------------------------
DROP TABLE IF EXISTS `post_video_links`;
CREATE TABLE `post_video_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of post_video_links
-- ----------------------------

-- ----------------------------
-- Table structure for staffs
-- ----------------------------
DROP TABLE IF EXISTS `staffs`;
CREATE TABLE `staffs` (
  `id` int(11) NOT NULL,
  `manage_users` tinyint(1) NOT NULL,
  `manage_categories` tinyint(1) NOT NULL,
  `manage_posts` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of staffs
-- ----------------------------
INSERT INTO `staffs` VALUES ('1', '1', '1', '1');
INSERT INTO `staffs` VALUES ('2', '0', '1', '1');
INSERT INTO `staffs` VALUES ('12', '0', '1', '0');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Adminstrator', 'admin@admin.com', '2018-12-17 19:33:13', '900150983cd24fb0d6963f7d28e17f72', 'active', 'dsds', null, '2018-12-26 19:33:42');
INSERT INTO `users` VALUES ('2', 'Robert Nienwo', 'makenna92@admin.net', '2018-12-10 05:24:50', '900150983cd24fb0d6963f7d28e17f72', 'active', 'GjdvHhLhMm', '2018-12-10 05:24:50', '2018-12-10 05:24:50');
INSERT INTO `users` VALUES ('3', 'Robert Nienow', 'makenna92@example.net', '2018-12-10 05:24:50', '900150983cd24fb0d6963f7d28e17f72', 'canceled', 'GjdvHhLhMm', '2018-12-10 05:24:50', '2018-12-10 05:24:50');
INSERT INTO `users` VALUES ('4', 'Lorine Rolfson', 'ernesto76@example.com', '2018-12-10 05:24:50', '900150983cd24fb0d6963f7d28e17f72', 'active', 'neaE1RMw1s', '2018-12-10 05:24:50', '2018-12-10 05:24:50');
INSERT INTO `users` VALUES ('5', 'April Douglas', 'konopelski.meaghan@example.org', '2018-12-10 05:24:50', '900150983cd24fb0d6963f7d28e17f72', 'active', 'BNQD5lw704', '2018-12-10 05:24:50', '2018-12-10 05:24:50');
INSERT INTO `users` VALUES ('6', 'Dr. Kaley Jakubowski', 'roman47@example.org', '2018-12-10 05:24:50', '900150983cd24fb0d6963f7d28e17f72', 'active', 'SyjBNK6LuG', '2018-12-10 05:24:50', '2018-12-10 05:24:50');
INSERT INTO `users` VALUES ('7', 'Alaina Mueller', 'asmitham@example.com', '2018-12-10 05:24:50', '900150983cd24fb0d6963f7d28e17f72', 'active', '7wmDtI2piq', '2018-12-10 05:24:50', '2018-12-10 05:24:50');
INSERT INTO `users` VALUES ('9', 'Dr. Eloy Zemlak', 'bode.summer@example.org', '2018-12-10 05:24:50', '900150983cd24fb0d6963f7d28e17f72', 'active', 'ii6PruAjSc', '2018-12-10 05:24:50', '2018-12-10 05:24:50');
INSERT INTO `users` VALUES ('10', 'Adeline Paucek', 'maxie.stanton@example.org', '2018-12-10 05:24:50', '900150983cd24fb0d6963f7d28e17f72', 'active', 'NB1XvNsoA5', '2018-12-10 05:24:50', '2018-12-10 05:24:50');
INSERT INTO `users` VALUES ('11', 'Anita Thompson', 'ibogisich@example.org', '2018-12-10 05:24:50', '900150983cd24fb0d6963f7d28e17f72', 'active', 'Pb62vbtPet', '2018-12-10 05:24:50', '2018-12-10 05:24:50');
INSERT INTO `users` VALUES ('12', 'test', 'test@test.com', null, '900150983cd24fb0d6963f7d28e17f72', 'canceled', null, null, null);
SET FOREIGN_KEY_CHECKS=1;
