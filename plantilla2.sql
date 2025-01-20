/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS Desenvolupament d'Aplicacions Multiplataforma 
    Mòdul: 0484 Bases de dades. 
    AUTORS: Omar Mehenni i Juan Carlos Sánchez
    DATA: 20/01/2025
****************************************************** */

-- ------------------------------------------------------
--  Creació restriccions companyia
-- ------------------------------------------------------

ALTER TABLE companyia 
add constraint pk_companyia PRIMARY KEY (nom);

alter TABLE companyia
add constraint fk_companyia FOREIGN KEY (filial_de) REFERENCES companyia (nom) 
ON UPDATE CASCADE;

-- ------------------------------------------------------
--  Creació restriccions  personal
-- ------------------------------------------------------

alter table personal
add CONSTRAINT pk_personal primary key (num_empleat);

alter TABLE personal
add constraint uq_personal_passaport UNIQUE (passaport);

alter table personal
add CONSTRAINT ch_sou check (sou >= 20000);

-- ------------------------------------------------------
--  Creació restriccions  pilot
-- ------------------------------------------------------

ALTER TABLE pilot
add CONSTRAINT pk_pilot PRIMARY KEY (num_empleat);

ALTER TABLE pilot
add constraint ch_hores_Vol_pilot CHECK (hores_Vol >= 400);

ALTER table pilot
add CONSTRAINT fk_pilot_num_empleat FOREIGN KEY (num_empleat) references personal (num_empleat)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- ------------------------------------------------------
--  Creació restriccions  hostessa
-- ------------------------------------------------------

ALTER TABLE hostessa
add constraint pk_hostessa PRIMARY key (num_empleat);

ALTER TABLE hostessa
add constraint fk_hostessa_num_empleat FOREIGN key (num_empleat) references personal (num_empleat)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- ------------------------------------------------------
--  Creació restriccions  avio
-- ------------------------------------------------------

ALTER table avio 
add CONSTRAINT pk_avio PRIMARY KEY (num_serie);

alter table avio
add constraint ch_tipus CHECK (tipus ='COM-PAS' OR tipus = 'JET' OR tipus = 'CARGO');

alter table avio 
add constraint fk_avio_companyia foreign key (companyia) REFERENCES companyia (nom)
on update cascade;

-- ------------------------------------------------------
--  Creació restriccions  aeroport
-- ------------------------------------------------------

ALTER TABLE aeroport 
add constraint pk_aeroport PRIMARY key (codi);

alter TABLE aeroport 
add CONSTRAINT uq_aeroport_IATA UNIQUE (IATA);

-- ------------------------------------------------------
--  Creació restriccions  Mostrador
-- ------------------------------------------------------

alter TABLE Mostrador
add CONSTRAINT pk_mostrador primary key (numero, codi_aeroport);

ALTER TABLE Mostrador
add constraint fk_mostrador foreign key (codi_aeroport) references aeroport (codi)
on delete CASCADE
on update cascade;

-- ------------------------------------------------------
--  Creació restriccions  vol
-- ------------------------------------------------------

alter TABLE vol
ADD CONSTRAINT pk_codi primary KEY (codi);

alter table vol
add constraint ch_descripcio CHECK (descripcio ='ON-TIME' OR descripcio = 'DELAYED' OR descripcio = 'UNKNOWN');

alter table vol 
add constraint ch_durada_vol check (durada >=10 and durada <= 1200);

ALTER table vol
add constraint fk_vol_aeroport_origen FOREIGN key (aeroport_origen) REFERENCES aeroport (codi)
on UPDATE cascade;

ALTER table vol
add constraint fk_vol_aeroport_desti FOREIGN key (aeroport_desti) REFERENCES aeroport (codi)
on UPDATE cascade;

ALTER table vol
add constraint fk_vol_avio FOREIGN key (avio) REFERENCES avio (num_serie)
on UPDATE cascade;

ALTER table vol
add constraint fk_vol_hostessa FOREIGN key (hostessa) REFERENCES hostessa (num_empleat)
on UPDATE cascade;

ALTER table vol
add constraint fk_vol_pilot FOREIGN key (pilot) REFERENCES pilot (num_empleat)
on UPDATE cascade;

-- ------------------------------------------------------
--  Creació restriccions  passatger
-- ------------------------------------------------------

ALTER table passatger
ADD CONSTRAINT pk_passatger primary KEY (passaport);

alter table passatger
add constraint uq_passatger_passaport unique (passaport);

-- ------------------------------------------------------
--  Creació restriccions  volar
-- ------------------------------------------------------ 

ALTER TABLE volar
ADD CONSTRAINT pk_passatger_vol PRIMARY KEY (passatger, vol);

ALTER TABLE volar
add constraint ch_seient_vol CHECK (seient >=1 and seient <= 200);

alter table volar
add constraint uq_seient_vol UNIQUE (seient);

ALTER table volar 
add constraint fk_volar_passtager FOREIGN key (passatger) REFERENCES passatger (passaport)
on update cascade;

ALTER table volar 
add constraint fk_volar_vol FOREIGN key (vol) REFERENCES vol (codi)
on update cascade;
