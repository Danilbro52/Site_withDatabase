-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Cze 08, 2024 at 11:59 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sklep_ogrodniczy`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'krzewy'),
(2, 'trawy'),
(3, 'jasnowate'),
(4, 'astrowate'),
(5, 'drzewa');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `details` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `details`, `price`, `stock_quantity`, `category_id`, `image`) VALUES
(1, 'Hortensja Ogrodowa', 'Hortensja ogrodowa (Hydrangea macrophylla) to krzew, który dorastaja do 1,5 m wysokości.', 'Hortensja ogrodowa przybyła do nas z Japonii. Oczywiście to co nas najbardziej olśniewa w jej wyglądzie to przecudowne, duże, kuliste kwiaty. Chociaż krzew hortensji pięknie wygląda także dzięki liściom. Hortensja ogrodowa jest najbardziej uprzywilejowana pod względem kolorów kwiatostanów. Odmiany tej rośliny możesz kupić w kolorach bieli, różu, czerwieni i błękitu a także o kwiatach wielokolorowych. Co roku pojawia się wiele nowych odmian. Hortensja ogrodowa kwitnie od początku lata, aż do pierwszych przymrozków.', 45.99, 131, 1, 'HorOgr.jpg'),
(2, 'Chryzantema', 'Piękna chryzantema drobnokwiatowa o żółtych kwiatach.', 'Dorasta do 35-45cm wysokości. Kwitnie późną jesienią. Roślina preferuje stanowiska słoneczne, półcieniste oraz przepuszczalne gleby. Po zakończeniu kwitnienia lub przed nadejściem zimy roślinę należy przyciąć i przenieść do chłodnego, jasnego pomieszczenia, a podlewanie ograniczyć do minimum. Chryzantema idealnie nadaje się  do uprawy w donicach ozdobnych oraz jako dekoracja pomników. ', 25.50, 120, 4, 'Chryzantema.jpg'),
(3, 'Budleja', 'Budleja Dawida to przepiękna roślina, która czaruje ogród swoimi barwnymi i okazałymi kwiatostanami. ', 'Ze względu na swoją niesamowitą woń, zjawiskowe, zwracające uwagę kolory i nektar który wytwarza, jest ulubionym kwiatem owadów. Budleja Dawida jest krzewem, który przyciąga niezliczoną ilość najpiękniejszych motyli i z tego powodu potocznie nazywana jest motylim krzewem. Krzew ozdobny jest niezwykle atrakcyjnym akcentem w każdym ogrodzie, nie tylko urodziwie w nim wyglądając, ale też oszałamiająco pachnąc. Kwiatostany budlei Dawida nadają się do cięcia, dzięki czemu mogą stanowić ozdobę w wazonie, wypełniając przy tym cały dom swym oszałamiającym aromatem.', 55.99, 0, 2, 'Budleja.jpeg'),
(4, 'Hortensja Bukietowa', 'Hortensja bukietowa jest niezwykle ozdobnym krzewem. Jest znacznie większa od Hortensji ogrodowej.', 'Hortensja bukietowa potrafi dorastać nawet do 2,5 m. To Hortensja idealna dla początkujących ogrodników, ponieważ jest łatwiejsza w uprawie i bardziej odporna na mróz. Kwitnie ona od lipca do września tworząc duże , stożkowate kwiatostany. W większości kolory kwiatów Hortensji bukietowej są kremowobiałe a pod koniec kwitnienia pięknie przebarwiają się na różowo- czerwone barwy. Jak właściwie wszystkie hortensje lubi rosnąć w słońcu oraz w lekko zacienionych zakątkach naszych ogrodów. Pamiętaj, że hortensja bukietowa lubi dobrą ziemię (zapewnij jej podłoże wyższej jakości) oraz glebę wilgotną.', 45.99, 58, 1, 'HorBuk.jpg'),
(5, 'Gaura \'Pasionate Blush\'', 'Gaura Linheimera jest rzadko spotykaną byliną o bardzo oryginalnej urodzie i egzotycznym uroku.', 'Odmiana \'Pasionate Blush\' jest miniaturą tego gatunku o różowych kwiatach dorastającą do około 50 cm wysokości. Wyrasta w postaci kęp zagęszczonych u podstawy, które od lipca aż do jesieni wytwarzają obficie piękne kwiaty osadzone niemal na całej długości pędów. Kwiaty otwierają się o świcie, są różowe i mają po kilka długich, zwisających pręcików. Pąki kwiatowe są natomiast purpurowe, co dobrze podkreśla i wzmacnia róż rozwiniętych kwiatów. Cała kwitnąca kępa ma dość luźny lecz wyrazisty pokrój. Gaura est bardzo oryginalnym gatunkiem, rzadko spotykanym w ogrodach.', 23.99, 70, 2, 'Gaura.jpg'),
(6, 'Koleus', 'Pochodząca z Indonezji kolorowa, oryginalna roślina ozdobna wyglądająca jak namalowana.', 'Koleus Blumego (Coleus blumei) należy do rodziny jasnotowatych (Lamiaceae). W naturalnym środowisku jest to roślina wieloletnia, jednak u nas w ogrodach uprawiana jako jednoroczna. Pochodzi z tropikalnych rejonów Australii, Azji i wysp Pacyfiku. W związku z tym preferuje stanowiska słoneczne, jasne, ciepłe. Im bardziej nasłonecznione miejsce tym dla nich lepiej -ładniej wybarwiają się ich liście. To właśnie one są cechą charakterystyczną tej rośliny.', 16.00, 400, 3, 'Koleus.jpg'),
(7, 'lawenda', 'Lawenda to niezwykle popularna roślina, która gości w wielu ogrodach. Popularność wynika z jej walorów zapachowych, smakowych, zdrowotnych oraz dekoracyjnych.', 'Lawenda wąskolistna należy do najczęściej uprawianych w naszym kraju. Jest to zimozielona roślina, która charakteryzuje się wąskimi, srebrzystymi listkami i kwiatami zebranymi w kłosy. Wielu osobom lawenda kojarzy się przede wszystkim z Francją i fioletowobłękitnymi polami. W Polsce również możemy cieszyć oczy takimi widokami, bo świetnie nadaje się do uprawy w ogrodzie.\r\n\r\nWymaga ona jednak nakładu pracy, czyli przycinania, wyboru odpowiedniego miejsca pod uprawę, ale umiejętnie pielęgnowana bardzo dobrze się rozrasta, pięknie wygląda i wydziela przyjemny zapach. W ogrodzie lawenda ma wartość nie tylko ozdobną, ale także może posłużyć do stworzenia suchych bukietów, które spakowane w siateczkę skutecznie chronią przed molami w szafie. Lawenda może być również składnikiem leczniczych mikstur oraz dodatkiem do potraw.', 19.99, 43, 3, 'Lawenda.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`) VALUES
(1, 'jacekpieczarek', 'jacekpieczarek');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeksy dla tabeli `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
