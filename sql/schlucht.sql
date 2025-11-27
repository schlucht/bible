-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Erstellungszeit: 26. Nov 2025 um 12:47
-- Server-Version: 9.5.0
-- PHP-Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `schlucht`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book`
--

CREATE TABLE `book` (
  `id` int NOT NULL,
  `testament_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `abbreviation` varchar(10) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `year` varchar(100) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `book`
--

INSERT INTO `book` (`id`, `testament_id`, `name`, `abbreviation`, `author`, `year`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Genesis', 'Gen', NULL, NULL, '<h1>Erste Buch Moses</h1>', '2025-11-25 13:12:49', NULL),
(2, 2, 'Matthäus', 'Mat', NULL, NULL, '<h1>Erstes Buch aus dem neuen Testament</h1>', '2025-11-25 13:12:49', NULL),
(3, 1, 'Exodus', 'Ex', 'Mose', '1700 v. Chr.', 'Auszug aus Ägypten', '2025-11-25 14:17:02', NULL),
(4, 2, 'Johannes', 'Joh', 'Apostel Johannes', '80-90 n. Cr.', NULL, '2025-11-26 09:28:05', NULL),
(5, 1, 'Nummeri', 'Num', 'Mose', '1400 v. Chr.', '', '2025-11-26 10:11:40', NULL),
(6, 2, 'Lukas', 'Lk', 'Lukas', '40 n.Chr', '', '2025-11-26 10:11:40', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `chapter`
--

CREATE TABLE `chapter` (
  `id` int NOT NULL,
  `book_id` int NOT NULL,
  `number` int NOT NULL,
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `chapter`
--

INSERT INTO `chapter` (`id`, `book_id`, `number`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Die Erschaffung der Erde', '2025-11-25 13:18:27', NULL),
(2, 2, 1, 'Genealogie Jesus', '2025-11-25 13:18:27', NULL),
(3, 3, 1, 'Erste Kapitel zeigt eine Zusammenfassung von Genesis 1.', '2025-11-25 14:19:37', NULL),
(4, 4, 2, 'Enthält die Hochzeit von Kanaan', '2025-11-26 09:29:02', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `chapter-comment`
--

CREATE TABLE `chapter-comment` (
  `id` int NOT NULL,
  `chapter_id` int NOT NULL,
  `user_id` int NOT NULL,
  `text` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `chapter-comment`
--

INSERT INTO `chapter-comment` (`id`, `chapter_id`, `user_id`, `text`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Es geht um die Erschaffung in diesem Kapitel.', '2025-11-25 13:35:26', NULL),
(2, 1, 1, 'In diesem Kapitel sehe ich die Allmacht Gottes', '2025-11-25 13:35:26', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `testament`
--

CREATE TABLE `testament` (
  `id` int NOT NULL,
  `name` varchar(10) NOT NULL,
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `testament`
--

INSERT INTO `testament` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'AT', NULL, '2025-11-25 13:07:45', NULL),
(2, 'NT', NULL, '2025-11-25 13:07:45', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `translation`
--

CREATE TABLE `translation` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `language` varchar(100) NOT NULL DEFAULT 'de',
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `translation`
--

INSERT INTO `translation` (`id`, `name`, `language`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Schlachter 2000', 'de', NULL, '2025-11-25 13:27:45', NULL),
(2, 'Elberfelder', 'de', NULL, '2025-11-25 13:27:45', NULL),
(3, 'NGÜ', 'de', NULL, '2025-11-26 09:30:49', NULL),
(4, 'Luther 2017', 'de', NULL, '2025-11-26 09:30:49', NULL),
(5, 'Menge Bibel', 'de', NULL, '2025-11-26 09:31:40', NULL),
(6, 'Einheitsübersetzung 2016', 'de', NULL, '2025-11-26 09:31:40', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user-login`
--

CREATE TABLE `user-login` (
  `loginId` int NOT NULL,
  `user_id` int NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Lothar', 'Schmid', 'lothar@mail.ch', 'schlucht', '2025-11-03 11:45:31', '2025-11-03 11:45:31'),
(2, 'Janina', 'Schmid', 'janina@web.ch', 'freizeit', '2025-11-03 11:45:31', '2025-11-03 11:45:31');

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `vbook`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `vbook` (
`Buchname` varchar(100)
,`Kapitelnummer` int
,`TestamentName` varchar(10)
,`text` text
,`Versnummer` int
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `vbook2`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `vbook2` (
`Buchname` varchar(100)
,`Kapitelnummer` int
,`TestamentName` varchar(10)
,`text` text
,`verse_id` int
,`Versnummer` int
);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `verse`
--

CREATE TABLE `verse` (
  `id` int NOT NULL,
  `chapter_id` int NOT NULL,
  `number` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `verse`
--

INSERT INTO `verse` (`id`, `chapter_id`, `number`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-11-25 13:21:31', NULL),
(2, 2, 1, '2025-11-25 13:21:31', NULL),
(3, 4, 3, '2025-11-26 09:29:38', NULL),
(4, 4, 1, '2025-11-26 09:55:04', NULL),
(5, 4, 2, '2025-11-26 09:55:04', NULL),
(6, 4, 4, '2025-11-26 09:55:04', NULL),
(7, 4, 5, '2025-11-26 09:55:04', NULL),
(8, 4, 6, '2025-11-26 09:55:04', NULL),
(9, 4, 7, '2025-11-26 09:55:04', NULL),
(10, 4, 8, '2025-11-26 09:55:04', NULL),
(11, 4, 9, '2025-11-26 09:55:04', NULL),
(12, 4, 10, '2025-11-26 09:55:04', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `verse-comment`
--

CREATE TABLE `verse-comment` (
  `id` int NOT NULL,
  `verse_id` int NOT NULL,
  `user_id` int NOT NULL,
  `text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `verse-comment`
--

INSERT INTO `verse-comment` (`id`, `verse_id`, `user_id`, `text`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Gott erschafft die Welt', '2025-11-25 13:38:59', NULL),
(2, 1, 1, 'Am Anfang war gar nichts', '2025-11-25 13:38:59', NULL),
(3, 2, 1, 'Das zeugt das Jesus von David abstammt.', '2025-11-25 13:39:32', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `verse-text`
--

CREATE TABLE `verse-text` (
  `id` int NOT NULL,
  `verse_id` int NOT NULL,
  `translation_id` int NOT NULL,
  `text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `verse-text`
--

INSERT INTO `verse-text` (`id`, `verse_id`, `translation_id`, `text`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Im Anfang schuf Gott die Himmel und die Erde.', '2025-11-25 13:30:46', NULL),
(2, 2, 1, 'Geschlechtregister des Jesus Christus des Sohnes Davids, des Sohnes Abraham.', '2025-11-25 13:30:46', NULL),
(3, 3, 3, 'Während des Festes ging der Wein aus. Da sagte die Mutter Jesu zu ihrem Sohn: »Sie haben keinen Wein mehr!«', '2025-11-26 09:35:47', NULL),
(4, 3, 5, 'Als es nun an Wein mangelte, sagte die Mutter Jesu zu ihm: »Sie haben keinen Wein (mehr)!«', '2025-11-26 09:35:47', NULL),
(5, 3, 4, 'Und als der Wein ausging, spricht die Mutter Jesu zu ihm: Sie haben keinen Wein mehr.', '2025-11-26 09:36:36', NULL),
(6, 3, 1, 'Und als es an Wein mangelte, spricht die Mutter Jesu zu ihm: Sie haben keinen Wein!', '2025-11-26 09:36:36', NULL),
(7, 3, 2, 'Und als es an Wein mangelte, spricht die Mutter Jesu zu ihm: Sie haben keinen Wein.', '2025-11-26 09:37:11', NULL),
(8, 3, 6, 'Als der Wein ausging, sagte die Mutter Jesu zu ihm: Sie haben keinen Wein mehr.', '2025-11-26 09:37:11', NULL),
(9, 4, 1, 'Und am dritten Tag war eine Hochzeit in Kana in Galiläa, und die Mutter Jesu war dort.', '2025-11-26 10:00:30', NULL),
(10, 5, 1, 'Aber auch Jesus wurde samt seinen Jüngern zur Hochzeit eingeladen.', '2025-11-26 10:00:30', NULL),
(11, 6, 1, 'Jesus spricht zu ihr: Frau, was habe ich mit dir zu tun? Meine Stunde ist noch nicht gekommen!', '2025-11-26 10:00:30', NULL),
(12, 7, 1, 'Seine Mutter spricht zu den Dienern: Was er euch sagt, das tut!', '2025-11-26 10:00:30', NULL),
(13, 8, 1, 'Es waren aber dort sechs steinerne Wasserkrüge, nach der Reinigungssitte der Juden, von denen jeder zwei oder drei Eimer fasste.', '2025-11-26 10:00:30', NULL),
(14, 9, 1, 'Jesus spricht zu ihnen: Füllt die Krüge mit Wasser! Und sie füllten sie bis obenhin.', '2025-11-26 10:00:30', NULL),
(15, 10, 1, 'Und er spricht zu ihnen: Schöpft nun und bringt es dem Speisemeister! Und sie brachten es hin.', '2025-11-26 10:00:30', NULL),
(16, 11, 1, 'Als aber der Speisemeister das Wasser, das zu Wein geworden war, gekostet hatte (und er wusste nicht, woher es war; die Diener aber, die das Wasser geschöpft hatten, wussten es), da rief der Speisemeister den Bräutigam\r\n', '2025-11-26 10:00:30', NULL),
(17, 12, 1, 'und sprach zu ihm: Jedermann setzt zuerst den guten Wein vor, und dann, wenn sie trunken geworden sind, den geringeren; du aber hast den guten Wein bis jetzt behalten!', '2025-11-26 10:00:30', NULL);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testament_book` (`testament_id`);

--
-- Indizes für die Tabelle `chapter`
--
ALTER TABLE `chapter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_chapter` (`book_id`);

--
-- Indizes für die Tabelle `chapter-comment`
--
ALTER TABLE `chapter-comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chapter_nummer` (`chapter_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indizes für die Tabelle `testament`
--
ALTER TABLE `testament`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `translation`
--
ALTER TABLE `translation`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `user-login`
--
ALTER TABLE `user-login`
  ADD PRIMARY KEY (`loginId`),
  ADD KEY `user` (`user_id`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indizes für die Tabelle `verse`
--
ALTER TABLE `verse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chapter_verse` (`chapter_id`);

--
-- Indizes für die Tabelle `verse-comment`
--
ALTER TABLE `verse-comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vers_nummer` (`verse_id`),
  ADD KEY `user_nummer` (`user_id`);

--
-- Indizes für die Tabelle `verse-text`
--
ALTER TABLE `verse-text`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vers_text` (`verse_id`),
  ADD KEY `translation_vers` (`translation_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `book`
--
ALTER TABLE `book`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `chapter`
--
ALTER TABLE `chapter`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `chapter-comment`
--
ALTER TABLE `chapter-comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `testament`
--
ALTER TABLE `testament`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `translation`
--
ALTER TABLE `translation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `user-login`
--
ALTER TABLE `user-login`
  MODIFY `loginId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `verse`
--
ALTER TABLE `verse`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `verse-comment`
--
ALTER TABLE `verse-comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `verse-text`
--
ALTER TABLE `verse-text`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

-- --------------------------------------------------------

--
-- Struktur des Views `vbook`
--
DROP TABLE IF EXISTS `vbook`;

CREATE ALGORITHM=UNDEFINED DEFINER=`schlucht`@`%` SQL SECURITY DEFINER VIEW `vbook`  AS SELECT `vt`.`text` AS `text`, `v`.`number` AS `Versnummer`, `c`.`number` AS `Kapitelnummer`, `b`.`name` AS `Buchname`, `t`.`name` AS `TestamentName` FROM ((((`verse-text` `vt` join `verse` `v` on((`v`.`id` = `vt`.`verse_id`))) join `chapter` `c` on((`c`.`id` = `v`.`chapter_id`))) join `book` `b` on((`b`.`id` = `c`.`book_id`))) join `testament` `t` on((`t`.`id` = `b`.`testament_id`))) ;

-- --------------------------------------------------------

--
-- Struktur des Views `vbook2`
--
DROP TABLE IF EXISTS `vbook2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`schlucht`@`%` SQL SECURITY DEFINER VIEW `vbook2`  AS SELECT `vt`.`verse_id` AS `verse_id`, `vt`.`text` AS `text`, `v`.`number` AS `Versnummer`, `c`.`number` AS `Kapitelnummer`, `b`.`name` AS `Buchname`, `t`.`name` AS `TestamentName` FROM ((((`verse-text` `vt` join `verse` `v` on((`v`.`id` = `vt`.`verse_id`))) join `chapter` `c` on((`c`.`id` = `v`.`chapter_id`))) join `book` `b` on((`b`.`id` = `c`.`book_id`))) join `testament` `t` on((`t`.`id` = `b`.`testament_id`))) ;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `testament_book` FOREIGN KEY (`testament_id`) REFERENCES `testament` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints der Tabelle `chapter`
--
ALTER TABLE `chapter`
  ADD CONSTRAINT `book_chapter` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints der Tabelle `chapter-comment`
--
ALTER TABLE `chapter-comment`
  ADD CONSTRAINT `chapter_nummer` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints der Tabelle `user-login`
--
ALTER TABLE `user-login`
  ADD CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints der Tabelle `verse`
--
ALTER TABLE `verse`
  ADD CONSTRAINT `chapter_verse` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints der Tabelle `verse-comment`
--
ALTER TABLE `verse-comment`
  ADD CONSTRAINT `user_nummer` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `vers_nummer` FOREIGN KEY (`verse_id`) REFERENCES `verse` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints der Tabelle `verse-text`
--
ALTER TABLE `verse-text`
  ADD CONSTRAINT `translation_vers` FOREIGN KEY (`translation_id`) REFERENCES `translation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `vers_text` FOREIGN KEY (`verse_id`) REFERENCES `verse` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
