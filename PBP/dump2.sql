use gradjevinskaFirma;

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

insert into ovlascenja(idOvlascenja, nazivOvlascenja)
values
(10,Direktor),
(11,Ekonomista),
(12,Inženjer),
(13,Arhitekta),
(14,Prodavac),
(15,Šef tima),
(16,Šef gradilišta),
(17,Magacioner),
(18,Kontrolor);

insert into pozicije(idZaposlenog, idOvlascenja)
values
(853,10),
(854,10),
(855,11),
(856,11),
(857,11),
(858,12),
(859,12),
(860,12),
(861,12),
(862,12),
(863,13),
(864,13),
(865,13),
(866,14),
(867,14),
(868,14),
(869,14),
(870,14),
(871,16),
(872,16),
(873,16),
(874,17),
(875,17),
(876,18),
(877,18);


insert into projekti(idProjekta, datumPocetka, rok, datumZavrsetka, arhitekta, inzinjer, odobrio) 
values
(500,2011-01-01,2013-01-01,2012-11-24,862,863,853),
(501,2012-02-02,2014-02-02,2013-12-25,862,863,853),
(502,2013-03-03,2015-03-03,2014-01-26,862,863,853),
(503,2014-04-04,2016-04-04,,862,863,853),
(504,2015-05-05,2017-05-05,,862,863,853);

insert into gradjevinskiObjekat(idObjekta, idProjekta, velicina, spremanZaProdaju, oglasen)
values
(8477,500,25,true,false),
(8478,500,35,true,true),
(8479,501,75,false,false),
(8480,503,25,true,true),
(8481,504,85,true,true),
(8482,502,45,true,true);

insert into dobavljaci (idDobavljaca, ime, adresa, telefon)
values 
(5215, 'Tripplephase', 'Braća Srnić 50', '011/116050'),
(5216, 'Voltfase', 'Dositeja Obradovića 51', '011/178371'),
(5217, 'Mathace', 'Kraljevića Marka 52', '011/240692'),
(5218, 'Dva Brata', 'Despota Stefana 53', '011/303013'),
(5219, 'Tata i sin', 'Hajduk Stanka 54', '011/365334'),
(5220, 'Dedini unuci', 'Svetog Save 55', '011/427655'),
(5221, 'Trustjob', 'Cara Lazara 56', '011/489976');

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

insert into skladiste(idMaterijala, kolicina, kvalitet, nabavnaCena, valuta)
values
(32,100,85,II,20,8,EUR),
(33,105,85,I,40,8,EUR),
(34,100,85,II,20,8,EUR),
(35,22,85,II,100,8,EUR),
(36,100,85,III,80,8,EUR),
(37,150,85,II,4000,8,RSD),
(38,200,85,IV,60,8,EUR);

insert into nabavkeMaterijala(idNabavke, idDobavljaca, datumPrijave, datumIsporuke)
values
(699,5216,2015-11-23,2016-2-1,null),
(700,5217,2015-11-23,2016-2-1,null),
(900,5221,2015-12-15,2015-9-18,null);

insert into stavkeNabavkeMaterijala(idStavkeNabavke, idNabavke, idMaterijala, kolicina, cena, valuta, kvalitet)
values
(741,699,34,20,2,40,5,EUR,III),
(742,700,40,40,2,85,5,USD,I),
(743,701,54,120,2,550,5,RSD,IV),
(744,900,50,50,2500,55,RSD,II),
(745,900,42,10,50,55,USD,I),
(746,900,50,50,2500,55,RSD,II);

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

insert into nabavkaMasina(idNabavke, idDobavljaca, datumPrijave, datumIsporuke)
(101, 1, 16.1.2016, 2.2.2016.,10),
(102, 2, 26.1.2016, 3.2.2016.,10),
(103, 3, 31.1.2016, 5.2.2016.,10),
(104, 4, 1.2.2016, 10.2.2016.,10),
(105, 2, 5.1.2016, 16.2.2016.,10),
(106, 3, 19.1.2016, 29.2.2016.,10),
(107, 1, 28.1.2016, 3.3.2016.,10);


insert into stavkaNabavkeMasina(idStavkeNabavke, idNabavke, idMasine, cena, valuta)
values
(201, 101, 31, 10000.00, EUR),
(202, 101, 32, 10000.00, EUR),
(203, 102, 33, 10000.00, EUR),
(204, 102, 34, 10000.00, EUR),
(205, 101, 35, 8000.00, EUR),
(206, 103, 36, 8000.00, EUR),
(207, 101, 37, 8000.00, EUR),
(208, 101, 38, 8000.00, EUR),
(209, 102, 39, 8000.00, EUR),
(210, 102, 40, 8000.00, EUR),
(211, 103, 41, 8000.00, EUR),
(212, 104, 42, 5000.00, EUR),
(213, 104, 43, 5000.00, EUR),
(214, 105, 44, 5000.00, EUR),
(215, 106, 45, 5000.00, EUR),
(216, 106, 46, 5000.00, EUR),
(217, 106, 47, 5000.00, EUR),
(218, 105, 48, 12000.00, EUR), 
(218, 105, 49, 12000.00, EUR), 
(219, 106, 50, 12000.00, EUR), 
(220, 106, 51, 12000.00, EUR), 
(221, 106, 52, 12000.00, EUR), 
(222, 107, 53, 12000.00, EUR), 
(223, 107, 54, 12000.00, EUR), 
(224, 107, 55, 12000.00, EUR), 
(225, 101, 56, 20000.00, EUR),
(226, 102, 57, 20000.00, EUR),
(227, 103, 58, 25000.00, EUR);



insert into prodaja(idProdaje, idProdavca, idObjekta, imeKupca, prezimeKupca, cena, valuta, datumProdaje) 
values
(2500,866,1000,Zoran,Cvijanović,50000,EUR,2013-01-01),
(2501,867,1001,Marko,Spasovski,51000,USD,2013-02-01),
(2502,869,1002,Željko,Milutinović,52000,USD,2013-03-01),
(2503,868,1003,Svetlana,Sargančilović,53000,EUR,2013-04-01),
(2504,866,1004,Bogdan,Čenek,54000,USD,2013-05-01),
(2505,868,1005,Višnja,Parabolić,55000,EUR,2013-06-01),
(2506,870,1006,Jelena,Jiniapolis,5600000,RSD,2013-07-01),
(2507,867,1007,Sofia,Čečenovski,57000,USD,2013-08-01),
(2508,869,1008,Budimir,Grgeč,5800000,RSD,2013-09-01),
(2509,866,1009,Vesmir,Čopić,59000,EUR,2013-10-01);


insert into radovi(idRada, naziv, opis)
values
(100,Stolarski radovi,Stolarski radovi),
(101,Hidro i termoizolaterski radovi,Hidro i termoizolaterski radovi),
(102,Krovopokrivački radovi,Krovopokrivački radovi),
(103,Zidarski radovi,Zidarski radovi),
(104,Instalacije grejanja i provetravanja,Instalacije grejanja i provetravanja),
(105,Vodovodno kanalizacioni radovi,Vodovodno kanalizacioni radovi),
(106,Zemljani radovi,Zemljani radovi),
(107,Video nadzor,Video nadzor),
(108,Lifovska postrojenja,Lifovska postrojenja),
(109,Elektro radovi,Elektro radovi),
(110,Betonski radovi,Betonski radovi),
(111,Podopolagački radovi,Podopolagački radovi),
(112,Molersko-fabrički radovi,Molersko-fabrički radovi),
(113,Bravarski radovi,Bravarski radovi),
(114,Limarski radovi,Limarski radovi),
(115,Armirački radovi,Armirački radovi),
(116,Tesarski radovi,Tesarski radovi),
(117,Horizontalna signalizacija,Horizontalna signalizacija),
(118,Vertikalna signalizacija,Vertikalna signalizacija),
(119,Semafori,Semafori),
(120,Traširanje,Traširanje),
(121,Izrada i montaža šina i pragova,Izrada i montaža šina i pragova),
(121,Spremanje asfalta u pogonu i ugradnja,Spremanje asfalta u pogonu i ugradnja),
(122,Proizvodnja energije,Proizvodnja energije),
(123,Kontrola nivoa i protoka vode,Kontrola nivoa i protoka vode);

insert into podizvodjaci(idPodizodjaca, naziv)
values
(200,Silverholding),
(201,Tripplephase),
(202,Ozerlex),
(203,Basebelax),
(204,Newdom),
(205,Indigoplanet),
(206,Transzone),
(207,Grootentag),
(208,Acefind),
(209,Conlane),
(210,Voltfase),
(211,Ranfix),
(212,Opetexon),
(213,Mathace),
(214,Kindom),
(215,Trustjob),
(216,Bamplus),
(217,Statway),
(218,Ganjatech),
(219,Reezlah Distribution),
(220,Unostrip),
(221,Hatdojob),
(222,Candax);


insert into ugovoriSaPodizvodjcima(idUgovora, idPodizvodjaca, idProjekta, idRada)
values
(1100,200,500,101),
(1101,206,500,103),
(1102,212,500,105),
(1103,218,500,106),
(1104,201,500,109),
(1105,202,500,110),
(1106,202,501,101),
(1107,208,501,103),
(1108,214,501,105),
(1109,216,501,106),
(1110,221,501,109),
(1111,203,501,110),
(1112,201,502,101),
(1113,207,502,103),
(1114,210,502,105),
(1115,217,502,106),
(1116,222,502,109),
(1117,204,502,110),
(1118,204,503,101),
(1119,205,503,103),
(1120,213,503,105),
(1121,215,503,106),
(1122,200,503,109),
(1123,205,503,110),
(1124,203,504,101),
(1125,209,504,103),
(1126,211,504,105),
(1127,219,504,106),
(1128,201,504,109),
(1129,206,504,110);

