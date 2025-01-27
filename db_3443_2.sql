-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 21. Mrz 2024 um 14:30
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
-- Datenbank: `db_3443_2`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_geschlechter`
--

CREATE TABLE `tbl_geschlechter` (
  `IDGeschlecht` int(10) UNSIGNED NOT NULL,
  `Geschlecht` varchar(16) NOT NULL,
  `Bezeichnung` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_geschlechter`
--

INSERT INTO `tbl_geschlechter` (`IDGeschlecht`, `Geschlecht`, `Bezeichnung`) VALUES
(1, 'männlich', 'Mann'),
(2, 'weiblich', 'Frau'),
(3, 'divers', '?');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_staaten`
--

CREATE TABLE `tbl_staaten` (
  `IDStaat` int(10) UNSIGNED NOT NULL,
  `Staat` varchar(64) NOT NULL,
  `Abkürzung` varchar(64) NOT NULL,
  `Vorwahl` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_staaten`
--

INSERT INTO `tbl_staaten` (`IDStaat`, `Staat`, `Abkürzung`, `Vorwahl`) VALUES
(1, 'Österreich', 'AT', 43),
(2, 'Deutschland', 'DE', 49),
(3, 'Zypern', 'CY', 357),
(4, 'United States', 'US', 1),
(5, 'Kanada', 'CA', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_user`
--

CREATE TABLE `tbl_user` (
  `IDUser` int(10) UNSIGNED NOT NULL,
  `Emailadresse` varchar(64) NOT NULL,
  `Passwort` varchar(256) NOT NULL,
  `Vorname` varchar(32) DEFAULT NULL,
  `Nachname` varchar(32) DEFAULT NULL,
  `FIDGeschlecht` int(10) UNSIGNED DEFAULT NULL,
  `GebDatum` date DEFAULT NULL,
  `FIDGebLand` int(11) UNSIGNED DEFAULT NULL,
  `RegZeitpunkt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_user`
--

INSERT INTO `tbl_user` (`IDUser`, `Emailadresse`, `Passwort`, `Vorname`, `Nachname`, `FIDGeschlecht`, `GebDatum`, `FIDGebLand`, `RegZeitpunkt`) VALUES
(4, 'tes3t@test.at', 'test123', NULL, 'Müller', 1, '1999-02-03', 3, '2024-03-05 08:29:11'),
(5, 'test4@test.at', 'test9435', 'Sabine', 'Maier', NULL, NULL, 2, '2024-03-05 08:29:11'),
(6, 'test5@test.at', '34957jdasf', 'Sandra', 'Maierhofer', 2, '2000-01-01', 5, '2024-03-05 08:33:40'),
(7, 'test6@test.at', 'lskdhflsdaf', 'Sandra', 'Obermaier', 2, NULL, NULL, '2024-03-05 08:33:40'),
(8, 'test7@test.at', 'asdf03998', 'Johannes', 'Obermaier', 3, NULL, 1, '2024-03-05 08:33:40'),
(9, 'test8@test.at', '238sdafdsklh4AA', 'Tobias', NULL, 1, '1998-03-18', 2, '2024-03-05 08:33:40'),
(10, 'test9@test.at', 'j43SAD333', 'Thomas', 'Maierhofer', 3, '1999-08-15', 3, '2024-03-05 08:33:40'),
(14, 'test23@test.at', 'asdfasdf', 'Sandra', 'Maierhofermüller', NULL, NULL, 4, '2024-03-20 09:54:12');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `tbl_geschlechter`
--
ALTER TABLE `tbl_geschlechter`
  ADD PRIMARY KEY (`IDGeschlecht`),
  ADD UNIQUE KEY `Geschlecht` (`Geschlecht`),
  ADD UNIQUE KEY `Bezeichnung` (`Bezeichnung`);

--
-- Indizes für die Tabelle `tbl_staaten`
--
ALTER TABLE `tbl_staaten`
  ADD PRIMARY KEY (`IDStaat`);

--
-- Indizes für die Tabelle `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`IDUser`),
  ADD UNIQUE KEY `Emailadresse` (`Emailadresse`),
  ADD KEY `FIDGeschlecht` (`FIDGeschlecht`) USING BTREE,
  ADD KEY `FIDStaat` (`FIDGebLand`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `tbl_geschlechter`
--
ALTER TABLE `tbl_geschlechter`
  MODIFY `IDGeschlecht` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `tbl_staaten`
--
ALTER TABLE `tbl_staaten`
  MODIFY `IDStaat` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `IDUser` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD CONSTRAINT `tbl_user_ibfk_1` FOREIGN KEY (`FIDGeschlecht`) REFERENCES `tbl_geschlechter` (`IDGeschlecht`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_user_ibfk_2` FOREIGN KEY (`FIDGebLand`) REFERENCES `tbl_staaten` (`IDStaat`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
