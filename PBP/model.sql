create database if not exists gradjevinskaFirma;
use gradjevinskaFirma;

# Table dropping

drop table if exists garaza;
drop table if exists stavkeNabavkeMasina;
drop table if exists nabavkeMasina;
drop table if exists masine;
drop table if exists skladiste;
drop table if exists stavkeNabavkeMaterijala;
drop table if exists nabavkeMaterijala;
drop table if exists materijali;
drop table if exists dobavljaci;
drop table if exists ugovoriSaPodizvodjacima;
drop table if exists podizvodjaci;
drop table if exists radovi;
drop table if exists prodaja;
drop table if exists pozicije;
drop table if exists zaposleni;
drop table if exists gradjevinskiObjekti;

# Nabavka materijala

create table zaposleni (
	idZaposlenog int not null auto_increment,
	ime varchar(255),
	prezime varchar(255),
	primary key(idZaposlenog)
);

create table materijali (
	idMaterijala int not null auto_increment,
	naziv varchar(255) not null,
	opis text,
	jedinica enum ('kg', 'm', 'm2', 'm3'),
	primary key(idMaterijala)
);

create table skladiste (
	idMaterijala int not null auto_increment,
	kolicina decimal(10, 2) not null,
	kvalitet enum('I', 'II', 'III', 'IV'),
	nabavnaCena decimal(10, 2),
    valuta enum('RSD', 'USD', 'EUR'),
    primary key (idMaterijala, kvalitet, nabavnaCena),
	foreign key (idMaterijala) references materijali(idMaterijala)
);

create table dobavljaci (
	idDobavljaca int not null auto_increment,
	ime varchar(255) not null,
	adresa varchar(255) not null,
	telefon varchar(255) not null,
	primary key(idDobavljaca)
);

create table nabavkeMaterijala (
	idNabavke int not null auto_increment,
	idDobavljaca int,
	datumPrijave date,
    datumIsporuke date default null,
    odobrio int default null,
	primary key(idNabavke),
	foreign key (idDobavljaca) references dobavljaci(idDobavljaca),
    foreign key (odobrio) references zaposleni(idZaposlenog)
);

create table stavkeNabavkeMaterijala (
	idStavkeNabavke int not null auto_increment,
	idNabavke int not null,
	idMaterijala int not null,
	kolicina decimal(10, 2),
	cena decimal(10, 2),
    valuta enum('RSD', 'USD', 'EUR'),
	kvalitet enum('I', 'II', 'III', 'IV'),
	primary key(idStavkeNabavke, idNabavke),
	foreign key(idNabavke) references nabavkeMaterijala(idNabavke),
	foreign key(idMaterijala) references materijali(idMaterijala)
);

# Zaposleni



create table pozicije (
	idZaposlenog int not null auto_increment,
	pozicija enum('direktor', 'ekonomista', 'arhitekta', 'inzenjer', 'sef tima', 'sef gradilista', 'prodavac', 'magacioner', 'kontrolor'),
	foreign key(idZaposlenog) references zaposleni(idZaposlenog)
);

create table gradjevinskiObjekti (
	 idObjekta int(11) NOT NULL AUTO_INCREMENT auto_increment,
	 velicina smallint not null,
	 stanjeProdaje enum('Za prodaju', 'Nespreman') default 'Nespreman',
	 stanjeOglasavanja enum('Oglasen', 'Neoglasen') default 'Neoglasen',
	 stanjePrezentovanja enum('Prezentovan', 'Neprezentovan') default 'Neprezentovan',
	 PRIMARY KEY ( idObjekta )
);

create table prodaja (
	idProdaje int not null auto_increment,
	idProdavca int not null,
	idObjekta int not null,
	imeKupca varchar(255) not null,
	prezimeKupca varchar(255) not null,
	cena decimal(10, 2) not null,
    valuta enum('RSD', 'USD', 'EUR'),
	datumProdaje date,
	primary key(idProdaje),
	foreign key(idProdavca) references zaposleni(idZaposlenog),
	foreign key (idObjekta) references gradjevinskiObjekti(idObjekta)
);


# Nabavka masina

create table masine (
    idMasine int not null auto_increment,
    naziv varchar(255) not null,
    opis text,
    primary key(idMasine)
);

create table garaza (
	idMasine int not null auto_increment,
	brojMasina smallint not null,
	cena decimal(10, 2),
    valuta enum('RSD', 'USD', 'EUR'),
	foreign key (idMasine) references masine(idMasine)
);

create table nabavkeMasina (
	idNabavke int not null auto_increment,
	idDobavljaca int not null,
	datumPrijave date not null,
    datumIsporuke date default null,
	primary key(idNabavke),
	foreign key (idDobavljaca) references dobavljaci(idDobavljaca)
);

create table stavkeNabavkeMasina (
	idStavkeNabavke int not null auto_increment,
	idNabavke int not null,
	idMasine int not null,
	brojMasina smallint not null,
	cena decimal(10, 2),
    valuta enum('RSD', 'USD', 'EUR'),
	primary key(idStavkeNabavke, idNabavke),
	foreign key(idNabavke) references nabavkeMasina(idNabavke),
	foreign key(idMasine) references masine(idMasine)
);

# Izvodjenje radova

create table radovi (
    idRada int not null auto_increment,
    naziv varchar(255) not null,
    opis text,
    primary key (idRada)
);

# Podizvodjaci

create table podizvodjaci (
	idPodizvodjaca int not null auto_increment,
	naziv varchar(255) not null,
	primary key(idPodizvodjaca)
);

create table ugovoriSaPodizvodjacima (
	idUgovora int not null auto_increment,
	idPodizvodjaca int,
	datumPocetkaRadova date,
	idRada int,
	primary key(idUgovora),
	foreign key (idPodizvodjaca) references podizvodjaci(idPodizvodjaca),
	foreign key (idRada) references radovi(idRada)
);
