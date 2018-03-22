---- USAR BASE DE DATOS MASTER ----
USE master

---- CREAR BASE DE DATOS PRUEBA ---
CREATE DATABASE prueba

---- USAR BASE DE DATOS PRUEBA ----
USE prueba

---- CREAR TABLA DISTRITO ----
CREATE TABLE distrito(
	cod_distrito INT NOT NULL,
	nombre_distrito VARCHAR(25)
)

---- AÑADIR PK A TABLA EXISTENTE ----
ALTER TABLE distrito ADD CONSTRAINT PK_distrito PRIMARY KEY(cod_distrito)

---- CREAR TABLA PROVINCIA ----
CREATE TABLE provincia(
	cod_provincia INT NOT NULL,
	nombre_provincia VARCHAR(25)
)

---- AÑADIR PK A TABLA EXISTENTE ----
ALTER TABLE provincia ADD CONSTRAINT PK_provincia PRIMARY KEY(cod_provincia)

---- CREAR TABLA DEPARTAMENTO CON PK ----
CREATE TABLE departamento(
	cod_dpto INT NOT NULL PRIMARY KEY,
	nombre_dpto VARCHAR(25)
)

---- CREAR TABLA CON PK ----
CREATE TABLE prueba(
	id INT,
	nombre VARCHAR(20),
	edad INT,
	CONSTRAINT PK_prueba PRIMARY KEY (id)
)

---- AÑADIR COLUMNA A TABLA ----
ALTER TABLE distrito ADD cod_provincia INT
ALTER TABLE provincia ADD cod_dpto INT

---- AÑADIR FK A TABLA ----
ALTER TABLE distrito ADD CONSTRAINT FK_distrito_provincia FOREIGN KEY(cod_provincia) REFERENCES provincia(cod_provincia)
ALTER TABLE provincia ADD CONSTRAINT FK_provinvia_departamento FOREIGN KEY(cod_dpto) REFERENCES departamento(cod_dpto)

---- INSERTAR DATOS EN TABLA -----
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(1,'Amazonas')
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(2,'Ancash')
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(3,'Apurimac')
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(4,'Arequipa')
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(5,'Ayacucho')
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(6,'Cajamarca')
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(7,'Callao')
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(8,'Cuzco')
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(9,'Huancavelica')
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(10,'Huanuco')
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(11,'Ica')
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(12,'Junin')
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(13,'La Libertad')
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(14,'Lambayeque')
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(15,'Lima')
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(16,'Loreto')
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(17,'Madre de Dios')
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(18,'Moquegua')
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(19,'Pasco')
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(20,'Piura')
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(21,'Puno')
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(22,'San Martin')
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(23,'Tacna')
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(24,'Tumbes')
INSERT INTO departamento(cod_dpto,nombre_dpto) VALUES(25,'Ucayali')


SELECT * FROM departamento
SELECT cod_dpto FROM departamento WHERE nombre_dpto = 'Lima'

INSERT INTO provincia(cod_provincia,nombre_provincia,cod_dpto) VALUES(100,'Barranca',15)
INSERT INTO provincia(cod_provincia,nombre_provincia,cod_dpto) VALUES(101,'Cajatambo',15)
INSERT INTO provincia(cod_provincia,nombre_provincia,cod_dpto) VALUES(102,'Canta',15)
INSERT INTO provincia(cod_provincia,nombre_provincia,cod_dpto) VALUES(103,'Cañete',15)
INSERT INTO provincia(cod_provincia,nombre_provincia,cod_dpto) VALUES(104,'Huaral',15)
INSERT INTO provincia(cod_provincia,nombre_provincia,cod_dpto) VALUES(105,'Huarochiri',15)
INSERT INTO provincia(cod_provincia,nombre_provincia,cod_dpto) VALUES(106,'Huara',15)
INSERT INTO provincia(cod_provincia,nombre_provincia,cod_dpto) VALUES(107,'Lima',15)
INSERT INTO provincia(cod_provincia,nombre_provincia,cod_dpto) VALUES(108,'Oyon',15)
INSERT INTO provincia(cod_provincia,nombre_provincia,cod_dpto) VALUES(109,'Yauyos',15)

SELECT * FROM provincia

INSERT INTO distrito(cod_distrito,nombre_distrito,cod_provincia) VALUES(200,'Ancón',107)
INSERT INTO distrito(cod_distrito,nombre_distrito,cod_provincia) VALUES(201,'Ate',107)
INSERT INTO distrito(cod_distrito,nombre_distrito,cod_provincia) VALUES(202,'Barranco',107)
INSERT INTO distrito(cod_distrito,nombre_distrito,cod_provincia) VALUES(203,'Chorrillos',107)
INSERT INTO distrito(cod_distrito,nombre_distrito,cod_provincia) VALUES(204,'San Martin de Porres',107)

---- ELIMINAR REGISTRO DE UNA TABLA ----
DELETE FROM distrito WHERE cod_distrito = 202

---- ACTUALIZAR REGISTRO DE UNA TABLA ----
UPDATE provincia SET nombre = 'Oyón' WHERE nombre = 'Oyon'
UPDATE departamento SET nombre_dpto = 'Huánuco' WHERE cod_dpto = 7

SELECT top 5 * FROM departamento

---- RESTRICCIONES (CONSTRAINTS) ----
CREATE TABLE cliente(
	id_cliente INT NOT NULL PRIMARY KEY,
	nombre VARCHAR(25) NOT NULL,
	ciudad VARCHAR(50) NOT NULL,
	telefono DECIMAL(9,0) NOT NULL UNIQUE
)

INSERT INTO cliente(id_cliente,nombre,ciudad,telefono) VALUES (1,'Angel Sánchez','Lima',987654321)
INSERT INTO cliente(id_cliente,nombre,ciudad,telefono) VALUES (2,'Martin Casas','S.M.P.',987654321)
INSERT INTO cliente(id_cliente,nombre,ciudad,telefono) VALUES (3,'Kathy Osco','Comas',987654987)

SELECT * FROM cliente

ALTER TABLE cliente DROP CONSTRAINT UQ__cliente__2A16D945918A0BB6
ALTER TABLE cliente ADD CONSTRAINT UQ__cliente__2A16D945918A0BB6 UNIQUE(telefono)

DELETE FROM cliente WHERE id_cliente = 1