CREATE TABLE COMPANYA (
    nom VARCHAR (40) NOT NULL,
    IATA VARCHAR (6) NOT NULL,
    CODE3 VARCHAR (6) NOT NULL,
    ICAO VARCHAR (6) NOT NULL,
    pais VARCHAR (40) NOT NULL
);

CREATE TABLE AVIO (
    num_serie VARCHAR (30) NOT NULL,
    tipus VARCHAR (10)  NOT NULL, 
    fabricant VARCHAR (20) NOT NULL,
    any_fabricacio YEAR 
);

CREATE TABLE AEROPORT (
    codi VARCHAR (4) NOT NULL,
    pais VARCHAR (40) NOT NULL,
    ciutat VARCHAR (40) NOT NULL,
    IATA  VARCHAR (4),
    nom VARCHAR (55) NOT NULL,
    any_construccio YEAR 
);  

CREATE TABLE MOSTRADOR (
    numero TINYINT UNSIGNED
);

CREATE TABLE PERSONAL (
    num_empleat INT,
    nom VARCHAR (25) NOT NULL,
    cognom VARCHAR (35) NOT NULL,
    passaport VARCHAR (20) NOT NULL,
    sou float NOT NULL
);

CREATE TABLE PILOT (
    hores_vol TIME
);

CREATE TABLE PASSATGER (
    passaport VARCHAR (20) NOT NULL,
    nom VARCHAR (30) NOT NULL,
    cognom VARCHAR (50),
    email VARCHAR (40),
    data_naixement DATE,
    genere CHAR ('H','D')  
);

CREATE TABLE VOL (
    codi VARCHAR(9) NOT NULL,
    data DATE NOT NULL,
    durada INT UNSIGNED,
    descripcio VARCHAR (255)
);