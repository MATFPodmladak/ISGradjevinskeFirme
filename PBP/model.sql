drop	database if		exists	gradjevinskafirma;
create	database if not exists	gradjevinskaFirma;
use								gradjevinskaFirma;

-- kreiranje tabela

create table zaposleni
    (
        idZaposlenog int not null auto_increment
      , ime           varchar(255) not null
      , prezime       varchar(255) not null
      , korisnickoIme varchar(255) not null unique
      , salt		  char(16)	   not null
      , lozinka		  char(32)	   not null
      , primary key (idZaposlenog)
    )
;

create table ovlascenja
    (
        idOvlascenja    int not null auto_increment
      , nazivOvlascenja varchar(255) not null
      , primary key(idOvlascenja)
    )
;

create table pozicije
    (
        idZaposlenog int not null
      , idOvlascenja int not null
      , foreign key(idZaposlenog) references zaposleni(idZaposlenog)
      , foreign key(idOvlascenja) references ovlascenja(idOvlascenja)
    )
;

create table projekti
    (
        idProjekta     int not null auto_increment
      , datumPocetka   date not null
      , rok            date not null
      , datumZavrsetka date default null
      , arhitekta      int default null
      , inzenjer       int default null
      , odobrio        int default null
      , primary key (idProjekta)
    )
;

create table gradjevinskiObjekti
    (
        idObjekta				int		 not null auto_increment
      , idProjekta				int		 not null
      , velicina 				smallint not null
      , spremanZaProdaju		bool	 not null default false
      , oglasen					bool	 not null default false
      , spremanZaPrezentovanje	bool	 not null default false
      , primary key (idObjekta)
      , foreign key (idProjekta) references projekti (idProjekta)
    )
;

create table dobavljaci
    (
        idDobavljaca int not null auto_increment
      , ime          varchar(255) not null
      , adresa       varchar(255) not null
      , telefon      varchar(255) not null
      , primary key (idDobavljaca)
    )
;

create table materijali
    (
        idMaterijala	int not null auto_increment
      , naziv       	varchar(255) not null
      , opis			text
      , jedinica		enum ('kg', 'm', 'm2', 'm3')
      , primary key (idMaterijala)
    )
;

create table skladiste
    (
        idMaterijala	int not null
      , kolicina		decimal(10, 2) not null
      , kvalitet 		enum('I', 'II', 'III', 'IV')
      , nabavnaCena		decimal(10, 2)
      , valuta			enum('RSD', 'USD', 'EUR')
      , primary key (idMaterijala, kvalitet, nabavnaCena)
      , foreign key (idMaterijala) references materijali(idMaterijala)
    )
;


create table nabavkeMaterijala
    (
        idNabavke     int not null auto_increment
      , idDobavljaca  int
      , datumPrijave  date
      , datumIsporuke date default null
      , odobrio       int default null
      , primary key (idNabavke)
      , foreign key (idDobavljaca) references dobavljaci(idDobavljaca)
      , foreign key (odobrio) references zaposleni(idZaposlenog)
    )
;

create table stavkeNabavkeMaterijala
    (
        idStavkeNabavke int not null auto_increment
      , idNabavke       int not null
      , idMaterijala    int not null
      , kolicina        decimal(10, 2)
      , cena            decimal(10, 2)
      , valuta			enum('RSD', 'USD', 'EUR')
      , kvalitet 		enum('I', 'II', 'III', 'IV')
      , primary key (idStavkeNabavke, idNabavke)
      , foreign key (idNabavke) references nabavkeMaterijala(idNabavke)
      , foreign key (idMaterijala) references materijali(idMaterijala)
    )
;


create table prodaja
    (
        idProdaje    int			not null auto_increment
      , idProdavca   int			not null
      , idObjekta    int			not null unique
      , imeKupca     varchar(255) 	not null
      , prezimeKupca varchar(255) 	not null
      , cena         decimal(10, 2) not null
      , valuta		 enum('RSD', 'USD', 'EUR')
      , datumProdaje date default null
      , primary key (idProdaje)
      , foreign key (idProdavca) references zaposleni(idZaposlenog)
      , foreign key (idObjekta) references gradjevinskiObjekti(idObjekta)
    )
;

create table masine
    (
        idMasine int		  not null auto_increment
      , naziv    varchar(255) not null
      , primary key (idMasine)
    )
;

create table nabavkeMasina
    (
        idNabavke     int	not null auto_increment
      , idDobavljaca  int	not null
      , datumPrijave  date	not null
      , datumIsporuke date	default null
      , odobrio       int not null
      , primary key (idNabavke)
      , foreign key (idDobavljaca) references dobavljaci(idDobavljaca)
      , foreign key (odobrio) references zaposleni(idZaposlenog)
    )
;

create table stavkeNabavkeMasina
    (
        idStavkeNabavke int not null auto_increment
      , idNabavke       int not null
      , idMasine        int not null
      , cena            decimal(10, 2)
      , valuta enum('RSD', 'USD', 'EUR')
      , primary key (idStavkeNabavke, idNabavke)
      , foreign key (idNabavke) references nabavkeMasina(idNabavke)
      , foreign key (idMasine) references masine(idMasine)
    )
;

create table radovi
    (
        idRada int			not null auto_increment
      , naziv  varchar(255) not null
      , opis text
      , primary key (idRada)
    )
;

create table podizvodjaci
    (
        idPodizvodjaca int			not null auto_increment
      , naziv          varchar(255) not null
      , primary key (idPodizvodjaca)
    )
;

create table ugovoriSaPodizvodjacima
    (
        idUgovora      int not null auto_increment
      , idPodizvodjaca int
      , idProjekta     int
      , idRada         int
      , primary key (idUgovora)
      , foreign key (idPodizvodjaca) references podizvodjaci(idPodizvodjaca)
      , foreign key (idRada) references radovi(idRada)
      , foreign key (idProjekta) references projekti(idProjekta)
    )
;

-- pogledi

create view cenaNabavkeMasina
    (idNabavke, potrosenNovac, valuta
    ) as
select
    nm.idNabavke
  , sum(snm.cena)
  , snm.valuta
from
    nabavkeMasina nm
join
    stavkeNabavkeMasina snm
on  nm.idNabavke = snm.idNabavke
group by
    nm.idNabavke
  , snm.valuta
;

create view cenaNabavkeMaterijala
    (idNabavke, potrosenNovac, valuta
    ) as
select
    nm.idNabavke
  , sum(snm.cena)
  , snm.valuta
from
    nabavkeMaterijala nm
join
    stavkeNabavkeMaterijala snm
on  nm.idNabavke = snm.idNabavke
group by
    nm.idNabavke
  , snm.valuta
;

create view brojMasina
    (tipMasine, brojMasina
    ) as
select naziv, count(naziv) from masine group by naziv;

create view ovlascenjaZaposlenih (idZaposlenog, idOvlascenja, nazivOvlascenja) as
select z.idZaposlenog, o.idOvlascenja, o.nazivOvlascenja
from zaposleni z
	join pozicije p
		on z.idZaposlenog=p.idZaposlenog
	join ovlascenja o
		on o.idOvlascenja=p.idOvlascenja;

-- okidaci

delimiter $$
create procedure
    validDecimal (val decimal
                  , nonnegative bool)
begin
    if val < .0 or
        (
            val = .0 and nonnegative = false
        )
        then
        signal sqlstate '45000' set message_text = "Vrednost nije ispravna";
    end if;
end;
$$
create trigger skladiste_bi before
    insert
    on skladiste for each row begin if new.nabavnaCena < .0
        or new.kolicina                               <= .0 then signal sqlstate '45000' set message_text = "Vrednost nije ispravna"
    ;

end if;
end
$$
create trigger skladiste_bu before
    update
    on skladiste for each row begin if new.nabavnaCena < .0
        or new.kolicina                               <= .0 then signal sqlstate '45000'
    set message_text                                   = "Vrednost nije ispravna"
    ;

end if;
end
$$
create trigger nabavkeMaterijala_bi before
    insert
    on nabavkeMaterijala for each row begin if new.datumIsporuke is not null
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
create trigger nabavkeMaterijala_bu before
    update
    on nabavkeMaterijala for each row begin if new.datumIsporuke is not null
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
create trigger stavkeNabavkeMaterijala_bi before
    insert
    on stavkeNabavkeMaterijala for each row begin if new.cena < .0
        or new.kolicina                                      <= .0 then signal sqlstate '45000' set message_text = "Vrednost nije ispravna"
    ;

end if;
end
$$
create trigger stavkeNabavkeMaterijala_bu before
    update
    on stavkeNabavkeMaterijala for each row begin if new.cena < .0
        or new.kolicina                                      <= .0 then signal sqlstate '45000'
    set message_text                                          = "Vrednost nije ispravna"
    ;

end if;
end
$$
create trigger nabavkeMasina_bi before
    insert
    on nabavkeMasina for each row
begin
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
create trigger nabavkeMasina_bu before
    update
    on nabavkeMasina for each row begin if new.datumIsporuke is not null
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
create trigger prodaja_bi before
    insert
    on prodaja for each row begin if new.idProdavca not in
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
create trigger prodaja_bu before
    update
    on prodaja for each row begin if new.idProdavca not in
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

$$create trigger projekti_bi before
    insert
    on projekti for each row begin if new.arhitekta is null
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

create trigger projekti_bu before
    update
    on projekti for each row begin if new.arhitekta is null
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
