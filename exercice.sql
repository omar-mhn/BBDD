-- 1
create table pelicula(
    id char (6),
    titulo varchar(70),
    anyo tinyint,
    genero varchar (15)

);
--2
create table if actor (
    id tinyint,
    nombre varchar (25)
);
--3-
create table participar(
    pelicula_id tinyint,
    actor_id tinyint,
    orden smallint

);
--4
alter table pelicula
add constraint pk_pelicula primary key (id);

-- 5 
alter table actor 
add constraint pk_actor primary key (id);

--6 
alter table participar 
add constraint pk_rep_pelicula foreign key (pelicula_id) references pelicula (id);
alter table participar 
-- ?????? 
 --7 
 alter table pelicula 
 modify id char (7);
--8 
alter table participar
modify pelicula_id char(6);
alter table participar 
add constraint pk_rep_pelicula foreign key (pelicula_id) references pelicula (id);
alter table participar 
--9 
alter table participar 
add constraint pk_reparto primary key (pelicula_id, actor_id);

--10 
alter table participar 
add constraint fk_rep_actor foreign key (actor_id) references actor (id);

--11 
alter table pelicula 
modify titulo varchar(70) not null;
--12 
alter table actor 
modify nombre varchar (25) not null ;

--13 
alter table pelicula 
add column puntuacion decimal(3,1);

--14 
alter table pelicula 
add column votos tinyint ;

--15 
alter table pelicula
drop column genero ;

--16 
rename table participar to reparto;