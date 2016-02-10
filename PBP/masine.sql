create database if not exists gradjevinskaFirma;

use gradjevinskaFirma;

drop table if exists garaza;
drop table if exists ostvareneNabavkeMasina;
drop table if exists stavkeNabavkeMasina;
drop table if exists nabavkeMasina;
drop table if exists masine

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
	foreign key (idMasine) references materijali(idMasine)
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
	brojMasina int(),
	cena decimal(10, 2),
	primary key(idStavkeNabavke, idNabavke),
	foreign key(idNabavke) references nabavkeMasina(idNabavke),
	foreign key(idMasine) references masine(idMasine)
);
