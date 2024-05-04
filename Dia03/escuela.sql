create database escuela;

use escuela;

create table departamento(
	id int(10) primary key,
	nombre varchar(50) not null
);

create table profesor(
	id_profesor int(10) primary key,
	id_departamento int(10) not null,
	foreign key (id_departamento) references departamento(id)
);

create table grado(
	id int(10) primary key,
	nombre varchar(100) not null
);

drop table grado;

create table curso_escolar(
	id int(10) primary key,
	anyo_inicio YEAR(4) not null,
	anyo_fin YEAR(4) not null
);

create table persona(
	id int(10) primary key,
	nif varchar(9),
	nombre varchar(25) not null,
	apellido1 varchar(50) not null,
	apellido2 varchar(50),
	ciudad varchar(25) not null,
	direccion varchar(50),
	telefono varchar(9),
	fecha_nacimiento date not null,
	sexo enum('H','M') not null,
	tipo enum('1','2','3') not null
);

create table asignatura(
	id int(10) primary key,
	nombre varchar(100) not null,
	creditos float not null,
	tipo enum('1','2','3') not null,
	curso tinyint(3),
	cuatrimestre tinyint(3),
	id_profesor int(10),
	id_grado int(10) not null,
	foreign key (id_profesor) references profesor(id_profesor),
	foreign key (id_grado) references grado(id)
);

create table alumno_se_matricula_asignatura(
	id_alumno int(10),
	id_asignatura int(10),
	id_curso_escolar int(10),
	primary key (id_alumno, id_asignatura, id_curso_escolar),
	foreign key (id_alumno) references persona(id),
	foreign key (id_asignatura) references asignatura(id),
	foreign key (id_curso_escolar) references curso_escolar(id)
);

show tables;

