CREATE DATABASE inventario
USE inventario

CREATE TABLE curso(
	id_curso int,
	nombre varchar (20),
	horario DATETIME,
	fecha_inicio DATETIME,
	profesor varchar (15)
	)

--modificar la definicon de una columna para eliminar nulos--

ALTER TABLE curso ALTER COLUMN id_curso INT NOT NULL	--<--

--establecer clave primaria--
ALTER TABLE curso					--<--
	ADD CONSTRAINT PK_curso_1001 
	PRIMARY KEY (id_curso)

--ejercicio--
CREATE TABLE curso2(
	id_curso int NOT NULL,
	nombre varchar (20),
	horario DATETIME,
	fecha_inicio DATETIME,
	profesor varchar (15)
	)

ALTER TABLE curso2 ALTER COLUMN nombre varchar(20) NOT NULL

--asignando como PK, varios dominios, en este caso 2--

ALTER TABLE curso2
	ADD CONSTRAINT PK_curso2_1001
	PRIMARY KEY (id_curso,nombre)	--<--DDL10|--

--posible error--
--ALTER TABLE curso2 ALTER COLUMN nombre varchar(20) 
/* Mens. 5074, Nivel 16, Estado 1, Línea 36
El objeto 'PK_curso2_1001' de tipo objeto es dependiente de columna 'nombre'.
Mens. 4922, Nivel 16, Estado 9, Línea 36
Error de ALTER TABLE ALTER COLUMN nombre debido a que uno o más objetos tienen acceso a esta columna.
*/

--para establecer varios campos como PK se mantiene presionado shift o ctrl al seleccionar--

