-- para empezar mysql -u root -p --
--clase companiya--
create table Companya(
    nom varchar (40) NOT NULL,
    IATA varchar(6) NOT NULL,
    CODE3 varchar(6) NOT NULL,
    ICAO varchar(6) NOT NULL,
    pais varchar (40)NOT NULL,
    filial_de varchar(40) not null  -- de la relacion --
);
create table Avió (
    num_serie varchar(30) NOT NULL ,
    tipus varchar(10) NOT NULL,
    fabricant varchar (20) NOT NULL,
    any_fabricacio Year,
    Companyia varchar(40) NOT NULL -- de companyia --
);
create table Aeroport (
    codi varchar (4) NOT NULL PRIMARY KEY,
    pais varchar(40) NOT NULL,
    ciutat varchar (40) NOT null,
    IATA varchar (4),
    nom varchar (55) NOT NULL,
    any_construccio Year
);
create table Monstrador (
    numero tinyint unsigned,
    codi_aeroport varchar(4)    -- falta la de primary key --
);
create table Personal (
    num_empleat tinyint unsigned,
    nom varchar(25) NOT NULL,
    cognom varchar(35) NOT NULL,
    passaport varchar(20) NOT NULL,
    sou float NOT NULL
);
create table Hostessa(
    num_empleat tinyint unsigned
);
create table Pilot (
    hores_vol tinyint unsigned,
    num_empleat tinyint unsigned
);
create table Passatger (
   passaport varchar(20) NOT NULL,
   nom varchar(30) NOT NULL,
   adreca varchar(30),
   telefon varchar(9),
   cognom varchar(50),
   email varchar (40),
   data_naixement date,
   genere char(1)
);
create table Vol(
    codi varchar (9) NOT NULL,
    data DATE NOT NULL,
    durada int NOT NULL,                      ----probleme de date ---
    descripcio varchar(255) NOT NULL
    aeroport_origen varchar (4) NOT NULL ,
    aeroport_desti varchar (4) NOT NULL ,
    avio varchar(30) NOT NULL ,
    hostessa tinyint unsigned,
    pilot tinyint unsigned

);
create table VOLAR (
    passatger varchar(20) NOT NULL,
    vol varchar (9) NOT NULL,
    seint smallint 
);


--------exercice classe----------------------
create table casa (
    id varchar(9),
    nom varchar(30),
    constraint pk_casa primary key(id)
);

create table estudiante(
    id varchar(9),
    nom varchar(30),
    curs varchar(40),
    id_casa varchar(9),
    constraint pk_estudiante primary key (id),
    constraint fk_estudiente_casa foreign key (casa_id)references casa(id)

);


-----------Harry potter--------------------








_-----------exemple classe---------------
create table t3(
    DNi varchar (8) primary key not null,
    nom varchar(40) not null,
    email varchar(50) not null unique,
    sou smallint not null  check( sou >= 400) 

);


create table t4 (
    num_habitacio smallint not null primary key,
    tipus check(tipus ='doble' or tipus = 'triple' or tipus ='suite' )
);


------exercici 2.2.5 --------------
create table t5(
    codi tinyint primary key auto_increment,
    model varchar(50) not null,
    marca varchar(50) not null,
    matrícula varchar(10) not null unique,
    bastidor varchar(43) not null unique,
    color varchar(10)

);
create table t6(
    nom_hotel varchar (56),
    nom_habitacio varchar(34),
    tipus varchar(34),
    constraint pk_t6 primary key (nom_hotel,nom_habitacio)
);


--------------- exemple cours 
create table profe(
    dni char (10) not null,
    nom varchar(30),
    email varchar(50),
    constraint pk_profe primary key (dni),
    constraint uq_profe_email unique (email)

);
create table asignat(
    codi tinyint not null,
    nom varchar(78) not null,
    hores varchar(32), 
    dni char(10) references profe(dni),
    constraint pk_asg primary key (codi)

)




















create table t1 (
    dni char (9),
    nom_complet varchar(100),
    edat tinyint unsigned,
    sexe enum ('Dona','Hone','Altres'),
    sou float,
    email varchar (100),
    telefon char (12),
    es_estudiante boolean


);

create table t2 (
    num_habitacio smallint unsigned,
    tipus enum('doubel','triple','suite')
);


create table pelicula (
    id varchar (6),
    Titul varchar (70),
    anyo Year ,
    genero varchar (15)
);

create table actor (
    id smallint,
    Nombre varchar (25)
);

create table participar (
    pelicula_id smallint,
    actor_id smallint,
    orden smallint unsigned 
);


-- modificar la taula t2 --
alter table t2 add column metres tinyint;
alter table t2 add column t_nevera boolean after tipus;


