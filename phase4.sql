/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS Desenvolupador d'aplicions multiplataforma
    Mòdul: 0484 Bases de dades. 
    AUTORS:Omar Mehenni i Juan carlos Sánchez
    DATA: 16/03/2025
****************************************************** */

-- Pregunta 1
select aeroport.ciutat, aeroport.nom as aeroport , vol.data , vol.codi from 
aeroport join vol on (vol.aeroport_origen = aeroport.codi)
where durada < 40 and month (data) = 02  and year (data) = 2024 and descripcio like "%delayed"
order by ciutat, data;
-- Pregunta 2
select avio.any_fabricacio as any ,companyia.nom as companyia , avio.num_serie, avio.tipus 
from companyia join avio on (avio.companyia = companyia.nom)
where companyia.pais like "%Spain" and avio.any_fabricacio < 2000 
order by any desc,companyia,num_serie; 

-- Pregunta 3
select vol.codi,vol.data, concat(personal.cognom,", ",personal.nom ," (",pilot.hores_Vol,")") as pilot, avio.companyia 
FROM vol
JOIN pilot ON vol.pilot = pilot.num_empleat
JOIN avio ON vol.avio = avio.num_serie
JOIN personal ON personal.num_empleat = pilot.num_empleat
where month (vol.data) = 02 and year(vol.data) = 2024 and pilot.hores_Vol >7000 and
 personal.sou >53000 and vol.descripcio like "%delayed%"
order by avio.companyia,vol.data,vol.codi;

-- Pregunta 4
select concat(passatger.cognom,", ",passatger.nom) as passatger,
concat(personal.cognom,", ",personal.nom) as hostessa,ao.codi as aeroport_origen,
ad.codi as aeroport_desti, vol.durada
from vol
join aeroport as ao on (ao.codi = vol.aeroport_origen)
join aeroport as ad  on  (ad.codi = vol.aeroport_desti)
join hostessa on (vol.hostessa = hostessa.num_empleat)
join personal on personal.num_empleat = hostessa.num_empleat
join volar on (volar.vol = vol.codi)
join passatger on ( passatger.passaport = volar.passatger)
where passatger.adreca like"%Madrid%" and date(vol.data)= '2023-12-25'
order by passatger.cognom;

-- Pregunta 5
select vol.codi, concat(ao.nom," (",ao.ciutat,")") as origen, 
concat(ad.nom," (",ad.ciutat,")") as desti  
from vol 
join aeroport as ad on (ad.codi = aeroport_desti)
join aeroport as ao on (ao.codi = aeroport_origen)
where year(vol.data) = 2024 and vol.durada > 160 and ao.ciutat like"__o%" and ad.ciutat like "__o%"
order by vol.codi;

-- Pregunta 6 
select c1.nom,c2.nom ,concat(persoPil.cognom,",",persoPil.nom)as pilot , concat(persoHos.cognom,", ",persoHos.nom) as hostessa
from companyia
join companyia as c1 on c1.nom = companyia.nom
join companyia as c2 on c2.nom = companyia.filial_de 
join avio on avio.companyia = companyia.nom
join vol on vol.avio = avio.num_serie
join hostessa on vol.hostessa = hostessa.num_empleat
join pilot on vol.pilot = pilot.num_empleat
join personal as persoHos on hostessa.num_empleat = persoHos.num_empleat
join personal as persoPil on pilot.num_empleat = persoPil.num_empleat
where avio.any_fabricacio = 2008 and companyia.filial_de is not null
order by persoPil.cognom,persoHos.cognom;


-- Pregunta 7
select c1.nom as companyia, coalesce(c2.nom, '-') as mare
from companyia  
left outer join companyia as c1 on companyia.nom = c1.nom
left outer join companyia as c2 on companyia.filial_de = c2.nom
order by c1.nom;

-- Pregunta 8
select 'No ho sé';