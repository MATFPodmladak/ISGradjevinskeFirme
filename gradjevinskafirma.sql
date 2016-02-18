-- phpMyAdmin SQL Dump
-- version 4.4.13.1
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Feb 18, 2016 at 01:11 PM
-- Server version: 5.6.27
-- PHP Version: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gradjevinskafirma`
--
CREATE DATABASE IF NOT EXISTS `gradjevinskafirma` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `gradjevinskafirma`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `validDecimal`(val decimal
                  , nonnegative bool)
begin
    if val < .0 or
        (
            val = .0 and nonnegative = false
        )
        then
        signal sqlstate '45000' set message_text = "Vrednost nije ispravna";
    end if;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `brojmasina`
--
CREATE TABLE IF NOT EXISTS `brojmasina` (
`tipMasine` varchar(255)
,`brojMasina` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cenanabavkemasina`
--
CREATE TABLE IF NOT EXISTS `cenanabavkemasina` (
`idNabavke` int(11)
,`potrosenNovac` decimal(32,2)
,`valuta` enum('RSD','USD','EUR')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cenanabavkematerijala`
--
CREATE TABLE IF NOT EXISTS `cenanabavkematerijala` (
`idNabavke` int(11)
,`potrosenNovac` decimal(32,2)
,`valuta` enum('RSD','USD','EUR')
);

-- --------------------------------------------------------

--
-- Table structure for table `dobavljaci`
--

CREATE TABLE IF NOT EXISTS `dobavljaci` (
  `idDobavljaca` int(11) NOT NULL,
  `ime` varchar(255) NOT NULL,
  `adresa` varchar(255) NOT NULL,
  `telefon` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5222 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dobavljaci`
--

INSERT INTO `dobavljaci` (`idDobavljaca`, `ime`, `adresa`, `telefon`) VALUES
(5215, 'Tripplephase', 'Braća Srnić 50', '011/116050'),
(5216, 'Voltfase', 'Dositeja Obradovića 51', '011/178371'),
(5217, 'Mathace', 'Kraljevića Marka 52', '011/240692'),
(5218, 'Dva Brata', 'Despota Stefana 53', '011/303013'),
(5219, 'Tata i sin', 'Hajduk Stanka 54', '011/365334'),
(5220, 'Dedini unuci', 'Svetog Save 55', '011/427655'),
(5221, 'Trustjob', 'Cara Lazara 56', '011/489976');

-- --------------------------------------------------------

--
-- Table structure for table `gradjevinskiobjekti`
--

CREATE TABLE IF NOT EXISTS `gradjevinskiobjekti` (
  `idObjekta` int(11) NOT NULL,
  `idProjekta` int(11) NOT NULL,
  `velicina` smallint(6) NOT NULL,
  `spremanZaProdaju` tinyint(1) NOT NULL DEFAULT '0',
  `oglasen` tinyint(1) NOT NULL DEFAULT '0',
  `spremanZaPrezentovanje` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=8483 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gradjevinskiobjekti`
--

INSERT INTO `gradjevinskiobjekti` (`idObjekta`, `idProjekta`, `velicina`, `spremanZaProdaju`, `oglasen`, `spremanZaPrezentovanje`) VALUES
(8477, 500, 25, 1, 0, 0),
(8478, 500, 35, 1, 1, 0),
(8479, 501, 75, 0, 0, 0),
(8480, 503, 25, 1, 1, 0),
(8481, 504, 85, 1, 1, 0),
(8482, 502, 45, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `masine`
--

CREATE TABLE IF NOT EXISTS `masine` (
  `idMasine` int(11) NOT NULL,
  `naziv` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `masine`
--

INSERT INTO `masine` (`idMasine`, `naziv`) VALUES
(31, 'Buldožer'),
(32, 'Buldožer'),
(33, 'Buldožer'),
(34, 'Buldožer'),
(35, 'Utovarivač'),
(36, 'Utovarivač'),
(37, 'Bager'),
(38, 'Bager'),
(39, 'Bager'),
(40, 'Bager'),
(41, 'Bager'),
(42, 'Valjak'),
(43, 'Valjak'),
(44, 'Valjak'),
(45, 'Valjak'),
(46, 'Valjak'),
(47, 'Valjak'),
(48, 'Kamion'),
(49, 'Kamion'),
(50, 'Kamion'),
(51, 'Kamion'),
(52, 'Kamion'),
(53, 'Kamion'),
(54, 'Kamion'),
(55, 'Kamion'),
(56, 'Pumpa za beton'),
(57, 'Pumpa za beton'),
(58, 'Građevinski lift');

-- --------------------------------------------------------

--
-- Table structure for table `materijali`
--

CREATE TABLE IF NOT EXISTS `materijali` (
  `idMaterijala` int(11) NOT NULL,
  `naziv` varchar(255) NOT NULL,
  `opis` text,
  `jedinica` enum('kg','m','m2','m3') DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `materijali`
--

INSERT INTO `materijali` (`idMaterijala`, `naziv`, `opis`, `jedinica`) VALUES
(34, 'Krec', 'generic note', 'kg'),
(36, 'Armatura', 'generic note', 'm'),
(38, 'Kablovi', 'generic note', 'm'),
(40, 'Stiropor', 'generic note', 'm2'),
(42, 'Staklena vuna', 'generic note', 'm2'),
(44, 'Crep', 'generic note', 'm2'),
(46, 'Opeka', 'generic note', 'm2'),
(48, 'Lim', 'generic note', 'm2'),
(50, 'Cement', 'generic note', 'm3'),
(52, 'Sljunak', 'generic note', 'm3'),
(54, 'Pesak', 'generic note', 'm3'),
(56, 'Gips', 'generic note', 'm3'),
(58, 'Cigla', 'generic note', 'm3'),
(60, 'Blok', 'generic note', 'm3'),
(62, 'Drvo', 'generic note', 'm3'),
(64, 'Kamen', 'generic note', 'm3');

-- --------------------------------------------------------

--
-- Table structure for table `nabavkemasina`
--

CREATE TABLE IF NOT EXISTS `nabavkemasina` (
  `idNabavke` int(11) NOT NULL,
  `idDobavljaca` int(11) NOT NULL,
  `datumPrijave` date NOT NULL,
  `datumIsporuke` date DEFAULT NULL,
  `odobrio` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nabavkemasina`
--

INSERT INTO `nabavkemasina` (`idNabavke`, `idDobavljaca`, `datumPrijave`, `datumIsporuke`, `odobrio`) VALUES
(51, 5215, '2016-01-20', NULL, 853),
(52, 5216, '2026-01-20', NULL, 854),
(53, 5217, '2031-01-20', NULL, 853),
(54, 5218, '2001-02-20', NULL, 853),
(55, 5219, '2005-01-20', NULL, 854),
(56, 5220, '2019-01-20', NULL, 853),
(57, 5221, '2028-01-20', NULL, 854);

--
-- Triggers `nabavkemasina`
--
DELIMITER $$
CREATE TRIGGER `nabavkeMasina_bi` BEFORE INSERT ON `nabavkemasina`
 FOR EACH ROW begin
	if new.datumIsporuke is not null
        and new.datumIsporuke < new.datumPrijave then signal sqlstate '45000' set message_text = "Datum isporuke mora biti nakon datuma prijave nabavke"
    ;

end if;
if new.odobrio is not null
    and new.odobrio not in
    (
        select
            idZaposlenog
        from
            ovlascenjaZaposlenih
        where    
            nazivOvlascenja like 'direktor'
    )
    then
    signal sqlstate '45000' set message_text = "Direktor jedini ima pravo da odobri nabavku";
end if;
if (new.datumIsporuke is not null and new.odobrio is null) then
    signal sqlstate '45000' set message_text = "Datum isporuke ne moze biti unet bez odobrenja i obrnuto.";
end if;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `nabavkeMasina_bu` BEFORE UPDATE ON `nabavkemasina`
 FOR EACH ROW begin if new.datumIsporuke is not null
        and new.datumIsporuke                                          < new.datumPrijave then signal sqlstate '45000'
    set message_text                                                   = "Datum isporuke mora biti nakon datuma prijave nabavke"
    ;

end if;
if( new.odobrio is not null
    and new.odobrio not in
    (
        select
            idZaposlenog
        from
            ovlascenjaZaposlenih
        where    
            nazivOvlascenja like 'direktor' ) ) then
    signal sqlstate '45000' set message_text = "Direktor jedini ima pravo da odobri nabavku";
end if;
if (new.datumIsporuke is not null and new.odobrio is null) then
    signal sqlstate '45000' set message_text = "Datum isporuke ne moze biti unet bez odobrenja i obrnuto.";
end if;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `nabavkematerijala`
--

CREATE TABLE IF NOT EXISTS `nabavkematerijala` (
  `idNabavke` int(11) NOT NULL,
  `idDobavljaca` int(11) DEFAULT NULL,
  `datumPrijave` date DEFAULT NULL,
  `datumIsporuke` date DEFAULT NULL,
  `odobrio` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=901 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nabavkematerijala`
--

INSERT INTO `nabavkematerijala` (`idNabavke`, `idDobavljaca`, `datumPrijave`, `datumIsporuke`, `odobrio`) VALUES
(699, 5216, '2015-11-23', NULL, NULL),
(700, 5217, '2016-02-01', NULL, NULL),
(900, 5221, '2015-12-01', NULL, NULL);

--
-- Triggers `nabavkematerijala`
--
DELIMITER $$
CREATE TRIGGER `nabavkeMaterijala_bi` BEFORE INSERT ON `nabavkematerijala`
 FOR EACH ROW begin if new.datumIsporuke is not null
        and new.datumIsporuke                                              < new.datumPrijave then signal sqlstate '45000' set message_text = "Datum isporuke mora biti nakon datuma prijave nabavke"
    ;

end if;
if new.odobrio is not null
    and new.odobrio not in
    (
        select
            idZaposlenog
        from
            ovlascenjaZaposlenih
        where    
            nazivOvlascenja like 'direktor'
    )
    then
    signal sqlstate '45000' set message_text = "Direktor jedini ima pravo da odobri nabavku";
end if;
if (new.datumIsporuke is null xor new.odobrio is null) then
    signal sqlstate '45000' set message_text = "Datum isporuke ne moze biti unet bez odobrenja i obrnuto.";
end if;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `nabavkeMaterijala_bu` BEFORE UPDATE ON `nabavkematerijala`
 FOR EACH ROW begin if new.datumIsporuke is not null
        and new.datumIsporuke                                              < new.datumPrijave then signal sqlstate '45000'
    set message_text                                                       = "Datum isporuke mora biti nakon datuma prijave nabavke"
    ;

end if;
if new.odobrio is not null
    and new.odobrio not in
    (
        select
            idZaposlenog
        from
            ovlascenjaZaposlenih
        where    
            nazivOvlascenja like 'direktor' ) then
    signal sqlstate '45000' set message_text = "Direktor jedini ima pravo da odobri nabavku";
end if;
if (new.datumIsporuke is null xor new.odobrio is null) then
    signal sqlstate '45000' set message_text = "Datum isporuke ne moze biti unet bez odobrenja i obrnuto.";
end if;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ovlascenja`
--

CREATE TABLE IF NOT EXISTS `ovlascenja` (
  `idOvlascenja` int(11) NOT NULL,
  `nazivOvlascenja` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ovlascenja`
--

INSERT INTO `ovlascenja` (`idOvlascenja`, `nazivOvlascenja`) VALUES
(10, 'Direktor'),
(11, 'Ekonomista'),
(12, 'Inženjer'),
(13, 'Arhitekta'),
(14, 'Prodavac'),
(15, 'Šef tima'),
(16, 'Šef gradilišta'),
(17, 'Magacioner'),
(18, 'Kontrolor');

-- --------------------------------------------------------

--
-- Stand-in structure for view `ovlascenjazaposlenih`
--
CREATE TABLE IF NOT EXISTS `ovlascenjazaposlenih` (
`idZaposlenog` int(11)
,`idOvlascenja` int(11)
,`nazivOvlascenja` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `podizvodjaci`
--

CREATE TABLE IF NOT EXISTS `podizvodjaci` (
  `idPodizvodjaca` int(11) NOT NULL,
  `naziv` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `podizvodjaci`
--

INSERT INTO `podizvodjaci` (`idPodizvodjaca`, `naziv`) VALUES
(200, 'Silverholding'),
(201, 'Tripplephase'),
(202, 'Ozerlex'),
(203, 'Basebelax'),
(204, 'Newdom'),
(205, 'Indigoplanet'),
(206, 'Transzone'),
(207, 'Grootentag'),
(208, 'Acefind'),
(209, 'Conlane'),
(210, 'Voltfase'),
(211, 'Ranfix'),
(212, 'Opetexon'),
(213, 'Mathace'),
(214, 'Kindom'),
(215, 'Trustjob'),
(216, 'Bamplus'),
(217, 'Statway'),
(218, 'Ganjatech'),
(219, 'Reezlah Distribution'),
(220, 'Unostrip'),
(221, 'Hatdojob'),
(222, 'Candax');

-- --------------------------------------------------------

--
-- Table structure for table `pozicije`
--

CREATE TABLE IF NOT EXISTS `pozicije` (
  `idZaposlenog` int(11) NOT NULL,
  `idOvlascenja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pozicije`
--

INSERT INTO `pozicije` (`idZaposlenog`, `idOvlascenja`) VALUES
(853, 10),
(854, 10),
(855, 11),
(856, 11),
(857, 11),
(858, 12),
(859, 12),
(860, 12),
(861, 12),
(862, 12),
(863, 13),
(864, 13),
(865, 13),
(866, 14),
(867, 14),
(868, 14),
(869, 14),
(870, 14),
(871, 16),
(872, 16),
(873, 16),
(874, 17),
(875, 17),
(876, 18),
(877, 18);

-- --------------------------------------------------------

--
-- Table structure for table `prodaja`
--

CREATE TABLE IF NOT EXISTS `prodaja` (
  `idProdaje` int(11) NOT NULL,
  `idProdavca` int(11) NOT NULL,
  `idObjekta` int(11) NOT NULL,
  `imeKupca` varchar(255) NOT NULL,
  `prezimeKupca` varchar(255) NOT NULL,
  `cena` decimal(10,2) NOT NULL,
  `valuta` enum('RSD','USD','EUR') DEFAULT NULL,
  `datumProdaje` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2506 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prodaja`
--

INSERT INTO `prodaja` (`idProdaje`, `idProdavca`, `idObjekta`, `imeKupca`, `prezimeKupca`, `cena`, `valuta`, `datumProdaje`) VALUES
(2500, 866, 8477, 'Zoran', 'Cvijanović', '50000.00', 'EUR', '2013-01-01'),
(2501, 867, 8478, 'Marko', 'Spasovski', '51000.00', 'USD', '2013-02-01'),
(2503, 868, 8480, 'Svetlana', 'Sargančilović', '53000.00', 'EUR', '2013-04-01'),
(2504, 866, 8481, 'Bogdan', 'Čenek', '54000.00', 'USD', '2013-05-01'),
(2505, 868, 8482, 'Višnja', 'Parabolić', '55000.00', 'EUR', '2013-06-01');

--
-- Triggers `prodaja`
--
DELIMITER $$
CREATE TRIGGER `prodaja_bi` BEFORE INSERT ON `prodaja`
 FOR EACH ROW begin if new.idProdavca not in
        (
            select
            idZaposlenog
        from
            ovlascenjaZaposlenih
        where    
            nazivOvlascenja like 'prodavac'
        )
        then signal sqlstate '45000' set message_text = "Prodavac jedini ima pravo da prodaje objekte."
    ;

end if;
if false in
    (
        select
            spremanZaProdaju
        from
            gradjevinskiObjekti
        where
            gradjevinskiObjekti.idObjekta=new.idObjekta
    )
    then
    signal sqlstate '45000' set message_text = "Objekat mora biti spreman za prodaju.";
end if;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `prodaja_bu` BEFORE UPDATE ON `prodaja`
 FOR EACH ROW begin if new.idProdavca not in
        (
            select
            idZaposlenog
        from
            ovlascenjaZaposlenih
        where    
            nazivOvlascenja like 'prodavac' ) then signal sqlstate '45000'
    set message_text = "Prodavac jedini ima pravo da prodaje objekte."
    ;

end if;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `projekti`
--

CREATE TABLE IF NOT EXISTS `projekti` (
  `idProjekta` int(11) NOT NULL,
  `datumPocetka` date NOT NULL,
  `rok` date NOT NULL,
  `datumZavrsetka` date DEFAULT NULL,
  `arhitekta` int(11) DEFAULT NULL,
  `inzenjer` int(11) DEFAULT NULL,
  `odobrio` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=505 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projekti`
--

INSERT INTO `projekti` (`idProjekta`, `datumPocetka`, `rok`, `datumZavrsetka`, `arhitekta`, `inzenjer`, `odobrio`) VALUES
(500, '2011-01-01', '2013-01-01', '2012-11-24', 863, 862, 853),
(501, '2012-02-02', '2014-02-02', '2013-12-25', 863, 862, 853),
(502, '2013-03-03', '2015-03-03', '2014-01-26', 863, 862, 853),
(503, '2014-04-04', '2016-04-04', NULL, 863, 862, 853),
(504, '2015-05-05', '2017-05-05', NULL, 863, 862, 853);

--
-- Triggers `projekti`
--
DELIMITER $$
CREATE TRIGGER `projekti_bi` BEFORE INSERT ON `projekti`
 FOR EACH ROW begin if new.arhitekta is null
        and new.inzenjer                        is not null then signal sqlstate '45000' set message_text = "Inzenjer moze da odobri projekat jedino nakon arhitekte."
    ;

end if;
if new.odobrio is not null and new.inzenjer is null then
    signal sqlstate '45000' set message_text = "Direktor moze da odobri projekat jedino nakon inzenjera.";
end if;
if (new.arhitekta is not null and new.arhitekta not in
    (
        select
            idZaposlenog
        from
            ovlascenjaZaposlenih
        where    
            nazivOvlascenja like 'arhitekta' ) ) or
    (
        new.inzenjer is not null and new.inzenjer not in
        (
            select
            idZaposlenog
        from
            ovlascenjaZaposlenih
        where    
            nazivOvlascenja like 'inzenjer' )
    )
    or
    (
        new.odobrio is not null and new.odobrio not in
        (
            select
            idZaposlenog
        from
            ovlascenjaZaposlenih
        where    
            nazivOvlascenja like 'direktor' )
    )
    then
    signal sqlstate '45000' set message_text = "Neophodno je da arhitekta, inzenjer ili direktor imaju svoja ovlascenja.";
end if;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `projekti_bu` BEFORE UPDATE ON `projekti`
 FOR EACH ROW begin if new.arhitekta is null
        and new.inzenjer                        is not null then signal sqlstate '45000' set message_text = "Inzenjer moze da odobri projekat jedino nakon arhitekte."
    ;

end if;
if new.odobrio is not null and new.inzenjer is null then
    signal sqlstate '45000' set message_text = "Direktor moze da odobri projekat jedino nakon inzenjera.";
end if;
if (new.arhitekta is not null and new.arhitekta not in
    (
        select
            idZaposlenog
        from
            ovlascenjaZaposlenih
        where    
            nazivOvlascenja like 'arhitekta' ) ) or
    (
        new.inzenjer is not null and new.inzenjer not in
        (
            select
            idZaposlenog
        from
            ovlascenjaZaposlenih
        where    
            nazivOvlascenja like 'inzenjer' )
    )
    or
    (
        new.odobrio is not null and new.odobrio not in
        (
            select
            idZaposlenog
        from
            ovlascenjaZaposlenih
        where    
            nazivOvlascenja like 'direktor' )
    )
    then
    signal sqlstate '45000' set message_text = "Neophodno je da arhitekta, inzenjer ili direktor imaju svoja ovlascenja.";
end if;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `radovi`
--

CREATE TABLE IF NOT EXISTS `radovi` (
  `idRada` int(11) NOT NULL,
  `naziv` varchar(255) NOT NULL,
  `opis` text
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `radovi`
--

INSERT INTO `radovi` (`idRada`, `naziv`, `opis`) VALUES
(100, 'Stolarski radovi', 'Stolarski radovi'),
(101, 'Hidro i termoizolaterski radovi', 'Hidro i termoizolaterski radovi'),
(102, 'Krovopokrivački radovi', 'Krovopokrivački radovi'),
(103, 'Zidarski radovi', 'Zidarski radovi'),
(104, 'Instalacije grejanja i provetravanja', 'Instalacije grejanja i provetravanja'),
(105, 'Vodovodno kanalizacioni radovi', 'Vodovodno kanalizacioni radovi'),
(106, 'Zemljani radovi', 'Zemljani radovi'),
(107, 'Video nadzor', 'Video nadzor'),
(108, 'Lifovska postrojenja', 'Lifovska postrojenja'),
(109, 'Elektro radovi', 'Elektro radovi'),
(110, 'Betonski radovi', 'Betonski radovi'),
(111, 'Podopolagački radovi', 'Podopolagački radovi'),
(112, 'Molersko-fabrički radovi', 'Molersko-fabrički radovi'),
(113, 'Bravarski radovi', 'Bravarski radovi'),
(114, 'Limarski radovi', 'Limarski radovi'),
(115, 'Armirački radovi', 'Armirački radovi'),
(116, 'Tesarski radovi', 'Tesarski radovi'),
(117, 'Horizontalna signalizacija', 'Horizontalna signalizacija'),
(118, 'Vertikalna signalizacija', 'Vertikalna signalizacija'),
(119, 'Semafori', 'Semafori'),
(120, 'Traširanje', 'Traširanje'),
(121, 'Izrada i montaža šina i pragova', 'Izrada i montaža šina i pragova'),
(122, 'Proizvodnja energije', 'Proizvodnja energije'),
(123, 'Kontrola nivoa i protoka vode', 'Kontrola nivoa i protoka vode'),
(124, 'Spremanje asfalta u pogonu i ugradnja', 'Spremanje asfalta u pogonu i ugradnja');

-- --------------------------------------------------------

--
-- Table structure for table `skladiste`
--

CREATE TABLE IF NOT EXISTS `skladiste` (
  `idMaterijala` int(11) NOT NULL,
  `kolicina` decimal(10,2) NOT NULL,
  `kvalitet` enum('I','II','III','IV') NOT NULL DEFAULT 'I',
  `nabavnaCena` decimal(10,2) NOT NULL DEFAULT '0.00',
  `valuta` enum('RSD','USD','EUR') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `skladiste`
--

INSERT INTO `skladiste` (`idMaterijala`, `kolicina`, `kvalitet`, `nabavnaCena`, `valuta`) VALUES
(34, '85.00', 'II', '20.80', 'EUR'),
(36, '100.00', 'III', '80.80', 'EUR'),
(38, '200.00', 'IV', '60.80', 'EUR'),
(46, '100.00', 'II', '20.80', 'EUR'),
(52, '105.00', 'I', '40.80', 'EUR'),
(56, '150.00', 'II', '4000.80', 'RSD'),
(60, '85.00', 'II', '100.80', 'EUR');

--
-- Triggers `skladiste`
--
DELIMITER $$
CREATE TRIGGER `skladiste_bi` BEFORE INSERT ON `skladiste`
 FOR EACH ROW begin if new.nabavnaCena < .0
        or new.kolicina                               <= .0 then signal sqlstate '45000' set message_text = "Vrednost nije ispravna"
    ;

end if;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `skladiste_bu` BEFORE UPDATE ON `skladiste`
 FOR EACH ROW begin if new.nabavnaCena < .0
        or new.kolicina                               <= .0 then signal sqlstate '45000'
    set message_text                                   = "Vrednost nije ispravna"
    ;

end if;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stavkenabavkemasina`
--

CREATE TABLE IF NOT EXISTS `stavkenabavkemasina` (
  `idStavkeNabavke` int(11) NOT NULL,
  `idNabavke` int(11) NOT NULL,
  `idMasine` int(11) NOT NULL,
  `cena` decimal(10,2) DEFAULT NULL,
  `valuta` enum('RSD','USD','EUR') DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stavkenabavkemasina`
--

INSERT INTO `stavkenabavkemasina` (`idStavkeNabavke`, `idNabavke`, `idMasine`, `cena`, `valuta`) VALUES
(201, 51, 31, '10000.00', 'EUR'),
(202, 51, 32, '10000.00', 'EUR'),
(203, 52, 33, '10000.00', 'EUR'),
(204, 52, 34, '10000.00', 'EUR'),
(205, 51, 35, '8000.00', 'EUR'),
(206, 53, 36, '8000.00', 'EUR'),
(207, 51, 37, '8000.00', 'EUR'),
(208, 51, 38, '8000.00', 'EUR'),
(209, 52, 39, '8000.00', 'EUR'),
(210, 52, 40, '8000.00', 'EUR'),
(211, 53, 41, '8000.00', 'EUR'),
(212, 54, 42, '5000.00', 'EUR'),
(213, 54, 43, '5000.00', 'EUR'),
(214, 55, 44, '5000.00', 'EUR'),
(215, 56, 45, '5000.00', 'EUR'),
(216, 56, 46, '5000.00', 'EUR'),
(217, 56, 47, '5000.00', 'EUR'),
(218, 55, 48, '12000.00', 'EUR'),
(219, 56, 50, '12000.00', 'EUR'),
(220, 56, 51, '12000.00', 'EUR'),
(221, 56, 52, '12000.00', 'EUR'),
(222, 57, 53, '12000.00', 'EUR'),
(223, 57, 54, '12000.00', 'EUR'),
(224, 57, 55, '12000.00', 'EUR'),
(225, 51, 56, '20000.00', 'EUR'),
(226, 52, 57, '20000.00', 'EUR'),
(227, 53, 58, '25000.00', 'EUR'),
(228, 55, 49, '12000.00', 'EUR');

-- --------------------------------------------------------

--
-- Table structure for table `stavkenabavkematerijala`
--

CREATE TABLE IF NOT EXISTS `stavkenabavkematerijala` (
  `idStavkeNabavke` int(11) NOT NULL,
  `idNabavke` int(11) NOT NULL,
  `idMaterijala` int(11) NOT NULL,
  `kolicina` decimal(10,2) DEFAULT NULL,
  `cena` decimal(10,2) DEFAULT NULL,
  `valuta` enum('RSD','USD','EUR') DEFAULT NULL,
  `kvalitet` enum('I','II','III','IV') DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=747 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stavkenabavkematerijala`
--

INSERT INTO `stavkenabavkematerijala` (`idStavkeNabavke`, `idNabavke`, `idMaterijala`, `kolicina`, `cena`, `valuta`, `kvalitet`) VALUES
(741, 699, 34, '20.00', '2.00', 'EUR', 'III'),
(742, 700, 40, '40.00', '2.00', 'USD', 'I'),
(743, 700, 54, '120.00', '2.00', 'RSD', 'IV'),
(744, 900, 50, '50.00', '5001.00', 'RSD', 'II'),
(745, 900, 42, '10.00', '6001.00', 'USD', 'I'),
(746, 900, 50, '50.00', '1134.00', 'RSD', 'II');

--
-- Triggers `stavkenabavkematerijala`
--
DELIMITER $$
CREATE TRIGGER `stavkeNabavkeMaterijala_bi` BEFORE INSERT ON `stavkenabavkematerijala`
 FOR EACH ROW begin if new.cena < .0
        or new.kolicina                                      <= .0 then signal sqlstate '45000' set message_text = "Vrednost nije ispravna"
    ;

end if;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `stavkeNabavkeMaterijala_bu` BEFORE UPDATE ON `stavkenabavkematerijala`
 FOR EACH ROW begin if new.cena < .0
        or new.kolicina                                      <= .0 then signal sqlstate '45000'
    set message_text                                          = "Vrednost nije ispravna"
    ;

end if;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ugovorisapodizvodjacima`
--

CREATE TABLE IF NOT EXISTS `ugovorisapodizvodjacima` (
  `idUgovora` int(11) NOT NULL,
  `idPodizvodjaca` int(11) DEFAULT NULL,
  `idProjekta` int(11) DEFAULT NULL,
  `idRada` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1130 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ugovorisapodizvodjacima`
--

INSERT INTO `ugovorisapodizvodjacima` (`idUgovora`, `idPodizvodjaca`, `idProjekta`, `idRada`) VALUES
(1100, 200, 500, 101),
(1101, 206, 500, 103),
(1102, 212, 500, 105),
(1103, 218, 500, 106),
(1104, 201, 500, 109),
(1105, 202, 500, 110),
(1106, 202, 501, 101),
(1107, 208, 501, 103),
(1108, 214, 501, 105),
(1109, 216, 501, 106),
(1110, 221, 501, 109),
(1111, 203, 501, 110),
(1112, 201, 502, 101),
(1113, 207, 502, 103),
(1114, 210, 502, 105),
(1115, 217, 502, 106),
(1116, 222, 502, 109),
(1117, 204, 502, 110),
(1118, 204, 503, 101),
(1119, 205, 503, 103),
(1120, 213, 503, 105),
(1121, 215, 503, 106),
(1122, 200, 503, 109),
(1123, 205, 503, 110),
(1124, 203, 504, 101),
(1125, 209, 504, 103),
(1126, 211, 504, 105),
(1127, 219, 504, 106),
(1128, 201, 504, 109),
(1129, 206, 504, 110);

-- --------------------------------------------------------

--
-- Table structure for table `zaposleni`
--

CREATE TABLE IF NOT EXISTS `zaposleni` (
  `idZaposlenog` int(11) NOT NULL,
  `ime` varchar(255) NOT NULL,
  `prezime` varchar(255) NOT NULL,
  `korisnickoIme` varchar(255) NOT NULL,
  `salt` char(16) NOT NULL,
  `lozinka` char(32) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=878 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zaposleni`
--

INSERT INTO `zaposleni` (`idZaposlenog`, `ime`, `prezime`, `korisnickoIme`, `salt`, `lozinka`) VALUES
(853, 'Marko', 'Miladinović', 'MarkoMiladinović', 'abc', 'abc'),
(854, 'Ivana', 'Rodić', 'IvanaRodić', 'abc', 'abc'),
(855, 'Tijana', 'Janković', 'TijanaJanković', 'abc', 'abc'),
(856, 'Pera', 'Stojisavljević', 'PeraStojisavljević', 'abc', 'abc'),
(857, 'Stanko', 'Marić', 'StankoMarić', 'abc', 'abc'),
(858, 'Mihajlo', 'Sretenović', 'MihajloSretenović', 'abc', 'abc'),
(859, 'Slavko', 'Maruljić', 'SlavkoMaruljić', 'abc', 'abc'),
(860, 'Srboljub', 'Ignjatović', 'SrboljubIgnjatović', 'abc', 'abc'),
(861, 'Miladinka', 'Grabovać', 'MiladinkaGrabovać', 'abc', 'abc'),
(862, 'Tamara', 'Djurdjević', 'TamaraDjurdjević', 'abc', 'abc'),
(863, 'Aleksandra', 'Zec', 'AleksandraZec', 'abc', 'abc'),
(864, 'Milanka', 'Glušica', 'MilankaGlušica', 'abc', 'abc'),
(865, 'Ivan', 'Mitrović', 'IvanMitrović', 'abc', 'abc'),
(866, 'Nikola', 'Aleksić', 'NikolaAleksić', 'abc', 'abc'),
(867, 'Dejan', 'Tanasković', 'DejanTanasković', 'abc', 'abc'),
(868, 'Nikolina', 'Bjeloš', 'NikolinaBjeloš', 'abc', 'abc'),
(869, 'Marija', 'Srecković', 'MarijaSrecković', 'abc', 'abc'),
(870, 'Stojan', 'Milosević', 'StojanMilosević', 'abc', 'abc'),
(871, 'Zvonko', 'Nikolić', 'ZvonkoNikolić', 'abc', 'abc'),
(872, 'Prvoslav', 'Manesku', 'PrvoslavManesku', 'abc', 'abc'),
(873, 'Stanoje', 'Stojanović', 'StanojeStojanović', 'abc', 'abc'),
(874, 'Miroljub', 'Ljubenović', 'MiroljubLjubenović', 'abc', 'abc'),
(875, 'Miloje', 'Šipka', 'MilojeŠipka', 'abc', 'abc'),
(876, 'Sretoje', 'Motka', 'SretojeMotka', 'abc', 'abc'),
(877, 'Radoje', 'Opalić', 'RadojeOpalić', 'abc', 'abc');

-- --------------------------------------------------------

--
-- Structure for view `brojmasina`
--
DROP TABLE IF EXISTS `brojmasina`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `brojmasina` AS select `masine`.`naziv` AS `tipMasine`,count(`masine`.`naziv`) AS `brojMasina` from `masine` group by `masine`.`naziv`;

-- --------------------------------------------------------

--
-- Structure for view `cenanabavkemasina`
--
DROP TABLE IF EXISTS `cenanabavkemasina`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cenanabavkemasina` AS select `nm`.`idNabavke` AS `idNabavke`,sum(`snm`.`cena`) AS `potrosenNovac`,`snm`.`valuta` AS `valuta` from (`nabavkemasina` `nm` join `stavkenabavkemasina` `snm` on((`nm`.`idNabavke` = `snm`.`idNabavke`))) group by `nm`.`idNabavke`,`snm`.`valuta`;

-- --------------------------------------------------------

--
-- Structure for view `cenanabavkematerijala`
--
DROP TABLE IF EXISTS `cenanabavkematerijala`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cenanabavkematerijala` AS select `nm`.`idNabavke` AS `idNabavke`,sum(`snm`.`cena`) AS `potrosenNovac`,`snm`.`valuta` AS `valuta` from (`nabavkematerijala` `nm` join `stavkenabavkematerijala` `snm` on((`nm`.`idNabavke` = `snm`.`idNabavke`))) group by `nm`.`idNabavke`,`snm`.`valuta`;

-- --------------------------------------------------------

--
-- Structure for view `ovlascenjazaposlenih`
--
DROP TABLE IF EXISTS `ovlascenjazaposlenih`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ovlascenjazaposlenih` AS select `z`.`idZaposlenog` AS `idZaposlenog`,`o`.`idOvlascenja` AS `idOvlascenja`,`o`.`nazivOvlascenja` AS `nazivOvlascenja` from ((`zaposleni` `z` join `pozicije` `p` on((`z`.`idZaposlenog` = `p`.`idZaposlenog`))) join `ovlascenja` `o` on((`o`.`idOvlascenja` = `p`.`idOvlascenja`)));

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dobavljaci`
--
ALTER TABLE `dobavljaci`
  ADD PRIMARY KEY (`idDobavljaca`);

--
-- Indexes for table `gradjevinskiobjekti`
--
ALTER TABLE `gradjevinskiobjekti`
  ADD PRIMARY KEY (`idObjekta`),
  ADD KEY `idProjekta` (`idProjekta`);

--
-- Indexes for table `masine`
--
ALTER TABLE `masine`
  ADD PRIMARY KEY (`idMasine`);

--
-- Indexes for table `materijali`
--
ALTER TABLE `materijali`
  ADD PRIMARY KEY (`idMaterijala`);

--
-- Indexes for table `nabavkemasina`
--
ALTER TABLE `nabavkemasina`
  ADD PRIMARY KEY (`idNabavke`),
  ADD KEY `idDobavljaca` (`idDobavljaca`),
  ADD KEY `odobrio` (`odobrio`);

--
-- Indexes for table `nabavkematerijala`
--
ALTER TABLE `nabavkematerijala`
  ADD PRIMARY KEY (`idNabavke`),
  ADD KEY `idDobavljaca` (`idDobavljaca`),
  ADD KEY `odobrio` (`odobrio`);

--
-- Indexes for table `ovlascenja`
--
ALTER TABLE `ovlascenja`
  ADD PRIMARY KEY (`idOvlascenja`);

--
-- Indexes for table `podizvodjaci`
--
ALTER TABLE `podizvodjaci`
  ADD PRIMARY KEY (`idPodizvodjaca`);

--
-- Indexes for table `pozicije`
--
ALTER TABLE `pozicije`
  ADD KEY `idZaposlenog` (`idZaposlenog`),
  ADD KEY `idOvlascenja` (`idOvlascenja`);

--
-- Indexes for table `prodaja`
--
ALTER TABLE `prodaja`
  ADD PRIMARY KEY (`idProdaje`),
  ADD UNIQUE KEY `idObjekta` (`idObjekta`),
  ADD KEY `idProdavca` (`idProdavca`);

--
-- Indexes for table `projekti`
--
ALTER TABLE `projekti`
  ADD PRIMARY KEY (`idProjekta`);

--
-- Indexes for table `radovi`
--
ALTER TABLE `radovi`
  ADD PRIMARY KEY (`idRada`);

--
-- Indexes for table `skladiste`
--
ALTER TABLE `skladiste`
  ADD PRIMARY KEY (`idMaterijala`,`kvalitet`,`nabavnaCena`);

--
-- Indexes for table `stavkenabavkemasina`
--
ALTER TABLE `stavkenabavkemasina`
  ADD PRIMARY KEY (`idStavkeNabavke`,`idNabavke`),
  ADD KEY `idNabavke` (`idNabavke`),
  ADD KEY `idMasine` (`idMasine`);

--
-- Indexes for table `stavkenabavkematerijala`
--
ALTER TABLE `stavkenabavkematerijala`
  ADD PRIMARY KEY (`idStavkeNabavke`,`idNabavke`),
  ADD KEY `idNabavke` (`idNabavke`),
  ADD KEY `idMaterijala` (`idMaterijala`);

--
-- Indexes for table `ugovorisapodizvodjacima`
--
ALTER TABLE `ugovorisapodizvodjacima`
  ADD PRIMARY KEY (`idUgovora`),
  ADD KEY `idPodizvodjaca` (`idPodizvodjaca`),
  ADD KEY `idRada` (`idRada`),
  ADD KEY `idProjekta` (`idProjekta`);

--
-- Indexes for table `zaposleni`
--
ALTER TABLE `zaposleni`
  ADD PRIMARY KEY (`idZaposlenog`),
  ADD UNIQUE KEY `korisnickoIme` (`korisnickoIme`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dobavljaci`
--
ALTER TABLE `dobavljaci`
  MODIFY `idDobavljaca` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5222;
--
-- AUTO_INCREMENT for table `gradjevinskiobjekti`
--
ALTER TABLE `gradjevinskiobjekti`
  MODIFY `idObjekta` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8483;
--
-- AUTO_INCREMENT for table `masine`
--
ALTER TABLE `masine`
  MODIFY `idMasine` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `materijali`
--
ALTER TABLE `materijali`
  MODIFY `idMaterijala` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `nabavkemasina`
--
ALTER TABLE `nabavkemasina`
  MODIFY `idNabavke` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `nabavkematerijala`
--
ALTER TABLE `nabavkematerijala`
  MODIFY `idNabavke` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=901;
--
-- AUTO_INCREMENT for table `ovlascenja`
--
ALTER TABLE `ovlascenja`
  MODIFY `idOvlascenja` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `podizvodjaci`
--
ALTER TABLE `podizvodjaci`
  MODIFY `idPodizvodjaca` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=223;
--
-- AUTO_INCREMENT for table `prodaja`
--
ALTER TABLE `prodaja`
  MODIFY `idProdaje` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2506;
--
-- AUTO_INCREMENT for table `projekti`
--
ALTER TABLE `projekti`
  MODIFY `idProjekta` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=505;
--
-- AUTO_INCREMENT for table `radovi`
--
ALTER TABLE `radovi`
  MODIFY `idRada` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=125;
--
-- AUTO_INCREMENT for table `stavkenabavkemasina`
--
ALTER TABLE `stavkenabavkemasina`
  MODIFY `idStavkeNabavke` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=229;
--
-- AUTO_INCREMENT for table `stavkenabavkematerijala`
--
ALTER TABLE `stavkenabavkematerijala`
  MODIFY `idStavkeNabavke` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=747;
--
-- AUTO_INCREMENT for table `ugovorisapodizvodjacima`
--
ALTER TABLE `ugovorisapodizvodjacima`
  MODIFY `idUgovora` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1130;
--
-- AUTO_INCREMENT for table `zaposleni`
--
ALTER TABLE `zaposleni`
  MODIFY `idZaposlenog` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=878;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `gradjevinskiobjekti`
--
ALTER TABLE `gradjevinskiobjekti`
  ADD CONSTRAINT `gradjevinskiobjekti_ibfk_1` FOREIGN KEY (`idProjekta`) REFERENCES `projekti` (`idProjekta`);

--
-- Constraints for table `nabavkemasina`
--
ALTER TABLE `nabavkemasina`
  ADD CONSTRAINT `nabavkemasina_ibfk_1` FOREIGN KEY (`idDobavljaca`) REFERENCES `dobavljaci` (`idDobavljaca`),
  ADD CONSTRAINT `nabavkemasina_ibfk_2` FOREIGN KEY (`odobrio`) REFERENCES `zaposleni` (`idZaposlenog`);

--
-- Constraints for table `nabavkematerijala`
--
ALTER TABLE `nabavkematerijala`
  ADD CONSTRAINT `nabavkematerijala_ibfk_1` FOREIGN KEY (`idDobavljaca`) REFERENCES `dobavljaci` (`idDobavljaca`),
  ADD CONSTRAINT `nabavkematerijala_ibfk_2` FOREIGN KEY (`odobrio`) REFERENCES `zaposleni` (`idZaposlenog`);

--
-- Constraints for table `pozicije`
--
ALTER TABLE `pozicije`
  ADD CONSTRAINT `pozicije_ibfk_1` FOREIGN KEY (`idZaposlenog`) REFERENCES `zaposleni` (`idZaposlenog`),
  ADD CONSTRAINT `pozicije_ibfk_2` FOREIGN KEY (`idOvlascenja`) REFERENCES `ovlascenja` (`idOvlascenja`);

--
-- Constraints for table `prodaja`
--
ALTER TABLE `prodaja`
  ADD CONSTRAINT `prodaja_ibfk_1` FOREIGN KEY (`idProdavca`) REFERENCES `zaposleni` (`idZaposlenog`),
  ADD CONSTRAINT `prodaja_ibfk_2` FOREIGN KEY (`idObjekta`) REFERENCES `gradjevinskiobjekti` (`idObjekta`);

--
-- Constraints for table `skladiste`
--
ALTER TABLE `skladiste`
  ADD CONSTRAINT `skladiste_ibfk_1` FOREIGN KEY (`idMaterijala`) REFERENCES `materijali` (`idMaterijala`);

--
-- Constraints for table `stavkenabavkemasina`
--
ALTER TABLE `stavkenabavkemasina`
  ADD CONSTRAINT `stavkenabavkemasina_ibfk_1` FOREIGN KEY (`idNabavke`) REFERENCES `nabavkemasina` (`idNabavke`),
  ADD CONSTRAINT `stavkenabavkemasina_ibfk_2` FOREIGN KEY (`idMasine`) REFERENCES `masine` (`idMasine`);

--
-- Constraints for table `stavkenabavkematerijala`
--
ALTER TABLE `stavkenabavkematerijala`
  ADD CONSTRAINT `stavkenabavkematerijala_ibfk_1` FOREIGN KEY (`idNabavke`) REFERENCES `nabavkematerijala` (`idNabavke`),
  ADD CONSTRAINT `stavkenabavkematerijala_ibfk_2` FOREIGN KEY (`idMaterijala`) REFERENCES `materijali` (`idMaterijala`);

--
-- Constraints for table `ugovorisapodizvodjacima`
--
ALTER TABLE `ugovorisapodizvodjacima`
  ADD CONSTRAINT `ugovorisapodizvodjacima_ibfk_1` FOREIGN KEY (`idPodizvodjaca`) REFERENCES `podizvodjaci` (`idPodizvodjaca`),
  ADD CONSTRAINT `ugovorisapodizvodjacima_ibfk_2` FOREIGN KEY (`idRada`) REFERENCES `radovi` (`idRada`),
  ADD CONSTRAINT `ugovorisapodizvodjacima_ibfk_3` FOREIGN KEY (`idProjekta`) REFERENCES `projekti` (`idProjekta`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
