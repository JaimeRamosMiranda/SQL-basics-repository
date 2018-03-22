---- CREAR UNA BASE DE DATOS ----
CREATE DATABASE encuesta

---- MODIFICAR EL NOMBRE DE UNA BASE DE DATOS ----
ALTER DATABASE encuesta MODIFY NAME = agenda

---- ELIMINAR UNA BASE DE DATOS ----
DROP DATABASE encuesta

---- CREAR UNA TABLA ----
CREATE TABLE usuario(
	id_usuario int,
	nombre varchar(25),
	apellido varchar(25),
	edad int
)

---- MODIFICAR LA DEFINICIÓN DE UNA COLUMNA ----
ALTER TABLE usuario ALTER COLUMN nombre INT

---- ELIMINAR UNA COLUMNA DE UNA TABLA ----
ALTER TABLE usuario DROP COLUMN apellido

---- AÑADIR UNA COLUMNA A UNA TABLA ----
ALTER TABLE usuario ADD apellido VARCHAR(30)

---- ELIMINAR UNA TABLA ----
DROP TABLE usuario



