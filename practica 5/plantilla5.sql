/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS Desenvolupador d'aplicions multiplataforma
    Mòdul: 0484 Bases de dades. 
    AUTORS: Juan Carlos Sánchez i Omar Mehenni
    DATA: 18/03/2025
****************************************************** */

-- Pregunta 1
select aeroport.ciutat, count(ciutat) as total_vols
from vol join aeroport 
on (vol.aeroport_desti = aeroport.codi)  
where year (data)= 2023 
group by ciutat
having count(ciutat) >= 800
order by total_vols desc;


-- preguntar a jordi se debe visualizar la primer columna como company o como nombre.

-- Pregunta 2
select companyia.nom as companyia,
count(vol.codi) as total_vols,
avg(vol.durada) as vol_promig,
max(data) as last_vol 
from companyia left join avio 
on avio.companyia = companyia.nom
left join vol 
on vol.avio = avio.num_serie
where companyia.pais = 'Spain'
group by companyia.nom
order by companyia.nom;  

-- Pregunta 3
select year(vol.data) as any,
month(vol.data) as mes, 
companyia.nom as nom,
count(vol.codi) as total_vols
from companyia join avio 
on (avio.companyia = companyia.nom)
join vol on (vol.avio = avio.num_serie)
where companyia.pais = 'Spain' and year(vol.data) = 2023
group by any, mes, companyia.nom
order by any, mes, companyia.nom;

-- Pregunta 4
select aeroportor.codi as codi_origen,
aeroportor.nom as nom_origen,
aeroportor.pais as pais_origen,
aeroportdes.nom as nom_desti,
aeroportdes.pais as pais_desti
from aeroport as aeroportor join vol
on aeroportor.codi = vol.aeroport_origen
join aeroport as aeroportdes on
aeroportdes.codi = vol.aeroport_desti
where vol.data = all (
select vol.data from vol 
where vol.codi = '482739') and
vol.aeroport_origen = all (
select vol.aeroport_origen from vol
where vol.codi = '482739') and
vol.aeroport_desti = all ( 
select vol.aeroport_desti from vol
where vol.codi = '482739')
and vol.codi <> '482739';

-- Pregunta 5
select avio.companyia as nom,
count(vol.codi) as total_vols 
from vol join avio on
avio.num_serie = vol.avio
group by avio.companyia
having count(vol.codi) > (
select count(vol.codi)
from vol join avio on
vol.avio = avio.num_serie
where avio.companyia = 'British Airways') 
order by total_vols;
