---- CREAR TABLA USUARIO ----
CREATE TABLE usuario(
	id_usuario int not null,
	nombres varchar(20),
	apellidos varchar(20),
	dni numeric(8,0),
	edad int,
	genero varchar(2),
	fecha_nac date,
	sueldo money
)

---- INSERT ----
INSERT INTO usuario(id_usuario,nombres,apellidos,dni,edad,genero,fecha_nac,sueldo) VALUES (1,'Angel','Sánchez','12345678',23,'M','1994-07-23',1000)
INSERT INTO usuario(id_usuario,nombres,apellidos,dni,edad,genero,fecha_nac,sueldo) VALUES (2,'Cristian','Quiroz','12367845',24,'M','1993-11-06',850)
INSERT INTO usuario(id_usuario,nombres,apellidos,dni,edad,genero,fecha_nac,sueldo) VALUES (3,'Marco','Casas','18452367',19,'M','1998-01-12',1250)
INSERT INTO usuario(id_usuario,nombres,apellidos,dni,edad,genero,fecha_nac,sueldo) VALUES (4,'Katherine','Dextre','12252447',25,'F','1992-05-07',2300)
INSERT INTO usuario(id_usuario,nombres,apellidos,dni,edad,genero,fecha_nac,sueldo) VALUES (5,'Diana','Castro','78232407',27,'F','1990-10-16',4500)

INSERT INTO usuario(id_usuario,nombres,apellidos,dni,edad,genero,fecha_nac,sueldo) VALUES (1,'Angel','Sánchez','12345678',23,'M','1994-07-23',1000),
																						  (2,'Cristian','Quiroz','12367845',24,'M','1993-11-06',850),
                                                                                          (3,'Marco','Casas','18452367',19,'M','1998-01-12',1250),
																						  (4,'Katherine','Dextre','12252447',25,'F','1992-05-07',2300),
                                                                                          (5,'Diana','Castro','78232407',27,'F','1990-10-16',4500)
																						  
INSERT INTO usuario VALUES (1,'Angel','Sánchez','12345678',23,'M','1994-07-23',1000),
					       (2,'Cristian','Quiroz','12367845',24,'M','1993-11-06',850),
                           (3,'Marco','Casas','18452367',19,'M','1998-01-12',1250),
						   (4,'Katherine','Dextre','12252447',25,'F','1992-05-07',2300),
                           (5,'Diana','Castro','78232407',27,'F','1990-10-16',4500)
						   

---- ACTUALIZAR REGISTRO DE UNA TABLA ----
UPDATE usuario SET nombres = 'Marco' WHERE nombres = 'Angel'
UPDATE usuario SET nombres = 'Marco' WHERE id_usuario = 3
UPDATE usuario SET nombres = 'Marco'

---- IDENTITY ----
/* 
Por defecto identity empieza en 1 y su incremento es de 1 en 1.
No permite valores nulos.
Solo se permite una columna con identity por tabla.
*/
CREATE TABLE paciente(
	id_paciente INT IDENTITY,
	nombres VARCHAR(20),
	edad INT
)

/* Por defecto no permite insertar valores en la columna con identity */
INSERT INTO paciente(id_paciente,nombres,edad) VALUES (1,'María',35)
INSERT INTO paciente(nombres,edad) VALUES ('María',35)
INSERT INTO paciente(nombres,edad) VALUES ('Helen',20)
INSERT INTO paciente(nombres,edad) VALUES ('Angel',24)

/* Activar la inserción de datos */
SET IDENTITY_INSERT paciente ON
INSERT INTO paciente(id_paciente,nombres,edad) VALUES (3,'Carlos',40)

/* Desactivar la inserción de datos */
SET IDENTITY_INSERT paciente OFF

/* No permite actualizar los valores de la columna con identity*/
UPDATE paciente SET id_paciente = 005 WHERE id_paciente = 3

CREATE TABLE paciente(
	id_paciente INT IDENTITY(1,2),
	nombres VARCHAR(20),
	edad INT
)

CREATE TABLE paciente(
	id_paciente INT IDENTITY(3,2),
	nombres VARCHAR(20),
	edad INT
)

/* Saber desde qué número empieza el identity */
SELECT IDENT_SEED('paciente')

/* Saber de cuanto es el incremento del identity */
SELECT IDENT_INCR('paciente')

---- ELIMINAR DATOS DE UNA TABLA ----
CREATE TABLE alumno(
	id_alumno INT NOT NULL IDENTITY(1,1),
	nombres VARCHAR(20)
)

INSERT INTO alumno VALUES('Ricardo'),
						 ('Angel'),
						 ('Diana'),
						 ('Kathy'),
						 ('Marco')

SELECT * FROM alumno

---- DELETE ---
DELETE FROM alumno WHERE id_alumno = 5
DELETE alumno

INSERT INTO alumno VALUES('Manuel')

---- TRUNCATE ----
TRUNCATE TABLE alumno

INSERT INTO alumno VALUES('Valentino')
						   
---- SELECT ----                                                                          
SELECT * FROM usuario                                          
SELECT id_usuario FROM usuario
SELECT nombres FROM usuario
SELECT nombres,id_usuario,edad FROM usuario
SELECT * FROM usuario WHERE nombre = 'Angel'
SELECT * FROM usuario WHERE id_usuario = 3

---- SELECT TOP ----
SELECT TOP 50 PERCENT * FROM alumno
SELECT TOP 4 * FROM alumno
SELECT TOP 3 * FROM producto ORDER BY id_producto DESC

---- SELECT CON OPERADORES RELACIONALES ----
/*
=  igual
<  menor que
>  mayor que
<= menor igual
>= mayor igual
<> diferente a
*/
CREATE TABLE mercaderia(
	id_merca numeric(18, 0) NOT NULL,
	descripcion nvarchar(50) NOT NULL,
	precio money NOT NULL,
	estado char(1) NOT NULL
)

INSERT mercaderia(id_merca, descripcion,precio,estado) VALUES (00101,'Lapiceros 3M F23',2,'A')
INSERT mercaderia(id_merca, descripcion,precio,estado) VALUES (00102,'Papel Bond A4',1.3,'A')

SELECT * FROM mercaderia WHERE precio = 2
SELECT * FROM mercaderia WHERE precio < 2
SELECT * FROM mercaderia WHERE precio > 1.3
SELECT * FROM mercaderia WHERE precio > 1
SELECT * FROM mercaderia WHERE precio <= 4
SELECT * FROM mercaderia WHERE precio >= 1.4
SELECT * FROM mercaderia WHERE precio <> 2

---- SELECT CON OPERADORES AND, OR , IN ----
/* Los operadores AND y OR se usan para filtrar resultados basándose en más de una condición */
CREATE TABLE cliente(
	id_cliente int,
	nombre_cliente varchar(25),
	ciudad varchar(20),
	pais varchar(20),
	telefono int
)

SELECT * FROM cliente WHERE pais='España' AND ciudad='Madrid';

SELECT * FROM cliente WHERE ciudad IN ('Madrid','Barcelona')
SELECT * FROM departamento WHERE cod_dpto IN (1,4,6)
SELECT * FROM departamento WHERE cod_dpto NOT IN (1,4,6)

SELECT * FROM departamento WHERE cod_dpto = 1 OR cod_dpto = 4 OR cod_dpto = 6

/* Podemos combinar tantas condiciones AND y OR como necesitemos. 
Las expresiones, para evitar errores y para facilitar la lectura, se puede agrupar utilizando paréntesis */
SELECT * FROM cliente WHERE pais = 'España' AND (ciudad = 'Madrid' OR ciudad = 'Barcelona')

UPDATE paciente SET sexo = 'F' WHERE id_paciente IN (1,2)
UPDATE paciente SET sexo = 'F' WHERE id_paciente = 1 OR id_paciente = 2

---- SELECT CON OPERADORES ARITMÉTICOS ----
/*
+
-
/
*
*/

/* Ganancia de cada producto */
SELECT precio_venta - precio_compra FROM producto

/* Subtotal de cada producto */
SELECT nombre,precio_venta*10 FROM producto

/* Actualizar */
UPDATE producto SET precio_venta = precio_venta + (precio_venta*0.1) WHERE id_producto = 1

---- MANEJO DE CADENAS ----
/* 
SUBSTRING --> extrae subcadenas
STR       --> de número a cadena
STUFF     --> reemplaza una cadena por otra dándole el número de lugar y tamaño de la cadena a reemplazar
LEN       --> tamaño de una cadena
CHAR      --> valor de un número en código ASCII
LOWER	  --> convierte a minúscula
UPPER     --> convierte a mayúscula
LTRIM     --> elimna espacios de la izquierda
RTRIM     --> elimna espacios de la derecha
REPLACE   --> reemplazar cadena
REVERSE   --> invertir una cadena
PATINDEX  --> retorna el número de orden donde inicia la coincidencia
REPLICATE --> repite la cadena n veces
SPACE     --> espacios entre cadenas
 */

 SELECT SUBSTRING('Hola y bienvenidos',8,1)
 SELECT STR(123)
 SELECT STUFF('Todos somos amigos',13,6,'enemigos')
 SELECT LEN('Curso de SQL')
 SELECT LEN(nombres) FROM paciente WHERE id_paciente = 1
 SELECT CHAR(67)
 SELECT LOWER('Angel Sánchez')
 SELECT UPPER('Angel Sánchez')
 SELECT UPPER(nombres) FROM paciente WHERE id_paciente = 1
 SELECT LTRIM('     Hola amigos     ')
 SELECT RTRIM('     Hola amigos     ')
 SELECT REPLACE('Todos somos amigos','amigos','enemigos')
 SELECT REVERSE('Hola')
 SELECT REVERSE('123')
 SELECT PATINDEX('%Marcos%','Bienvenidos a San Marcos')
 SELECT REPLICATE('Hola ',3)
 SELECT 'Angel' + SPACE(20) + 'Sánchez'
 
---- FUNCIONES AGREGADAS ----
/*
COUNT --> contar
SUM   --> sumar
MAX   --> máximo
MIN   --> mínimo
AVG   --> promedio
*/

CREATE TABLE libro(
	id_libro int not null identity,
	titulo varchar(45),
	autor varchar(25),
	precio_compra money,
	precio_venta money
)

SELECT COUNT(titulo) FROM libro
SELECT COUNT(titulo) FROM libro WHERE precio_venta > 200

SELECT SUM(precio_venta) FROM libro

SELECT MAX(precio_compra) FROM libro

SELECT MIN(precio_venta) FROM libro

SELECT AVG(precio_venta) FROM libro

---- COUNT DISTINCT ----
SELECT COUNT(DISTINCT(cod_provincia)) FROM distrito

---- ORDER BY ----
/* La cláusula ORDER BY se usa para ordenar los resultados por una o más columnas. 
Por defecto se ordenan en orden ascendente ASC. Para ordenar los resultados en orden descendente se usa la palabra DESC. */
SELECT * FROM libro ORDER BY titulo
SELECT precio_venta FROM libro ORDER BY precio_venta DESC
SELECT * FROM libro ORDER BY titulo,precio_venta
SELECT * FROM libro ORDER BY titulo ASC,precio_venta DESC

---- CONCATENACIÓN ----
SELECT 'Hola' + ' ' + 'bienvenidos'

SELECT 'Nombre del paciente: ' + nombres FROM paciente
SELECT 'Nombre del paciente: ' + nombres FROM paciente WHERE id_paciente = 2

---- ALIAS (SOBRENOMBRE) ----
/* Los alias SQL se usan para renombrar temporalmente una tabla o columna, de esta forma son más legibles, especialmente 
para consultas algo más complejas. */
SELECT 'Hola' + ' ' + 'bienvenidos' AS Mensaje
SELECT 'Hola' + ' ' + 'bienvenidos' AS [Este es mi mensaje]

SELECT precio_compra AS [Precio de compra] FROM libro


---- COMANDO LIKE Y NOT LIKE ----
SELECT * FROM departamento WHERE nombre_dpto LIKE 'A%'
SELECT * FROM departamento WHERE nombre_dpto LIKE '%s'
SELECT * FROM departamento WHERE nombre_dpto NOT LIKE 'A%'
SELECT * FROM departamento WHERE NOT nombre_dpto LIKE 'A%'

---- WILDCARDS ----
/* 
Los wildcards son caracteres que pueden servir parar sustituir por cualquier
otro caracter en un string. Se utilizan con el operador LIKE y en SQL sirven para
encontrar datos en una tabla. Estos son:

%            --> Sustituye por cero o más caracteres
_            --> Sustituye por un solo caracter
[caracteres] --> Establece y crea rangos de caracteres a encontrar
[^caracteres]--> Establece y crea rangos de caracteres a evitar

*/
/* Veamos los clientes cuya ciudad empieza por una letra cualquiera, seguido por 
ruj, seguido por otro caracter cualquiera y acabando por llo */
SELECT * FROM cliente WHERE ciudad LIKE '_ruj_llo'

/* Los corchetes nos permiten poder seleccionar filas con unas determinadas palabras 
en una posición determinada, o un rango de palabras. Buscamos los clientes cuya ciudad 
empieza por o, por b, o por m: */
SELECT * FROM cliente WHERE ciudad LIKE '[obm]%'

/* Ahora queremos encontrar los clientes cuya ciudad acaba en un rango de la a a la g 
(las posibilidades son: a, b, c, d, e, f, g): */
SELECT * FROM cleintes WHERE ciudad LIKE '%[a-g]'

/* Para evitar varios caracteres o rangos se hace lo mismo añadiendo ^ */
SELECT * FROM cliente WHERE ciudad LIKE '[^obm]%'

---- IS NULL ----
SELECT * FROM producto WHERE nombre IS NULL
SELECT * FROM producto WHERE nombre IS NOT NULL
SELECT * FROM producto WHERE NOT nombre IS NULL

---- BETWEEN ----
/* El operador BETWEEN se usa para seleccionar valores dentro de un rango. Los valores 
pueden ser números, texto o fechas. */

CREATE TABLE producto(
	id_producto INT IDENTITY,
	nombre_producto VARCHAR(25),
	categoria INT,
	precio MONEY,
	stock INT,
	ultima_venta DATE
)

INSERT INTO producto VALUES ('Gafas de sol',1,30,6,'2015-10-10')
INSERT INTO producto VALUES ('Gorra',1,10,18,'2015-10-2')
INSERT INTO producto VALUES ('Camiseta',2,10,16,'2015-10-13')
INSERT INTO producto VALUES ('Pantalón',2,15,10,'2015-09-16')
INSERT INTO producto VALUES ('Zapatillas',2,25,12,'2015-09-29')

/* Seleccionar los productos que tengan un precio entre 10 y 20 */
SELECT * FROM producto WHERE precio BETWEEN 10 AND 20
SELECT * FROM producto WHERE precio BETWEEN 10 AND 20

/* Seleccionar los productos cuyo precio no está entre 10 y 20 */
SELECT * FROM producto WHERE precio NOT BETWEEN 10 AND 20

/* Productos cuyo nombre empieza con alguna letra entre la A y la H */
SELECT * FROM producto WHERE nombre_producto BETWEEN 'a' AND 'h'

/* Productos cuya última venta no se ha producido en el mes de Octubre */
SELECT * FROM producto WHERE ultima_venta NOT BETWEEN '2015-10-01' AND '2015-10-31'

---- INNER JOIN ----
SELECT * FROM departamento INNER JOIN provincia ON departamento.cod_dpto = provincia.cod_dpto
SELECT * FROM departamento d INNER JOIN provincia p ON d.cod_dpto=p.cod_dpto INNER JOIN distrito dist ON p.cod_provincia=dist.cod_provincia





