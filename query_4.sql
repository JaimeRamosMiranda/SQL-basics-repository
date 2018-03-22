CREATE TABLE productos(
	codigo varchar(15),
	nombre varchar (20),
	descripcion nvarchar(50),
	precio money,
	stock int
	)

--modificar la definicion de una columna--
ALTER TABLE productos ALTER COLUMN codigo INT			--<--DDL8|--

ALTER TABLE productos ALTER COLUMN codigo varchar(15)

--eliminar y agregar columnas--
ALTER TABLE productos DROP COLUMN stock

ALTER TABLE productos ADD stock INT

--ejemplo2 de eliminar y agregar columna--
ALTER TABLE productos DROP COLUMN nombre

ALTER TABLE productos ADD nombre varchar(20)

--eliminar tabla--
DROP TABLE productos
DROP TABLE Usuario

--eliminar base de datos--
DROP DATABASE personal2

USE master		--<--DDL9--

DROP DATABASE Personal2
