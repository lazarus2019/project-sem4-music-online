-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2021 at 03:53 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `music_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `aboutus`
--

CREATE TABLE `aboutus` (
  `id` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aboutus`
--

INSERT INTO `aboutus` (`id`, `title`, `content`) VALUES
(2, 'Why do we use it?', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)'),
(3, 'Where can I get some?', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.'),
(4, 'Where does it come from?', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.'),
(5, 'Where does it come from?', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32..\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.'),
(15, 'New question', 'answer');

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `username` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nickname` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `join_date` date NOT NULL,
  `is_artist` tinyint(1) NOT NULL DEFAULT 0,
  `follower` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_request` tinyint(1) NOT NULL DEFAULT 0,
  `auth_provider` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `username`, `password`, `nickname`, `firstname`, `lastname`, `email`, `birthday`, `gender`, `image`, `join_date`, `is_artist`, `follower`, `description`, `is_active`, `is_request`, `auth_provider`, `email_code`, `country_id`) VALUES
(1, 'denvau@dventertainment.vn', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'Den Vau', 'Den', 'Vau', 'denvau@dventertainment.vn', '1989-06-13', 'Male', 'denvau.jpg', '2019-10-06', 1, 421112, 'A Vietnamese boy who plays Rap.', 1, 0, '0', NULL, 239),
(2, 'info@mtpentertainment.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'Son Tung MTP', 'Thanh', 'Tung', 'info@mtpentertainment.com', '1991-08-12', 'Male', 'sontung.jpg', '2019-10-08', 1, 1000021, 'Son Tung M-TP Official Netfzik Channel - Property of Sơn Tung M-TP', 1, 0, '0', NULL, 239),
(3, 'booking@lunatic.biz', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'Vu Official', 'Official', 'Vu', 'booking@lunatic.biz', '1991-06-06', 'Male', 'vu.jpg', '2019-10-09', 1, 33139, 'I\'m Vu, simply, I\'m Vu?\r\nJust a lot of miscellaneous things :D', 1, 0, '0', NULL, 239),
(4, 'haanhtuan@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'Ha Anh Tuan', 'Ha ', 'Anh Tuan', 'haanhtuan@gmail.com', '1990-06-23', 'Male', 'haanhtuan.jpg', '2019-10-09', 1, 34357, 'Please \"Subscribe\" to Ha Anh Tuan\'s channel to enjoy music in an authentic, close and unique space', 1, 0, '0', NULL, 239),
(5, 'mrsiro@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'Mr Siro', 'Mr', 'Siro', 'mrsiro@gmail.com', '1993-04-09', 'Male', 'mrsiro.jpg', '2019-10-09', 1, 64352, 'Thank you for always supporting and following the channel We will try to create the best quality products to serve you.', 1, 0, '0', NULL, 239),
(6, 'obito@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'Obito', '', '', 'obito@gmail.com', '2001-04-01', 'Male', 'obito.jpg', '2019-10-11', 1, 6403, 'Welcome to Obito\'s Official Netfzik channel.\r\nThank you for watching. Subscribe and Leave a Comment for Obito! ', 1, 0, '0', NULL, 239),
(7, 'binz@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'Binz Da Poet', 'Dan ', 'Le', 'binz@gmail.com', '1988-05-24', 'Male', 'binz.jpg', '2019-08-14', 1, 221323, 'Binz (May 24, 1988) - singer/songwriter/rapper/producer. He studied at The Art Institute in the US and when he returned to Vietnam, he joined SpaceSpeakers. With a unique voice, distinctive rap, and rich lyrics, Binz quickly made a strong impression on the public through a series of songs.', 1, 0, '0', NULL, 239),
(8, 'thinhsuy@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'Thinh Suy ', 'Thinh', 'Suy', 'thinhsuy@gmail.com', '1990-05-11', 'Male', 'thinhsuy.jpg', '2020-09-25', 1, 221323, 'Looking for a door which is already on my left hand.', 1, 0, '0', NULL, 239),
(9, 'tlinh@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'Tlinh', 'Thao', 'Linh', 'tlinh@gmail.com', '1992-06-13', 'Female', 'tlinh.jpg', '2020-09-25', 1, 24131, '', 1, 0, '0', NULL, 239),
(10, 'hnhngan@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'Hnhngan', 'Hanh', 'Ngan', 'hnhngan@gmail.com', '1992-06-13', 'Female', 'hnhngan.jpg', '2020-11-13', 1, 4432, 'many things are difficult to say, ask for the direction of music and written hands.', 1, 0, '0', NULL, 239),
(11, 'justatee@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'JustaTee Music\r\n', 'Thanh', 'Tuan', 'justatee@gmail.com', '1990-11-01', 'Male', 'justatee.jpg', '2020-11-01', 1, 33223, 'DOB: 01/11\r\nMusic Producer/Artist\r\nGenres: R&B/Hiphop/Electronica\r\nLadyKillah 2010\r\nSpaceSpeakers 2012', 1, 0, '0', NULL, 239),
(12, 'bray@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'B Ray\r\n', '', '', 'bray@gmail.com', '1986-12-05', 'Male', 'bray.jpg', '2020-12-11', 1, 5231, '', 1, 0, '0', NULL, 239),
(14, 'anne@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'Anne Marie\r\n', 'Anne', 'Marie', 'anne@gmail.com', '1992-03-20', 'Female', 'anne.jpg', '2021-11-03', 1, 313113, 'Anne-Marie has proved to be one of the UK’s most exciting and successful British breakthrough popstars of recent years. A former 3x world karate champion and West End child star-turned 9x BRIT Award nominee, A-M’s rise has been nothing short of meteoric. In 2018 Anne-Marie released her debut album, ‘Speak Your Mind’ which featured the hit singles \'Alarm\', \'Ciao Adios\', \'Heavy\', \'Friends\', \'2002\' and \'Perfect to Me\'. She subsequently ended that year as as the UK’s biggest-selling debut artist, selling out headline shows and playing stadium dates supporting long-time friend and champion Ed Sheeran in the process.', 1, 0, '0', NULL, 232),
(15, 'charlie@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'Charlie Puth\r\n', 'Charlie', 'Puth', 'charlie@gmail.com', '1989-01-04', 'Male', 'charlie.jpg', '2019-11-15', 1, 1323131, 'Over the past three years, Charlie Puth has proven himself commercially with the extraordinary success of four multi-platinum hits', 1, 0, '0', NULL, 232),
(16, 'maroon5@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'Maroon 5\r\n', 'Maroon ', '', 'maroon5@gmail.com', '1989-01-04', 'Male', 'maroon5.jpg', '2019-11-04', 1, 444214, 'Welcome to the Maroon 5 official Youtube Channel. Head to our website for more info- www.maroon5.com', 1, 0, '0', NULL, 232),
(17, 'knaan@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'K\'NAAN\r\n', 'knaan', 'Warsame', 'knaan@gmail.com', '1991-01-12', 'Male', 'maroon5.jpg', '2019-11-04', 1, 64345, 'Performing \"Is Anybody Out There?\" with Nelly Furtado on ELLEN, March 22.', 1, 0, '0', NULL, 232),
(18, 'lilnasx@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'Lil Nas X\r\n', 'Lis ', 'Nas X', 'lilnasx@gmail.com', '1993-01-21', 'Male', 'lilnasx.jpg', '2019-11-23', 1, 32432, 'ayeee lmao', 1, 0, '0', NULL, 232),
(19, 'khalid@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'Khalid\r\n', 'Khalid', '', 'khalid@gmail.com', '1988-11-15', 'Male', 'khalid.jpg', '2022-02-04', 1, 12413, '', 1, 0, '0', NULL, 232),
(20, 'edsheeran@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'Ed Sheeran\r\n', 'Ed ', ' Sheeran', 'edsheeran@gmail.com', '1989-12-09', 'Male', 'edsheeran.jpg', '2022-02-02', 1, 7323113, 'Ed Sheeran may be the quintessential pop star of the 2010s: an internationally acclaimed, multi-award winning singer/songwriter who seems to acknowledge no boundaries between styles or eras with elements of folk, hip-hop, pop, dance, soul, and rock woven throughout his music. ', 1, 0, '0', NULL, 232),
(21, 'wizkhalifa@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'Wiz Khalifa\r\n', 'Wiz ', ' Khalifa', 'wizkhalifa@gmail.com', '1995-11-10', 'Male', 'wizkhalifa.jpg', '2021-12-07', 1, 323123, 'Wiz Khalifa\'s Official Netfzik Channel\r\nTaylor Gang Ent. / Atlantic Records', 1, 0, '0', NULL, 232),
(22, 'marshmello@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'Marshmello\r\n', '', '', 'marshmello@gmail.com', '1997-01-18', 'Male', 'marshmello.jpg', '2021-11-12', 1, 35122, 'Marshmello, the anonymous Producer/DJ is taking the music industry by storm. Becoming one of the fastest rising dance producers in history, his fanbase ranges from children to adults who have helped him gather over 2 billion streams and over 300 consecutive sold out shows worldwide, currently making him one of Spotify’s Top 10 most listened to Artists in the world. ', 0, 0, '0', NULL, 232),
(23, 'alanwalker@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'Alan Walker\r\n', '', '', 'alanwalker@gmail.com', '1997-01-02', 'Male', 'alanwalker.jpg', '2021-11-13', 1, 35122, 'When I was a kid, I had a fascination for programming and graphic design. Music kind of just happened spontaneously a few years back. I found a track on Youtube I liked a lot – it inspired me and it made me start exploring producing myself. Everything started online with people, or rather nicknames, from around the world helping each other out. Now music is a big part of my life.', 0, 0, '0', NULL, 232),
(24, 'toneandi@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'TONES AND I ', '', '', 'toneandi@gmail.com', '1993-01-05', 'Female', 'toneandi.jpg', '2021-09-03', 1, 35122, 'Official Netfzik channel for musician Tones And I. Subscribe and hit the bell for notifications so you never miss anything that\'s uploaded here.', 1, 0, '0', NULL, 232),
(25, 'lisa@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'Lalisa', '', '', 'lisa@gmail.com', '1995-01-14', 'Female', 'lisa.jpg', '2019-09-10', 1, 4364535, 'BLACKPINK Official YouTube Channel\r\n블랙핑크 공식 유튜브 채널입니다.', 1, 0, '0', NULL, 117),
(26, 'rose@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'Rose', '', '', 'rose@gmail.com', '1995-01-14', 'Female', 'rose.jpg', '2019-09-10', 1, 2123321, 'BLACKPINK Official Netfzik Channel\r\n블랙핑크 공식 유튜브 채널입니다.', 1, 0, '0', NULL, 117),
(27, 'jisoo@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'Jisoo', '', '', 'jisoo@gmail.com', '1991-02-21', 'Female', 'jisoo.jpg', '2019-09-10', 1, 4644252, 'BLACKPINK Official Netfzik Channel\r\n블랙핑크 공식 유튜브 채널입니다.', 1, 0, '0', NULL, 117),
(28, 'jennie@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'Jennie', '', '', 'jennie@gmail.com', '1992-04-10', 'Female', 'jennie.jpg', '2019-09-10', 1, 433213, 'BLACKPINK Official Netfzik Channel\r\n블랙핑크 공식 유튜브 채널입니다.', 1, 0, '0', NULL, 117),
(29, 'iu@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'IU', '', '', 'iu@gmail.com', '1992-04-10', 'Female', 'iu.jpg', '2019-09-10', 1, 33228, '아이유(IU) Official YouTube Channel', 1, 0, '0', NULL, 117),
(30, 'gaho@gmail.com', '$2a$09$x8/RIfS0zRMtBW348sFyh.d3XiMq.L.RrNY1fYjd6yH3ND4dAVClK', 'Gaho', '', '', 'gaho@gmail.com', '1992-04-10', 'Male', 'gaho.jpg', '2019-09-10', 1, 3244, 'Kang Dae-ho, better known by his stage name Gaho, is a South Korean singer, songwriter and producer under Planetarium Records.', 1, 0, '0', NULL, 117),
(32, 'ltv.aptech2019@gmail.com', '$2a$10$pVFT1ofleP7pErNruRmtnu0jtJXlsBmTzvk0N/.IlmijSWp/QB2T.', 'super admin', 'Son', 'Nguyen', 'ltv.aptech2019@gmail.com', '2001-01-01', 'Male', 'a72e75876eea4e959803a0bf648dd65a.jpg', '2021-12-10', 0, 0, 'ltv.aptech2019@gmail.com', 1, 0, '0', '486030', 1),
(33, 'sonntfx05683@funix.edu.vn', '$2a$10$yqQHVk2xMvYrBLDx9ZppY.EajyMx1mKwG0fV5u6SYFZdatF1tsbUu', NULL, 'krix', 'Daniel', 'sonntfx05683@funix.edu.vn', NULL, NULL, NULL, '2021-12-10', 1, 0, NULL, 0, 0, '0', NULL, NULL),
(34, NULL, '$2a$10$fUAho5jSFEcmqIpopDCLwuDVhxlBJH.toE8eRZikUgwLg4xd28eti', 'thunguyen', 'Son', 'Nguyen', 'viettestdemo@gmail.com', '2001-08-10', 'Male', '1f23f443fac34be289bfba39253a0d3d.jpg', '2021-12-10', 1, 0, 'viettestdemo@gmail.com', 0, 0, '0', '238080', 1),
(35, 'vuvanngan.vn@gmail.com', '$2a$10$pUN.WXi8YcSyfYhruv9YIeojTDb.jbzWpUiSdOww7qC9Dads8.daO', 'signup123', 'Thu', 'Nguyen edit', 'vuvanngan.vn@gmail.com', '2001-01-01', 'Female', NULL, '2021-12-10', 1, 0, NULL, 1, 0, '0', NULL, 17),
(36, 'thaisonbk2020@gmail.com', '$2a$10$XD9JKXredFEilZdp112YVuICH0z2RKfHSlU86m.EsqRBkHQYx94z6', NULL, 'krix', 'Daniel', 'thaisonbk2020@gmail.com', NULL, NULL, '43ed43177a444cfa81977290594fdc2f.jpg', '2021-12-10', 1, 0, NULL, 1, 0, '0', NULL, NULL),
(37, NULL, NULL, 'Thu Yang Ho', ' Yang Ho', 'Thu', 'thu_qtwukxc_ho@tfbnw.net', NULL, NULL, NULL, '2021-12-10', 0, 0, NULL, 1, 0, '1', NULL, NULL),
(38, NULL, '$2a$10$5WDsXfEuMNBfRlTZBhOkue5YVgxFWz2BJ7r1OPWZdExEKB8bLmgOi', 'lazarus20190', 'Son', 'Nguyen', 'thaisonbk2019@gmail.com', '2020-01-01', 'Male', '644b96df31ba42cf92cf20610c2d00b5.jpg', '2021-12-10', 1, 0, 'vietname boi', 1, 0, '0', '737163', 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_playlist`
--

CREATE TABLE `account_playlist` (
  `playlist_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `is_own` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_playlist`
--

INSERT INTO `account_playlist` (`playlist_id`, `account_id`, `is_own`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1),
(17, 17, 1),
(18, 18, 1),
(19, 19, 1),
(20, 20, 1),
(21, 21, 1),
(22, 22, 1),
(23, 23, 1),
(24, 24, 1),
(25, 25, 1),
(26, 26, 1),
(27, 27, 1),
(28, 28, 1),
(29, 29, 1),
(30, 30, 1),
(31, 1, 1),
(32, 2, 1),
(33, 3, 1),
(34, 4, 1),
(35, 5, 1),
(36, 6, 1),
(37, 7, 1),
(38, 8, 1),
(39, 9, 1),
(40, 10, 1),
(41, 11, 1),
(42, 12, 1),
(44, 14, 1),
(45, 15, 1),
(46, 16, 1),
(47, 17, 1),
(48, 18, 1),
(49, 19, 1),
(50, 20, 1),
(51, 21, 1),
(52, 22, 1),
(53, 23, 1),
(54, 24, 1),
(55, 25, 1),
(56, 26, 1),
(57, 27, 1),
(58, 28, 1),
(59, 29, 1),
(60, 30, 1),
(61, 2, 1),
(61, 32, 0),
(63, 32, 1),
(64, 32, 1),
(65, 25, 1),
(67, 27, 1),
(72, 8, 0),
(73, 34, 1),
(74, 34, 1),
(75, 37, 1),
(76, 37, 1),
(77, 38, 1),
(78, 38, 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_role`
--

CREATE TABLE `account_role` (
  `account_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_role`
--

INSERT INTO `account_role` (`account_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(32, 3),
(33, 2),
(34, 1),
(35, 1),
(36, 2),
(37, 1),
(38, 1);

-- --------------------------------------------------------

--
-- Table structure for table `advertisement`
--

CREATE TABLE `advertisement` (
  `id` int(11) NOT NULL,
  `file_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `advertisement`
--

INSERT INTO `advertisement` (`id`, `file_name`, `title`, `thumbnail`, `description`, `duration`, `status`) VALUES
(2, 'premium_sound.mp3', 'Advertisement 05/12', '2c0fe647f56949f5b77f720338d8b496.jpg', 'This is a new advertisement of spotify.', 26, 1);

-- --------------------------------------------------------

--
-- Table structure for table `artist_track`
--

CREATE TABLE `artist_track` (
  `account_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  `is_own` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `artist_track`
--

INSERT INTO `artist_track` (`account_id`, `track_id`, `is_own`) VALUES
(1, 23, 1),
(2, 17, 1),
(2, 41, 1),
(3, 11, 1),
(4, 5, 1),
(4, 41, 0),
(5, 16, 1),
(6, 31, 1),
(7, 20, 1),
(8, 14, 1),
(9, 19, 1),
(10, 25, 1),
(11, 18, 1),
(12, 15, 1),
(12, 22, 1),
(14, 21, 1),
(15, 3, 0),
(15, 9, 1),
(16, 3, 1),
(16, 6, 1),
(17, 4, 0),
(17, 6, 0),
(17, 12, 0),
(18, 6, 1),
(18, 26, 1),
(21, 1, 0),
(21, 2, 1),
(22, 13, 1),
(23, 4, 1),
(24, 1, 1),
(24, 9, 0),
(24, 27, 1),
(24, 33, 1),
(25, 7, 1),
(25, 34, 1),
(26, 8, 1),
(26, 32, 1),
(27, 28, 1),
(27, 32, 1),
(28, 29, 1),
(28, 35, 1),
(29, 10, 1),
(29, 30, 1),
(30, 24, 1);

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `image` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `image`, `title`, `description`, `status`) VALUES
(4, '0d860dfa0e4d434894f4bb6a6dd10589.jpg', 'New Artist of Our Label', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable', 1),
(5, '8745841f3d1a49d99ba7ff7f22ded7f7.jpg', 'Metallica and Slipknot feature in trailer for ?Long Live Rock? documentary', 'It also features Rage Against The Machine, Guns N\' Roses and a number of others', 1),
(6, 'fb25c9433a96493592814d032cfee214.jpg', 'Metallica and Slipknot feature in trailer for?', 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested', 0),
(10, '27c81423377b45489e69b690c3bbe73b.jpg', 'New banner', 'New banner edit', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `account_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  `message` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `fullname` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `fullname`, `email`, `phone_number`, `content`, `is_read`, `date`) VALUES
(1, 'Vanessa Stevens', 'vanessa.stevens@example.com', '(526)-269-7884', 'I want to be an artist on your website.', 1, '2021-12-01'),
(2, 'Walter Chambers', 'walter.chambers@example.com', '(336)-032-1110', 'Why I can\'t register for the premium package? What is happening?', 0, '2021-12-08'),
(3, 'Bessie Adams', 'bessie.adams@example.com', '(115)-059-6339', 'Can I resign after signing a package?', 0, '2021-11-10'),
(6, 'Lazarus2019', 'thaisonbk2019@gmail.com', '(688)-332-2782', 'Some tracks show error signs in packages when I already have premium. So I can\'t listen to my favorite song. Hope your developer could fix it as fast as posible.', 1, '2021-11-27'),
(7, 'Thai Son Nguyen', 'thaisonbk2020@gmail.com', '0165161454', 'my question', 0, '2021-12-10');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `country_code`, `country_name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albania'),
(3, 'DZ', 'Algeria'),
(4, 'DS', 'America'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antarctica'),
(9, 'AG', 'Antigua and Barbuda'),
(10, 'AR', 'Argentina'),
(11, 'AM', 'Armenia'),
(12, 'AW', 'Aruba'),
(13, 'AU', 'Australia'),
(14, 'AT', 'Austria'),
(15, 'AZ', 'Azerbaijan'),
(16, 'BS', 'Bahamas'),
(17, 'BH', 'Bahrain'),
(18, 'BD', 'Bangladesh'),
(19, 'BB', 'Barbados'),
(20, 'BY', 'Belarus'),
(21, 'BE', 'Belgium'),
(22, 'BZ', 'Belize'),
(23, 'BJ', 'Benin'),
(24, 'BM', 'Bermuda'),
(25, 'BT', 'Bhutan'),
(26, 'BO', 'Bolivia'),
(27, 'BA', 'Bosnia and Herzegovina'),
(28, 'BW', 'Botswana'),
(29, 'BV', 'Bouvet Island'),
(30, 'BR', 'Brazil'),
(31, 'IO', 'British Indian Ocean Territory'),
(32, 'BN', 'Brunei Darussalam'),
(33, 'BG', 'Bulgaria'),
(34, 'BF', 'Burkina Faso'),
(35, 'BI', 'Burundi'),
(36, 'KH', 'Cambodia'),
(37, 'CM', 'Cameroon'),
(38, 'CA', 'Canada'),
(39, 'CV', 'Cape Verde'),
(40, 'KY', 'Cayman Islands'),
(41, 'CF', 'Central African Republic'),
(42, 'TD', 'Chad'),
(43, 'CL', 'Chile'),
(44, 'CN', 'China'),
(45, 'CX', 'Christmas Island'),
(46, 'CC', 'Cocos (Keeling) Islands'),
(47, 'CO', 'Colombia'),
(48, 'KM', 'Comoros'),
(49, 'CD', 'Democratic Republic of the Congo'),
(50, 'CG', 'Republic of Congo'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'HR', 'Croatia (Hrvatska)'),
(54, 'CU', 'Cuba'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DK', 'Denmark'),
(58, 'DJ', 'Djibouti'),
(59, 'DM', 'Dominica'),
(60, 'DO', 'Dominican Republic'),
(61, 'TP', 'East Timor'),
(62, 'EC', 'Ecuador'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands (Malvinas)'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'FX', 'France, Metropolitan'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GK', 'Guernsey'),
(85, 'GR', 'Greece'),
(86, 'GL', 'Greenland'),
(87, 'GD', 'Grenada'),
(88, 'GP', 'Guadeloupe'),
(89, 'GU', 'Guam'),
(90, 'GT', 'Guatemala'),
(91, 'GN', 'Guinea'),
(92, 'GW', 'Guinea-Bissau'),
(93, 'GY', 'Guyana'),
(94, 'HT', 'Haiti'),
(95, 'HM', 'Heard and Mc Donald Islands'),
(96, 'HN', 'Honduras'),
(97, 'HK', 'Hong Kong'),
(98, 'HU', 'Hungary'),
(99, 'IS', 'Iceland'),
(100, 'IN', 'India'),
(101, 'IM', 'Isle of Man'),
(102, 'ID', 'Indonesia'),
(103, 'IR', 'Iran (Islamic Republic of)'),
(104, 'IQ', 'Iraq'),
(105, 'IE', 'Ireland'),
(106, 'IL', 'Israel'),
(107, 'IT', 'Italy'),
(108, 'CI', 'Ivory Coast'),
(109, 'JE', 'Jersey'),
(110, 'JM', 'Jamaica'),
(111, 'JP', 'Japan'),
(112, 'JO', 'Jordan'),
(113, 'KZ', 'Kazakhstan'),
(114, 'KE', 'Kenya'),
(115, 'KI', 'Kiribati'),
(116, 'KP', 'Korea, Democratic People\'s Republic of'),
(117, 'KR', 'Korea, Republic of'),
(118, 'XK', 'Kosovo'),
(119, 'KW', 'Kuwait'),
(120, 'KG', 'Kyrgyzstan'),
(121, 'LA', 'Lao People\'s Democratic Republic'),
(122, 'LV', 'Latvia'),
(123, 'LB', 'Lebanon'),
(124, 'LS', 'Lesotho'),
(125, 'LR', 'Liberia'),
(126, 'LY', 'Libyan Arab Jamahiriya'),
(127, 'LI', 'Liechtenstein'),
(128, 'LT', 'Lithuania'),
(129, 'LU', 'Luxembourg'),
(130, 'MO', 'Macau'),
(131, 'MK', 'North Macedonia'),
(132, 'MG', 'Madagascar'),
(133, 'MW', 'Malawi'),
(134, 'MY', 'Malaysia'),
(135, 'MV', 'Maldives'),
(136, 'ML', 'Mali'),
(137, 'MT', 'Malta'),
(138, 'MH', 'Marshall Islands'),
(139, 'MQ', 'Martinique'),
(140, 'MR', 'Mauritania'),
(141, 'MU', 'Mauritius'),
(142, 'TY', 'Mayotte'),
(143, 'MX', 'Mexico'),
(144, 'FM', 'Micronesia, Federated States of'),
(145, 'MD', 'Moldova, Republic of'),
(146, 'MC', 'Monaco'),
(147, 'MN', 'Mongolia'),
(148, 'ME', 'Montenegro'),
(149, 'MS', 'Montserrat'),
(150, 'MA', 'Morocco'),
(151, 'MZ', 'Mozambique'),
(152, 'MM', 'Myanmar'),
(153, 'NA', 'Namibia'),
(154, 'NR', 'Nauru'),
(155, 'NP', 'Nepal'),
(156, 'NL', 'Netherlands'),
(157, 'AN', 'Netherlands Antilles'),
(158, 'NC', 'New Caledonia'),
(159, 'NZ', 'New Zealand'),
(160, 'NI', 'Nicaragua'),
(161, 'NE', 'Niger'),
(162, 'NG', 'Nigeria'),
(163, 'NU', 'Niue'),
(164, 'NF', 'Norfolk Island'),
(165, 'MP', 'Northern Mariana Islands'),
(166, 'NO', 'Norway'),
(167, 'OM', 'Oman'),
(168, 'PK', 'Pakistan'),
(169, 'PW', 'Palau'),
(170, 'PS', 'Palestine'),
(171, 'PA', 'Panama'),
(172, 'PG', 'Papua New Guinea'),
(173, 'PY', 'Paraguay'),
(174, 'PE', 'Peru'),
(175, 'PH', 'Philippines'),
(176, 'PN', 'Pitcairn'),
(177, 'PL', 'Poland'),
(178, 'PT', 'Portugal'),
(179, 'PR', 'Puerto Rico'),
(180, 'QA', 'Qatar'),
(181, 'RE', 'Reunion'),
(182, 'RO', 'Romania'),
(183, 'RU', 'Russian Federation'),
(184, 'RW', 'Rwanda'),
(185, 'KN', 'Saint Kitts and Nevis'),
(186, 'LC', 'Saint Lucia'),
(187, 'VC', 'Saint Vincent and the Grenadines'),
(188, 'WS', 'Samoa'),
(189, 'SM', 'San Marino'),
(190, 'ST', 'Sao Tome and Principe'),
(191, 'SA', 'Saudi Arabia'),
(192, 'SN', 'Senegal'),
(193, 'RS', 'Serbia'),
(194, 'SC', 'Seychelles'),
(195, 'SL', 'Sierra Leone'),
(196, 'SG', 'Singapore'),
(197, 'SK', 'Slovakia'),
(198, 'SI', 'Slovenia'),
(199, 'SB', 'Solomon Islands'),
(200, 'SO', 'Somalia'),
(201, 'ZA', 'South Africa'),
(202, 'GS', 'South Georgia South Sandwich Islands'),
(203, 'SS', 'South Sudan'),
(204, 'ES', 'Spain'),
(205, 'LK', 'Sri Lanka'),
(206, 'SH', 'St. Helena'),
(207, 'PM', 'St. Pierre and Miquelon'),
(208, 'SD', 'Sudan'),
(209, 'SR', 'Suriname'),
(210, 'SJ', 'Svalbard and Jan Mayen Islands'),
(211, 'SZ', 'Swaziland'),
(212, 'SE', 'Sweden'),
(213, 'CH', 'Switzerland'),
(214, 'SY', 'Syrian Arab Republic'),
(215, 'TW', 'Taiwan'),
(216, 'TJ', 'Tajikistan'),
(217, 'TZ', 'Tanzania, United Republic of'),
(218, 'TH', 'Thailand'),
(219, 'TG', 'Togo'),
(220, 'TK', 'Tokelau'),
(221, 'TO', 'Tonga'),
(222, 'TT', 'Trinidad and Tobago'),
(223, 'TN', 'Tunisia'),
(224, 'TR', 'Turkey'),
(225, 'TM', 'Turkmenistan'),
(226, 'TC', 'Turks and Caicos Islands'),
(227, 'TV', 'Tuvalu'),
(228, 'UG', 'Uganda'),
(229, 'UA', 'Ukraine'),
(230, 'AE', 'United Arab Emirates'),
(231, 'GB', 'United Kingdom'),
(232, 'US', 'United States'),
(233, 'UM', 'United States minor outlying islands'),
(234, 'UY', 'Uruguay'),
(235, 'UZ', 'Uzbekistan'),
(236, 'VU', 'Vanuatu'),
(237, 'VA', 'Vatican City State'),
(238, 'VE', 'Venezuela'),
(239, 'VN', 'Vietnam'),
(240, 'VG', 'Virgin Islands (British)'),
(241, 'VI', 'Virgin Islands (U.S.)'),
(242, 'WF', 'Wallis and Futuna Islands'),
(243, 'EH', 'Western Sahara'),
(244, 'YE', 'Yemen'),
(245, 'ZM', 'Zambia'),
(246, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`, `thumbnail`) VALUES
(1, 'Pop edit', 'b5041aa18961405e997f3313e7a7506e.jpg'),
(2, 'R&D', '5893d44c1a334078a83dd54e063f2245.jpg'),
(3, 'Rap', '0d652a50bc894184a9c777214db88ae7.jpg'),
(4, 'Country', '3a7dcc0a740a40549141a088c8483aba.jpg'),
(5, 'Rock', '8fabe8c402e24ef28b2d7e5840acbbac.jpg'),
(6, 'Blues', '1042c97e10d84aad9a82833f486af70b.jpg'),
(7, 'EDM', '6d0299fef6284cf6bfef78937bab6650.jpg'),
(8, 'Folk', '5e1269df119547b1aa828d64e339e0cb.jpg'),
(9, 'Classical', '6f2c2f6c9de140e6875916c57318b189.jpg'),
(10, 'Jazz', '1d4d32ad0b78433c9df04588c40b06ef.jpg'),
(11, 'Dance', '562f1ca31b02401cab5e00c3f01e8a0b.jpg'),
(12, 'Latin', '7fb43aa219b54037a3bc3105ae65a7eb.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `message` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_read` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `account_id`, `message`, `date`, `is_read`) VALUES
(1, 7, 'You have successfully purchased [HOT] VIP PREMIUM package. Enjoy it!', '2021-12-10 00:11:00', 0),
(2, 15, 'You have successfully purchased PREMIUM package. Enjoy it!', '2021-12-10 00:28:09', 0),
(3, 16, 'Your track YOU DONT KNOW ME was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 00:31:29', 0),
(4, 25, 'You have successfully purchased PRO PREMIUM package. Enjoy it!', '2021-12-10 00:35:53', 0),
(5, 2, 'Your track WHITE RIVER  AAKAS was public. Now everyone can listen this track!', '2021-12-10 01:19:53', 0),
(6, 3, 'Your track DEJA VU was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 01:41:05', 0),
(7, 22, 'Your track AFTER SCHOOL was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 01:42:45', 0),
(8, 8, 'Your track �I N? was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 01:43:08', 0),
(9, 12, 'Your track C??I TH�I was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 01:44:23', 0),
(10, 5, 'Your track C�U H?N C�U TH? was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 01:45:10', 0),
(11, 2, 'Your track S?I G?N &#272;AU L?NG QU? was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 01:45:39', 0),
(12, 7, 'Your track CH�NG TA SAU N�Y  was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 01:46:59', 0),
(13, 9, 'Your track MU?N R?I M� SAO C�N was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 01:47:27', 0),
(14, 11, 'Your track T�NH TH??NG PHU TH� was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 01:47:55', 0),
(15, 14, 'Your track BEAUTIFUL MISTAKES was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 01:48:13', 0),
(16, 12, 'Your track D?U D�NG EM ??N was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 01:48:50', 0),
(17, 1, 'Your track PH?N DUY�N L? L�NG was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 01:49:10', 0),
(18, 30, 'Your track IN THE MORNING was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 01:49:28', 0),
(19, 18, 'Your track LOCO was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 01:50:31', 0),
(20, 27, 'Your track DUMB DUMB was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 01:51:09', 0),
(21, 28, 'Your track COLD BLOODED was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 01:51:27', 0),
(22, 29, 'Your track CHRISTMAS EVEL was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 01:51:50', 0),
(23, 28, 'Your track AIRPORT GOODBYES AIRPORT GOODBYES was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 01:52:28', 0),
(24, 25, 'Your track SNAKE was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 01:52:54', 0),
(25, 24, 'Your track PING PONG was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 01:53:11', 0),
(26, 26, 'Your track ROMANTIC SUNDAY was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 01:53:26', 0),
(27, 6, 'Your track GONE was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 01:55:12', 0),
(28, 24, 'Your track SAILING was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 01:56:09', 0),
(29, 10, 'Your track H??NG  was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 01:58:06', 0),
(30, 34, 'Your request to become a Artist was accepted. If you unsatisfied, send feedback please!', '2021-12-10 02:49:39', 0),
(32, 23, 'Your album DIFFERENT WORLD was deleted by admin. If you unsatisfied, send feedback please!', '2021-12-10 03:09:24', 0),
(33, 24, 'Your track STAY was public. Now everyone can listen this track!', '2021-12-10 03:10:15', 0),
(34, 24, 'Your track STAY was changed something by admin. If you unsatisfied, send feedback please!', '2021-12-10 03:10:36', 0);

-- --------------------------------------------------------

--
-- Table structure for table `package_info`
--

CREATE TABLE `package_info` (
  `id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `price` double NOT NULL,
  `purchase_date` date NOT NULL,
  `expiration_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_info`
--

INSERT INTO `package_info` (`id`, `package_id`, `account_id`, `price`, `purchase_date`, `expiration_date`) VALUES
(1, 2, 32, 9.99, '2021-12-10', '2022-01-20'),
(2, 6, 7, 50.98, '2021-11-03', '2023-04-04'),
(3, 2, 15, 19.99, '2021-10-01', '2022-01-09'),
(4, 3, 25, 29.99, '2021-09-10', '2022-06-08'),
(5, 6, 22, 50.98, '2021-01-21', '2021-11-25'),
(6, 2, 1, 9.99, '2021-06-03', '2023-04-04'),
(7, 2, 15, 9.99, '2021-08-11', '2021-10-20'),
(8, 4, 29, 3.99, '2021-07-23', '2021-06-15'),
(9, 6, 6, 50.98, '2021-02-09', '2021-11-25'),
(10, 2, 1, 9.99, '2021-03-23', '2023-04-04'),
(11, 2, 15, 9.99, '2021-04-16', '2021-10-20'),
(12, 4, 12, 3.99, '2021-05-28', '2021-06-15'),
(13, 2, 38, 9.99, '2021-12-10', '2022-01-09');

-- --------------------------------------------------------

--
-- Table structure for table `playlist`
--

CREATE TABLE `playlist` (
  `id` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_date` date NOT NULL,
  `last_updated` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `status_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `playlist`
--

INSERT INTO `playlist` (`id`, `title`, `thumbnail`, `publish_date`, `last_updated`, `description`, `likes`, `status_id`, `category_id`) VALUES
(1, 'Recently 1', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(2, 'Recently 2', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(3, 'Recently 3', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(4, 'Recently 4', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(5, 'Recently 5', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(6, 'Recently 6', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(7, 'Recently 7', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(8, 'Recently 8', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(9, 'Recently 9', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(10, 'Recently 10', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(11, 'Recently 11', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(12, 'Recently 12', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(13, 'Recently 13', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(14, 'Recently 14', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(15, 'Recently 15', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(16, 'Recently 16', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(17, 'Recently 17', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(18, 'Recently 18', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(19, 'Recently 19', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(20, 'Recently 20', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(21, 'Recently 21', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(22, 'Recently 22', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(23, 'Recently 23', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(24, 'Recently 24', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(25, 'Recently 25', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(26, 'Recently 26', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(27, 'Recently 27', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(28, 'Recently 28', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(29, 'Recently 29', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(30, 'Recently 30', 'recently.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 1),
(31, 'Favorite 1', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(32, 'Favorite 2', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(33, 'Favorite 3', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(34, 'Favorite 4', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(35, 'Favorite 5', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(36, 'Favorite 6', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(37, 'Favorite 7', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(38, 'Favorite 8', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(39, 'Favorite 9', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(40, 'Favorite 10', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(41, 'Favorite 11', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(42, 'Favorite 12', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(43, 'Favorite 13', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(44, 'Favorite 14', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(45, 'Favorite 15', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(46, 'Favorite 16', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(47, 'Favorite 17', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(48, 'Favorite 18', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(49, 'Favorite 19', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(50, 'Favorite 20', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(51, 'Favorite 21', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(52, 'Favorite 22', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(53, 'Favorite 23', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(54, 'Favorite 24', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(55, 'Favorite 25', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(56, 'Favorite 26', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(57, 'Favorite 27', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(58, 'Favorite 28', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(59, 'Favorite 29', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(60, 'Favorite 30', 'favorite.jpg', '2021-12-09', '2021-12-09', '', 0, 3, 2),
(61, 'M-TP', 'b28f8fcddd254187930066d29fe9314b.jpg', '2021-12-10', '2021-12-10', 'Nguy&#7877;n Thanh T�ng, th&#432;&#7901;ng &#273;&#432;&#7907;c bi&#7871;t &#273;&#7871;n v&#7899;i ngh&#7879; danh S&#417;n T�ng M-TP, l� m&#7897;t nam ca s&#297; ki�m s�ng t�c nh&#7841;c, rapper v� di&#7877;n vi�n ng&#432;&#7901;i Vi&#7879;t Nam. Sinh ra &#7903; th�nh ph&#7889; Th�i B�nh, th&#7901;i th&#417; &#7845;u, T�ng th&#432;&#7901;ng &#273;i h�t &#7903; Cung v&#259;n ho� thi&#7871;u nhi t&#7881;nh Th�i B�nh v� h&#7885;c ch&#417;i &#273;�n organ.', 0, 1, 3),
(63, 'Favorite 32', 'event1.jpg', '2021-12-10', '2021-12-10', '', 0, 3, 2),
(64, 'Recently 32', 'event2.jpg', '2021-12-10', '2021-12-10', '', 0, 3, 1),
(65, 'Money', '1713420c1d1047298df224e8057a0957.jpg', '2021-12-22', '2021-12-10', '\"Money\" is a song by Thai rapper and singer, and Blackpink member Lisa from her debut single album Lalisa (2021). It was released to US contemporary hit radio by Interscope Records as the second single from the album on November 9, 2021. The lyrics for the track were written by Bekuh Boom and Vince, with music being composed by them alongside 24 and R. Tee. Commercially, the song peaked at number ten on the Billboard Global 200 and number seven on the Global Excl. U.S., as well as number 90 on the US Billboard Hot 100.', 0, 1, 3),
(67, 'THE ALBUM', '93688fbbc0a94621b99c80a539241d00.png', '2021-12-18', '2021-12-10', 'The Album (stylized in all caps) is the first Korean studio album (second overall) by the South Korean girl group Blackpink. It was released on October 2, 2020, by YG Entertainment and distributed through YG Plus and Interscope Records. It is the group\'s first full-length work since their debut in 2016.[4] For the album, Blackpink recorded over ten new songs and worked with a variety of producers, including Teddy, Tommy Brown, R. Tee, Steven Franks, and 24. Eight songs made the final tracklist, including two collaborations: \"Ice Cream\" with Selena Gomez, and \"Bet You Wanna\" featuring Cardi B. The album explores the themes of love and the complexities of growing up. Musically, The Album utilizes pop, R&B, hip hop, EDM, and trap elements.', 0, 3, 3),
(68, 'Top 20 Best Song Ever edit', 'af12b3569f8c4220b8e5e9b2a587bb62.jpg', '2021-12-10', '2021-12-10', 'This is a custom playlist by admin.  edit', 0, 1, 5),
(69, 'Throwback Happy Hits', 'bd62259ff6704ee099724ee4593ac634.jpg', '2021-12-10', '2021-12-10', 'Top tracks that you be happy when hearing it.', 0, 3, 6),
(70, 'Asia Tune', '9432b56cb35d44de932a754ed2a0c659.jpg', '2021-12-10', '2021-12-10', 'Some Asian tracks that you could not forget the melody.', 0, 3, 5),
(71, 'A Little Chill', '73bff04a1b3440e796f153b9ab9b8f56.jpg', '2021-12-10', '2021-12-10', 'Start a new trip with the playlist of nature.', 0, 1, 7),
(72, 'day la playlist', 'custom.jpg', '2021-12-10', '2021-12-10', 'day la playlist', 0, 1, 4),
(73, 'Favorite 34', 'event1.jpg', '2021-12-10', '2021-12-10', '', 0, 3, 2),
(74, 'Recently 34', 'event2.jpg', '2021-12-10', '2021-12-10', '', 0, 3, 1),
(75, 'Favorite 37', 'favorite.jpg', '2021-12-10', '2021-12-10', 'Favorite 37', 0, 3, 2),
(76, 'Recently 37', 'recently.jpg', '2021-12-10', '2021-12-10', 'Recently 37', 0, 3, 1),
(77, 'Favorite 38', 'event1.jpg', '2021-12-10', '2021-12-10', '', 0, 3, 2),
(78, 'Recently 38', 'event2.jpg', '2021-12-10', '2021-12-10', '', 0, 3, 1),
(79, 'New playlist', 'f447e5f97222444a965d2b21f2c1f65d.jpg', '2021-12-10', '2021-12-10', 'New playlist', 0, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `playlist_category`
--

CREATE TABLE `playlist_category` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `playlist_category`
--

INSERT INTO `playlist_category` (`id`, `name`) VALUES
(1, 'Recently played'),
(2, 'Favorite song'),
(3, 'Album'),
(4, 'Custom'),
(5, 'Party'),
(6, 'Relaxing'),
(7, 'Travaling');

-- --------------------------------------------------------

--
-- Table structure for table `playlist_track`
--

CREATE TABLE `playlist_track` (
  `playlist_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `playlist_track`
--

INSERT INTO `playlist_track` (`playlist_id`, `track_id`) VALUES
(2, 17),
(2, 41),
(4, 28),
(4, 32),
(8, 28),
(8, 32),
(25, 2),
(32, 17),
(34, 32),
(61, 17),
(61, 41),
(63, 17),
(64, 2),
(64, 7),
(64, 17),
(64, 28),
(64, 32),
(64, 34),
(64, 35),
(65, 7),
(67, 28),
(67, 32),
(68, 3),
(68, 9),
(68, 17),
(68, 32),
(69, 25),
(69, 26),
(70, 7),
(70, 8),
(71, 28),
(71, 29),
(72, 31),
(72, 32),
(77, 23),
(78, 2),
(78, 7),
(78, 8),
(78, 14),
(78, 15),
(78, 16),
(78, 17),
(78, 21),
(78, 23),
(78, 26),
(78, 28),
(78, 29),
(78, 32),
(78, 33),
(78, 34),
(78, 35),
(79, 1),
(79, 17);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ROLE_USER'),
(2, 'ROLE_ADMIN'),
(3, 'ROLE_MANAGER');

-- --------------------------------------------------------

--
-- Table structure for table `service_package`
--

CREATE TABLE `service_package` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `duration` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_package`
--

INSERT INTO `service_package` (`id`, `name`, `price`, `duration`, `status`, `description`, `is_delete`) VALUES
(2, 'Premium', 9.99, 1, 1, 'good', 0),
(3, 'Pro Premium', 29.99, 6, 1, 'perfect', 0),
(4, 'Starter', 5.99, 1, 1, 'normal', 0),
(6, '[Hot] VIP Premium edit', 100, 8, 1, '[Hot] VIP Premium edit', 1),
(7, 'Gold', 150, 10, 1, 'Gold', 0);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `name`) VALUES
(1, 'Public'),
(2, 'Pending'),
(3, 'Hidden');

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `id` int(11) NOT NULL,
  `file_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lyrics` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `duration` int(11) NOT NULL DEFAULT current_timestamp(),
  `listens` int(11) NOT NULL DEFAULT 0,
  `base_listens` int(11) NOT NULL DEFAULT 0,
  `weekly_listens` int(11) NOT NULL DEFAULT 0,
  `is_premium` tinyint(1) NOT NULL DEFAULT 0,
  `publish_date` date NOT NULL,
  `status_id` int(11) NOT NULL,
  `genres_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`id`, `file_name`, `title`, `lyrics`, `thumbnail`, `likes`, `duration`, `listens`, `base_listens`, `weekly_listens`, `is_premium`, `publish_date`, `status_id`, `genres_id`) VALUES
(1, '2830e21916384dd5bfc74fce15e68ca3.mp3', 'Stay', 'Stay one more night/n\r\nOh, my dear, why do all the seasons change?/n\r\nOver time, now we\'re here thinkin\' \'bout those days/n\r\nI just wish things could be like they used to/n\r\nBut they never will now I see right through you/n\r\nWish you could tell me all the ways that I miss you/n\r\nBaby, I\'d be lying if I didn\'t say I wish you\'d/n\r\nStay, baby/n\r\nI don\'t know, know you anymore/n\r\nTried my best to forget you/n\r\nBut I know that I still miss you/n\r\nDancing all alone/n\r\nBut I can\'t let you go/n\r\nGave you all I can give you/n\r\nNow all that\'s left is \"I still miss you\"/n\r\nYou don\'t love me like you used to/n\r\nI can tell you don\'t need me when I\'m with you/n\r\nGirl, you don\'t need help/n\r\nYou was lyin\' while im lyin\' here by myself/n\r\nBut who was there when you were crying on the ground?/n\r\nOh, I should probably go/n\r\nI should hit the road/n\r\nDrop you and go, damn/n\r\nI am alone in the world/n\r\nI\'m tired of feeling down, I think it\'s time I leave you now, yeah/n\r\nI just wish things could be like they used to/n\r\nBut they never will now I see right through you/n\r\nWish you could tell me all the ways that I miss you/n\r\nBaby, I\'d be lying if I didn\'t say I wish you\'d/n\r\nStay, baby/n\r\nI don\'t know, know you anymore/n\r\nTried my best to forget you/n\r\nBut I know that I still miss you/n\r\nDancing all alone/n\r\nBut I can\'t let you go/n\r\nGave you all I could give you/n\r\nNow all that\'s left is \"I still miss you\"/n\r\nI just wish things could be like they used to/n\r\nBut they never will now I see right through you/n\r\nWish you could tell me all the ways that I miss you/n', '45f77e0e74e34c9ca9b7894af6b985ad.jpg', 4551, 167, 34520, 34210, 350, 0, '2021-12-09', 1, 3),
(2, '4978f2e8bb7543ce93f9e2a4890d8d8e.mp3', 'End of Time', 'When things are right, then you just know/n\r\nThere is something in your eyes that brings me home/n\r\n\'Cause when there\'s love, you don\'t let go/n\r\nSo as long as you\'re with me you\'re not alone, you\'ll never be/n\r\nI wanna tell you what I feel and really mean it/n\r\nI wanna shout it from the rooftops to the sky/n\r\n\'Cause if you ever need a friend, you know I\'ll be it/n\r\nFrom tonight until we see the end of time/n\r\nI\'ll cross my heart/n\r\nAnd hope to die/n\r\nWe\'re always and forever, I\'ll be by your side/n\r\nWhen days are dark/n\r\nAnd stars don\'t line/n\r\nWe\'re always and forever \'til the end, the end of time/n\r\nWhen we look back, to when we\'re old/n\r\nWe\'ll see your footprints next to mine along the road/n\r\nAnd I don\'t know, what the future holds/n\r\nBut as long as you\'re with me, you\'re not alone, you\'ll never be/n\r\nI wanna tell you what I feel and really mean it/n\r\nI wanna shout it from the rooftops to the sky/n\r\n\'Cause if you ever need a friend, you know I\'ll be it/n\r\nFrom tonight until we see the end of time/n\r\nI\'ll cross my heart/n\r\nAnd hope to die/n\r\nWe\'re always and forever, I\'ll be by your side/n\r\nWhen days are dark/n\r\nAnd stars don\'t line/n\r\nWe\'re always and forever \'til the end, the end of time/n\r\nPut your hands to the sky/n\r\nAlways and forever by our side/n\r\nAlways and forever \'til the end of time/n\r\nI\'ll cross my heart/n\r\nAnd hope to die/n\r\nWe\'re always and forever, I\'ll be by your side/n\r\nWhen days are dark/n\r\nAnd stars don\'t line/n\r\nWe\'re always and forever \'til the end, the end of time/n\r\nThe end of time/n', '8d53c27210c5465cac5a485046182de8.jpg', 123, 187, 42547, 40000, 4521, 0, '2021-12-07', 1, 3),
(3, '7ca2207b76cf4db8a2db8253f2db4f78.mp3', 'You Dont Know Me', 'Take me to the place I used to run/n\r\nRemember the house where I was born/n\r\nBaby, you don\'t know me/n\r\nMy baby, you don\'t know/n\r\nI\'ll show you all the stars I used to hide/n\r\nNo one never seemed to realize/n\r\nBut baby, you will know me/n\r\nBut baby, you will know/n\r\nBaby, you don\'t know/n\r\nBaby, you don\'t know/n\r\nBaby, you don\'t know/n\r\nBaby, you don\'t know/n\r\nTake me to the place I used to run/n\r\nRemember the house where I was born/n\r\nBaby, you don\'t know me/n\r\nBaby, you don\'t know/n\r\nI\'ll show you all the stars I used to hide/n\r\nNo one never seemed to realize/n\r\nBut baby, you will know me/n\r\nBut baby, you will know/n\r\nBaby, you don\'t know/n\r\nBaby, you don\'t know/n\r\nBaby, you don\'t know/n\r\nBaby, you don\'t know/n\r\nBut baby, you don\'t know/n', '0aaa1605a1d445e9935fc48552cb8f50.jpg', 424, 147, 25052, 24000, 2121, 1, '2021-11-15', 3, 3),
(4, '0badfe02e1fe4bf3aa3b41859e094d3b.mp3', 'Daydreamer', 'I\'d like to be what I am not/n\r\nAn Astronaut? But hey, why not?/n\r\nMy life is mine and it\'s a fact/n\r\nI\'d like to be what I am not/n\r\nAn Astronaut? But hey, why not?/n\r\nMy life is mine and it\'s a fact/n\r\nWake up in the morning/n\r\nAnd I picture myself flying in the sky/n\r\n\'Cause I\'m a bird, it\'s not a lie/n\r\nNow that I am diving/n\r\nThrough the oceans of my dreams/n\r\nI want them so bad to become reality/n\r\nI\'m a daydreamer/n\r\nI\'d like to be what I am not/n\r\nAn Astronaut? But hey, why not?/n\r\nMy life is mine and it\'s a fact/n\r\nI\'d like to be what I am not/n\r\nAn Astronaut? But hey, why not?/n\r\nMy life is mine and it\'s a fact/n\r\nWake up in the morning/n\r\nAnd I picture myself flying in the sky/n\r\n\'Cause I\'m a bird, it\'s not a lie/n\r\nNow that I am diving/n\r\nThrough the oceans of my dreams/n\r\nI want them so bad to become reality/n\r\nI\'m a daydreamer/n\r\nI\'m a daydreamer/n\r\nI\'m a daydreamer/n\r\nI\'m a daydreamer/n\r\nI\'d like to be what I am not/n\r\nAn Astronaut? But hey, why not?/n\r\nMy life is mine and it\'s a fact/n\r\nI\'d like to be what I am not/n\r\nAn Astronaut? But hey, why not?/n\r\nMy life is mine and it\'s a fact/n\r\nWake up in the morning/n\r\nAnd I picture myself flying in the sky/n\r\n\'Cause I\'m a bird, it\'s not a lie/n\r\nNow that I am diving/n\r\nThrough the oceans of my dreams/n\r\nI want them so bad to become reality/n\r\nI\'m a daydreamer/n\r\nI\'m a daydreamer/n\r\nI\'m a daydreamer/n\r\nI\'m a daydreamer/n\r\nI\'m a daydreamer/n', '8e43d477389e46c9854906319d78ef1c.jpg', 7352, 185, 14041, 12000, 1210, 0, '2021-10-04', 3, 8),
(5, 'b36235015c1542ef9b694b5c63c123cc.mp3', 'B&#432;&#7899;c Qua Nhau', 'Cu&#7897;c &#273;&#7901;i c&#7913; tr�i, ta nh�n l&#7841;i ng�y th�ng c�n b�n nhau c�ng nh&#7919;ng th&#259;ng tr&#7847;m./n\r\nT&#7841;i sao kh�ng v&#7851;y tay ch�o n&#417;i ta &#273;&#7913;ng b�y gi&#7901; hai n&#417;i hai ng&#432;&#7901;i d&#432;ng./n\r\n&#272;&#7907;i em b&#432;&#7899;c qua &#273;&#7875; khi&#7871;n anh nh&#7853;n ra l� &#273;�i m&#7855;t em c�n &#273;ang bu&#7891;n./n\r\nM�u hoa c�i �o v&#7851;n c�n nh&#432; l&#7901;i h&#7913;a &#273;� t&#7915;ng gi&#7901; &#273;�y c�n nh&#432; x&#432;a./n\r\nD�ng ng&#432;&#7901;i v&#7897;i v�ng b&#432;&#7899;c qua, ch&#7907;t nh&#432; chi&#7871;c h�n th&#7871; th�i./n\r\n/n\r\n&#272;�i m�i chia l�m &#273;�i nh&#432; ta &#273;ang mong v&#7853;y th�i/n\r\nNg&#432;&#7901;i ngh&#7865;n ng�o b&#432;&#7899;c &#273;i, ch&#7907;t nh&#432; ch�ng ta quay v&#7873;/n\r\nGi&#7845;u tr�i tim m�nh v� &#273;&#7915;ng th&#7893;n th&#7913;c khi th&#7845;y nhau/n\r\n&#272;o�n t�u kia d&#7915;ng l&#7841;i, c�n hai ta b&#432;&#7899;c qua nhau/n\r\n/n\r\n[BRIDGE:]/n\r\nTr�i &#273;i theo m�y tr&#7901;i/n\r\nT&#7915;ng c&#7843;m x�c trong tim anh &#273;ang c� &#273;&#417;n c�ng v&#7899;i ng�n l&#7901;i/n\r\nVi&#7871;t ri�ng cho b�i ca t�nh &#273;&#7847;u/n\r\nCh&#7881; c�n l&#7841;i m&#7897;t th�i *** t&#7915; l�u/n', 'fde807f2e79f441db3cf23ed20939764.jpg', 1214, 257, 25334, 25200, 724, 1, '2021-10-26', 1, 9),
(6, 'd0de675446a74218a961b75a77736d8a.mp3', 'Peaches', 'I got my peaches out in Georgia (oh, yeah, shit)/n\r\nI get my weed from California (that\'s that shit)/n\r\nI took my chick up to the North, yeah (badass bitch)/n\r\nI get my light right from the source, yeah (yeah, that\'s it)/n\r\nAnd I see you (oh), the way I breathe you in (in), it\'s the texture of your skin/n\r\nI wanna wrap my arms around you, baby, never let you go, oh/n\r\nAnd I say, oh, there\'s nothing like your touch/n\r\nIt\'s the way you lift me up, yeah/n\r\nAnd I\'ll be right here with you \'til the end/n\r\nI got my peaches out in Georgia (oh, yeah, shit)/n\r\nI get my weed from California (that\'s that shit)/n\r\nI took my chick up to the North, yeah (badass bitch)/n\r\nI get my light right from the source, yeah (yeah, that\'s it)/n\r\nYou ain\'t sure yet, but I\'m for ya/n\r\nAll I could want, all I can wish for/n\r\nNights alone that we miss more/n\r\nAnd days we save as souvenirs/n\r\nThere\'s no time, I wanna make more time/n\r\nAnd give you my whole life/n\r\nI left my girl, I\'m in Mallorca/n\r\nHate to leave her, call it torture/n\r\nRemember when I couldn\'t hold her/n\r\nLeft her baggage for Rimowa/n\r\nI got my peaches out in Georgia (oh, yeah, shit)/n\r\nI get my weed from California (that\'s that shit)/n\r\nI took my chick up to the North, yeah (badass bitch)/n\r\nI get my light right from the source, yeah (yeah, that\'s it)/n\r\nI get the feeling, so I\'m sure (sure)/n\r\nHand in my hand because I\'m yours/n\r\nI can\'t, I can\'t pretend, I can\'t ignore you\'re right for me/n\r\nDon\'t think you wanna know just where I\'ve been, oh/n\r\nDone being distracted/n\r\nThe one I need is right in my arms (oh)/n\r\nYour kisses taste the sweetest with mine/n\r\nAnd I\'ll be right here with you \'til end of time/n\r\nI got my peaches out in Georgia (oh, yeah, shit)/n\r\nI get my weed from California (that\'s that shit)/n\r\nI took my chick up to the North, yeah (badass bitch)/n\r\nI get my light right from the source, yeah (yeah, that\'s it)/n\r\nI got my peaches out in Georgia (oh, yeah, shit)/n\r\nI get my weed from California (that\'s that shit)/n\r\nI took my chick up to the North, yeah (badass bitch)/n\r\n(I get my light right from the source, yeah, yeah)/n\r\nI got my peaches out in Georgia (oh, yeah, shit)/n\r\nI get my weed from California (that\'s that shit)/n\r\nI took my chick up to the North, yeah (badass bitch)/n\r\nI get my light right from the source, yeah (yeah, that\'s it)/n\r\nI got my peaches out in Georgia (oh, yeah, shit)/n\r\nI get my weed from California (that\'s that shit)/n\r\nI took my chick up to the North, yeah (badass bitch)/n\r\nI get my light right from the source, yeah (yeah, that\'s it)/n', 'efb259bbe53d4868a830869f2b539d12.jpg', 786, 198, 83122, 80000, 8587, 0, '2021-12-09', 2, 4),
(7, '01418b6d9a914eee831c3cf2161d36e0.mp3', 'Money', '[Verse 1]/n\r\nIt\'s the end of the month and the weekend/n\r\nI\'ma spend this check, everything on me, yeah/n\r\nI\'ma tip myself, I\'ma spend it on myself/n\r\nI\'ma drop it like it\'s pouring, I\'ma pour it on myself/n\r\n/n\r\n[Refrain]/n\r\nCheck, check, check, check that money/n\r\nMaking bank account number (Yikes)/n\r\nThat\'s that *** that\'s never getting bounced on ya\'/n\r\nBitch, I do the money dance, I just made a hundred bands/n\r\nWhen the store says sign for it/n\r\nI\'ma leave my autograph/n\r\n/n\r\n[Pre-Chorus]/n\r\nDolla\' bills, dolla\' bills/n\r\nWatch it fallin\' for me/n\r\nI love the way that feels/n\r\nDolla\' bills, dolla\' bills/n\r\nKeep on fallin\' for me/n\r\nI love th&#1077; way it feels/n\r\n/n\r\n[Chorus]/n\r\nI came here to drop som&#1077; money, dropping all my money/n\r\nDrop some money, all this bread so yummy, yeah/n\r\nTwerking, twerking, when I buy the things I like/n\r\nDolla\', dollas, dropping on my ass tonight/n\r\n/n\r\n[Verse 2]/n\r\nEveryone silent, listen to my money talk/n\r\nSpend how I like it/n\r\nYeah, everyone know what I mean, mean/n\r\nWhen they see green, when they see green, that mean go/n\r\nGive me what the hell I want, give me what the hell I want/n\r\n/n\r\n[Refrain]/n\r\nCheck that money/n\r\nMaking bank account number (Yikes)/n\r\nThat\'s that *** that\'s never getting bounced on ya\'/n\r\nBitch, I do the money dance, I just made a hundred bands/n\r\nWhen the store says sign for it/n\r\nI\'ma leave my autograph/n\r\n/n\r\n[Pre-Chorus]/n\r\nDolla\' bills, dolla\' bills/n\r\nWatch it fallin\' for me/n\r\nI love the way that feels/n\r\nDolla\' bills, dolla\' bills/n\r\nKeep on fallin\' for me/n\r\nI love the way it feels/n\r\n/n\r\n[Chorus]/n\r\nI came here to drop some money, dropping all my money/n\r\nDrop some money, all this bread so yummy, yeah/n\r\nTwerking, twerking, when I buy the things I like/n\r\nDolla\', dollas, dropping on my ass tonight/n\r\n/n\r\n[Post-Chorus]/n\r\nDrop some money, dropping all my money/n\r\nDrop some money, all this bread so yummy, yeah/n\r\nDrop some money, dropping all my money/n\r\nDrop some money, all this bread so yummy, yeah/n\r\n/n\r\n[Outro]/n\r\nMy money moves, money I choose/n\r\nCeline my shoes, walkin\' on you/n\r\nMy money rules, my money moves, money I choose/n\r\nWatch how my wons and yens and dollars be droppin\' on you/n\r\n(Dun, dun-dun-dun-dun-dun, dun, dun-dun-dun-dun-dun-dun)/n\r\nDroppin\' on you/n\r\n(Dun, dun-dun-dun-dun-dun, dun, dun-dun-dun-dun-dun-dun)/n\r\nDroppin\' on you/n', 'e4cd78cce54345ff82579c5efb5df926.jpg', 4535, 168, 14147, 13330, 453, 1, '2021-10-12', 1, 3),
(8, 'c1ab4e3211b745f0ad927d08bd734bb2.mp3', 'On The Ground ', 'My life\'s been magic, seems fantastic/n\r\nI used to have a hole in the wall with a mattress/n\r\nFunny when you want it, suddenly you have it/n\r\nYou find out that your gold\'s just plastic/n\r\nEvery day, every night/n\r\nI\'ve been thinkin\' back on you and I/n\r\nEvery day, every night/n\r\nI worked my whole life/n\r\nJust to get right, just to be like/n\r\n\"Look at me, I\'m never coming down\"/n\r\nI worked my whole life/n\r\nJust to get high, just to realize/n\r\nEverything I need is on the/n\r\nEverything I need is on the ground/n\r\nOn the ground/n\r\nEverything I need is on the ground/n\r\n(Nah, but they don\'t hear me though)/n\r\n(Yeah, what goes up must come down)/n\r\n(Nah, but they don\'t hear me though)/n\r\n(You\'re runnin\' out of time)/n\r\nMy world\'s been hectic, seems electric/n\r\nBut I\'ve been waking up with your voice in my head/n\r\nAnd I\'m tryna send a message and let you know that/n\r\nEvery single minute I\'m without you, I regret it/n\r\nEvery day, every night/n\r\nI\'ve been thinkin\' back on you and I/n\r\nEvery day, every night/n\r\nI worked my whole life/n\r\nJust to get right, just to be like/n\r\n\"Look at me, I\'m never coming down\"/n\r\nI worked my whole life/n\r\nJust to get high, just to realize/n\r\nEverything I need is on the/n\r\nEverything I need is on the ground/n\r\nOn the ground/n\r\nEverything I need is on the ground/n\r\n(Nah, but they don\'t hear me though)/n\r\n(Yeah, what goes up must come down)/n\r\n(Nah, but they don\'t hear me though)/n\r\n(You\'re runnin\' out of time)/n\r\nI\'m way up in the clouds/n\r\nAnd they say I\'ve made it now/n\r\nBut I figured it out/n\r\nEverything I need is on the ground (yeah, yeah)/n\r\nJust drove by your house (just drove by your house)/n\r\nSo far from you now (so far from you now)/n\r\nBut I figured it out/n\r\nEverything I need is on the/n\r\nEverything I need is on the ground/n\r\nOn the ground/n\r\nEverything I need is on the ground/n\r\n(Nah, but they don\'t hear me though)/n\r\nOn the ground/n\r\n(Nah, but they don\'t hear me though)/n\r\nEverything I need is on the ground/n', '66c12113a6f64d7c922bfa4a18adbeee.jpg', 52, 168, 3289, 3000, 4242, 0, '2021-12-07', 1, 1),
(9, 'd601269b27c649e98e7c5c96503f4ef3.mp3', 'Kiss Me More ', 'We hug and yes, we make love/n\r\nAnd always just say \"Goodnight\" (la-la-la-la-la)/n\r\nAnd we cuddle, sure I do love it/n\r\nBut I need your lips on mine/n\r\nCan you kiss me more?/n\r\nWe\'re so young, boy/n\r\nWe ain\'t got nothin\' to lose, oh, oh/n\r\nIt\'s just principle/n\r\nBaby, hold me/n\r\n\'Cause I like the way you groove, oh, oh/n\r\nBoy, you write your name, I can do the same/n\r\nOoh, I love the taste, la-la-la-la/n\r\nAll on my tongue, I want it (la-la-la-la)/n\r\nBoy, you write your name, I can do the same/n\r\nOoh, I love the taste, la-la-la-la-la/n\r\nAll on my tongue, I want it/n\r\nI, I feel like fuckin\' somethin\'/n\r\nBut we could be corny, fuck it/n\r\nSugar, I ain\'t no dummy, dummy/n\r\nI like to say, what if, but if/n\r\nWe could kiss and just cut the rubbish/n\r\nThen I might be on to somethin\'/n\r\nI ain\'t givin\' you one in public/n\r\nI\'m givin\' you hundreds, fuck it/n\r\nSomethin\' we just gotta get into/n\r\nSign first, middle, last, on the wisdom tooth/n\r\nNiggas wishin\' that the pussy was a kissin\' booth/n\r\nTaste breakfast, lunch and gin and juice/n\r\nAnd that dinner just like dessert too/n\r\nAnd when we French, refresh, gimme two/n\r\nWhen I bite that lip, come get me too/n\r\nHe want lipstick, lip gloss, hickeys too, uh/n\r\nCan you kiss me more?/n\r\nWe\'re so young, boy/n\r\nWe ain\'t got nothin\' to lose, oh, oh/n\r\nIt\'s just principle/n\r\nBaby, hold me/n\r\n\'Cause I like the way you groove, oh, oh/n\r\nBoy, you write your name, I can do the same/n\r\nOoh, I love the taste, la-la-la-la/n\r\nAll on my tongue, I want it (la-la-la-la)/n\r\nBoy, you write your name, I can do the same/n\r\nOoh, I love the taste, la-la-la-la-la/n\r\nAll on my tongue, I want it/n\r\nSay give me a buck, need that gushy stuff/n\r\nPush the limit, no, you ain\'t good enough/n\r\nAll your niggas say that you lost without me/n\r\nAll my bitches feel like I dodged the county/n\r\nFuckin\' with you feel like jail, nigga/n\r\nI can\'t even exhale, nigga/n\r\nPussy like holy grail, you know that/n\r\nYou gon\' make me need bail, you know that/n\r\nCaught dippin\' with your friend/n\r\nYou ain\'t even have man, lyin\' on ya-, you know that/n\r\nGot me a bag full of brick, you know that/n\r\nControl, don\'t slow the pace if I throw back/n\r\nAll this ass for real/n\r\nDrama make you feel/n\r\nFantasy and whip appeal/n\r\nIs all I can give you/n\r\nCan you kiss me more?/n\r\nWe\'re so young, boy/n\r\nWe ain\'t got nothin\' to lose, oh, oh/n\r\nIt\'s just principle/n\r\nBaby, hold me/n\r\n\'Cause I like the way you groove, oh, oh/n\r\nOh, darlin\'/n\r\nBoy, you write your name, I can do the same/n\r\nOoh, I love the taste, oh-la-la-la-la/n\r\nAll on my tongue, I want it/n\r\nBoy, you write your name, I can do the same/n\r\nOoh, I love the taste, oh-la-la-la-la-la/n\r\nAll on my tongue, I want it/n', 'db9331903f67432e84d63256a08ff121.jpg', 782, 208, 3452, 3000, 868, 0, '2021-11-04', 1, 1),
(10, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'Celebrity ', '&#49464;&#49345;&#51032; &#47784;&#49436;&#47532;/n\r\n&#44396;&#48512;&#51221;&#54616;&#44172; &#52964;&#48260;&#47536;/n\r\n&#44264;&#52843;&#44144;&#47532; outsider (ah ah)/n\r\n&#44152;&#51020;&#44152;&#51060;, &#50743;&#52264;&#47548;/n\r\n&#51060;&#50612;&#54256; &#45320;&#47672; playlist/n\r\n&#51020;&#50501;&#44620;&#51648; &#45796; minor/n\r\n&#45324; &#47784;&#47476;&#51648;/n\r\n&#46504;&#44400; &#44256;&#44060; &#50948;/n\r\n&#54872;&#54620; &#48731; &#51312;&#47749;&#51060;/n\r\n&#50612;&#46364; &#48708;&#52628;&#45716;&#51648;/n\r\n&#45712;&#47140;&#46020; &#51339;&#51004;&#45768;/n\r\n&#44208;&#44397; &#50508;&#44172; &#46104;&#44600;/n\r\nThe one and only/n\r\nYou are my celebrity/n\r\n&#51082;&#51648;&#47560; &#45324; &#55120;&#47536; &#50612;&#46176; &#49324;&#51060;/n\r\n&#50812;&#49552;&#51004;&#47196; &#44536;&#47536; &#48324; &#54616;&#45208;/n\r\n&#48372;&#51060;&#45768; &#44536; &#50976;&#51068;&#54632;&#51060; &#50620;&#47560;&#45208;/n\r\n&#50500;&#47492;&#45796;&#50868;&#51648; &#47568;&#50556;/n\r\nYou are my celebrity/n\r\nCelebrity/n\r\nYou are my celebrity/n\r\n&#51648;&#52432;&#48260;&#47536; &#54364;&#51221; &#47560;&#52824;/n\r\n&#51204;&#50896;&#51012; &#44732;&#45459;&#51008; &#46319;&#51060;/n\r\n&#49900;&#51109;&#49548;&#47536; too quiet/n\r\n&#45348;&#44032; &#44032;&#51652; &#48152;&#51677;&#44144;&#47548;/n\r\n&#49345;&#49345;&#47141;, identity/n\r\n&#44620;&#51648; &#47784;&#51312;&#47532; diet, woo/n\r\n&#45324; &#47784;&#47476;&#51648;/n\r\n&#50500;&#51649; &#47803;&#45796; &#54592;/n\r\n&#45328; &#50948;&#54644; &#50416;&#50668;&#51652;/n\r\n&#50724;&#47000;&#46108; &#49324;&#46993;&#49884;/n\r\n&#54756;&#47588;&#46020; &#51339;&#51004;&#45768;/n\r\n&#50883;&#51020; &#51667;&#44172; &#46104;&#44600;/n\r\nThe one and only/n\r\nYou are my celebrity/n\r\n&#51082;&#51648;&#47560; &#45324; &#55120;&#47536; &#50612;&#46176; &#49324;&#51060;/n\r\n&#50812;&#49552;&#51004;&#47196; &#44536;&#47536; &#48324; &#54616;&#45208;/n\r\n&#48372;&#51060;&#45768; &#44536; &#50976;&#51068;&#54632;&#51060; &#50620;&#47560;&#45208;/n\r\n&#50500;&#47492;&#45796;&#50868;&#51648; &#47568;&#50556;/n\r\nYou are my celebrity/n\r\n&#48156;&#51088;&#44397;&#47560;&#45796; &#51060;&#50612;&#51652; &#48324;&#51088;&#47532;/n\r\n&#44536; &#49436;&#53804;&#47480; &#44152;&#51020;&#51060; &#49352;&#44200;&#45459;&#51008; &#48145;&#44536;&#47548;/n\r\n&#50724;&#47215;&#51060; &#45320;&#47484; &#47564;&#45208;&#47084; &#44032;&#45716; &#44600;/n\r\n&#44536;&#47532;&#47196; &#44032;&#47732; &#46076; &#51216;&#49440;&#51012; &#46384;&#46972;/n\r\n&#51082;&#51648;&#47560; &#51060; &#50724;&#47004; &#44200;&#50872; &#49324;&#51060;/n\r\n&#50616; &#53960;&#51004;&#47196; &#54588;&#50872; &#44867; &#54616;&#45208;/n\r\n&#48372;&#51060;&#45768; &#54616;&#47336; &#46244; &#48388;&#51060; &#50620;&#47560;&#45208;/n\r\n&#50500;&#47492;&#45796;&#50872;&#51648; &#47568;&#50556;/n\r\nYou are my celebrity/n\r\nCelebrity/n\r\nYou are my celebrity/n', '7df52e35f7134236991ad2ab373e9a25.jpg', 8548, 195, 14718, 13000, 575, 0, '2021-11-15', 1, 5),
(11, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'Deja Vu', '&#49464;&#49345;&#51032; &#47784;&#49436;&#47532;/n\r\n&#44396;&#48512;&#51221;&#54616;&#44172; &#52964;&#48260;&#47536;/n\r\n&#44264;&#52843;&#44144;&#47532; outsider (ah ah)/n\r\n&#44152;&#51020;&#44152;&#51060;, &#50743;&#52264;&#47548;/n\r\n&#51060;&#50612;&#54256; &#45320;&#47672; playlist/n\r\n&#51020;&#50501;&#44620;&#51648; &#45796; minor/n\r\n&#45324; &#47784;&#47476;&#51648;/n\r\n&#46504;&#44400; &#44256;&#44060; &#50948;/n\r\n&#54872;&#54620; &#48731; &#51312;&#47749;&#51060;/n\r\n&#50612;&#46364; &#48708;&#52628;&#45716;&#51648;/n\r\n&#45712;&#47140;&#46020; &#51339;&#51004;&#45768;/n\r\n&#44208;&#44397; &#50508;&#44172; &#46104;&#44600;/n\r\nThe one and only/n\r\nYou are my celebrity/n\r\n&#51082;&#51648;&#47560; &#45324; &#55120;&#47536; &#50612;&#46176; &#49324;&#51060;/n\r\n&#50812;&#49552;&#51004;&#47196; &#44536;&#47536; &#48324; &#54616;&#45208;/n\r\n&#48372;&#51060;&#45768; &#44536; &#50976;&#51068;&#54632;&#51060; &#50620;&#47560;&#45208;/n\r\n&#50500;&#47492;&#45796;&#50868;&#51648; &#47568;&#50556;/n\r\nYou are my celebrity/n\r\nCelebrity/n\r\nYou are my celebrity/n\r\n&#51648;&#52432;&#48260;&#47536; &#54364;&#51221; &#47560;&#52824;/n\r\n&#51204;&#50896;&#51012; &#44732;&#45459;&#51008; &#46319;&#51060;/n\r\n&#49900;&#51109;&#49548;&#47536; too quiet/n\r\n&#45348;&#44032; &#44032;&#51652; &#48152;&#51677;&#44144;&#47548;/n\r\n&#49345;&#49345;&#47141;, identity/n\r\n&#44620;&#51648; &#47784;&#51312;&#47532; diet, woo/n\r\n&#45324; &#47784;&#47476;&#51648;/n\r\n&#50500;&#51649; &#47803;&#45796; &#54592;/n\r\n&#45328; &#50948;&#54644; &#50416;&#50668;&#51652;/n\r\n&#50724;&#47000;&#46108; &#49324;&#46993;&#49884;/n\r\n&#54756;&#47588;&#46020; &#51339;&#51004;&#45768;/n\r\n&#50883;&#51020; &#51667;&#44172; &#46104;&#44600;/n\r\nThe one and only/n\r\nYou are my celebrity/n\r\n&#51082;&#51648;&#47560; &#45324; &#55120;&#47536; &#50612;&#46176; &#49324;&#51060;/n\r\n&#50812;&#49552;&#51004;&#47196; &#44536;&#47536; &#48324; &#54616;&#45208;/n\r\n&#48372;&#51060;&#45768; &#44536; &#50976;&#51068;&#54632;&#51060; &#50620;&#47560;&#45208;/n\r\n&#50500;&#47492;&#45796;&#50868;&#51648; &#47568;&#50556;/n\r\nYou are my celebrity/n\r\n&#48156;&#51088;&#44397;&#47560;&#45796; &#51060;&#50612;&#51652; &#48324;&#51088;&#47532;/n\r\n&#44536; &#49436;&#53804;&#47480; &#44152;&#51020;&#51060; &#49352;&#44200;&#45459;&#51008; &#48145;&#44536;&#47548;/n\r\n&#50724;&#47215;&#51060; &#45320;&#47484; &#47564;&#45208;&#47084; &#44032;&#45716; &#44600;/n\r\n&#44536;&#47532;&#47196; &#44032;&#47732; &#46076; &#51216;&#49440;&#51012; &#46384;&#46972;/n\r\n&#51082;&#51648;&#47560; &#51060; &#50724;&#47004; &#44200;&#50872; &#49324;&#51060;/n\r\n&#50616; &#53960;&#51004;&#47196; &#54588;&#50872; &#44867; &#54616;&#45208;/n\r\n&#48372;&#51060;&#45768; &#54616;&#47336; &#46244; &#48388;&#51060; &#50620;&#47560;&#45208;/n\r\n&#50500;&#47492;&#45796;&#50872;&#51648; &#47568;&#50556;/n\r\nYou are my celebrity/n\r\nCelebrity/n\r\nYou are my celebrity/n', 'dbc4f8f83d554a998616b7bf7e602345.jpg', 57, 195, 34532, 32200, 351, 1, '2021-12-01', 3, 11),
(12, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'Realer N Realer', '&#49464;&#49345;&#51032; &#47784;&#49436;&#47532;/n\r\n&#44396;&#48512;&#51221;&#54616;&#44172; &#52964;&#48260;&#47536;/n\r\n&#44264;&#52843;&#44144;&#47532; outsider (ah ah)/n\r\n&#44152;&#51020;&#44152;&#51060;, &#50743;&#52264;&#47548;/n\r\n&#51060;&#50612;&#54256; &#45320;&#47672; playlist/n\r\n&#51020;&#50501;&#44620;&#51648; &#45796; minor/n\r\n&#45324; &#47784;&#47476;&#51648;/n\r\n&#46504;&#44400; &#44256;&#44060; &#50948;/n\r\n&#54872;&#54620; &#48731; &#51312;&#47749;&#51060;/n\r\n&#50612;&#46364; &#48708;&#52628;&#45716;&#51648;/n\r\n&#45712;&#47140;&#46020; &#51339;&#51004;&#45768;/n\r\n&#44208;&#44397; &#50508;&#44172; &#46104;&#44600;/n\r\nThe one and only/n\r\nYou are my celebrity/n\r\n&#51082;&#51648;&#47560; &#45324; &#55120;&#47536; &#50612;&#46176; &#49324;&#51060;/n\r\n&#50812;&#49552;&#51004;&#47196; &#44536;&#47536; &#48324; &#54616;&#45208;/n\r\n&#48372;&#51060;&#45768; &#44536; &#50976;&#51068;&#54632;&#51060; &#50620;&#47560;&#45208;/n\r\n&#50500;&#47492;&#45796;&#50868;&#51648; &#47568;&#50556;/n\r\nYou are my celebrity/n\r\nCelebrity/n\r\nYou are my celebrity/n\r\n&#51648;&#52432;&#48260;&#47536; &#54364;&#51221; &#47560;&#52824;/n\r\n&#51204;&#50896;&#51012; &#44732;&#45459;&#51008; &#46319;&#51060;/n\r\n&#49900;&#51109;&#49548;&#47536; too quiet/n\r\n&#45348;&#44032; &#44032;&#51652; &#48152;&#51677;&#44144;&#47548;/n\r\n&#49345;&#49345;&#47141;, identity/n\r\n&#44620;&#51648; &#47784;&#51312;&#47532; diet, woo/n\r\n&#45324; &#47784;&#47476;&#51648;/n\r\n&#50500;&#51649; &#47803;&#45796; &#54592;/n\r\n&#45328; &#50948;&#54644; &#50416;&#50668;&#51652;/n\r\n&#50724;&#47000;&#46108; &#49324;&#46993;&#49884;/n\r\n&#54756;&#47588;&#46020; &#51339;&#51004;&#45768;/n\r\n&#50883;&#51020; &#51667;&#44172; &#46104;&#44600;/n\r\nThe one and only/n\r\nYou are my celebrity/n\r\n&#51082;&#51648;&#47560; &#45324; &#55120;&#47536; &#50612;&#46176; &#49324;&#51060;/n\r\n&#50812;&#49552;&#51004;&#47196; &#44536;&#47536; &#48324; &#54616;&#45208;/n\r\n&#48372;&#51060;&#45768; &#44536; &#50976;&#51068;&#54632;&#51060; &#50620;&#47560;&#45208;/n\r\n&#50500;&#47492;&#45796;&#50868;&#51648; &#47568;&#50556;/n\r\nYou are my celebrity/n\r\n&#48156;&#51088;&#44397;&#47560;&#45796; &#51060;&#50612;&#51652; &#48324;&#51088;&#47532;/n\r\n&#44536; &#49436;&#53804;&#47480; &#44152;&#51020;&#51060; &#49352;&#44200;&#45459;&#51008; &#48145;&#44536;&#47548;/n\r\n&#50724;&#47215;&#51060; &#45320;&#47484; &#47564;&#45208;&#47084; &#44032;&#45716; &#44600;/n\r\n&#44536;&#47532;&#47196; &#44032;&#47732; &#46076; &#51216;&#49440;&#51012; &#46384;&#46972;/n\r\n&#51082;&#51648;&#47560; &#51060; &#50724;&#47004; &#44200;&#50872; &#49324;&#51060;/n\r\n&#50616; &#53960;&#51004;&#47196; &#54588;&#50872; &#44867; &#54616;&#45208;/n\r\n&#48372;&#51060;&#45768; &#54616;&#47336; &#46244; &#48388;&#51060; &#50620;&#47560;&#45208;/n\r\n&#50500;&#47492;&#45796;&#50872;&#51648; &#47568;&#50556;/n\r\nYou are my celebrity/n\r\nCelebrity/n\r\nYou are my celebrity/n', '688ea700cac34043bcd908e61de06a14.jpg', 424, 195, 14345, 14000, 254, 0, '2021-10-04', 1, 4),
(13, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'After School', 'My life\"s been magic, seems fantastic/n', '9d66522bafb44577829df1679d8e21ef.jpg', 1414, 195, 354345, 350000, 421, 0, '2021-11-15', 1, 11),
(14, 'adf459f129af4852ab3e69dd43e4280a.mp3', '�i N?', 'My life\"s been magic, seems fantastic/n', '2e9f81f6d60b4d7e89d686a4a0aa3d57.jpg', 401, 195, 174247, 16000, 0, 1, '2021-10-11', 1, 3),
(15, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'C??i Th�i', 'My life\"s been magic, seems fantastic/n', '43c03973bc1a4e6b9fafd0d995a82223.jpg', 141, 195, 34537, 33000, 211, 0, '2021-05-12', 1, 2),
(16, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'C�u H?n C�u Th?', 'My life\"s been magic, seems fantastic/n', 'e5100f9b9f714ab5ad34c5bc3d6c31f8.jpg', 785, 195, 45347, 42000, 245, 1, '2020-01-09', 1, 7),
(17, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'Sài Gòn Đau Lòng Quá', 'My life\"s been magic, seems fantastic/n', '528923dc75f94a9aa6cb566df782d105.jpg', 251, 195, 453508, 450000, 2451, 0, '2019-03-11', 1, 10),
(18, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'T�nh Th??ng Phu Th�', 'My life\"s been magic, seems fantastic/n', '6bf1cabf7808420881a8d97533d0b5e9.jpg', 471, 195, 45112, 43000, 381, 1, '2020-08-11', 2, 11),
(19, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'Mu?n R?i M� Sao C�n', 'My life\"s been magic, seems fantastic/n', 'f62f6e523d8340208b1223626ceff8f7.jpg', 245, 195, 78385, 75000, 0, 0, '2021-08-11', 3, 2),
(20, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'Ch�ng Ta Sau N�y ', 'My life\"s been magic, seems fantastic/n', '6e2a2e79350d438f83aae93c0ceae1ac.jpg', 287, 195, 14351, 14000, 455, 1, '2021-10-20', 1, 2),
(21, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'Beautiful Mistakes', 'My life\"s been magic, seems fantastic/n', '64a21b4dc33741a093475e474d6f40b4.jpg', 140, 195, 7583248, 750000, 0, 1, '2021-11-03', 1, 11),
(22, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'D?u D�ng Em ??n', 'My life\"s been magic, seems fantastic/n', '495fa2d70f294962b83f3a994e33ae7f.jpg', 687, 195, 43245, 40000, 271, 1, '2021-09-23', 2, 1),
(23, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'Ph?n Duy�n L? L�ng', 'My life\"s been magic, seems fantastic/n', '8d8ae7d61b64417c8039cd3d63f6eeba.jpg', 141, 195, 34533, 32000, 0, 1, '2021-12-01', 1, 5),
(24, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'In The Morning', 'My life\"s been magic, seems fantastic/n', '35c6683a41b44bfdbb4158f4dd420036.jpg', 4523, 195, 2452452, 240000, 285, 1, '2021-06-30', 2, 4),
(25, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'Beautiful', 'My life\"s been magic, seems fantastic/n', '5d849cf9ae2a49f5ac04eb540421863a.jpg', 1711, 195, 34532, 30000, 0, 1, '2020-12-30', 2, 11),
(26, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'Rich and blind', 'My life\"s been magic, seems fantastic/n', 'f166cc034ac14c38b369d82477afa2aa.jpg', 285, 195, 24523, 22000, 4123, 0, '2021-11-05', 1, 3),
(27, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'Sailing', 'My life\"s been magic, seems fantastic/n', '66da5525ab54422c8d1b2ed7a7ffb619.jpg', 140, 195, 345321, 330000, 0, 0, '2021-06-05', 3, 2),
(28, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'Dumb Dumb', 'My life\"s been magic, seems fantastic/n', 'bb812abecdb74fe8af4af538691355ff.jpg', 1715, 195, 24528, 22000, 754, 0, '2021-10-12', 1, 6),
(29, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'Cold Blooded', 'My life\"s been magic, seems fantastic/n', 'a331010e22764237a5cab82e16bb14f2.jpg', 786, 195, 24524, 20000, 533, 1, '2021-10-15', 1, 5),
(30, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'Christmas Evel', 'My life\"s been magic, seems fantastic/n', '73bc8e380cfd4f58868ef69fb1c1a6e0.jpg', 371, 195, 245212, 230000, 844, 1, '2021-06-15', 3, 8),
(31, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'Gone', 'My life\"s been magic, seems fantastic/n', 'f97d25a67da04ad696ca1905e23bb358.jpg', 471, 195, 24512, 20000, 621, 1, '2021-09-01', 3, 9),
(32, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'Romantic Sunday', 'My life\"s been magic, seems fantastic/n', '7c7f023691944a4692db19827b9c294d.jpg', 852, 195, 24535, 24000, 384, 0, '2021-06-18', 1, 9),
(33, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'Ping Pong', 'My life\"s been magic, seems fantastic/n', 'dd3f7b8bc5734625b6893e0f92640236.jpg', 123, 195, 245126, 230000, 357, 1, '2021-03-18', 1, 10),
(34, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'Snake', 'My life\"s been magic, seems fantastic/n', 'd1338dc1214c4d6fb2cdf2db7ed12ae7.jpg', 2621, 195, 458287, 45000, 132, 0, '2021-08-03', 1, 9),
(35, 'adf459f129af4852ab3e69dd43e4280a.mp3', 'Airport Goodbyes Airport Goodbyes', 'My life\"s been magic, seems fantastic/n', '25e275e8e8f348b7b3de9d5f936a612a.jpg', 114, 195, 782430, 780000, 272, 0, '2021-04-25', 1, 8),
(41, '014d19972df84e3e863e37c83c765392.mp3', 'Reed Mathis  Reasons ', 'Reed Mathis  Reasons ', '7e03709481114bb8989c0d55a3585f6f.jpg', 0, 151, 1, 0, 0, 0, '2021-12-10', 1, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aboutus`
--
ALTER TABLE `aboutus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `account_playlist`
--
ALTER TABLE `account_playlist`
  ADD PRIMARY KEY (`playlist_id`,`account_id`),
  ADD KEY `artist_id` (`playlist_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `account_role`
--
ALTER TABLE `account_role`
  ADD PRIMARY KEY (`account_id`,`role_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `advertisement`
--
ALTER TABLE `advertisement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `artist_track`
--
ALTER TABLE `artist_track`
  ADD PRIMARY KEY (`account_id`,`track_id`),
  ADD KEY `artist_id` (`account_id`),
  ADD KEY `song_id` (`track_id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banner_id` (`title`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`account_id`,`track_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `track_id` (`track_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`account_id`);

--
-- Indexes for table `package_info`
--
ALTER TABLE `package_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`category_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `playlist_category`
--
ALTER TABLE `playlist_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playlist_track`
--
ALTER TABLE `playlist_track`
  ADD PRIMARY KEY (`playlist_id`,`track_id`),
  ADD KEY `playlist_id` (`playlist_id`),
  ADD KEY `song_id` (`track_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_package`
--
ALTER TABLE `service_package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `genres_id` (`genres_id`),
  ADD KEY `status_id` (`status_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aboutus`
--
ALTER TABLE `aboutus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `advertisement`
--
ALTER TABLE `advertisement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `package_info`
--
ALTER TABLE `package_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `playlist_category`
--
ALTER TABLE `playlist_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service_package`
--
ALTER TABLE `service_package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);

--
-- Constraints for table `account_playlist`
--
ALTER TABLE `account_playlist`
  ADD CONSTRAINT `account_playlist_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `account_playlist_ibfk_3` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id`);

--
-- Constraints for table `account_role`
--
ALTER TABLE `account_role`
  ADD CONSTRAINT `account_role_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `account_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `artist_track`
--
ALTER TABLE `artist_track`
  ADD CONSTRAINT `artist_track_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`),
  ADD CONSTRAINT `artist_track_ibfk_3` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

--
-- Constraints for table `package_info`
--
ALTER TABLE `package_info`
  ADD CONSTRAINT `package_info_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `package_info_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `service_package` (`id`);

--
-- Constraints for table `playlist`
--
ALTER TABLE `playlist`
  ADD CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `playlist_category` (`id`),
  ADD CONSTRAINT `playlist_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`);

--
-- Constraints for table `playlist_track`
--
ALTER TABLE `playlist_track`
  ADD CONSTRAINT `playlist_track_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`),
  ADD CONSTRAINT `playlist_track_ibfk_2` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id`);

--
-- Constraints for table `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `track_ibfk_1` FOREIGN KEY (`genres_id`) REFERENCES `genres` (`id`),
  ADD CONSTRAINT `track_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
