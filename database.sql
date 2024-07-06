-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql2.serv00.com
-- Erstellungszeit: 26. Mrz 2024 um 22:53
-- Server-Version: 8.0.35
-- PHP-Version: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `m1170_general`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `admin_id` int NOT NULL,
  `action` varchar(60) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `aeo_table`
--

CREATE TABLE `aeo_table` (
  `winnerip` varchar(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `alert`
--

CREATE TABLE `alert` (
  `id` int NOT NULL,
  `alert` varchar(225) NOT NULL,
  `textcolor` varchar(255) NOT NULL,
  `background` varchar(255) NOT NULL,
  `type` enum('warning','success','error') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'warning'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `avatar`
--

CREATE TABLE `avatar` (
  `user_id` int NOT NULL,
  `head_color` varchar(6) NOT NULL,
  `torso_color` varchar(6) NOT NULL,
  `right_arm_color` varchar(6) NOT NULL,
  `left_arm_color` varchar(6) NOT NULL,
  `right_leg_color` varchar(6) NOT NULL,
  `left_leg_color` varchar(6) NOT NULL,
  `face` int NOT NULL DEFAULT '0',
  `shirt` int NOT NULL DEFAULT '0',
  `pants` int NOT NULL DEFAULT '0',
  `tshirt` int NOT NULL DEFAULT '0',
  `hat1` int NOT NULL DEFAULT '0',
  `hat2` int NOT NULL DEFAULT '0',
  `hat3` int NOT NULL DEFAULT '0',
  `hat4` int NOT NULL DEFAULT '0',
  `hat5` int NOT NULL DEFAULT '0',
  `tool` int NOT NULL DEFAULT '0',
  `head` int NOT NULL DEFAULT '0',
  `cache` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `awards`
--

CREATE TABLE `awards` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `category` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `beta_buy`
--

CREATE TABLE `beta_buy` (
  `id` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `gross` decimal(5,2) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `beta_users`
--

CREATE TABLE `beta_users` (
  `id` int NOT NULL,
  `username` varchar(26) NOT NULL,
  `usernameL` varchar(100) NOT NULL,
  `password` varchar(70) NOT NULL,
  `IP` varchar(46) NOT NULL,
  `birth` date NOT NULL,
  `gender` enum('male','female','hidden') NOT NULL DEFAULT 'hidden',
  `pronouns` enum('she/her','he/him','they/them') DEFAULT NULL,
  `date` date DEFAULT NULL,
  `last_online` datetime NOT NULL,
  `daily_bits` datetime NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `views` int NOT NULL,
  `bucks` int NOT NULL DEFAULT '1',
  `bits` int NOT NULL DEFAULT '10',
  `primary_group` int DEFAULT '-1',
  `power` int NOT NULL DEFAULT '0',
  `avatar_id` int NOT NULL,
  `unique_key` varchar(20) NOT NULL,
  `theme` int NOT NULL,
  `displayname` varchar(26) NOT NULL,
  `invite` int NOT NULL,
  `verifiedshopdev` int NOT NULL,
  `followers` int NOT NULL,
  `jackpot` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `blogs`
--

CREATE TABLE `blogs` (
  `id` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `information` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `author_id` int NOT NULL,
  `pinned` int NOT NULL,
  `image_link` varchar(255) NOT NULL,
  `image_alt` varchar(255) NOT NULL,
  `creation` date DEFAULT NULL,
  `background` varchar(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `clans`
--

CREATE TABLE `clans` (
  `id` int NOT NULL,
  `owner_id` int NOT NULL,
  `name` varchar(26) NOT NULL,
  `tag` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `members` int NOT NULL,
  `approved` enum('yes','no','declined') NOT NULL DEFAULT 'no',
  `funds` int NOT NULL,
  `verified` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `clans_members`
--

CREATE TABLE `clans_members` (
  `id` int NOT NULL,
  `group_id` int NOT NULL,
  `user_id` int NOT NULL,
  `rank` int NOT NULL DEFAULT '1',
  `status` enum('in','out','banned') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `clans_ranks`
--

CREATE TABLE `clans_ranks` (
  `id` int NOT NULL,
  `group_id` int NOT NULL,
  `power` int NOT NULL,
  `name` varchar(26) NOT NULL,
  `perm_ranks` enum('yes','no') NOT NULL,
  `perm_posts` enum('yes','no') NOT NULL,
  `perm_members` enum('yes','no') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `clans_walls`
--

CREATE TABLE `clans_walls` (
  `id` int NOT NULL,
  `group_id` int NOT NULL,
  `owner_id` int NOT NULL,
  `post` varchar(100) NOT NULL,
  `time` datetime NOT NULL,
  `type` enum('pinned','normal','deleted') NOT NULL DEFAULT 'normal'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `crate`
--

CREATE TABLE `crate` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `item_id` int NOT NULL,
  `serial` int NOT NULL DEFAULT '0',
  `payment` enum('bits','bucks') NOT NULL DEFAULT 'bits',
  `price` int NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `own` enum('yes','no') NOT NULL DEFAULT 'yes'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `emails`
--

CREATE TABLE `emails` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `verified` enum('yes','no') NOT NULL DEFAULT 'no',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `forum_banners`
--

CREATE TABLE `forum_banners` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `url` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `forum_boards`
--

CREATE TABLE `forum_boards` (
  `id` int NOT NULL,
  `name` varchar(26) NOT NULL,
  `description` varchar(128) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `forum_posts`
--

CREATE TABLE `forum_posts` (
  `id` int NOT NULL,
  `author_id` int NOT NULL,
  `thread_id` int NOT NULL,
  `body` text NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `forum_threads`
--

CREATE TABLE `forum_threads` (
  `id` int NOT NULL,
  `author_id` int NOT NULL,
  `board_id` int NOT NULL,
  `title` text NOT NULL,
  `body` text NOT NULL,
  `locked` enum('yes','no') NOT NULL DEFAULT 'no',
  `pinned` enum('yes','no') NOT NULL DEFAULT 'no',
  `deleted` enum('yes','no') NOT NULL DEFAULT 'no',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `views` int NOT NULL,
  `latest_post` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `friends`
--

CREATE TABLE `friends` (
  `id` int NOT NULL,
  `from_id` int NOT NULL,
  `to_id` int NOT NULL,
  `status` enum('pending','accepted','declined') NOT NULL DEFAULT 'pending'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `friends`
--

INSERT INTO `friends` (`id`, `from_id`, `to_id`, `status`) VALUES
(1, 1, 2, 'accepted');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `games`
--

CREATE TABLE `games` (
  `id` int NOT NULL,
  `creator_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `playing` int NOT NULL DEFAULT '0',
  `visits` int NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address` varchar(15) NOT NULL,
  `uid` varchar(20) NOT NULL,
  `active` int NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `items`
--

CREATE TABLE `items` (
  `id` int NOT NULL,
  `creator_id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `type` enum('hat','shirt') NOT NULL,
  `robux` int NOT NULL,
  `tickets` int NOT NULL,
  `method` enum('free','both','robux','tickets','offsale') NOT NULL,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `item_comments`
--

CREATE TABLE `item_comments` (
  `id` int NOT NULL,
  `author_id` int NOT NULL,
  `item_id` int NOT NULL,
  `comment` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `list`
--

CREATE TABLE `list` (
  `id` int NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `uploaded` enum('Yes','No') NOT NULL,
  `bits` int NOT NULL DEFAULT '-1',
  `bucks` int NOT NULL DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `log`
--

CREATE TABLE `log` (
  `id` int NOT NULL,
  `action` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `log`
--

INSERT INTO `log` (`id`, `action`, `date`) VALUES
(1, 'User 1 logged in from 0', '2024-03-24 20:06:15'),
(2, 'User 1 logged in from 0', '2024-03-25 00:33:02'),
(3, 'User 1 logged in from 0', '2024-03-25 00:34:52'),
(4, 'User 1 logged in from 0', '2024-03-25 15:44:20');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `membership`
--

CREATE TABLE `membership` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `membership` int NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `length` int NOT NULL,
  `active` enum('yes','no') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `membership_values`
--

CREATE TABLE `membership_values` (
  `value` int NOT NULL,
  `name` varchar(12) NOT NULL,
  `daily_bucks` int NOT NULL,
  `sets` int NOT NULL,
  `items` int NOT NULL,
  `create_clans` int NOT NULL,
  `join_clans` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `author_id` varchar(26) NOT NULL,
  `recipient_id` int NOT NULL,
  `date` date NOT NULL,
  `title` varchar(52) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `read` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `misc`
--

CREATE TABLE `misc` (
  `featured_game_id` varchar(1) NOT NULL,
  `alert` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `moderation`
--

CREATE TABLE `moderation` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `admin_id` int NOT NULL,
  `reason` enum('Excessive or inappropriate use of profanity','Inappropriate/adult content','Requesting or giving private information','Engaging in third party/offsite deals','Harassing/bullying other users','Exploiting/scamming other users','Stolen account','Phishing/hacking/trading accounts','Other') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `admin_note` text NOT NULL,
  `issued` datetime NOT NULL,
  `length` int NOT NULL,
  `active` enum('yes','no') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `promocodes`
--

CREATE TABLE `promocodes` (
  `code` varchar(255) NOT NULL,
  `itemid` varchar(100) NOT NULL DEFAULT '0',
  `uses` int NOT NULL DEFAULT '-1',
  `used` int NOT NULL DEFAULT '0',
  `expired` tinyint(1) NOT NULL DEFAULT '0',
  `expirationdate` timestamp NOT NULL DEFAULT '2037-12-31 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `purchases`
--

CREATE TABLE `purchases` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `gross` decimal(5,2) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(100) NOT NULL,
  `receipt` varchar(60) NOT NULL,
  `product` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reg_keys`
--

CREATE TABLE `reg_keys` (
  `id` int NOT NULL,
  `key_content` varchar(1000) NOT NULL,
  `used` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reports`
--

CREATE TABLE `reports` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `r_type` varchar(10) NOT NULL,
  `r_id` int NOT NULL,
  `r_reason` text,
  `seen` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shop_items`
--

CREATE TABLE `shop_items` (
  `id` int NOT NULL,
  `owner_id` int NOT NULL,
  `name` varchar(52) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `bucks` int NOT NULL DEFAULT '-1',
  `bits` int NOT NULL DEFAULT '-1',
  `type` varchar(10) NOT NULL COMMENT 'HAT | FACE | TOOL | SHIRT | TSHIRT | PANTS ',
  `date` date NOT NULL,
  `last_updated` date NOT NULL,
  `offsale` enum('yes','no') NOT NULL DEFAULT 'no',
  `collectible` enum('yes','no') NOT NULL DEFAULT 'no',
  `collectable-edition` enum('yes','no') NOT NULL DEFAULT 'no',
  `collectible_q` int NOT NULL DEFAULT '0',
  `zoom` varchar(11) DEFAULT NULL,
  `approved` enum('yes','no','declined') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `private` int NOT NULL,
  `eventinfo` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `shop_items`
--

INSERT INTO `shop_items` (`id`, `owner_id`, `name`, `description`, `bucks`, `bits`, `type`, `date`, `last_updated`, `offsale`, `collectible`, `collectable-edition`, `collectible_q`, `zoom`, `approved`, `private`, `eventinfo`) VALUES
(1, 1, 'Pants test', 'test', 0, 0, 'pants', '2024-03-25', '2024-03-25', 'no', 'no', 'no', 0, NULL, 'yes', 0, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `site_banner`
--

CREATE TABLE `site_banner` (
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `special_sellers`
--

CREATE TABLE `special_sellers` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `item_id` int NOT NULL,
  `serial` int NOT NULL,
  `bucks` int NOT NULL,
  `active` enum('yes','no') NOT NULL DEFAULT 'yes'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `statuses`
--

CREATE TABLE `statuses` (
  `id` int NOT NULL,
  `owner_id` int NOT NULL,
  `body` varchar(124) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `test`
--

CREATE TABLE `test` (
  `id` int NOT NULL,
  `crap` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `themes`
--

CREATE TABLE `themes` (
  `id` int NOT NULL,
  `theme selected` enum('defualt','theme1') NOT NULL DEFAULT 'defualt'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(70) NOT NULL,
  `age` enum('under13','over13') NOT NULL,
  `safechat` enum('safe','supersafe') NOT NULL,
  `email` varchar(100) NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `join_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `robux` int NOT NULL DEFAULT '0',
  `tickets` int NOT NULL DEFAULT '0',
  `description` text,
  `last_seen` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_promocodes`
--

CREATE TABLE `user_promocodes` (
  `id` int NOT NULL,
  `code` varchar(255) NOT NULL,
  `user` int NOT NULL,
  `timeredeemed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_rewards`
--

CREATE TABLE `user_rewards` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `reward_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_walls`
--

CREATE TABLE `user_walls` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `owner_id` int NOT NULL,
  `post` varchar(100) NOT NULL,
  `time` datetime NOT NULL,
  `type` enum('pinned','normal','deleted') NOT NULL DEFAULT 'normal'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `aeo_table`
--
ALTER TABLE `aeo_table`
  ADD PRIMARY KEY (`winnerip`);

--
-- Indizes für die Tabelle `alert`
--
ALTER TABLE `alert`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `avatar`
--
ALTER TABLE `avatar`
  ADD PRIMARY KEY (`user_id`);

--
-- Indizes für die Tabelle `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `beta_buy`
--
ALTER TABLE `beta_buy`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `beta_users`
--
ALTER TABLE `beta_users`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `clans`
--
ALTER TABLE `clans`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `clans_members`
--
ALTER TABLE `clans_members`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `clans_ranks`
--
ALTER TABLE `clans_ranks`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `clans_walls`
--
ALTER TABLE `clans_walls`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `crate`
--
ALTER TABLE `crate`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `forum_banners`
--
ALTER TABLE `forum_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `forum_boards`
--
ALTER TABLE `forum_boards`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `forum_posts`
--
ALTER TABLE `forum_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `forum_threads`
--
ALTER TABLE `forum_threads`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `item_comments`
--
ALTER TABLE `item_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `list`
--
ALTER TABLE `list`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `membership_values`
--
ALTER TABLE `membership_values`
  ADD PRIMARY KEY (`value`);

--
-- Indizes für die Tabelle `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `misc`
--
ALTER TABLE `misc`
  ADD KEY `featured_game_id` (`featured_game_id`);

--
-- Indizes für die Tabelle `moderation`
--
ALTER TABLE `moderation`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `promocodes`
--
ALTER TABLE `promocodes`
  ADD PRIMARY KEY (`code`);

--
-- Indizes für die Tabelle `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `reg_keys`
--
ALTER TABLE `reg_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `shop_items`
--
ALTER TABLE `shop_items`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `special_sellers`
--
ALTER TABLE `special_sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `user_promocodes`
--
ALTER TABLE `user_promocodes`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `user_rewards`
--
ALTER TABLE `user_rewards`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `user_walls`
--
ALTER TABLE `user_walls`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `avatar`
--
ALTER TABLE `avatar`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `awards`
--
ALTER TABLE `awards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `beta_buy`
--
ALTER TABLE `beta_buy`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `beta_users`
--
ALTER TABLE `beta_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `clans`
--
ALTER TABLE `clans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `clans_members`
--
ALTER TABLE `clans_members`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `clans_ranks`
--
ALTER TABLE `clans_ranks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `clans_walls`
--
ALTER TABLE `clans_walls`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `crate`
--
ALTER TABLE `crate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `forum_banners`
--
ALTER TABLE `forum_banners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `forum_boards`
--
ALTER TABLE `forum_boards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `forum_posts`
--
ALTER TABLE `forum_posts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `forum_threads`
--
ALTER TABLE `forum_threads`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `friends`
--
ALTER TABLE `friends`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `games`
--
ALTER TABLE `games`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `items`
--
ALTER TABLE `items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `item_comments`
--
ALTER TABLE `item_comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `list`
--
ALTER TABLE `list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `log`
--
ALTER TABLE `log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `membership`
--
ALTER TABLE `membership`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `membership_values`
--
ALTER TABLE `membership_values`
  MODIFY `value` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `moderation`
--
ALTER TABLE `moderation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `reg_keys`
--
ALTER TABLE `reg_keys`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `shop_items`
--
ALTER TABLE `shop_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `special_sellers`
--
ALTER TABLE `special_sellers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `test`
--
ALTER TABLE `test`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `user_promocodes`
--
ALTER TABLE `user_promocodes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `user_rewards`
--
ALTER TABLE `user_rewards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `user_walls`
--
ALTER TABLE `user_walls`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
