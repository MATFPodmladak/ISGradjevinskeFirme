use	gradjevinskaFirma;

LOAD DATA INFILE 'ISGradjevinskeFirme/PBP/podaci/zaposleni.txt' INTO TABLE zaposleni
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE 'ISGradjevinskeFirme/PBP/podaci/ovlascenja.txt' INTO TABLE ovlascenja
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE 'ISGradjevinskeFirme/PBP/podaci/pozicije.txt' INTO TABLE pozicije
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE 'ISGradjevinskeFirme/PBP/podaci/projekti.txt' INTO TABLE projekti
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE 'ISGradjevinskeFirme/PBP/podaci/gradjevinskiObjekti.txt' INTO TABLE gradjevinskiObjekti
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE 'ISGradjevinskeFirme/PBP/podaci/dobavljaci.txt' INTO TABLE dobavljaci
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE 'ISGradjevinskeFirme/PBP/podaci/materijali.txt' INTO TABLE materijali
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE 'ISGradjevinskeFirme/PBP/podaci/skladiste.txt' INTO TABLE skladiste
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE 'ISGradjevinskeFirme/PBP/podaci/nabavkeMaterijala.txt' INTO TABLE nabavkeMaterijala
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE 'ISGradjevinskeFirme/PBP/podaci/stavkeNabavkeMaterijala.txt' INTO TABLE stavkeNabavkeMaterijala
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE 'ISGradjevinskeFirme/PBP/podaci/prodaja.txt' INTO TABLE prodaja
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE 'ISGradjevinskeFirme/PBP/podaci/masine.txt' INTO TABLE masine
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE 'ISGradjevinskeFirme/PBP/podaci/nabavkeMasina.txt' INTO TABLE nabavkeMasina
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE 'ISGradjevinskeFirme/PBP/podaci/stavkeNabavkeMasina.txt' INTO TABLE stavkeNabavkeMasina
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE 'ISGradjevinskeFirme/PBP/podaci/radovi.txt' INTO TABLE radovi
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE 'ISGradjevinskeFirme/PBP/podaci/podizvodjaci.txt' INTO TABLE podizvodjaci
  FIELDS TERMINATED BY ';';
LOAD DATA INFILE 'ISGradjevinskeFirme/PBP/podaci/ugovoriSaPodizvodjacima.txt' INTO TABLE ugovoriSaPodizvodjacima
  FIELDS TERMINATED BY ';';
