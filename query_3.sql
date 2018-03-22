CREATE DATABASE Personal2

--usar base de datos--

USE Personal2  --<--

-- crear tabla--

CREATE TABLE Usuario (
	nombre varchar(30),
	clave varchar(10),
	direccion varchar(50),
	telefono int,
	sexo char (1)
	)

--modificar, eliminar y agregar columnas--

ALTER TABLE Usuario DROP COLUMN nombre   --<--DDL6--

ALTER TABLE Usuario ADD nombre varchar (30)  --<--DDL7

