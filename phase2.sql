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

alter table companyia
add constraint pk_companyia primary key(nom); 

alter table companyia
add constraint fk_companyia foreign key (filial_de) references companyia(nom)on update CASCADE;
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
add constraint pk_personal primary key (num_empleat);

alter table personal 
add constraint uq_passaport unique (passaport);

alter table personal
add constraint ck_sou check (sou >= 20000);
-- ------------------------------------------------------
--  Creació de la taula  hostessa
-- ------------------------------------------------------

CREATE TABLE hostessa ( 
	num_empleat int
) CHARACTER SET utf8mb4;

alter table hostessa 
add constraint pk_hostessa primary key(num_empleat);

alter table hostessa
add constraint fk_hostessa foreign key (num_empleat) references personal (num_empleat)
on delete CASCADE on update CASCADE;
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

alter table avio 
add constraint ck_tipus check (tipus='COM-PAS' or tipus='JET' or tipus= 'CARGO');

alter table avio 
add constraint pk_avio primary key (num_serie);

alter table avio 
add constraint fk_avio foreign key (companyia) references companyia(nom) on update CASCADE;
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

alter table aeroport 
add constraint PK_aeroport primary key (codi);

alter table aeroport
add constraint uq_iata unique (IATA);
-- ------------------------------------------------------
--  Creació de la taula  Mostrador
-- ------------------------------------------------------

CREATE TABLE Mostrador (
	numero smallint, 
	codi_aeroport CHAR(4)
) CHARACTER SET utf8mb4;

alter table Mostrador
add constraint pk_mostrador primary key (numero, codi_aeroport);

alter table Mostrador 
add constraint fk_mostrador foreign key(codi_aeroport) references aeroport(codi)
on delete CASCADE on update CASCADE;
-- ------------------------------------------------------
--  Creació de la taula  pilot
-- ------------------------------------------------------

CREATE TABLE pilot (
	num_empleat int, 
	hores_Vol smallint
)CHARACTER SET utf8mb4;

alter table pilot
add constraint check (hores_Vol >= 400);

alter table pilot 
add constraint pk_pilot primary key (num_empleat);

alter table pilot
add constraint fk_pilot foreign key (num_empleat) references personal(num_empleat)
on delete CASCADE on update CASCADE;
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

alter table vol 
add constraint check (descripcio='ON-TIME' or descripcio='DELAYED' or descripcio='UNKNOWN');

alter table vol 
add constraint pk_vol primary key(codi);

alter table vol
add constraint fk_vol_origen foreign key(aeroport_origen) references aeroport(codi)
on update CASCADE;

alter table vol 
add constraint fk_vol_desti foreign key(aeroport_desti) references aeroport(codi)
on update CASCADE;

alter table vol 
add constraint fk_vol_avio foreign key(avio) references avio(num_serie)
on update CASCADE;

alter table vol 
add constraint fk_vol_hostessa foreign key(hostessa) references hostessa(num_empleat)
on update CASCADE;

alter table vol 
add constraint fk_vol_pilot foreign key(pilot) references pilot(num_empleat)
on update CASCADE;

alter table vol 
add constraint ck_durada check (durada>= 10 and durada <= 1200);

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

alter table passatger
add constraint pk_passatger primary key (passaport);

-- ------------------------------------------------------
--  Creació de la taula  volar
-- ------------------------------------------------------  
CREATE TABLE volar(
	passatger char(20),
	vol char(9),
	seient tinyint
)CHARACTER SET utf8mb4;

alter table volar 
add constraint pk_volar primary key (passatger, vol);

alter table volar 
add constraint fk_volar_passatger foreign key (passatger) references passatger(passaport) ON UPDATE CASCADE; 

alter table volar 
add constraint fk_volar_vol foreign key(vol) references vol(codi) ON UPDATE CASCADE;

alter table volar 
add constraint check(seient >=1 and seient <= 200);

alter table volar 
add constraint uk_seient unique (seient);



