-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Erstellungszeit: 25. Nov 2025 um 13:42
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
(2, 2, 'Matthäus', 'Mat', NULL, NULL, '<h1>Erstes Buch aus dem neuen Testament</h1>', '2025-11-25 13:12:49', NULL);

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
(2, 2, 1, 'Genealogie Jesus', '2025-11-25 13:18:27', NULL);

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
(2, 'Elberfelder', 'de', NULL, '2025-11-25 13:27:45', NULL);

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
(2, 2, 1, '2025-11-25 13:21:31', NULL);

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
(2, 2, 1, 'Geschlechtregister des Jesus Christus des Sohnes Davids, des Sohnes Abraham.', '2025-11-25 13:30:46', NULL);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `chapter`
--
ALTER TABLE `chapter`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `verse-comment`
--
ALTER TABLE `verse-comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `verse-text`
--
ALTER TABLE `verse-text`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
