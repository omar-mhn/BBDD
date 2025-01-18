-- para empezar mysql -u root -p --
--clase companiya--
create table Companya(
    nom varchar (40) NOT NULL,
    IATA varchar(6) NOT NULL,
    CODE3 varchar(6) NOT NULL,
    ICAO varchar(6) NOT NULL,
    pais varchar (40)NOT NULL,
    filial_de varchar(40) not null -- de la relacion --
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
    codi_aeroport varchar(4) not null    -- falta la de primary key --
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
-- para brrar una columna --
alter table t2 drop column t_nevera;

-- 13/01/2025 --
-- modify para cambiar structura (tipus de dades) mais le change on peut faire les deux (le nom et le type)--
-- Problemes de la base de dades de pelis
 
-- Problema 1
create table if not exists pelicula (
    id char(6),
    titulo varchar(70),
    anyo smallint unsigned,
    genero varchar(15)
);
 
-- Problema 2
create table if not exists actor (
    id smallint unsigned,
    nom varchar(25)
);
 
-- Problema 3
create table if not exists reparto(
    actor_id smallint unsigned,
    pelicula_id smallint unsigned,
    orden smallint unsigned
);
 
-- exercice --
--11-- 
alter table pelicula  modify column titulo varchar(70)  not null;
--12--
alter table actor modify nom varchar (25) not null;
--13--
 alter table pelicula add column puntuacion float;
 --14
 alter table pelicula add column votos tinyint ;
 --15
 alter table pelicula drop column genero; 
 --16
 rename table participar to reparto;

 -- slución jordi https://pastebin.com/VApvcKNz
  -- pour faire les restrictions 
alter table persona add constraint pk_persona primary key (dni);
alter table coche add constraint pk_coche primary key (maricula);

--clau foranes
alter table coche 
add constraint fk_coche_persona
foreign key (dni_propietari) references persona (dni);



-- ejercicios del 04 a 10 
--4
alter table pelicula 
add constraint pk_pelicula 
primary key (id) ;
--5
alter table actor
add constraint pk_actor 
primary key (id);

--6 
alter table pelicula
add constraint fk_rep_pelicula 
foreign key (pelicula_id) references pelicula(id);


--7 
alter table pelicula
modify id char(7);
-- 8 
ALTER TABLE pelicula ADD COLUMN pelicula_id char(6);
--9


-- martes 14/1 
-- revision de classe pere et fils 
-- code de jordi 
-- borrat de taules
drop table persona;
drop table coche;
 
-- Creació de taules 
create table persona(
    dni char(9),
    nom varchar(30)
);
create table coche(
    matricula char(7),
    marca varchar(30),
    model varchar(30),
    dni_propietari char(9)
);
 
-- Claus primàries
alter table persona add constraint pk_persona primary key(dni);
alter table coche add constraint pk_coche primary key(matricula);
 
 
-- Claus foranes
 
alter table coche 
add constraint fk_coche_propietari foreign key(dni_propietari)
references persona(dni)
on delete set null
on update cascade;
-- en gros quand on suprime le pere il dit dans le fill que NULL --
-- on delete cascada; ici si on veut suprimer, il suprime le pere et le fils. --
-- on delete cascada; elle ne me laisse pas suprimer et elle est par default si on ne-- 
-- met aucun restriction (on delete) c'est cela qui viens par default--
-- Introducció de dades
insert into persona values('11111A', 'Pere');

insert into persona values('22222B', 'Nuria');
 
insert into coche values('B111A', 'Seat', 'Ibiza','11111A');
 
-- borrat de dades
 
delete from persona where dni='11111A';



-- corrections exercices jordi 
-- Problemes de la base de dades de pelis
 
-- Problema 1
create table if not exists pelicula (
    id char(6),
    titulo varchar(70),
    anyo smallint unsigned,
    genero varchar(15)
);
 
-- Problema 2
create table if not exists actor (
    id smallint unsigned,
    nom varchar(25)
);
 
-- Problema 3
create table if not exists reparto(
    actor_id smallint unsigned,
    pelicula_id smallint unsigned,
    orden smallint unsigned
);
 
-- Problema 4
alter table pelicula
add constraint pk_pelicula primary key(id);
 
-- problema 5
alter table actor
add constraint pk_actor primary key(id);
 
--problema 6
 
alter table reparto
add constraint FK_REP_PELICULA 
foreign key(pelicula_id) references pelicula(id);
-- No permet crear la restricció ja que els dos atributs
-- són de tipus de dades diferents (char i integer)
 
-- problema 7
alter table pelicula
modify column id smallint unsigned;
 
-- problema 8
alter table reparto
add constraint FK_REP_PELICULA 
foreign key(pelicula_id) references pelicula(id);
 
-- problema 9
 
-- problema 10
 
9. Crea la clau primària de la taula participar
10. Crea la clau forana de participar cap a actor
 
 
 
-- Problemes 11 al 16
 
-- problema 11
alter table pelicula
modify column titulo varchar(70) not null;
--problema 12
alter table actor
modify column nom varchar(25) not null;
 
-- problema 13
alter table pelicula
add column puntuacion float;
 
-- problema 14
alter table pelicula
add column votos integer;
 
-- problema 15
alter table pelicula
drop column genero;
 
-- problema 16
rename table participar to reparto;
 
 