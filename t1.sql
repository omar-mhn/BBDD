-- para empezar mysql -u root -p --


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


