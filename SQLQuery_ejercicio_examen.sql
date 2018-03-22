--Creando base de datos--
CREATE DATABASE Encuesta
USE Encuesta

--Mpdificando nombre de base de datos--
ALTER DATABASE Encuesta MODIFY NAME = Encuesta2
USE Encuesta2

--creando tablas y algunas PK--
CREATE TABLE Encuestador(
	id_encuestador INT NOT NULL PRIMARY KEY,
	dni INT,
	nombre VARCHAR(20),
	apellido VARCHAR(30),
	supervisor VARCHAR(20)
)

CREATE TABLE Ficha(
	id_ficha INT NOT NULL PRIMARY KEY,
	fecha_hora DATETIME,
	lugar VARCHAR(50),
	id_encuestador INT,
	encuestas INT
)

--Tabla puente--
CREATE TABLE Ficha_Encuesta(
	id_ficha INT,
	id_encuesta INT,
	id_distrito INT,
	id_estado INT,
)

CREATE TABLE Encuesta(
	id_encuesta INT NOT NULL PRIMARY KEY,
	descripcion VARCHAR(50),
	poblacion INT,
	muestra INT,
	desde DATETIME,
	hasta DATETIME
)

CREATE TABLE Estado(
	id_estado INT NOT NULL PRIMARY KEY,
	descripcion VARCHAR(50)
)

CREATE TABLE Provincia(
	id_prov INT NOT NULL PRIMARY KEY,
	nombre_prov VARCHAR(20),
	id_dpto INT
)

CREATE TABLE Distrito(
	id_distrito INT NOT NULL PRIMARY KEY,
	nombre_distrito VARCHAR(30),
	id_prov INT
)

CREATE TABLE Departamento(
	id_dpto INT NOT NULL PRIMARY KEY,
	nombre_dpto VARCHAR(20)
)

--asignando PK a tabla puente--
ALTER TABLE Ficha_Encuesta
	ALTER COLUMN id_ficha INT NOT NULL
ALTER TABLE Ficha_Encuesta
	ALTER COLUMN id_encuesta INT NOT NULL
ALTER TABLE Ficha_Encuesta
	ALTER COLUMN id_distrito INT NOT NULL

ALTER TABLE Ficha_Encuesta
	ADD CONSTRAINT PK_FichaEncuesta_1001
	PRIMARY KEY (id_ficha,id_encuesta,id_distrito)

--asignando FK--
ALTER TABLE Ficha
	ADD CONSTRAINT FK_Ficha_Encuestador
	FOREIGN KEY (id_encuestador)
	REFERENCES Encuestador (id_encuestador)

ALTER TABLE Ficha_Encuesta
	ADD CONSTRAINT FK_FichaEncuesta_Ficha
	FOREIGN KEY (id_ficha)
	REFERENCES Ficha (id_ficha)

ALTER TABLE Ficha_Encuesta
	ADD CONSTRAINT FK_FichaEncuesta_Encuesta
	FOREIGN KEY (id_encuesta)
	REFERENCES Encuesta (id_encuesta)

ALTER TABLE Ficha_Encuesta
	ADD CONSTRAINT FK_FichaEncuesta_Distrito
	FOREIGN KEY (id_distrito)
	REFERENCES Distrito (id_distrito)

ALTER TABLE Ficha_Encuesta
	ADD CONSTRAINT FK_FichaEncuesta_Estado
	FOREIGN KEY (id_estado)
	REFERENCES Estado (id_estado)

ALTER TABLE Distrito
	ADD CONSTRAINT FK_Distrito_Provincia
	FOREIGN KEY (id_prov)
	REFERENCES Provincia (id_prov)

ALTER TABLE Provincia
	ADD CONSTRAINT FK_Provincia_Departamento
	FOREIGN KEY (id_dpto)
	REFERENCES Departamento (id_dpto)

--Añadiendo restricciones--
ALTER TABLE Encuestador
	ADD CONSTRAINT CHK_dni
	CHECK (dni LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

ALTER TABLE Encuestador
	ADD CONSTRAINT UNQ_dni
	UNIQUE (dni)

ALTER TABLE Ficha
	ADD CONSTRAINT DEF_fechahora
	DEFAULT GETDATE() FOR fecha_hora

ALTER TABLE Encuestador
	ADD CONSTRAINT UNQ_supervisor
	UNIQUE (supervisor)

ALTER TABLE Encuestador
	DROP CONSTRAINT UNQ_supervisor

--insertando datos--
INSERT INTO Departamento (id_dpto,nombre_dpto)		
	VALUES (1,'Amazonas'),								
	 (2,'Ancash'),
	 (3,'Apurimac'),
	 (4,'Arequipa'),
	 (5,'Ayacucho'),
	 (6,'Cajamarca'),
	 (7,'Callao'),
	 (8,'Cusco'),
	 (9,'Huancaveliva'),
	 (10,'Huánuco'),
	 (11,'Ica'),
	 (12,'Junín'),
	 (13,'La Libertad'),
	 (14,'Lambayeque'),
	 (15,'Lima'),
	 (16,'Loreto'),
	 (17,'Madre de Dios'),
	 (18,'Moquegua'),
	 (19,'Pasco'),
	 (20,'Piura'),
	 (21,'Puno'),
	 (22,'San Martín'),
	 (23,'Tacna'),
	 (24,'Tumbes'),
	 (25,'Ucayali')

INSERT INTO Ficha (id_ficha,lugar,encuestas)
	VALUES (1,'San Juan de Lurigancho',100),
			(2,'Miraflores',8),
			(3,'Surco',76),
			(4,'Callao',56),
			(5,'Los Olivos',56),
			(6,'San Juan de Miraflores',23)

--actualizando datos--
UPDATE Ficha SET lugar = 'Chorrillos' WHERE id_ficha =4
UPDATE Ficha SET lugar = 'La Molina' WHERE id_ficha =2
UPDATE Ficha SET lugar = 'Villa María' WHERE id_ficha =3
UPDATE Ficha SET lugar = 'Surquillo' WHERE id_ficha =6

SELECT TOP 50 PERCENT * FROM Departamento

SELECT TOP 50 PERCENT * FROM Departamento ORDER BY id_dpto DESC

DELETE FROM Ficha WHERE id_ficha = 3

SELECT * FROM Departamento
SELECT id_dpto,nombre_dpto FROM Departamento WHERE id_dpto >= 20
SELECT * FROM Departamento WHERE id_dpto BETWEEN 10 AND 20
SELECT * FROM Departamento WHERE id_dpto IN(1,3,6,8,9,24)
SELECT * FROM Ficha

SELECT SUBSTRING ('San Juan de Lurigancho',5,4)

SELECT STR(23)

SELECT * FROM Departamento
SELECT COUNT(nombre_dpto) FROM Departamento WHERE 4 < id_dpto 
SELECT * FROM Ficha
SELECT encuestas - id_ficha*2 AS Nuevo_codigo FROM Ficha WHERE id_ficha < 6 ORDER BY id_ficha DESC
SELECT * FROM Departamento WHERE nombre_dpto LIKE '%ar%'
SELECT * FROM Departamento WHERE nombre_dpto NOT LIKE '%[aeiou]'
SELECT * FROM Departamento WHERE nombre_dpto LIKE '_[aeiou]%[^aeiou]'
SELECT * FROM Ficha WHERE id_encuestador IS NULL AND id_ficha >2




