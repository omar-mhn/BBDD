
/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS Desenvolupador de aplicacions multiplataforma
    Mòdul: 0484 Bases de dades. 
    AUTORS: Juan Carlos Sánchez i Omar Mehenni
    DATA: 07/02/2025
****************************************************** */

-- Pregunta 1
select nom, ICAO
from companyia
where pais like 'Spain' order by ICAO;

-- Pregunta 2
select num_serie, fabricant, any_fabricacio as any, companyia
from avio
where fabricant not like '%Boeing%' and any_fabricacio >= 2020 order by any_fabricacio, fabricant, num_serie;

-- Pregunta 3
select concat ('L''aeroport ',nom, ' està a ', ciutat, ' i va ser construït l''any ', any_construccio) as aeroport
from aeroport
where pais like 'Spain'order by aeroport;

-- Pregunta 4
SELECT nom , pais, char_length(nom) as longitud 
FROM aeroport
WHERE nom LIKE '%e%e%e%' and char_length(nom) between 7 and 9
order by longitud desc, pais; 

-- Pregunta 5
select num_serie 
from avio 
where (companyia like 'Alitalia' or fabricant like 'Concorde') and any_fabricacio = 2008 order by num_serie ;

-- Pregunta 6
SELECT concat(cognom, ', ', nom) as nom_complet
FROM passatger
where (nom like '%k%k%' or cognom like '%k%k%') and adreca like '%barcelona'  order by cognom;

-- Pregunta 7
SELECT distinct fabricant
from avio 
where any_fabricacio = 2000  order by fabricant;

-- Pregunta 8
SELECT cognom, nom, DATE_FORMAT(data_naix, '%d/%m/%Y (%W)') AS naixement
FROM passatger WHERE YEAR(data_naix) = 2003 AND MONTH(data_naix) = 10 AND nom NOT LIKE '%a%'
ORDER BY data_naix desc, cognom;    

-- Pregunta 9
SELECT nom, cognom, telefon, data_naix
FROM passatger
WHERE (timestampdiff (year, data_naix,now())) between 54 and 55 AND telefon % 2 = 1 AND adreca IS NULL
ORDER BY data_naix, nom;
