
/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS Desenvolupament d'Aplicacions Multiplataforma 
    CFGS Desenvolupament d'Aplicacions Web 
    Mòdul: 0484 Bases de dades. 
    AUTOR: Jordi Quesada Balaguer
    DATA: Gener 2025
****************************************************** */

-- ------------------------------------------------------
-- Base de dades de vols
-- ------------------------------------------------------

-- ------------------------------------------------------
--  Eliminació de taules
-- ------------------------------------------------------

drop table if exists volar;
drop table if exists vol;
drop table if exists pilot;
drop table if exists hostessa;
drop table if exists personal;
drop table if exists passatger;
drop table if exists Mostrador;
drop table if exists aeroport;
drop table if exists avio;
drop table if exists companyia;

-- ------------------------------------------------------
--  Creació de taula companyia
-- ------------------------------------------------------

CREATE TABLE companyia (	
	nom Varchar(40) not null, 
	IATA CHAR(6) not null, 
	CODE3 CHAR(6), 
	ICAO CHAR(6), 
	pais Varchar(40) NOT NULL, 
	filial_de Varchar(40)
) CHARACTER SET utf8mb4;

ALTER TABLE companyia 
add constraint pk_companyia PRIMARY KEY (nom);

alter TABLE companyia
add constraint fk_companyia FOREIGN KEY (filial_de) REFERENCES companyia (nom) 
ON DELETE RESTRICT
ON UPDATE CASCADE;

-- ------------------------------------------------------
--  Creació de la taula  personal
-- ------------------------------------------------------

CREATE TABLE personal (
    num_empleat INT,
    nom VARCHAR(25) NOT NULL,
    cognom VARCHAR(35) NOT NULL,
    passaport CHAR(20) NOT NULL,
    sou FLOAT NOT NULL
)  CHARACTER SET utf8mb4;

alter table personal
add CONSTRAINT pk_personal primary key (num_empleat);

alter TABLE personal
add constraint uq_personal_passaport UNIQUE (passaport);

alter table personal
add CONSTRAINT ch_sou check (sou >= 20000);

-- ------------------------------------------------------
--  Creació de la taula  pilot
-- ------------------------------------------------------

CREATE TABLE pilot (
	num_empleat int, 
	hores_Vol smallint
)CHARACTER SET utf8mb4;

ALTER TABLE pilot
add CONSTRAINT pk_pilot PRIMARY KEY (num_empleat);

ALTER TABLE pilot
add constraint ch_hores_Vol CHECK (hores_Vol >= 400);

ALTER table pilot
add CONSTRAINT fk_pilot_num_empleat FOREIGN KEY (num_empleat) references personal (num_empleat)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- ------------------------------------------------------
--  Creació de la taula  hostessa
-- ------------------------------------------------------

CREATE TABLE hostessa ( 
	num_empleat int
) CHARACTER SET utf8mb4;

ALTER TABLE hostessa
add constraint pk_hostessa PRIMARY key (num_empleat);

ALTER TABLE hostessa
add constraint fk_hostessa_num_empleat FOREIGN key (num_empleat) references personal (num_empleat)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- ------------------------------------------------------
--  Creació de la taula  avio
-- ------------------------------------------------------

CREATE TABLE avio (	
	num_serie CHAR(30), 
	tipus Varchar(10) not null, 
	fabricant Varchar(20) not null, 
	any_fabricacio year, 
	companyia Varchar(40) not null
)  CHARACTER SET utf8mb4;

ALTER table avio 
add CONSTRAINT pk_avio PRIMARY KEY (num_serie);

alter table avio
add constraint ch_tipus CHECK (tipus ='COM-PAS' OR tipus = 'JET' OR tipus = 'CARGO');

alter table avio 
add constraint fk_avio_companyia foreign key (companyia) REFERENCES companyia (nom)
on delete restrict 
on update cascade;

-- ------------------------------------------------------
--  Creació de la taula  aeroport
-- ------------------------------------------------------

CREATE TABLE aeroport (
	codi CHAR(4), 
	pais Varchar(40) not null, 
	ciutat Varchar(40) not null, 
	IATA CHAR(4), 
	nom Varchar(55) not null, 
	any_construccio Year
) CHARACTER SET utf8mb4;

ALTER TABLE aeroport 
add constraint pk_aeroport PRIMARY key (codi);

alter TABLE aeroport 
add CONSTRAINT uq_aeroport_IATA UNIQUE (IATA);

-- ------------------------------------------------------
--  Creació de la taula  Mostrador
-- ------------------------------------------------------

CREATE TABLE Mostrador (
	numero smallint, 
	codi_aeroport CHAR(4)
) CHARACTER SET utf8mb4;

alter TABLE Mostrador
add CONSTRAINT pk_mostrador primary key (numero, codi_aeroport);

ALTER TABLE Mostrador
add constraint fk_mostrador foreign key (codi_aeroport) references aeroport (codi)
on delete CASCADE
on update cascade;

-- ------------------------------------------------------
--  Creació de la taula  vol
-- ------------------------------------------------------

CREATE TABLE vol (
	codi CHAR(9), 
	aeroport_desti CHAR(4) not null, 
	data DATE not null, 
	durada smallint not null, 
	aeroport_origen CHAR(4) not null, 
	avio CHAR(30) not null, 
	hostessa int not null, 
    pilot int not null, 
	descripcio Varchar(30) not null
) CHARACTER SET utf8mb4;

alter TABLE vol
ADD CONSTRAINT pk_codi primary KEY (codi);

alter table vol
add constraint ch_descripcio CHECK (descripcio ='ON-TIME' OR descripcio = 'DELAYED' OR descripcio = 'UNKNOWN');

alter table vol 
add constraint ch_durada_vol check (durada >=10 and durada <= 1200);

ALTER table vol
add constraint fk_vol_aeroport_origen FOREIGN key (aeroport_origen) REFERENCES aeroport (codi)
on delete RESTRICT
on UPDATE cascade;

ALTER table vol
add constraint fk_vol_aeroport_desti FOREIGN key (aeroport_desti) REFERENCES aeroport (codi)
on delete RESTRICT
on UPDATE cascade;

ALTER table vol
add constraint fk_vol_avio FOREIGN key (avio) REFERENCES avio (num_serie)
on delete RESTRICT
on UPDATE cascade;

ALTER table vol
add constraint fk_vol_hostessa FOREIGN key (hostessa) REFERENCES hostessa (num_empleat)
on delete RESTRICT
on UPDATE cascade;

ALTER table vol
add constraint fk_vol_pilot FOREIGN key (pilot) REFERENCES pilot (num_empleat)
on delete RESTRICT
on UPDATE cascade;

-- ------------------------------------------------------
--  Creació de la taula  passatger
-- ------------------------------------------------------

CREATE TABLE passatger (
	passaport CHAR(20), 
	nom Varchar(30) not null, 
	cognom Varchar(50), 
	adreca Varchar(70), 
	telefon Varchar(9), 
	email Varchar(40), 
	data_naix DATE, 
	genere CHAR(1)
)  CHARACTER SET utf8mb4;

ALTER table passatger
ADD CONSTRAINT pk_passatger primary KEY (passaport);

alter table passatger
add constraint uq_passatger_passaport unique (passaport);

-- ------------------------------------------------------
--  Creació de la taula  volar
-- ------------------------------------------------------ 

CREATE TABLE volar(
	passatger char(20),
	vol char(9),
	seient tinyint
)CHARACTER SET utf8mb4;

ALTER TABLE volar
ADD CONSTRAINT pk_passatger_vol PRIMARY KEY (passatger, vol);

ALTER TABLE volar
add constraint ch_seient_vol CHECK (seient >=1 and seient <= 200);

alter table volar
add constraint uq_seient_vol UNIQUE (seient);

ALTER table volar 
add constraint fk_volar_passtager FOREIGN key (passatger) REFERENCES passatger (passaport)
on DELETE RESTRICT
on update cascade;

ALTER table volar 
add constraint fk_volar_vol FOREIGN key (vol) REFERENCES vol (codi)
on DELETE RESTRICT
on update cascade;
