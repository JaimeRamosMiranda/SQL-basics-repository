CREATE DATABASE Universidad
USE Universidad

CREATE TABLE Alumno(
	id_alumno int,
	nombre varchar(20),
	apellido varchar(20),
	edad int,
	genero char(1),
	telefono int,
	direccion varchar(50)
	)

CREATE TABLE Carrera(
	id_carrera int,
	nombre varchar(30),
	duracion int
	)

ALTER TABLE Alumno ADD id_carrera int

--la llave foránea y la llave primaria deben ser del mismo tipo de dato		<-----

ALTER TABLE Alumno ALTER COLUMN id_alumno int NOT NULL

ALTER TABLE Alumno
	ADD CONSTRAINT PK_Alumno_1002
	PRIMARY KEY (id_alumno)

ALTER TABLE Carrera ALTER COLUMN id_carrera int NOT NULL

ALTER TABLE Carrera
	ADD CONSTRAINT PK_Carrera_1003
	PRIMARY KEY (id_carrera)

--añadir llave foránea a tabla--
ALTER TABLE Alumno						--<---DDL11|--
	ADD CONSTRAINT FK_Alumno_Carrera
	FOREIGN KEY (id_carrera)
	REFERENCES carrera (id_carrera)

--propiedades--
sp_help

