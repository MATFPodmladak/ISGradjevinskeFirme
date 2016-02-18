use	gradjevinskaFirma;

LOAD DATA INFILE './podaci/zaposleni.txt' INTO TABLE zaposleni
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE './podaci/ovlascenja.txt' INTO TABLE ovlascenja
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE './podaci/pozicije.txt' INTO TABLE pozicije
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE './PBP/podaci/projekti.txt' INTO TABLE projekti
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE './podaci/gradjevinskiObjekti.txt' INTO TABLE gradjevinskiObjekti
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE './podaci/dobavljaci.txt' INTO TABLE dobavljaci
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE './podaci/materijali.txt' INTO TABLE materijali
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE './podaci/skladiste.txt' INTO TABLE skladiste
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE './podaci/nabavkeMaterijala.txt' INTO TABLE nabavkeMaterijala
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE './podaci/stavkeNabavkeMaterijala.txt' INTO TABLE stavkeNabavkeMaterijala
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE './podaci/prodaja.txt' INTO TABLE prodaja
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE './podaci/masine.txt' INTO TABLE masine
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE './podaci/nabavkeMasina.txt' INTO TABLE nabavkeMasina
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE './podaci/stavkeNabavkeMasina.txt' INTO TABLE stavkeNabavkeMasina
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE './podaci/radovi.txt' INTO TABLE radovi
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE './podaci/podizvodjaci.txt' INTO TABLE podizvodjaci
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE './podaci/ugovoriSaPodizvodjacima.txt' INTO TABLE ugovoriSaPodizvodjacima
  FIELDS TERMINATED BY ';';
