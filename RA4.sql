insert into t3 (dni,nom,email,sou)
values('11111A','omar','omar@itic.com', 2349.43);

insert into t3 
values('11111b','juan','juan@itic.com', 2900.43);

insert into t3 
values('11111c','pep','pep@itic.com', 2900.43);

insert into t3 
values('11111D','jordi','jordi@itic.com',);

-- suprime tout la table de t5
delete from t5 ;

delete from t5 
where codi = 138 ;
--1 
insert into pelicula
values (1,'Lo que el viento se llevó',1939,8.5,5000);
--2 / 3
insert into pelicula
values (2,'Matrix',1998,7.1,6400),
(3,'Constantine',2005,6.5,2000);

--4 
update pelicula
set anyo = 1998 
where id = 2;

--5 
update pelicula 
set vots = vots + 0.3
where vots >4000;

--6 
update pelicula 
set puntuacio = puntuacio + (puntuacio * 2/100 )
where anyo < 2000;
-- 7 
delete from pelicula
where titol = 'Lo que el viento se llevó';


--exercice jordi RA4 
--1 
select * from pelicula 
wgere vots >10000;
-- 2 
select * from pelicula
where vots >= 5000 and vots <= 6000;
-- between icluye los valores 
select * from pelicula
where vots between 5000 and 6000;

-- 3
select * from pelicula
where puntuacio > 9.4 or vots >= 8000 and vots <= 9000;

-- 4 

select * from pelicula
where anyo between 1990 and 2000 and (puntuacio > 9.4 or vots between 8000 and 9000);
5-- 
select nom  
from actor 
where nom like 'Sean Connery';
-- ici pour le like 
--problema 6
select nom 
from actor
select * from actors  where nom like 'will %';
-- probleme 7
select * 
from actor 
where nom like '%k%w%z%' ; -- ici il dit que le K doit etre avant le w et w avant le z

select * 
from actor 
where nom like '%k%'and nom like '%w%' and nom like '%z%' ; -- ici il dit que n'importe que ordre 
-- problema 8 
select * 
from actor 
where nom like '%w%%w';

-- pour lundi 10 
-- probleme 8 al 12


-- maintenant on a commencer un nouveau truc et les plus importants son
 --FLOOR(num),CEIL(num),ROUND(num[,d]),TRUNCATE(num,d)

 -- exemple pour concat ;
select concat ('Hola! soy ',nom, '.k ase?') as saludo from profe;
-- pour chercher quelque chose dans un text et il te rend la posiition
select instr ('fderfddomardsefd','omar');
-- on BBDD les indexs on commence pas par 0 mais par 1 comme le mormal
-- si il trouve 0 donc il ne la pas rencontrer 
--celui la est in ecemple pour avoir le nom en majuscule
select concat ('Hola! soy ',upper(nom), '.k ase?') as saludo from profe


-- pour lundi du 13 a 16 des supers heros

-- je vais commencer l'exercice de superheros 
--1
select * 
from superpoder order by nom_poder ; 
--2
select * 
from superheroi 
where alcada_cm > 220;
--3
select * 
from superheroi 
where alcada_cm is null and pes_kg is null;
-- dans l'exercice 3 on dit tjr is null car quand on fait = null il nous ne donne pas de valeurs et il dit empty set 

--4 
select nom_superheroi, pes_kg 
from superheroi 
where pes_kg > 120 and alcada_cm < 170; 

--5 
select * 
from superheroi 
where pes_kg between 60 and 65; 

select * 
from superheroi 
where pes_kg >= 60 and pes_kg <=65; 

-- 6
select * 
from superheroi 
where pes_kg > 300 order by desc; 

--7 
select nom_superheroi, pes_kg, pes_kg*2.20462
 from superheroi
where pes_kg > 300;

--8
select nom_poder 
from superpoder
where nom_poder like '%Control%';

--9 
select nom_editorial 
from editorial 
where nom_editorial like 'M%s';
-- faut car ou M ou s donc on fait 
where nom_editorial like 'M' or nom_editorial like '%s';
-- 10 
select *
from race
where raca not like '%a%';

-- 11 
select nom_superheroi,pes_kg,alcada_cm
from superheroi
where (nom_superheroi like 'b%' or alcada_cm > 300) and  pes_kg >= 120;

-- 12 
select color 
from color 
where color like 'B%k' and color not like '%a%'; -- empty ??

--13 
select nom_superheroi, pes_kg, round(pes_kg*2.20462,2) as lliures
 from superheroi
where pes_kg > 300;

-- 14
select raca 
from raca 
where INSTR(raca, 'a')= 0;


-- 15  
select nom_poder
from superpoder
where INSTR (nom_poder,'o')=3;-- faut car par exemple olor pour lui  c faux psk le o est a 1 
where substring (nom_poder,3,1)='o';---  la la plus correcte
--16
select nom_editorial
from editorial
where CHAR_LENGTH(nom_editorial) > 10 ;

-- exemple classe 
-- pour aboir le nom et prenm 
select nom , substring(nom,instr(nom,' ')+1) from profe;
select nom , substring(nom,instr(nom,' ')-1) from profe;

 create table proves (
     id integer ,
     data1 date ,
     data2 datetime
 );

 insert into proves 
 values (1, '2025/02/10', '2025/02/10 12:15');

 -- attention le date 

  insert into proves 
 values (2, '1998/11/16', null);

 -- donne la date et l'heure de maintenant 
  insert into proves 
 values (2, now(),now());

 select date_format(data1,'%W %d %M  %Y')
 from proves;

 set lc_time_names = 'es_ES';




 -- nouvelle theorie 
 -- maintenant onn travail dans 2 tables ou plus au lieu de 1 
 select * from estudiant , casa -- ici il v nous faire la multiplication de tout 
-- domc 
select * from estudiant , casa
where estudiant.casa_id = casa.id ;

select * from profe,classes 
where profe.id = classes.profe_id;
-- version 1 
select nom,materia
 from profe,classes 
where profe.id = classes.profe_id;

-- varsion 2 
-- c'est meilleur de travailler comme sa `pour me pas avoir des probleme de repetion 

select profe.id,profe.nom,classes.materia
 from profe,classes 
where profe.id = classes.profe_id;


--21 
select superheroi.nom_superheroi,genere.genere from superheroi,genere
where superheroi.id_genere = genere.id and pes_kg between 60 and 70;

-- pour la emaine pro 
--22 hasta 25 

-- classe 17/02/25
-- 22
-- si on a pas l'idee de quel est l'autre clave f de l'autre table on met show create table de la principale
select nom_superheroi,nom_editorial
from superheroi, editorial
where superheroi.id_editorial = editorial.id;

-- 23 
select nom_superheroi,color
from superheroi, color
where superheroi.id_color_ulls = color.id 
and color like 'blau';

--24
 select nom_superheroi,nom_atribut
 from superheroi, atribut, atribut_heroi
 where atribut_heroi.heroi_id = superheroi.id and
  atribut_heroi.atribut_id = atribut.id and
nom_atribut like '%intel·ligència';

-- exemple jordi pour comprendre le 3 tables
insert into alumne values ('11111F', 'Jordi',25);
select alumne.nom, asignatura.nom
from alumne, asignatura, fer     
where fer.dni = alumne.dni and fer.codi = asignatura.codi;
insert into fer values ('11111F', 484);

----
