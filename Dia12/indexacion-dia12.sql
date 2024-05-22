-- ################################
-- ######  EJERCICIO DIA 12  ######
-- ################################

-- Optimización de consultas, programación de tareas y triggers

show tables;

-- Atomicidad
-- Consistencia
-- Aislamiento
-- Durabilidad

-- Consultar y usar BBDD
use world;
show tables;

-- Revisar satos
select * from city;
select * from city where CountryCode = "GBR";
select count(*) from city where CountryCode = "GBR";
select * from country;
select count(*) from country;
select * from countrylanguage;
select count(*) from countrylanguage;


-- Creemos un query complejo
select * from city where Name = "Peking";
select * from city where CountryCode = "CHN";
select * from city where CountryCode = "CHN" and Population > 0;

select * from city;

-- Creación de una indexación
create index idx_cityName on city(Name);
create index idx_cityCountry on city(CountryCode);


-- borrar indexacion
drop index idx_cityCountry on city;
drop index idx_cityName on city;

-- Revisar indexaciones creadas
show keys from city; -- Forma 1
show index from city; -- Forma 2

-- Hacer estudio de rendimiento de un index
explain analyze select * from city where Name = "Bogotá";


select distinct Name, idx_cityName
from city;

show extended index from city;


-- ver tamaño en mb de todos los indices
SELECT database_name, table_name, index_name,
ROUND(stat_value * @@innodb_page_size / 1024 / 1024, 2) size_in_mb
FROM mysql.innodb_index_stats
WHERE stat_name = 'size' AND index_name != 'PRIMARY'
ORDER BY size_in_mb DESC;

select table_name, index_name, 
ROUND(stat_value * @@innodb_page_size / 1024 / 1024, 2) size_in_mb
from mysql.innodb_index_stats
where table_name = "city" and stat_name = 'size' AND index_name != 'PRIMARY'
order by size_in_mb;