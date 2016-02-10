drop table if exists prodaja;

create table prodaja(
   idProdaje INT NOT NULL AUTO_INCREMENT,
   idRadnika INT NOT NULL,
   imeKupca VARCHAR(50) NOT NULL,
   prezimeKupca VARCHAR(50) NOT NULL,
   cena int(),
   datumProdaje DATE,
   PRIMARY KEY ( prodaja_id ),
   foreign key (idRadnika) references zaposleni(idRadnika)
);
