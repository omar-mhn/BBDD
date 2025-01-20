/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS _____________________________
    Mòdul: 0484 Bases de dades. 
    AUTORS: Omar Mehenni y Juan Carlos Sanchéz
    DATA: 19/01/2025
****************************************************** */



alter table companyia
add constraint pk_companyia primary key(nom); 

alter table companyia
add constraint fk_companyia foreign key (filial_de) references companyia(nom)on update CASCADE;

alter table personal
add constraint pk_personal primary key (num_empleat);

alter table personal 
add constraint uq_passaport unique (passaport);

alter table personal
add constraint ck_sou check (sou >= 20000);

alter table hostessa 
add constraint pk_hostessa primary key(num_empleat);

alter table hostessa
add constraint fk_hostessa foreign key (num_empleat) references personal (num_empleat)
on delete CASCADE on update CASCADE;

alter table avio 
add constraint ck_tipus check (tipus='COM-PAS' or tipus='JET' or tipus= 'CARGO');

alter table avio 
add constraint pk_avio primary key (num_serie);

alter table avio 
add constraint fk_avio foreign key (companyia) references companyia(nom) on update CASCADE;

alter table aeroport 
add constraint PK_aeroport primary key (codi);

alter table aeroport
add constraint uq_iata unique (IATA);

alter table Mostrador
add constraint pk_mostrador primary key (numero, codi_aeroport);

alter table Mostrador 
add constraint fk_mostrador foreign key(codi_aeroport) references aeroport(codi)
on delete CASCADE on update CASCADE;

alter table pilot
add constraint ck_pilot check (hores_Vol >= 400);

alter table pilot 
add constraint pk_pilot primary key (num_empleat);

alter table pilot
add constraint fk_pilot foreign key (num_empleat) references personal(num_empleat)
on delete CASCADE on update CASCADE;

alter table vol 
add constraint ck_vol check (descripcio='ON-TIME' or descripcio='DELAYED' or descripcio='UNKNOWN');

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

alter table passatger
add constraint pk_passatger primary key (passaport);

alter table passatger
add constraint un_passatger unique (passaport);

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

