--Restricciones--

/*
Agregar una restriccion CHECK, en este caso se especifica que solo contenga cifras del 0 al 9 en el campo dni
*/
ALTER TABLE Encuestador
	ADD CONSTRAINT CHK_Encuestador_dni
	CHECK (dni LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')		--<--DDL13--

/*Añadir la fecha del sistema, debe llenarse pirmaro los valores de las PK y FK
*/
ALTER TABLE Ficha
	ADD CONSTRAINT DFL_Ficha_fecha_hora
	DEFAULT GETDATE() FOR fecha_hora		--<--DDL14--

/*Añadir una restricción para población y muestra
*/
ALTER TABLE Encuesta
	ADD CONSTRAINT CHK_Encuesta_poblacion
	CHECK (poblacion > 1000)			--<--

ALTER TABLE Encuesta
	ADD CONSTRAINT CHK_Encuesta_muestra
	CHECK (muestra > 100)

--Eliminando restriccion--
ALTER TABLE Encuesta
	DROP CONSTRAINT CHK_Encuesta_muestra		--<--DDL15--

--Añadiendo restriccion para fecha de inicio
ALTER TABLE Encuesta
	ADD CONSTRAINT CHK_Encuesta_desde
	CHECK (desde < hasta)

--Añadiendo restriccion UNIQUE--
ALTER TABLE Encuestador
	ADD CONSTRAINT UNQ_Encuestador_dni
	UNIQUE (dni)						--<--DDL16--

ALTER TABLE Distrito
	ADD CONSTRAINT UQ_Distrito_nombre_distrito
	UNIQUE (nombre_distrito)

/*En el caso de la tabla distrito, requiere 2 campos no nulos, pero como id_prov es una FK,
entonces debe introducirse datos en la tabla provincia, donde id_prov es llave primaria
*/
ALTER TABLE Departamento
	ADD CONSTRAINT UQ_Departamento_nombredepartamento
	UNIQUE (nombre_dpto)

--Eliminando restriccion--
ALTER TABLE Encuesta
	DROP CONSTRAINT [CHK_Encuesta_desde]

ALTER TABLE Ficha
	DROP CONSTRAINT DFL_Ficha_fecha_hora