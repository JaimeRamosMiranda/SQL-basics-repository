CREATE DATABASE Universidad2
USE Universidad2

CREATE TABLE Alumno(
	id_alumno int NOT NULL,
	nombre varchar(20),
	apellido varchar(20),
	edad int,
	genero char(1),
	telefono int,
	direccion varchar(50)
	)

CREATE TABLE Carrera(
	id_carrera int NOT NULL,
	nombre varchar(30),
	duracion int
	)
--agregando llave primarias y foraneas--

ALTER TABLE Alumno
	ADD CONSTRAINT PK_Alumno_1002
	PRIMARY KEY (id_alumno)

ALTER TABLE Carrera
	ADD CONSTRAINT PK_Carrera_1003
	PRIMARY KEY (id_carrera)

--tabla puente--
/*En la tabla puente se incluyen los identificadores de las otras tablas,		<--DDL12|--
La combinación de estos dominios serán utilizados en la tabla puente como PK,
Se especificarán cada uno de estos dominios en la tabla puente como FK,
tomando como referencia la tabla de la que provienen, donde son PK.
*/

CREATE TABLE Alumno_Carrera(
	id_alumno int NOT NULL,
	id_carrera int NOT NULL
	)

ALTER TABLE Alumno_Carrera
	ADD CONSTRAINT PK_Alumno_Carrera_1004
	PRIMARY KEY (id_alumno,id_carrera)

--FK de tabla puente--

ALTER TABLE Alumno_Carrera
	ADD CONSTRAINT FK_Alumno_Carrera_Alumno
	FOREIGN KEY (id_alumno)
	REFERENCES Alumno (id_alumno)

ALTER TABLE Alumno_Carrera
	ADD CONSTRAINT FK_Alumno_Carrera_Carrera
	FOREIGN KEY (id_carrera)
	REFERENCES Carrera (id_carrera)