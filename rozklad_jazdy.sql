-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 04 Cze 2023, 18:00
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `rozklad_jazdy`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bilet`
--

CREATE TABLE `bilet` (
  `Bilet_ID` int(11) NOT NULL,
  `Podrozujacy_ID` int(11) NOT NULL,
  `Cena` decimal(10,2) NOT NULL,
  `Znizka` int(11) DEFAULT NULL,
  `Numer_miejsca` int(11) NOT NULL,
  `Wagon` int(11) NOT NULL,
  `Klasa` int(11) NOT NULL,
  `Data_przejazdu` date NOT NULL,
  `Data_kontroli` datetime NOT NULL,
  `Przystanek_Poczatkowy_ID` int(11) NOT NULL,
  `Przystanek_Koncowy_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `bilet`
--

INSERT INTO `bilet` (`Bilet_ID`, `Podrozujacy_ID`, `Cena`, `Znizka`, `Numer_miejsca`, `Wagon`, `Klasa`, `Data_przejazdu`, `Data_kontroli`, `Przystanek_Poczatkowy_ID`, `Przystanek_Koncowy_ID`) VALUES
(1, 1, '25.00', 0, 5, 2, 3, '2023-07-07', '2023-07-07 08:20:35', 1, 11),
(2, 2, '40.50', 20, 1, 1, 1, '2023-07-08', '2023-07-08 09:45:27', 3, 16),
(3, 3, '40.50', 20, 2, 1, 1, '2023-07-09', '2023-07-09 10:37:13', 8, 20),
(4, 4, '56.99', 4, 18, 3, 2, '2023-07-10', '2023-07-10 12:24:54', 28, 30),
(5, 5, '12.00', 0, 11, 4, 3, '2023-07-07', '2023-07-07 08:18:22', 11, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `podrozujacy`
--

CREATE TABLE `podrozujacy` (
  `Podrozujacy_ID` int(11) NOT NULL,
  `Imie` varchar(30) NOT NULL,
  `Nazwisko` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `podrozujacy`
--

INSERT INTO `podrozujacy` (`Podrozujacy_ID`, `Imie`, `Nazwisko`) VALUES
(1, 'Jan', 'Kowalski'),
(2, 'Pawel', 'Denko'),
(3, 'Urszula', 'Otomana'),
(4, 'Stefan', 'Batory'),
(5, 'Stefania', 'Zabek');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przystanek`
--

CREATE TABLE `przystanek` (
  `Przystanek_ID` int(11) NOT NULL,
  `Nazwa` varchar(40) NOT NULL,
  `Lokalizacja_geograficzna` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `przystanek`
--

INSERT INTO `przystanek` (`Przystanek_ID`, `Nazwa`, `Lokalizacja_geograficzna`) VALUES
(1, 'Krakow Glowny', '19 56 E 50 04 N'),
(2, 'Krakow Lobzow', '19 53 E 50 08 N'),
(3, 'Krakow Bronowice', '19 52 E 50 11 N'),
(4, 'Krakow Mydlniki', '19 48 E 50 15 N'),
(5, 'Krakow Zablocie', '19 58 E 50 05 N'),
(6, 'Krakow Plaszow', '19 53 E 50 01 N'),
(7, 'Krakow Prokocim', '19 43 E 50 12 N'),
(8, 'Krakow Biezanow', '19 51 E 50 00 N'),
(9, 'Wieliczka Bogucice', '20 04 E 49 59 N'),
(10, 'Wieliczka Park', '20 02 E 49 57 N'),
(11, 'Wieliczka Rynek-Kopalnia', '20 01 E 49 55 N'),
(12, 'Zabierzow Rzaska', '19 52 E 50 51 N'),
(13, 'Zabierzow', '19 55 E 50 54 N'),
(14, 'Krzeszowice', '19 56 E 50 32 N'),
(15, 'Trzebinia', '19 10 E 50 33 N'),
(16, 'Oswiecim', '19 37 E 50 03 N'),
(17, 'Bochnia', '20 49 E 49 08 N'),
(18, 'Brzesko Okocim', '20 21 E 49 08 N'),
(19, 'Tarnow', '20 13 E 50 49 N'),
(20, 'Bogoniowice Ciezkowice', '20 23 E 49 08 N'),
(21, 'Nowy Sacz', '20 41 E 49 37 N'),
(22, 'Krynica-Zdroj', '20 57 E 49 25 N'),
(23, 'Krakow Mydlniki Wapiennik', '20 00 E 50 20 N'),
(24, 'Krakow Podgorze', '20 01 E 50 18 N'),
(25, 'Krakow Bonarka', '20 02 E 50 19 N'),
(26, 'Krakow Lagiewniki', '20 03 E 50 23 N'),
(27, 'Krakow Sanktuarium', '20 04 E 50 22 N'),
(28, 'Krakow Swoszowice', '20 05 E 50 21 N'),
(29, 'Skawina', '19 49 E 49 58 N'),
(30, 'Kalwaria Zebrzydowska Lanckorona', '19 40 E 49 52 N'),
(31, 'Wadowice', '19 29 E 49 53 N');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `punkt_trasy`
--

CREATE TABLE `punkt_trasy` (
  `Punkt_trasy_ID` int(11) NOT NULL,
  `Przystanek_ID` int(11) NOT NULL,
  `Trasa_ID` int(11) NOT NULL,
  `Godzina_przyjazdu` datetime NOT NULL,
  `Godzina_odjazdu` datetime DEFAULT NULL,
  `Kolejnosc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `punkt_trasy`
--

INSERT INTO `punkt_trasy` (`Punkt_trasy_ID`, `Przystanek_ID`, `Trasa_ID`, `Godzina_przyjazdu`, `Godzina_odjazdu`, `Kolejnosc`) VALUES
(1, 1, 1, '2023-07-07 08:00:00', '2023-07-07 08:15:00', 1),
(2, 5, 1, '2023-07-07 08:18:00', '2023-07-07 08:20:00', 2),
(3, 6, 1, '2023-07-07 08:24:00', '2023-07-07 08:26:00', 3),
(4, 7, 1, '2023-07-07 08:29:00', '2023-07-07 08:31:00', 4),
(5, 8, 1, '2023-07-07 08:35:00', '2023-07-07 08:37:00', 5),
(6, 9, 1, '2023-07-07 08:42:00', '2023-07-07 08:44:00', 6),
(7, 10, 1, '2023-07-07 08:47:00', '2023-07-07 08:49:00', 7),
(8, 11, 1, '2023-07-07 08:51:00', '0000-00-00 00:00:00', 8),
(9, 1, 2, '2023-07-08 09:15:00', '2023-07-08 09:30:00', 1),
(10, 2, 2, '2023-07-08 09:33:00', '2023-07-08 09:35:00', 2),
(11, 3, 2, '2023-07-08 09:39:00', '2023-07-08 09:41:00', 3),
(12, 4, 2, '2023-07-08 09:44:00', '2023-07-08 09:46:00', 4),
(13, 23, 2, '2023-07-08 09:51:00', '2023-07-08 09:53:00', 5),
(14, 12, 2, '2023-07-08 09:56:00', '2023-07-08 09:58:00', 6),
(15, 13, 2, '2023-07-08 10:00:00', '2023-07-08 10:02:00', 7),
(16, 14, 2, '2023-07-08 10:11:00', '2023-07-08 10:13:00', 8),
(17, 15, 2, '2023-07-08 10:25:00', '2023-07-08 10:27:00', 9),
(18, 16, 2, '2023-07-08 11:02:00', '0000-00-00 00:00:00', 10),
(19, 1, 3, '2023-07-09 09:45:00', '2023-07-09 10:00:00', 1),
(20, 5, 3, '2023-07-09 10:03:00', '2023-07-09 10:05:00', 2),
(21, 6, 3, '2023-07-09 10:09:00', '2023-07-09 10:11:00', 3),
(22, 8, 3, '2023-07-09 10:13:00', '2023-07-09 10:15:00', 5),
(23, 17, 3, '2023-07-09 10:37:00', '2023-07-09 10:39:00', 5),
(24, 18, 3, '2023-07-09 10:46:00', '2023-07-09 10:48:00', 6),
(25, 19, 3, '2023-07-09 11:04:00', '2023-07-09 11:06:00', 7),
(26, 20, 3, '2023-07-09 12:10:00', '2023-07-09 12:12:00', 8),
(27, 21, 3, '2023-07-09 13:25:00', '2023-07-09 13:27:00', 9),
(28, 22, 3, '2023-07-09 15:11:00', '0000-00-00 00:00:00', 10),
(29, 1, 4, '2023-07-10 11:30:00', '2023-07-10 11:45:00', 1),
(30, 5, 4, '2023-07-10 11:48:00', '2023-07-10 11:50:00', 2),
(31, 24, 4, '2023-07-10 11:53:00', '2023-07-10 11:55:00', 3),
(32, 25, 4, '2023-07-10 11:58:00', '2023-07-10 12:00:00', 5),
(33, 26, 4, '2023-07-10 12:02:00', '2023-07-10 12:04:00', 5),
(34, 27, 4, '2023-07-10 12:06:00', '2023-07-10 12:08:00', 6),
(35, 28, 4, '2023-07-10 12:10:00', '2023-07-10 12:12:00', 7),
(36, 29, 4, '2023-07-10 12:24:00', '2023-07-10 12:26:00', 8),
(37, 30, 4, '2023-07-10 12:56:00', '2023-07-10 12:58:00', 9),
(38, 31, 4, '2023-07-10 13:33:00', '0000-00-00 00:00:00', 10),
(39, 11, 5, '2023-07-07 08:00:00', '2023-07-07 08:15:00', 1),
(40, 10, 5, '2023-07-07 08:18:00', '2023-07-07 08:20:00', 2),
(41, 9, 5, '2023-07-07 08:24:00', '2023-07-07 08:26:00', 3),
(42, 8, 5, '2023-07-07 08:29:00', '2023-07-07 08:31:00', 4),
(43, 7, 5, '2023-07-07 08:35:00', '2023-07-07 08:37:00', 5),
(44, 6, 5, '2023-07-07 08:42:00', '2023-07-07 08:44:00', 6),
(45, 5, 5, '2023-07-07 08:47:00', '2023-07-07 08:49:00', 7),
(46, 1, 5, '2023-07-07 08:51:00', '0000-00-00 00:00:00', 8),
(47, 16, 6, '2023-07-08 09:15:00', '2023-07-08 09:30:00', 1),
(48, 15, 6, '2023-07-08 09:33:00', '2023-07-08 09:35:00', 2),
(49, 14, 6, '2023-07-08 09:39:00', '2023-07-08 09:41:00', 3),
(50, 13, 6, '2023-07-08 09:44:00', '2023-07-08 09:46:00', 4),
(51, 12, 6, '2023-07-08 09:56:00', '2023-07-08 09:58:00', 5),
(52, 23, 6, '2023-07-08 09:51:00', '2023-07-08 09:53:00', 6),
(53, 4, 6, '2023-07-08 10:00:00', '2023-07-08 10:02:00', 7),
(54, 3, 6, '2023-07-08 10:11:00', '2023-07-08 10:13:00', 8),
(55, 2, 6, '2023-07-08 10:25:00', '2023-07-08 10:27:00', 9),
(56, 1, 6, '2023-07-08 11:02:00', '0000-00-00 00:00:00', 10),
(57, 22, 7, '2023-07-09 09:45:00', '2023-07-09 10:00:00', 1),
(58, 21, 7, '2023-07-09 10:03:00', '2023-07-09 10:05:00', 2),
(59, 20, 7, '2023-07-09 10:09:00', '2023-07-09 10:11:00', 3),
(60, 19, 7, '2023-07-09 10:13:00', '2023-07-09 10:15:00', 4),
(61, 18, 7, '2023-07-09 10:37:00', '2023-07-09 10:39:00', 5),
(62, 17, 7, '2023-07-09 10:46:00', '2023-07-09 10:48:00', 6),
(63, 8, 7, '2023-07-09 11:04:00', '2023-07-09 11:06:00', 7),
(64, 6, 7, '2023-07-09 12:10:00', '2023-07-09 12:12:00', 8),
(65, 5, 7, '2023-07-09 13:25:00', '2023-07-09 13:27:00', 9),
(66, 1, 7, '2023-07-09 15:11:00', '0000-00-00 00:00:00', 10),
(67, 31, 8, '2023-07-10 11:30:00', '2023-07-10 11:45:00', 1),
(68, 30, 8, '2023-07-10 11:48:00', '2023-07-10 11:50:00', 2),
(69, 29, 8, '2023-07-10 11:53:00', '2023-07-10 11:55:00', 3),
(70, 28, 8, '2023-07-10 11:58:00', '2023-07-10 12:00:00', 4),
(71, 27, 8, '2023-07-10 12:02:00', '2023-07-10 12:04:00', 5),
(72, 26, 8, '2023-07-10 12:06:00', '2023-07-10 12:08:00', 6),
(73, 25, 8, '2023-07-10 12:10:00', '2023-07-10 12:12:00', 7),
(74, 24, 8, '2023-07-10 12:24:00', '2023-07-10 12:26:00', 8),
(75, 5, 8, '2023-07-10 12:56:00', '2023-07-10 12:58:00', 9),
(76, 1, 8, '2023-07-10 13:33:00', '0000-00-00 00:00:00', 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sasiednie_przystanki`
--

CREATE TABLE `sasiednie_przystanki` (
  `Skad_ID` int(11) DEFAULT NULL,
  `Dokad_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `sasiednie_przystanki`
--

INSERT INTO `sasiednie_przystanki` (`Skad_ID`, `Dokad_ID`) VALUES
(1, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 11),
(1, 2),
(2, 3),
(3, 4),
(4, 23),
(23, 12),
(12, 13),
(13, 14),
(14, 15),
(15, 16),
(6, 8),
(8, 17),
(17, 18),
(18, 19),
(19, 20),
(20, 21),
(21, 22),
(5, 24),
(24, 25),
(25, 26),
(26, 27),
(27, 28),
(28, 29),
(30, 31),
(29, 30),
(5, 1),
(6, 5),
(7, 6),
(8, 7),
(9, 8),
(10, 9),
(11, 10),
(2, 1),
(3, 2),
(4, 3),
(23, 4),
(12, 23),
(13, 12),
(14, 13),
(15, 14),
(16, 15),
(8, 6),
(17, 8),
(18, 17),
(19, 18),
(20, 19),
(21, 20),
(22, 21),
(24, 5),
(25, 24),
(26, 25),
(27, 26),
(28, 27),
(29, 28),
(30, 29),
(31, 30);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `trasa`
--

CREATE TABLE `trasa` (
  `Trasa_ID` int(11) NOT NULL,
  `Nazwa` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `trasa`
--

INSERT INTO `trasa` (`Trasa_ID`, `Nazwa`) VALUES
(1, 'Krakow Glowny - Wieliczka Rynek-Kopalnia'),
(2, 'Krakow Glowny - Oswiecim'),
(3, 'Krakow Glowny - Krynica-Zdroj'),
(4, 'Krakow Glowny - Wadowice'),
(5, 'Wieliczka Rynek-Kopalnia - Krakow Glowny'),
(6, 'Oswiecim - Krakow Glowny'),
(7, 'Krynica-Zdroj - Krakow Glowny'),
(8, 'Wadowice - Krakow Glowny');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `bilet`
--
ALTER TABLE `bilet`
  ADD PRIMARY KEY (`Bilet_ID`),
  ADD KEY `Podrozujacy_ID` (`Podrozujacy_ID`),
  ADD KEY `Przystanek_Poczatkowy_ID` (`Przystanek_Poczatkowy_ID`),
  ADD KEY `Przystanek_Koncowy_ID` (`Przystanek_Koncowy_ID`);

--
-- Indeksy dla tabeli `podrozujacy`
--
ALTER TABLE `podrozujacy`
  ADD PRIMARY KEY (`Podrozujacy_ID`);

--
-- Indeksy dla tabeli `przystanek`
--
ALTER TABLE `przystanek`
  ADD PRIMARY KEY (`Przystanek_ID`),
  ADD UNIQUE KEY `Nazwa` (`Nazwa`),
  ADD UNIQUE KEY `Lokalizacja_geograficzna` (`Lokalizacja_geograficzna`);

--
-- Indeksy dla tabeli `punkt_trasy`
--
ALTER TABLE `punkt_trasy`
  ADD PRIMARY KEY (`Punkt_trasy_ID`),
  ADD KEY `Przystanek_ID` (`Przystanek_ID`),
  ADD KEY `Trasa_ID` (`Trasa_ID`);

--
-- Indeksy dla tabeli `sasiednie_przystanki`
--
ALTER TABLE `sasiednie_przystanki`
  ADD KEY `Skad_ID` (`Skad_ID`),
  ADD KEY `Dokad_ID` (`Dokad_ID`);

--
-- Indeksy dla tabeli `trasa`
--
ALTER TABLE `trasa`
  ADD PRIMARY KEY (`Trasa_ID`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `bilet`
--
ALTER TABLE `bilet`
  MODIFY `Bilet_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `podrozujacy`
--
ALTER TABLE `podrozujacy`
  MODIFY `Podrozujacy_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `przystanek`
--
ALTER TABLE `przystanek`
  MODIFY `Przystanek_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT dla tabeli `punkt_trasy`
--
ALTER TABLE `punkt_trasy`
  MODIFY `Punkt_trasy_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT dla tabeli `trasa`
--
ALTER TABLE `trasa`
  MODIFY `Trasa_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `bilet`
--
ALTER TABLE `bilet`
  ADD CONSTRAINT `bilet_ibfk_1` FOREIGN KEY (`Podrozujacy_ID`) REFERENCES `podrozujacy` (`Podrozujacy_ID`),
  ADD CONSTRAINT `bilet_ibfk_2` FOREIGN KEY (`Przystanek_Poczatkowy_ID`) REFERENCES `przystanek` (`Przystanek_ID`),
  ADD CONSTRAINT `bilet_ibfk_3` FOREIGN KEY (`Przystanek_Koncowy_ID`) REFERENCES `przystanek` (`Przystanek_ID`);

--
-- Ograniczenia dla tabeli `punkt_trasy`
--
ALTER TABLE `punkt_trasy`
  ADD CONSTRAINT `punkt_trasy_ibfk_1` FOREIGN KEY (`Przystanek_ID`) REFERENCES `przystanek` (`Przystanek_ID`),
  ADD CONSTRAINT `punkt_trasy_ibfk_2` FOREIGN KEY (`Trasa_ID`) REFERENCES `trasa` (`Trasa_ID`);

--
-- Ograniczenia dla tabeli `sasiednie_przystanki`
--
ALTER TABLE `sasiednie_przystanki`
  ADD CONSTRAINT `sasiednie_przystanki_ibfk_1` FOREIGN KEY (`Skad_ID`) REFERENCES `przystanek` (`Przystanek_ID`),
  ADD CONSTRAINT `sasiednie_przystanki_ibfk_2` FOREIGN KEY (`Dokad_ID`) REFERENCES `przystanek` (`Przystanek_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
