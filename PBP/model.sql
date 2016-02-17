drop database if exists gradjevinskafirma;
create database if not exists gradjevinskaFirma;
use gradjevinskaFirma;

<<<<<<< HEAD
=======
# Table dropping

drop table if exists stavkeNabavkeMasina;
drop table if exists nabavkeMasina;
drop table if exists masine;
drop table if exists skladiste;
drop table if exists stavkeNabavkeMaterijala;
drop table if exists nabavkeMaterijala;
drop table if exists materijali;
drop table if exists dobavljaci;
drop table if exists projekti;
drop table if exists ugovoriSaPodizvodjacima;
drop table if exists podizvodjaci;
drop table if exists radovi;
drop table if exists prodaja;
drop table if exists pozicije;
drop table if exists zaposleni;
drop table if exists gradjevinskiObjekti;

>>>>>>> f73119957fbd09641d11fb1dde0ed87c273fdd69
# Nabavka materijala

create table zaposleni (
	idZaposlenog int not null auto_increment,
	ime varchar(255),
	prezime varchar(255),
<<<<<<< HEAD
	primary key (idZaposlenog)
=======
	idPozicije int,
	primary key (idZaposlenog),
	foreign key (idPozicije) references pozicije(idPozicije)
>>>>>>> f73119957fbd09641d11fb1dde0ed87c273fdd69
);

create table materijali (
	idMaterijala int not null auto_increment,
	naziv varchar(255) not null,
	opis text,
	jedinica enum ('kg', 'm', 'm2', 'm3'),
	primary key (idMaterijala)
);

create table skladiste (
	idMaterijala int not null,
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
	primary key (idDobavljaca)
);

create table nabavkeMaterijala (
	idNabavke int not null auto_increment,
	idDobavljaca int,
	datumPrijave date,
	datumIsporuke date default null,
	odobrio int default null,
	primary key (idNabavke),
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
	primary key (idStavkeNabavke, idNabavke),
	foreign key (idNabavke) references nabavkeMaterijala(idNabavke),
	foreign key (idMaterijala) references materijali(idMaterijala)
);

# Zaposleni

<<<<<<< HEAD


create table ovlascenja (
	idOvlascenja int not null auto_increment,
	naziv varchar(255),
    primary key(idOvlascenja)
);

create table pozicije (
	idZaposlenog int not null,
    idOvlascenja int not null,
    foreign key(idZaposlenog) references zaposleni(idZaposlenog),
    foreign key(idOvlascenja) references ovlascenja(idOvlascenja)
);

create table gradjevinskiObjekti (
	idObjekta int not null auto_increment,
=======
create table pozicije (
	idPozicije int not null auto_increment,
	pozicija varchar(255),
	foreign key (idZaposlenog) references zaposleni(idZaposlenog)
);

create table gradjevinskiObjekti (
	idObjekta int(11) not null auto_increment,
>>>>>>> f73119957fbd09641d11fb1dde0ed87c273fdd69
	velicina smallint not null,
	stanjeProdaje enum('Za prodaju', 'Nespreman') default 'Nespreman',
	stanjeOglasavanja enum('Oglasen', 'Neoglasen') default 'Neoglasen',
	stanjePrezentovanja enum('Prezentovan', 'Neprezentovan') default 'Neprezentovan',
	primary key (idObjekta)
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
	primary key (idProdaje),
	foreign key (idProdavca) references zaposleni(idZaposlenog),
	foreign key (idObjekta) references gradjevinskiObjekti(idObjekta)
);

# Nabavka masina

create table masine (
	idMasine int not null auto_increment,
	naziv varchar(255) not null,
	primary key (idMasine)
);

create table nabavkeMasina (
	idNabavke int not null auto_increment,
	idDobavljaca int not null,
	datumPrijave date not null,
	datumIsporuke date default null,
	primary key (idNabavke),
	foreign key (idDobavljaca) references dobavljaci(idDobavljaca)
);

create table stavkeNabavkeMasina (
	idStavkeNabavke int not null auto_increment,
	idNabavke int not null,
	idMasine int not null,
	cena decimal(10, 2),
	valuta enum('RSD', 'USD', 'EUR'),
	primary key (idStavkeNabavke, idNabavke),
	foreign key (idNabavke) references nabavkeMasina(idNabavke),
	foreign key (idMasine) references masine(idMasine)
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
	primary key (idPodizvodjaca)
<<<<<<< HEAD
);

create table projekti (
	idProjekta int not null auto_increment,
	datumPocetka date not null,
	rok date not null,
	datumZavrsetka date default null,
	primary key (idProjekta)
=======
>>>>>>> f73119957fbd09641d11fb1dde0ed87c273fdd69
);

create table ugovoriSaPodizvodjacima (
	idUgovora int not null auto_increment,
	idPodizvodjaca int,
	idProjekta int,
	idRada int,
	primary key (idUgovora),
	foreign key (idPodizvodjaca) references podizvodjaci(idPodizvodjaca),
	foreign key (idRada) references radovi(idRada),
	foreign key (idProjekta) references projekti(idProjekta)
);

<<<<<<< HEAD




delimiter $$
create procedure validDecimal (val decimal, nonnegative bool)
begin
	if val < .0 or (val = .0 and nonnegative = false) then
		signal sqlstate '45000' set message_text = "Vrednost nije ispravna";
    end if;
end;
$$

create trigger skladiste_bi before insert on skladiste
for each row
begin
	if new.nabavnaCena < .0 or new.kolicina <= .0 then
		signal sqlstate '45000' set message_text = "Vrednost nije ispravna";
    end if;
end
$$

create trigger skladiste_bu before update on skladiste
for each row
begin
	if new.nabavnaCena < .0 or new.kolicina <= .0  then
		signal sqlstate '45000' set message_text = "Vrednost nije ispravna";
    end if;
end
$$

create trigger nabavkeMaterijala_bi before insert on nabavkeMaterijala
for each row
begin
	if new.datumIsporuke is not null and new.datumIsporuke < new.datumPrijave then
		signal sqlstate '45000' set message_text = "Datum isporuke mora biti nakon datuma prijave nabavke";
	end if;
end
$$

create trigger nabavkeMaterijala_bu before update on nabavkeMaterijala
for each row
begin
	if new.datumIsporuke is not null and new.datumIsporuke < new.datumPrijave then
		signal sqlstate '45000' set message_text = "Datum isporuke mora biti nakon datuma prijave nabavke";
	end if;
end
$$


create trigger stavkeNabavkeMaterijala_bi before insert on stavkeNabavkeMaterijala
for each row
begin
	if new.cena < .0 or new.kolicina <= .0  then
		signal sqlstate '45000' set message_text = "Vrednost nije ispravna";
    end if;
end
$$

create trigger stavkeNabavkeMaterijala_bu before update on stavkeNabavkeMaterijala
for each row
begin
	if new.cena < .0 or new.kolicina <= .0  then
		signal sqlstate '45000' set message_text = "Vrednost nije ispravna";
    end if;
end
$$
=======
create table projekti (
	idProjekta int not null auto_increment,
	datumPocetka date not null,
	rok date not null,
	datumZavrsetka date default null,
	primary key (idProjekta)
);
>>>>>>> f73119957fbd09641d11fb1dde0ed87c273fdd69
