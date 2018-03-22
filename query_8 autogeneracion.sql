CREATE DATABASE Autogeneracion
USE Autogeneracion

--IDENTITY solo funciona con int--

--cuando se usa identity, empieza en 3 y aumenta de 2 en 2--
CREATE TABLE paciente(
	id_paciente int IDENTITY(3,2),
	nombres varchar(20),
	edad int
	)

--cuando se usa sin indicar parametros, por defecto inicia en 1 y aumenta de uno en uno--
CREATE TABLE paciente(
	id_paciente int IDENTITY,
	nombres varchar(20),
	edad int
	)