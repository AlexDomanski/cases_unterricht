-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 03. Apr 2024 um 12:37
-- Server-Version: 10.4.21-MariaDB
-- PHP-Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db_musikalben`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_albums`
--

CREATE TABLE `tbl_albums` (
  `IDAlbum` int(10) UNSIGNED NOT NULL,
  `Album_Name` varchar(64) NOT NULL,
  `Erscheinungsjahr` int(4) UNSIGNED DEFAULT NULL,
  `FIDInterpret` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_interpreten`
--

CREATE TABLE `tbl_interpreten` (
  `IDInterpret` int(10) UNSIGNED NOT NULL,
  `Name` varchar(32) NOT NULL,
  `Gr_Jahr` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_interpreten`
--

INSERT INTO `tbl_interpreten` (`IDInterpret`, `Name`, `Gr_Jahr`) VALUES
(1, 'The Chemical Brothers', 1989),
(2, 'The Prodigy', 1990),
(3, 'Rammstein', 1994);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_songs`
--

CREATE TABLE `tbl_songs` (
  `IDSong` int(10) UNSIGNED NOT NULL,
  `Song_Name` varchar(64) NOT NULL,
  `Num_In_Album` int(10) UNSIGNED NOT NULL,
  `FIDAlbum` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `tbl_albums`
--
ALTER TABLE `tbl_albums`
  ADD PRIMARY KEY (`IDAlbum`),
  ADD UNIQUE KEY `Album_Name` (`Album_Name`),
  ADD KEY `FIDInterpret` (`FIDInterpret`);

--
-- Indizes für die Tabelle `tbl_interpreten`
--
ALTER TABLE `tbl_interpreten`
  ADD PRIMARY KEY (`IDInterpret`);

--
-- Indizes für die Tabelle `tbl_songs`
--
ALTER TABLE `tbl_songs`
  ADD PRIMARY KEY (`IDSong`),
  ADD KEY `FIDAlbum` (`FIDAlbum`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `tbl_albums`
--
ALTER TABLE `tbl_albums`
  MODIFY `IDAlbum` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `tbl_interpreten`
--
ALTER TABLE `tbl_interpreten`
  MODIFY `IDInterpret` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `tbl_songs`
--
ALTER TABLE `tbl_songs`
  MODIFY `IDSong` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `tbl_albums`
--
ALTER TABLE `tbl_albums`
  ADD CONSTRAINT `tbl_albums_ibfk_1` FOREIGN KEY (`FIDInterpret`) REFERENCES `tbl_interpreten` (`IDInterpret`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `tbl_songs`
--
ALTER TABLE `tbl_songs`
  ADD CONSTRAINT `tbl_songs_ibfk_1` FOREIGN KEY (`FIDAlbum`) REFERENCES `tbl_albums` (`IDAlbum`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
