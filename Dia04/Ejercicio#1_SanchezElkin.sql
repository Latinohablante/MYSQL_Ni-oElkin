-- ##################################
-- ######## EJERCICIO DIA 04 ########
-- ##################################

-- Creación y uso de la BBDD "pais"
create database pais;
use pais;


-- Creación de tabla pais
create table pais(
    id int primary key,
    nombre varchar(20),
    continente varchar(50),
    poblacion int
);

-- Creación de tabla idioma
create table idioma(
    id int primary key,
    idioma varchar(50)
);

-- Creación de tabla ciudad
create table ciudad(
    id int primary key,
    nombre varchar(20),
    id_pais int,
    foreign key (id_pais) references pais(id)
);

-- Creación de tabla idioma_pais
create table idioma_pais(
    id_idioma int,
    id_pais int,
    es_oficial tinyint(1),
    primary key (id_idioma, id_pais),
    foreign key (id_idioma) references idioma(id),
    foreign key (id_pais) references pais(id)
);

-- ver tablas creadas en la BD
show tables;


-- insertando datos a la tabla pais
insert into pais values 
(1, "Colombia", "America", 50000000),
(2, "Pais2", "Cont2", 30000000),
(3, "Pais3", "Cont3", 40000000),
(4, "Pais4", "Cont4", 60000000),
(5, "Pais5", "Cont3", 70000000),
(6, "Pais6", "Cont2", 50000000);
insert into pais values 
(7, "Pais7", "America", 50000000),
(8, "Pais8", "Cont1", 30000000),
(9, "Pais9", "Cont1", 40000000),
(10, "Pais10", "Cont2", 60000000);

-- insertando datos a la tabla ciudad
insert into ciudad values 
(1, "ciudad1", 1),
(2, "ciudad2", 1),
(3, "ciudad3", 1),
(4, "ciudad4", 2),
(5, "ciudad5", 2),
(6, "ciudad6", 3);
insert into ciudad values
(7, "ciudad7", 1),
(8, "ciudad8", 2),
(9, "ciudad9", 2),
(10, "ciudad10", 3);

-- insertando datos a la tabla idioma
insert into idioma values 
(1, "idioma1"),
(2, "idioma2"),
(3, "idioma3"),
(4, "idioma4"),
(5, "idioma5"),
(6, "idioma6");
insert into idioma values
(7, "idioma7"),
(8, "idioma8"),
(9, "idioma9"),
(10, "idioma10");

-- insertando datos a la tabla idioma_pais
insert into idioma_pais values
(1,1,1),
(2,2,0),
(1,2,1),
(3,3,0),
(1,5,1),
(1,6,1);
insert into idioma_pais values
(1,7,1),
(2,6,0),
(1,8,1),
(3,9,0);


-- Consulta general a ciudad
select * from ciudad;


-- consulta general a paises
select * from pais;

-- Consulta tipo inner join para obtener las ciudades
-- que están específicamente asignadas a un país

select pais.nombre as NombrePais, ciudad.nombre as NombreCiudad -- 1. Seleccionar tabla1.columna1 as variable1, tabla2.columna2 as variable2
from pais inner join ciudad -- 2. Seleccionar de qué tabla a qué tabla hacer x tipo de de relación
on pais.id = ciudad.id_pais; -- 3. Seleccionar de qué llave primaria o dato principal relacionarse


-- Consulta tipo Left join para obtener todos los países y ciudades
-- donde se incluyen los paises que no tienen ciudad

select pais.nombre as NombrePais, ciudad.nombre as NombreCiudad -- 1. Seleccionar tabla1.columna1 as variable1, tabla2.columna2 as variable2
from pais left join ciudad -- 2. Seleccionar de qué tabla a qué tabla hacer x tipo de de relación
on pais.id = ciudad.id_pais; -- 3. Seleccionar de qué llave primaria o dato principal relacionarse


-- Consulta tipo right join para obtener todas las ciudades y paises
-- donde se incluyen los países que no tienen ciudad

select pais.nombre as NombrePais, ciudad.nombre as NombreCiudad -- 1. Seleccionar tabla1.columna1 as variable1, tabla2.columna2 as variable2
from pais right join ciudad -- 2. Seleccionar de qué tabla a qué tabla hacer x tipo de de relación
on pais.id = ciudad.id_pais; -- 3. Seleccionar de qué llave primaria o dato principal relacionarse


-- Consulta de la unión completa de ambas tablas FULL OUTER JOIN

select pais.nombre as NombrePais, ciudad.nombre as NombreCiudad -- 1. Seleccionar tabla1.columna1 as variable1, tabla2.columna2 as variable2
from pais left join ciudad -- 2. Seleccionar de qué tabla a qué tabla hacer x tipo de de relación
on pais.id = ciudad.id_pais -- 3. Seleccionar de qué llave primaria o dato principal relacionarse
union
select pais.nombre as NombrePais, ciudad.nombre as NombreCiudad -- 1. Seleccionar tabla1.columna1 as variable1, tabla2.columna2 as variable2
from pais right join ciudad -- 2. Seleccionar de qué tabla a qué tabla hacer x tipo de de relación
on pais.id = ciudad.id_pais; -- 3. Seleccionar de qué llave primaria o dato principal relacionarse



select pais.nombre as NombrePais, ciudad.nombre as NombreCiudad -- 1. Seleccionar tabla1.columna1 as variable1, tabla2.columna2 as variable2
from pais right join ciudad -- 2. Seleccionar de qué tabla a qué tabla hacer x tipo de de relación
on pais.id = ciudad.id_pais -- 3. Seleccionar de qué llave primaria o dato principal relacionarse
union
select pais.nombre as NombrePais, ciudad.nombre as NombreCiudad -- 1. Seleccionar tabla1.columna1 as variable1, tabla2.columna2 as variable2
from pais left join ciudad -- 2. Seleccionar de qué tabla a qué tabla hacer x tipo de de relación
on pais.id = ciudad.id_pais; -- 3. Seleccionar de qué llave primaria o dato principal relacionarse
























-- DESARROLLADO POR ELKIN SANCHEZ - C.C: 1.***.***.371
