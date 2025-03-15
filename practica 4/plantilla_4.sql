/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS Desenvolupador d'aplicions multiplataforma
    Mòdul: 0484 Bases de dades. 
    AUTORS: Juan Carlos Sánchez i Omar Mehenni
    DATA: 25/02/2025
****************************************************** */

-- Pregunta 1
select aeroport.ciutat, aeroport.nom as aeroport, vol.data, vol.codi 
from aeroport join vol on (aeroport.codi = vol.aeroport_origen)
where durada < 40 and month (data) = 02 and year (data) = 2024 and descripcio like '%delayed%' 
order by ciutat, data;

-- Pregunta 2
select avio.any_fabricacio as any, companyia.nom as companyia, num_serie, tipus
from avio join companyia on (companyia.nom = avio.companyia)
where companyia.pais like '%Spain%' and avio.any_fabricacio < 2000
order by any desc, companyia, num_serie;

-- Pregunta 3
select vol.codi, vol.data, concat(personal.cognom, ', ', personal.nom, ' (',pilot.hores_Vol,')') as pilot, avio.companyia
from vol
join avio on vol.avio = avio.num_serie 
join pilot on vol.pilot = pilot.num_empleat 
join personal on pilot.num_empleat = personal.num_empleat
where month (vol.data) = 02 and year (vol.data) = 2024 and pilot.hores_Vol > 7000 and
personal.sou > 53000 and vol.descripcio like '%delayed%'
order by avio.companyia, vol.data, vol.codi; 

-- Pregunta 4
select concat(passatger.cognom, ', ',passatger.nom) as passatger,
concat(personal.cognom, ', ',personal.nom) as hostessa,
aeroport_origen, aeroport_desti, vol.durada
from passatger
join volar on (passatger.passaport = volar.passatger)
join vol on (volar.vol = vol.codi) 
join hostessa on (vol.hostessa = hostessa.num_empleat)
join personal on (hostessa.num_empleat = personal.num_empleat)
where passatger.adreca like '%Madrid%' and date(vol.data)='2023-12-25'
order by passatger.cognom;

-- Pregunta 5  
SELECT vol.codi, CONCAT(aeroport_origen.nom, ' (', aeroport_origen.ciutat, ')') AS origen, 
CONCAT(aeroport_desti.nom, ' (', aeroport_desti.ciutat, ')') AS desti 
FROM vol
JOIN aeroport aeroport_origen ON (vol.aeroport_origen = aeroport_origen.codi)
JOIN aeroport aeroport_desti ON (vol.aeroport_desti = aeroport_desti.codi)
WHERE aeroport_origen.ciutat like '__o%' and aeroport_desti.ciutat like '__o%'
and year(vol.data) = 2024 AND vol.durada > 160 order by vol.codi;

-- Pregunta 6
select c.nom, c.filial_de, concat(pil.cognom, ', ' ,pil.nom) pilot, concat(hos.cognom, ', ' ,hos.nom) hostessa
from pilot
join personal as pil on pilot.num_empleat = pil.num_empleat
join vol on pil.num_empleat = vol.pilot
join hostessa on vol.hostessa = hostessa.num_empleat
join personal as hos on hostessa.num_empleat =  hos.num_empleat
join avio on vol.avio = avio.num_serie
join companyia as c on avio.companyia = c.nom 
where any_fabricacio = 2008 and filial_de is not null
order by pil.cognom, hos.cognom;

-- Pregunta 7
SELECT c1.nom as companyia, coalesce(c2.nom, '-') as mare
FROM companyia
left join companyia as c1 on companyia.nom = c1.nom
left join companyia as c2 on companyia.filial_de = c2.nom
order by c1.nom;

-- Pregunta 8
select 'No ho sé'; 