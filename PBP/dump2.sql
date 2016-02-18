use gradjevinskaFirma;
insert into dobavljaci (idDobavljaca, ime, adresa, telefon)
values 
(5215, 'Tripplephase', 'Braća Srnić 50', '011/116050'),
(5216, 'Voltfase', 'Dositeja Obradovića 51', '011/178371'),
(5217, 'Mathace', 'Kraljevića Marka 52', '011/240692'),
(5218, 'Dva Brata', 'Despota Stefana 53', '011/303013'),
(5219, 'Tata i sin', 'Hajduk Stanka 54', '011/365334'),
(5220, 'Dedini unuci', 'Svetog Save 55', '011/427655'),
(5221, 'Trustjob', 'Cara Lazara 56', '011/489976');

insert into masine (idMasine, naziv)
values
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

insert into materijali (idMaterijala, naziv, opis, jedinica) values
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

insert into zaposleni(idZaposlenog, ime, prezime, korisnickoIme, lozinka, salt) 
values
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


