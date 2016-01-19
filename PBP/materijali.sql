create database if not exists materijali;

use materijali;

drop table if exists stavkePonude;
drop table if exists skladiste;
drop table if exists nabavke;
drop table if exists ponude;
drop table if exists dobavljaci;
drop table if exists materijali;

create table materijali(
	idMaterijala int(11),
    nazivMaterijala varchar(45) not null,
    opisMaterijala varchar(1024),
    jedinica varchar(45) not null,
    primary key(idMaterijala)
);

create table skladiste (
	idMaterijala int(11),
    kvalitet int not null,
    kolicina decimal(65, 2) not null,
    datumNabavke date not null,
    datumIsteka date,
    primary key (idMaterijala, kvalitet),
    foreign key (idMaterijala) references materijali(idMaterijala),
    check(kolicina >= .0),
    check(kvalitet >= 1),
    check((datumIsteka is not null and datumIsteka >= datumNabavke) or (datumIsteka is null))
    
);

create table dobavljaci(
	idDobavljaca int(11),
    imeDobavljaca varchar(256) not null,
    sifraDobavljaca char(12) not null,
    adresaDobavljaca varchar(256),
    telefonDobavljaca varchar(16),
    emailDobavljaca varchar(2048),
    primary key(idDobavljaca)
);

create table ponude(
	idPonude int(11),
    idDobavljaca int(11),
    datumPonude date not null,
    datumIstekaPonude date,
    primary key (idPonude),
    foreign key (idDobavljaca) references dobavljaci(idDobavljaca)
);

create table stavkePonude(
	idPonude int(11),
    idStavke int(11),
    idMaterijala int(11),
    kvalitet int(11) not null,
    kolicina decimal(65, 2) not null,
    cena decimal(65, 2) not null,
    primary key(idPonude, idStavke),
    foreign key(idPonude) references ponude(idPonude),
    foreign key(idMaterijala) references materijali(idMaterijala),
    check (kvalitet > 0),
    check (cena > .0),
    check (kolicina > 0)
);

create table nabavke(
	idNabavke int(11),
    isporucena bool,
    datumOdluke date,
    datumIsporuke date,
    primary key(idNabavke),
    foreign key(idNabavke) references ponude(idPonude),
    check(datumIsporuke > datumOdluke)
);