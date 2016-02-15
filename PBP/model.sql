create database if not exists gradjevinskaFirma;

use gradjevinskaFirma;


drop table if exists garaza;
drop table if exists ostvareneNabavkeMasina;
drop table if exists stavkeNabavkeMasina;
drop table if exists nabavkeMasina;
drop table if exists masine;
drop table if exists skladiste;
drop table if exists ostvareneNabavkeMaterijala;
drop table if exists stavkeNabavkeMaterijala;
drop table if exists nabavkeMaterijala;
drop table if exists materijali;
drop table if exists dobavljaci;
drop table if exists ugovoriSaPodizvodjacima;
drop table if exists podizvodjaci;
drop table if exists radovi;
drop table if exists prodaje;
drop table if exists pozicije;
drop table if exists zaposleni;


create table materijali (
	idMaterijala int(11) not null auto_increment,
	naziv varchar(45),
	opis varchar(256),
	jedinica varchar(15),
	primary key(idMaterijala)
);

create table skladiste (
	idMaterijala int(11),
	kolicina decimal(10, 2) not null,
	kvalitet varchar(10),
	nabavnaCena decimal(10, 2),
	foreign key (idMaterijala) references materijali(idMaterijala)
);

create table dobavljaci (
	idDobavljaca int(11) not null auto_increment,
	ime varchar(256) not null,
	adresa varchar(256) not null,
	telefon varchar(16) not null,
	primary key(idDobavljaca)
);

create table nabavkeMaterijala (
	idNabavke int(11) not null auto_increment,
	idDobavljaca int(11),
	datumPrijave date,
    datumIsporuke date default null,
	primary key(idNabavke),
	foreign key (idDobavljaca) references dobavljaci(idDobavljaca)
);


create table stavkeNabavkeMaterijala (
	idStavkeNabavke int(11) not null auto_increment,
	idNabavke int(11),
	idMaterijala int(11),
	kolicina decimal(10, 2),
	cena decimal(10, 2),
	kvalitet varchar(10),
	primary key(idStavkeNabavke, idNabavke),
	foreign key(idNabavke) references nabavkeMaterijala(idNabavke),
	foreign key(idMaterijala) references materijali(idMaterijala)
);






create table zaposleni (
	idZaposlenog int(11) not null auto_increment,
	ime varchar(45),
	prezime varchar(45),
	primary key(idZaposlenog)
);

create table pozicije (
	idZaposlenog int(11) not null,
	pozicija enum('direktor', 'ekonomista', 'arhitekta', 'inzenjer', 'sef tima', 'sef gradilista', 'prodavac', 'magacioner', 'kontrolor'),
	foreign key(idZaposlenog) references zaposleni(idZaposlenog)
);

create table prodaje (
   idProdaje INT NOT NULL AUTO_INCREMENT,
   idProdavca INT(11) NOT NULL,
   idObjekta int(11),
   imeKupca VARCHAR(50) NOT NULL,
   prezimeKupca VARCHAR(50) NOT NULL,
   cena int,
   datumProdaje DATE,
   PRIMARY KEY ( idProdaje ),
   foreign key (idProdavca) references zaposleni(idZaposlenog)
);



use gradjevinskaFirma;


create table masine (
	idMasine int(11) not null auto_increment,
	naziv varchar(45),
	svrha varchar(256),
	primary key(idMasine)
);

create table garaza (
	idMasine int(11),
	brojMasina int(2) not null,
	cena decimal(10, 2),
	foreign key (idMasine) references masine(idMasine)
);


create table nabavkeMasina (
	idNabavke int(11) not null auto_increment,
	idDobavljaca int(11),
	datumPrijave DATE,
    datumIsporuke date default null,
	primary key(idNabavke),
	foreign key (idDobavljaca) references dobavljaci(idDobavljaca)
);

create table stavkeNabavkeMasina (
	idStavkeNabavke int(11) not null auto_increment,
	idNabavke int(11),
	idMasine int(11),
	brojMasina int(11),
	cena decimal(10, 2),
	primary key(idStavkeNabavke, idNabavke),
	foreign key(idNabavke) references nabavkeMasina(idNabavke),
	foreign key(idMasine) references masine(idMasine)
);





CREATE TABLE radovi (
    idRadovi INT(11) NOT NULL AUTO_INCREMENT,
    naziv VARCHAR(50),
    PRIMARY KEY (idRadovi)
);

create table podizvodjaci (
	idPodizvodjaca int(11) not null auto_increment,
	naziv varchar(50),
	primarniRadId int(11),
	primary key(idPodizvodjaca),
	foreign key (primarniRadId) references radovi(idRadovi)
);

create table ugovoriSaPodizvodjacima (
	idUgovora int(11) not null auto_increment,
	idPodizvodjaca int(11),
	datumPocetkaRadova DATE,
	radId int(11),
	primary key(idUgovora),
	foreign key (idPodizvodjaca) references podizvodjaci(idPodizvodjaca),
	foreign key (radId) references radovi(idRadovi)
);

select * from ugovoriSaPodizvodjacima;