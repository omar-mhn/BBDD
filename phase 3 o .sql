
/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS _____________________________
    Mòdul: 0484 Bases de dades. 
    AUTORS:Omar Mehenni
    DATA: ________________
****************************************************** */

-- Pregunta 1
select nom ,ICAO 
from companyia
where pais like 'spain' order by ICAO;

-- Pregunta 2
select num_serie, fabricant,any_fabricacio as any,companyia
from avio
where fabricant not like'%Boeing%' and any_fabricacio >= 2020 ORDER BY any_fabricacio, fabricant, num_serie; 

-- Pregunta 3
select concat ("L'aeroport ",nom," està a ",ciutat," i va ser construït l'any ",any_construccio) AS aeroport
from aeroport
where pais like'spain';

-- Pregunta 4
select nom,pais,CHAR_LENGTH (nom) as longitud 
from aeroport
where (CHAR_LENGTH (nom) between 7 and 9 ) and nom like '%e%e%e%' 
order by CHAR_LENGTH (nom) desc, pais;  

-- Pregunta 5
select num_serie 
from avio 
where (companyia like 'Alitalia' or fabricant like 'Concorde') and any_fabricacio = 2008 order by num_serie ;

-- Pregunta 6
select concat(cognom,", ",nom) as nom_complet
from passatger
where (nom like '%K%k%' or cognom like '%K%k%') and adreca like '%Barcelona' order by cognom ;

-- Pregunta 7
select distinct fabricant 
from avio 
where any_fabricacio = 2000 order by fabricant;

-- Pregunta 8
select nom,cognom,date_format(data_naix,' %d/%m/%Y(%W)') as naixement 
from passatger 
where (year(data_naix) = 2003 and month (data_naix) = 10 and nom not like '%a%') order by data_naix desc, cognom ;

-- Pregunta 9
select nom,cognom,telefon,data_naix
from passatger
where (timestampdiff(year, data_naix,now()) between 54 and 55) and mod(telefon,2)=1 and adreca is null 
order by data_naix, nom ;
plantilla.sql
plantilla.sql s'està mostrant.