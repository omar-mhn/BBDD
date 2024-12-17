
DROP TABLE COMPANYA;
DROP TABLE AVIO;
DROP TABLE AEROPORT;
DROP TABLE MOSTRADOR;
DROP TABLE PERSONAL;
DROP TABLE HOSTESSA;
DROP TABLE PILOT;
DROP TABLE PASSATGER;
DROP TABLE VOL;
DROP TABLE VOLAR;

CREATE TABLE COMPANYA (
    nom VARCHAR (40) NOT NULL,
    IATA VARCHAR (6) NOT NULL,
    CODE3 VARCHAR (6) NOT NULL,
    ICAO VARCHAR (6) NOT NULL,
    pais VARCHAR (40) NOT NULL,
    filial_de VARCHAR (40) NOT NULL 
);

CREATE TABLE AVIO (
    num_serie VARCHAR (30) NOT NULL,
    tipus VARCHAR (10)  NOT NULL, 
    fabricant VARCHAR (20) NOT NULL,
    any_fabricacio YEAR, 
    companya VARCHAR (40) NOT NULL
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
    numero SMALLINT,
    codi_aeroport VARCHAR (4) NOT NULL    
);

CREATE TABLE PERSONAL (
    num_empleat INT,
    nom VARCHAR (25) NOT NULL,
    cognom VARCHAR (35) NOT NULL,
    passaport VARCHAR (20) NOT NULL,
    sou float NOT NULL
);

CREATE TABLE HOSTESSA (
    num_empleat INT
);

CREATE TABLE PILOT (
    num_empleat INT,
    hores_vol TIME
);

CREATE TABLE PASSATGER (
    passaport VARCHAR (20) NOT NULL,
    nom VARCHAR (30) NOT NULL,
    adreca VARCHAR (70),
    telefon VARCHAR (9),
    cognom VARCHAR (50),
    email VARCHAR (40),
    data_naixement DATE,
    genere CHAR (1)  
);

CREATE TABLE VOL (
    aeroport_origen VARCHAR (4) NOT NULL,
    aeroport_desti VARCHAR (4) NOT NULL,
    avio VARCHAR (30) NOT NULL,
    hostessa INT,
    pilot INT,
    codi VARCHAR(9) NOT NULL, 
    data DATE NOT NULL,
    descripcio VARCHAR (255),
    durada SMALLINT
);

CREATE TABLE VOLAR (
    passatger VARCHAR (20) NOT NULL,
    vol VARCHAR(9) NOT NULL,
    seient TINYINT 
);
