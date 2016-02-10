drop table if exists prodaja;

create table prodaja(
   prodaja_id INT NOT NULL AUTO_INCREMENT,
   #idRadnika INT NOT NULL,
   ime_kupca VARCHAR(50) NOT NULL,
   prezime_kupca VARCHAR(50) NOT NULL,
   jmbg_kupca INT(13) NOT NULL,
   datum_prodaje DATE,
   PRIMARY KEY ( prodaja_id ),
   #foreign key (idRadnika) references zaposleni(idRadnika)
);
