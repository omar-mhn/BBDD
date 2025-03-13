/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS Desenvolupador d'aplicions multiplataforma
    Mòdul: 0484 Bases de dades. 
    AUTORS: Juan Carlos Sánchez i Omar Mehenni
    DATA: 25/02/2025
****************************************************** */

-- Pregunta 1
select ciutat, aeroport_origen as aeroport, data, vol.codi from aeroport join vol 
on aeroport.codi = vol.aeroport_origen where durada < 40 and month (data) = 02 and year (data) = 2024 and descripcio like '%delayed%' 
order by ciutat, data;

-- Pregunta 2
select any_fabricacio as any, nom as companyia, num_serie, tipus from avio join 
companyia on companyia.nom = avio.companyia where pais like '%Spain%' 
and any_fabricacio < 2000 order by any_fabricacio desc, companyia, num_serie;

-- Pregunta 3
select codi, data, concat(personal.cognom, ', ', personal.nom, ' (',pilot.hores_Vol,')') as pilot, companyia
from vol join avio on vol.avio = avio.num_serie join pilot on vol.pilot = pilot.num_empleat 
join personal on pilot.num_empleat = personal.num_empleat where data like '%2024-02%'
and pilot.hores_Vol > 7000 and sou > 53000 and descripcio like '%delayed%' order by data, codi; 

-- Pregunta 4
select concat(passatger.cognom, ', ',passatger.nom) as passatger,
concat(personal.cognom, ', ',personal.nom) as hostessa,
aeroport_origen, aeroport_desti, durada from passatger
join volar on passatger.passaport = volar.passatger
join vol on volar.vol = vol.codi 
join hostessa on vol.hostessa = hostessa.num_empleat
join personal on hostessa.num_empleat = personal.num_empleat
where adreca like '%Madrid%' and data like '2023-12-25' order by passatger.cognom;

-- Pregunta 5  
SELECT vol.codi, 
CONCAT(aeroport_origen.nom, ' (', aeroport_origen.ciutat, ')') AS origen, 
CONCAT(aeroport_desti.nom, ' (', aeroport_desti.ciutat, ')') AS desti 
FROM vol JOIN aeroport aeroport_origen ON vol.aeroport_origen = aeroport_origen.codi
JOIN aeroport aeroport_desti ON vol.aeroport_desti = aeroport_desti.codi
WHERE aeroport_origen.ciutat like '__o%' and aeroport_desti.ciutat like '__o%'
and year(vol.data) = 2024 AND vol.durada > 160;

-- Pregunta 6
select c.nom, c.filial_de,
concat(pil.cognom, ', ' ,pil.nom) pilot, 
concat(hos.cognom, ', ' ,hos.nom) hostessa
from pilot
join personal as pil on pilot.num_empleat = pil.num_empleat
join vol on pil.num_empleat = vol.pilot
join hostessa on vol.hostessa = hostessa.num_empleat
join personal as hos on hostessa.num_empleat =  hos.num_empleat
join avio on vol.avio = avio.num_serie
join companyia as c on avio.companyia = c.nom 
where any_fabricacio = 2008 and filial_de is not null;

-- Pregunta 7
SELECT nom, coalesce(filial_de, '-') as mare
FROM companyia order by nom;

-- Pregunta 8
select 'No ho sé'; 