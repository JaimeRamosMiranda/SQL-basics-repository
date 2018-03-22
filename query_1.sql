--Creación de base de datos con comandos:

--correcto

CREATE DATABASE ejemplo4

--incorrecto

CREATE DATABASE alumnos aprobados

CREATE DATABASE 12Alumno

--correcto

CREATE DATABASE [alumnos aprobados] --<----DDL1|--

CREATE DATABASE [12Alumno]


-- Esto sirve para comentarios de una sola línea
/* Esto también sirve para comentario,
pero con varias líneas
*/

--modificar una base de datos

ALTER DATABASE [alumnos aprobados] MODIFY NAME = Hola --<---DDL2|

DROP DATABASE Hola			--<--DDL3

USE EJEMPLO2				--<--DDL4--|

CREATE TABLE Productos (			--<--DDL5--|
		numero int,
		descripcion varchar (10),
		precio int
		)
