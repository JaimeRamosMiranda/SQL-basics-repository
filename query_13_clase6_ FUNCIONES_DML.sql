-- CREAR BD --
CREATE DATABASE prueba100

-- USAR BD --
USE prueba100

-- CREAR TABLA USUARIO --
CREATE TABLE usuario(
	id_usuario INT NOT NULL,
	nombre VARCHAR(20),
	apellido VARCHAR(20),
	dni VARCHAR(8),
	edad INT,
	genero CHAR(1),
	fecha_nac DATE,
	sueldo MONEY
)

INSERT INTO usuario(id_usuario,nombre,apellido,dni,edad,genero,fecha_nac,sueldo)
	VALUES (1,'Pedro','Casas',12345678,23,'M','1994-07-02',1200)
INSERT INTO usuario(id_usuario,nombre,apellido,dni,edad,genero,fecha_nac,sueldo)
	VALUES (2,'Ana','Salazar',12345666,20,'M','1998-07-02',850)
INSERT INTO usuario(id_usuario,nombre,apellido,dni,edad,genero,fecha_nac,sueldo)
	VALUES (3,'Jorge','Sanchez',12311665,25,'M','1992-07-23',1850)

INSERT INTO usuario(id_usuario,nombre,apellido,dni,edad,genero,fecha_nac,sueldo)
	VALUES (4,'Pamela','Osco',12311333,23,'M','1993-10-23',4850),
		   (5,'Jorge','Dextre',12311443,21,'M','1995-12-23',3000)

INSERT INTO usuario VALUES (6,'Oscar','Rodriguez',12311000,23,'M','1994-09-13',10000)

SELECT * FROM usuario

-- ACTUALIZAR --
/* UPDATE (actualizar) Tabla SET (enviar) valor WHERE (donde) se cumple la condición	<----DML4--
*/

UPDATE usuario SET genero = 'F' WHERE id_usuario = 2
UPDATE usuario SET genero = 'F' WHERE id_usuario = 4
UPDATE usuario SET apellido = 'Sánchez' WHERE id_usuario = 3

-- IDENTITY --
/*
Por defecto IDENTITY empieza en 1 y aumenta de 1 en 1
No permite valores nulos, solo se permite una columna con IDENTITY, por tabla		<--DDL20--
*/

CREATE TABLE paciente(
	id_paciente INT IDENTITY,
	nombre_paciente varchar (20),
	edad INT	
)

--insertando datos

INSERT INTO paciente(id_paciente, nombre_paciente, edad)
	VALUES (1,'Jorge',23) -- No permite insertar valores en la columna con IDENTITY--   <-----

INSERT INTO paciente(nombre_paciente, edad)
	VALUES ('Jorge',23)
INSERT INTO paciente(nombre_paciente, edad)
	VALUES ('Angel',23)
INSERT INTO paciente(nombre_paciente, edad)
	VALUES ('Kathy',23)

--se mantiene presionado ALT y se puede seleccionar las columnas--

--seleccion de todas las columnas--
SELECT * FROM paciente

INSERT INTO paciente(nombre_paciente, edad)
	VALUES ('Carlos',23)

/*activando la insercion de datos, si permite la repetición--			<-------DDL21--
SET IDENTITY INSERT tabla ON
SET IDENTITY INSERT tabla OFF	<--desactivando
*/
SET IDENTITY_INSERT paciente ON --Activar la inserción de datos
INSERT INTO paciente(id_paciente, nombre_paciente, edad)
	VALUES (1,'Jorge',23)

SET IDENTITY_INSERT paciente OFF --Desactiva la inserción de valores--

UPDATE paciente SET id_paciente = 123 WHERE id_paciente = 3 --No permite actualizar el campo con IDENTITY

--Tabla paciente1--

CREATE TABLE paciente1(
	id_paciente INT IDENTITY(1,2),
	nombre_paciente varchar (20),
	edad INT	
)

INSERT INTO paciente1 (nombre_paciente,edad)
	VALUES('Ana',23)
INSERT INTO paciente1 (nombre_paciente,edad)
	VALUES('Harry',24)
INSERT INTO paciente1 (nombre_paciente,edad)
	VALUES('Camilo',25)

SELECT * FROM paciente1

--Tabla paciente2
CREATE TABLE paciente2(
	id_paciente INT IDENTITY(3,5),
	nombre_paciente varchar (20),
	edad INT	
)

INSERT INTO paciente2 (nombre_paciente,edad)
	VALUES('Ariel',23)
INSERT INTO paciente2 (nombre_paciente,edad)
	VALUES('Henry',24)
INSERT INTO paciente2 (nombre_paciente,edad)
	VALUES('Carlos',25)

SELECT * FROM paciente2

--Para modificar un valor o dato--
UPDATE paciente2 SET edad = 40 WHERE id_paciente = 8

--Saber desde qué número inicia el IDENTITY--			<---DML5--
SELECT IDENT_SEED('paciente2')

--Saber en cuánto incrementa el valor de IDENTITY--		<---DML6--
SELECT IDENT_INCR('paciente2')

--Eliminar datos--
--DELETE elimina los valores uno por uno o todos los valores de la tabla, pero no elimina el comando IDENTITY--
SELECT * FROM paciente
DELETE FROM paciente WHERE id_paciente = 4		--<--DML7--
DELETE FROM paciente WHERE id_paciente = 2
DELETE paciente

SELECT * FROM paciente

INSERT INTO paciente(nombre_paciente, edad)
	VALUES ('Jorge',23)
INSERT INTO paciente(nombre_paciente, edad)
	VALUES ('Angel',24)
INSERT INTO paciente(nombre_paciente, edad)
	VALUES ('Kathy',25)

SELECT * FROM paciente

TRUNCATE TABLE paciente --Resetea los valores con el campo con IDENTITY--	<--DDL22--

SELECT * FROM paciente

--SELECT--									<--DML1--
SELECT * FROM usuario
SELECT nombre FROM usuario
SELECT nombre,apellido FROM usuario
SELECT * FROM usuario WHERE id_usuario = 3
SELECT nombre,apellido FROM usuario WHERE id_usuario = 3
SELECT * FROM usuario WHERE nombre = 'Jorge'

--SELECT con TOP--							<--DML8--
SELECT TOP 4 * FROM usuario
SELECT TOP 50 PERCENT * FROM usuario

--SELECT con operadores relacionales--		<--DML9--
/*
	=	
	<
	>
	<=
	>=
	<> distinto
*/
SELECT * FROM usuario WHERE sueldo = 1200
SELECT * FROM usuario WHERE sueldo = 4000
SELECT nombre,sueldo FROM usuario WHERE sueldo > 4000
SELECT nombre,sueldo FROM usuario WHERE sueldo < 4000
SELECT * FROM usuario WHERE sueldo <> 1200
SELECT * FROM usuario WHERE sueldo <= 1200
SELECT * FROM usuario WHERE sueldo >= 1200

--SELECT con operadores AND, IN, OR--		<--DML10--
SELECT *FROM usuario WHERE nombre ='Pedro' AND apellido = 'Casas'
SELECT *FROM usuario WHERE id_usuario IN(1,4,6) --id_usuario coincide con alguno de los valores dentro de IN--
SELECT *FROM usuario WHERE id_usuario = 1 AND  id_usuario = 6 --no válido--
SELECT *FROM usuario WHERE id_usuario = 1 OR id_usuario = 6
SELECT *FROM usuario WHERE id_usuario NOT IN(1,4,6) --NOT IN 1--
SELECT *FROM usuario WHERE id_usuario = 1 OR id_usuario = 6 OR id_usuario = 4
SELECT *FROM usuario WHERE NOT id_usuario IN(1,4,6) --es igual que NOT IN 1--

UPDATE usuario SET genero = 'F' WHERE id_usuario IN(5,6)

UPDATE usuario SET nombre = 'Javier' WHERE id_usuario IN(1,4)

--SELECT con operadores aritméticos--		<--DML11--
/*
	+
	-
	*
	/
*/

CREATE TABLE producto(
	id_producto INT NOT NULL,
	nombre_producto varchar(20),
	precio_unit MONEY,
	precio_venta MONEY
)
ALTER TABLE producto DROP COLUMN id_producto
ALTER TABLE producto ADD id_prod INT NOT NULL

INSERT INTO producto(id_prod,nombre_producto,precio_unit,precio_venta)
	VALUES	(1,'Camioneta 4x4 oKM', 30000, 45000),
			(2,'Toyota Yaris OKM', 12000, 18000),
			(3,'Moto lineal Ronco', 6000, 8000) 

SELECT * FROM producto
SELECT precio_venta - precio_unit FROM producto
SELECT nombre_producto, precio_venta*10 FROM producto
SELECT nombre_producto, precio_venta*10 FROM producto
	WHERE id_prod = 1

UPDATE producto
	SET precio_venta = precio_venta + precio_venta*0.1
	WHERE id_prod = 3

SELECT * FROM producto

--Manejo de cadenas--		<--DML12--
/*	SUBSTRING --> extrae subcadenas SUBSTRING(cadena,inicio,número de caractéres)	DML12a*/
SELECT SUBSTRING ('Hola y bienvenidos',1,4)
SELECT SUBSTRING ('Hola y bienvenidos',10,4)

/*	STR --> de número a cadena*/
SELECT STR(123)

/*	STUFF --> reemplaza una cadena por otra dándole el número de lugar y el tamaño de la cadena incial
y cambiando or otra cadena				DML12b	*/
SELECT STUFF('Todos somos amigos',13,6,'enemigos')

/*	LEN -->tamaño de la cadena			DML12c	*/
SELECT LEN('Curso de SQL')

/*	CHAR -->valor de un número en código ASCII		DML12d	*/
SELECT CHAR(67)
SELECT CHAR(72)

/*	UPPER --> convierte a mayúsculas
	LOWER --> convierte a minúsculas		DML12e	*/ 
SELECT LOWER ('AngelCasas')
SELECT UPPER ('AngelCasas')

/*	LTRIM --> elimina espacios de la izquierda
	RTRIM --> elimina espacios de la derecha		DML12f	*/
SELECT LTRIM('     Hola amigos    ')
SELECT RTRIM('     Hola amigos    ')+'...'

/*	REPLACE --> reemplazar cadenas			DML12g	*/
SELECT REPLACE('Todos somos amigos','amigos','enemigos')

/*	REVERSE --> invertir una cadena			DML12h	*/
SELECT REVERSE('Hola')
SELECT REVERSE('Todos somos amigos')

/*	PATINDEX --> retorna el número de orden donde inicia la coincidencia	DML12i	*/
SELECT PATINDEX('%Marcos%','San Marcos')
SELECT PATINDEX('%an%','San Marcos')

/*	REPLICATE --> repite n veces la cadena	DML12j	*/
SELECT REPLICATE ('Hola ',20)

/*	SPACE --> espacio entre cadenas		DML12k	*/
SELECT 'San' + SPACE(10) + 'Marcos'

-----------------------
--Funciones agregadas--
/*								DML13
COUNT	--> contar
SUM		--> sumar
MAX		--> máximo
MIN		--> mínimo
AVG		--> promedio
*/ 
SELECT * FROM usuario
SELECT COUNT(nombre) FROM usuario
SELECT COUNT(nombre) FROM usuario WHERE sueldo > 4000
SELECT COUNT(dni) FROM usuario WHERE sueldo <= 1200

SELECT SUM(sueldo) FROM usuario
SELECT SUM(sueldo) FROM usuario WHERE id_usuario > 4

SELECT MAX(sueldo) FROM usuario
SELECT MIN(sueldo) FROM usuario

SELECT AVG(sueldo) FROM usuario
SELECT AVG(sueldo) FROM usuario WHERE id_usuario < 4

--COUNT DISTINCT--		--DML14--
SELECT COUNT(DISTINCT(nombre)) FROM usuario
SELECT COUNT(DISTINCT genero) FROM usuario

--ORDER BY--
/*
Se usa para ordenar los resultados por una o más columnas.
Por defecto se ordena de forma ascendente, para ordenarlo de forma descendente, se usa el comando DESC
*/

--DESC --> ordena en forma descendente
SELECT *FROM usuario ORDER BY nombre			--DML15a--
SELECT *FROM usuario ORDER BY nombre DESC		--DML15b--

SELECT * FROM usuario ORDER BY sueldo
SELECT * FROM usuario ORDER BY sueldo DESC

SELECT TOP 4 * FROM usuario ORDER BY id_usuario DESC

SELECT * FROM usuario ORDER BY nombre,sueldo

SELECT * FROM usuario ORDER BY nombre DESC,sueldo ASC
SELECT * FROM usuario ORDER BY sueldo ASC,nombre DESC

SELECT * FROM usuario ORDER BY apellido DESC,edad
SELECT * FROM usuario ORDER BY nombre DESC,edad

--CONCATENACION  +  --					DML16--
SELECT 'Hola' + ' ' + 'como estas'
SELECT * FROM paciente
SELECT 'Nombre del paciente: '+ nombre_paciente FROM paciente
SELECT 'Nombre del paciente: '+ nombre_paciente FROM paciente WHERE id_paciente = 3

--ALIAS   AS   --						DML17--
SELECT 'Hola' + ' ' + 'como estas' AS mensaje
SELECT 'Nombre del paciente: '+ nombre_paciente AS [Nombre del paciente] FROM paciente

--COMANDO LIKE y NOT LIKE-- no distigue mayúsculas ni minúsculas--	DML18--
SELECT * FROM paciente
SELECT * FROM paciente WHERE nombre_paciente LIKE 'A%'
SELECT * FROM paciente WHERE nombre_paciente LIKE '%E'
SELECT * FROM paciente WHERE nombre_paciente NOT LIKE '%l'
SELECT * FROM paciente WHERE nombre_paciente NOT LIKE 'A%'
SELECT * FROM paciente WHERE NOT nombre_paciente LIKE 'A%'

--WILCARD--		DML19a-d--
/*
Son caractéres que pueden servir para sustituir por cualquier cualquier otro caracter en un string.
Se utilizan con el operador LIKE
%				--> sustituye por cero o más caracteres
_				--> sustituye un solo caracter
[caracteres]	--> establece y crea un rango de caracteres a encontrar
[^caracteres]	--> estable y crea un rango de caracteres a evitar

*/
SELECT * FROM paciente WHERE nombre_paciente LIKE '_or_e'
SELECT * FROM paciente WHERE nombre_paciente LIKE '_ath_'
SELECT * FROM paciente WHERE nombre_paciente LIKE '[jkc]%' -- comienzan con j, k o c
SELECT * FROM paciente WHERE nombre_paciente NOT LIKE '[jkc]%'
SELECT * FROM paciente WHERE nombre_paciente NOT LIKE '%[el]'
SELECT * FROM paciente WHERE nombre_paciente LIKE '[a-c]%'

--IS NULL-- compara los campos con los valores NULL		DML20--
INSERT INTO paciente(nombre_paciente,edad)
	VALUES	(NULL,19),
			('Andres',NULL),
			(NULL,NULL)

SELECT * FROM paciente
SELECT * FROM paciente WHERE nombre_paciente IS NULL
SELECT id_paciente,nombre_paciente FROM paciente WHERE nombre_paciente IS NULL
SELECT * FROM paciente WHERE nombre_paciente IS NOT NULL
SELECT id_paciente,nombre_paciente FROM paciente WHERE nombre_paciente IS NOT NULL

--BETWEEN --					DML21--
SELECT * FROM usuario
SELECT * FROM usuario WHERE edad BETWEEN 23 AND 25
SELECT * FROM usuario WHERE sueldo BETWEEN 900 AND 4000
SELECT * FROM usuario WHERE nombre BETWEEN 'o' AND 'r'