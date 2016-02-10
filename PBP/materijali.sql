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
