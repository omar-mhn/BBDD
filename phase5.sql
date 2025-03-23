/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS Desenvolupador d'aplicions multiplataforma
    Mòdul: 0484 Bases de dades. 
    AUTORS:Omar Mehenni i Juan Carlos Sánchez
    DATA: 18/03/2025
****************************************************** */

-- Pregunta 1

select aeroport.ciutat, count(vol.codi) as total_vols
from vol 
join aeroport on vol.aeroport_desti = aeroport.codi
where year(data) = 2023
group by aeroport.ciutat 
having total_vols > 800
order by total_vols desc;

-- Pregunta 2
select companyia.nom as companyia,
       count(vol.codi) as total_vols,
       avg(vol.durada) as vol_promig,
       max(vol.data) as last_vol
from companyia
left outer join avio on companyia.nom = avio.companyia
left outer join vol on vol.avio = avio.num_serie
where  companyia.pais LIKE '%spain' 
group by  companyia.nom
order by companyia.nom;
-- Pregunta 3
select Year (vol.data) as any,
	month(vol.data) as mes,
	companyia.nom as nom,
	count(vol.codi) as total_vols
from companyia
join avio on companyia.nom = avio.companyia
join vol on vol.avio = avio.num_serie
where companyia.pais like '%spain' and Year (data) = 2023
group by Year (vol.data),month(vol.data),companyia.nom
order by any,mes,nom;
-- Pregunta 4
select vol.codi,
	aeroport_or.codi as codi_origen,
	aeroport_or.nom as nom_origen,
    aeroport_or.pais as pais_origen,
    aeroport_de.nom as nom_desti,
    aeroport_de.pais as pais_desti
from vol 
join aeroport as aeroport_or on vol.aeroport_origen = aeroport_or.codi
join aeroport as aeroport_de on vol.aeroport_desti = aeroport_de.codi 
where vol.data = (select data from vol where codi = 482739) 
and vol.aeroport_origen = (select aeroport_origen from vol where codi = 482739)
and vol.aeroport_desti = (select aeroport_desti from vol where codi = 482739)
and vol.codi <> 482739; 
-- Pregunta 5
select companyia.nom as nom,
	count(vol.codi) as total_vols
from companyia 
join avio on avio.companyia = companyia.nom 
join vol on vol.avio = avio.num_serie
group by companyia.nom
having  count(vol.codi) > (select count(vol.codi)
from companyia 
join avio on avio.companyia = companyia.nom 
join vol on vol.avio = avio.num_serie
where companyia.nom like '%British Airways');

