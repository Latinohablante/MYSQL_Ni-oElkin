-- ##############################
-- ###### EJERCICIO DIA 6  ######
-- ##############################

-- TITULO : NORMALIZACIÓN DE BASE DE DATOS
-- ¿Qué es Normalizar?: Reducir las posibles redundancias de datos y
-- con ello mejorar la integridad de los datos.

-- Pasos principales para la normalización
-- Primera Forma Normal (1NF) "Reducir"
-- Segunda Forma Normal (2NF) "Redundancia"
-- Tercera Forma Normal (3NF) "Independencia"


-- ############## Primera Forma Normal (1NF) ################
-- En la 1FN se busca eliminar las repeticiones de datos y asegurar con ello que cada columna
-- contenga un solo valor atómico(Dato que no se puede dividir, sea por conveniencia o por
-- especificación del lenguaje)

/*
Ej1: nombreCompleto = PEDRO FELIPE GOMEZ BONILLA --> ¿Es atómico?
-- RTA: No, por que se puede dividir en nombres y apellidos

-- Ej2: nombre = Pedro Felipe, apellido= Gomez Bonilla --> ¿Es atómico?
-- RTA: No, porque el nombre y el apellido aún se pueden dividir
*/

-- EX1 ¿El siguiente query está normalizado de acuerdo al 1NF?
create database dia6;
use dia6;


create table Estudiante(
	ID int,
	Nombre varchar(100),
	Telefono varchar(15)
);

-- RTA: No, porque el usuario está ingresando el nombre completo.
-- Aún así, si el diseñador ve pertinente por los requisitos empresariales, lo puede dejar así.

-- ¿Cómo podemos normalizarla, ya habiendo creado la tabla anteriormente?

alter table Estudiante add Apellido varchar(100);

-- Prueba de agregación de datos
show tables;
select * from Estudiante;

-- Revisar columnas creadas con su tipología de dato
show columns from Estudiante;

-- Manera #2 de mostrar información de la tabla
describe Estudiante;
insert into Estudiante(ID, Nombre, Apellido, Telefono) values(1,"Pedro","Gomez","302225888");

-- Alterar tabla existente
alter table Estudiante add Edad varchar(2) not null; 
drop table Estudiante;



-- EX2
-- Creación de la tabla estudiante

create table curso(
	ID_Curso int primary key,
	Nombre_Curso varchar(20),
	Estudiantes_Inscritos varchar(50)
);

show tables;


insert into curso values(101, "Matematicas", "Ana, Juan, María"),
	(102, "Historia", "Pedro, Luis, Ana, Carmen"),
	(103, "Física", "Juan, Carmen, Beatriz");

insert alter table drop 

select * from curso;

-- elimina los datos de la tabla
truncate curso;


-- Cambio columna de nombre
alter table curso change Estudiantes_inscritos Estudiante varchar(20);

describe curso;

INSERT INTO curso values
    (101,'Matematicas','Ana'),
    (101,'Matematicas','Juan'),
    (101,'Matematicas','Maria'),
    (102,'Historia','Pedro'),
    (102,'Historia','Luis'),
    (102,'Historia','Ana'),
    (102,'Historia','Carmen'),
    (103,'Fisica','Juan'),
    (103,'Fisica','Carmen'),
    (103,'Fisica','Beatriz');

select * from curso;


-- ######## Segunda Forma Normal (2NF) ############



create table Curso2(
	ID_Estudiante varchar(5),
	Nombre_Estudiante varchar(10),
	ID_Curso varchar(5),
	Nombre_Curso varchar(10),
	Nombre_Profesor varchar(20)
);

alter table Curso2 change Nombre_Curso Nombre_Curso varchar(20);

select * from Curso2;

insert into Curso2 values ("E01","Ana","C101","Matemáticas","Sr. García"),
	("E02","Juan","C102","Historia","Sra. López"),
	("E03","María","C101","Matemáticas","Sr. García"),
	("E04","Pedro","C103","Física","Sr. Hernández");

select * from Curso2;

create table estudiante(
	ID varchar(5),
	nombre varchar(10)
);

create table curso(
	id varchar(5),
	nombre varchar(20),
	profesor varchar(20)
);

drop table curso;

create table estudiante_curso(
	id_estudiante varchar(5),
	id_curso varchar(5)
);

insert into estudiante values ("E01","Ana"),
	("E02","Juan"),
	("E03","Maria"),
	("E04","Pedro");

insert into curso values ("C101", "Matemáticas", "Sr. García"),
	("C102", "Historia", "Sr. López"),
	("C103", "Física", "Sr. Hernández");

insert into estudiante_curso values ("E01","C101"),
	("E02","C102"),
	("E03","C101"),
	("E04","C103");