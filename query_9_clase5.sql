--creando base de datos encuesta--
CREATE DATABASE encuesta			--<--EJEMPLO PARA EL EXAMEN-----
USE encuesta

--creado tablas--
CREATE TABLE Encuestador(
	id_encuestador INT NOT NULL,
	dni varchar(8),
	nombre varchar(20),
	apellido varchar(20),
	supervisor varchar(20)
	)

CREATE TABLE Ficha(
	id_ficha INT NOT NULL,
	fecha_hora DATE,
	lugar varchar (50),
	id_encuesta INT NOT NULL,
	encuestas INT
	)
ALTER TABLE FICHA DROP COLUMN id_encuesta
ALTER TABLE Ficha ADD id_encuestador INT NOT NULL

CREATE TABLE Ficha_Encuesta(
	id_ficha INT NOT NULL,
	id_encuesta INT NOT NULL,
	id_distrito INT NOT NULL,
	id_estado INT NOT NULL
	)

CREATE TABLE Encuesta(
	id_encuesta INT NOT NULL,
	descripcion varchar(50),
	poblacion INT,
	muestra INT,
	desde DATE,
	hasta DATE
	)

CREATE TABLE Estado(
	id_estado INT NOT NULL,
	descripcion varchar(20)
	)

CREATE TABLE Provincia(
	id_prov INT NOT NULL,
	nombre_prov varchar(20),
	id_dpto INT NOT NULL,
	)

CREATE TABLE Distrito(
	id_distrito INT NOT NULL,
	nombre_distrito varchar(20),
	id_prov INT NOT NULL
	)

CREATE TABLE Departamento(
	id_dpto INT NOT NULL,
	nombre_dpto varchar(20),
	)

--Añadir PK a tabla creada--
ALTER TABLE Encuestador
	ADD CONSTRAINT PK_Encuestador_1001
	PRIMARY KEY (id_encuestador)

ALTER TABLE Ficha
	ADD CONSTRAINT PK_Ficha_1002
	Primary KEY (id_ficha)

ALTER TABLE Ficha_Encuesta
	ADD CONSTRAINT PK_Ficha_Encuesta__1003
	Primary KEY (id_ficha,id_encuesta,id_distrito)

ALTER TABLE Encuesta
	ADD CONSTRAINT PK_Encuesta_1004
	PRIMARY KEY (id_encuesta)

ALTER TABLE Estado
	ADD CONSTRAINT PK_Estado_1005
	PRIMARY KEY (id_estado)

ALTER TABLE Provincia
	ADD CONSTRAINT PK_Provincia_1006
	PRIMARY KEY (id_prov)

ALTER TABLE Distrito
	ADD CONSTRAINT PK_Distrito_1007
	PRIMARY KEY (id_distrito)

ALTER TABLE Departamento
	ADD CONSTRAINT PK_Departamento_1008
	PRIMARY KEY (id_dpto)

--Añadiendo FK a tablas creadas--
ALTER TABLE Ficha
	ADD CONSTRAINT FK_Ficha_Encuestador
	FOREIGN KEY (id_encuestador)
	REFERENCES Encuestador(id_encuestador)

ALTER TABLE Ficha_Encuesta
	ADD CONSTRAINT FK_Ficha_Encuesta_Estado
	FOREIGN KEY (id_estado)
	REFERENCES Estado (id_estado)

ALTER TABLE Ficha_Encuesta
	ADD CONSTRAINT FK_Ficha_Encuesta_Ficha
	FOREIGN KEY (id_ficha)
	REFERENCES Ficha (id_ficha)

ALTER TABLE Ficha_Encuesta
	ADD CONSTRAINT FK_Ficha_Encuesta_Encuesta
	FOREIGN KEY (id_encuesta)
	REFERENCES Encuesta (id_encuesta)

ALTER TABLE Ficha_Encuesta
	ADD CONSTRAINT FK_Ficha_Encuesta_Distrito
	FOREIGN KEY (id_distrito)
	REFERENCES Distrito (id_distrito)

ALTER TABLE Distrito
	ADD CONSTRAINT FK_Distrito_Provincia
	FOREIGN KEY (id_prov)
	REFERENCES Provincia (id_prov)

ALTER TABLE Provincia
	ADD CONSTRAINT FK_Provincia_Departamento
	FOREIGN KEY (id_dpto)
	REFERENCES Departamento (id_dpto)