create database if not exists gradjevinskaFirma;

use gradjevinskaFirma;


drop table if exists skladiste;
drop table if exists ostvareneNabavkeMaterijala;
drop table if exists stavkeNabavkeMaterijala;
drop table if exists nabavkeMaterijala;
drop table if exists materijali;
drop table if exists dobavljaci;

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
	primary key(idNabavke),
	foreign key (idDobavljaca) references dobavljaci(idDobavljaca)
);

create table ostvareneNabavkeMaterijala (
	idNabavke int(11) not null,
	datumIsporuke date not null,
	primary key(idNabavke),
	foreign key(idNabavke) references nabavkeMaterijala(idNabavke)
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



drop table if exists prodaje;
drop table if exists pozicije;
drop table if exists zaposleni;



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


create database if not exists gradjevinskaFirma;

use gradjevinskaFirma;

drop table if exists garaza;
drop table if exists ostvareneNabavkeMasina;
drop table if exists stavkeNabavkeMasina;
drop table if exists nabavkeMasina;
drop table if exists masine;

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
	primary key(idNabavke),
	foreign key (idDobavljaca) references dobavljaci(idDobavljaca)
);

create table ostvareneNabavkeMasina (
	idNabavke int(11) not null,
	datumIsporuke DATE not null,
	primary key(idNabavke),
	foreign key(idNabavke) references nabavkeMasina(idNabavke)
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

