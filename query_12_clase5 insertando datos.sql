USE Encuesta

--seleccionar todos los dominios de la tabla departamento--
SELECT * FROM Departamento		--<--DML1--
DELETE Departamento			--<--elimina registros, no la tabla--	<--DML2--

DELETE FROM Departamento 
	WHERE id_dpto = 1

DELETE FROM Departamento 
	WHERE id_dpto = 1

--insertar datos de departamento--

INSERT INTO Departamento(id_dpto,nombre_dpto)		--<--INSERT INTO Tabla (campo1,campo2,...,campo n)
	VALUES (1,'Amazonas')								--VALUES(valor del campo1, valor del campo2,..., n)--

INSERT INTO Departamento(id_dpto,nombre_dpto)		--<--DML3a--
	VALUES (2,'Ancash')

INSERT INTO Departamento(id_dpto,nombre_dpto)
	VALUES (3,'Apurimac')

INSERT INTO Departamento(id_dpto,nombre_dpto)
	VALUES (4,'Arequipa')

INSERT INTO Departamento(id_dpto,nombre_dpto)
	VALUES (5,'Ayacucho')

INSERT INTO Departamento(id_dpto,nombre_dpto)
	VALUES (6,'Cajamarca')

INSERT INTO Departamento(id_dpto,nombre_dpto)
	VALUES (7,'Callao')

INSERT INTO Departamento(id_dpto,nombre_dpto)
	VALUES (8,'Cusco')

INSERT INTO Departamento(id_dpto,nombre_dpto)
	VALUES (9,'Huancaveliva')

INSERT INTO Departamento(id_dpto,nombre_dpto)
	VALUES (10,'Huánuco')

INSERT INTO Departamento(id_dpto,nombre_dpto)
	VALUES (11,'Ica')

INSERT INTO Departamento(id_dpto,nombre_dpto)
	VALUES (12,'Junín')

INSERT INTO Departamento(id_dpto,nombre_dpto)
	VALUES (13,'La Libertad')

INSERT INTO Departamento(id_dpto,nombre_dpto)
	VALUES (14,'Lambayeque')

INSERT INTO Departamento(id_dpto,nombre_dpto)
	VALUES (15,'Lima')

INSERT INTO Departamento(id_dpto,nombre_dpto)
	VALUES (16,'Loreto')

INSERT INTO Departamento(id_dpto,nombre_dpto)
	VALUES (17,'Madre de Dios')

INSERT INTO Departamento(id_dpto,nombre_dpto)
	VALUES (18,'Moquegua')

INSERT INTO Departamento(id_dpto,nombre_dpto)
	VALUES (19,'Pasco')

INSERT INTO Departamento(id_dpto,nombre_dpto)
	VALUES (20,'Piura')

INSERT INTO Departamento(id_dpto,nombre_dpto)
	VALUES (21,'Puno')

INSERT INTO Departamento(id_dpto,nombre_dpto)
	VALUES (22,'San Martín')

INSERT INTO Departamento(id_dpto,nombre_dpto)
	VALUES (23,'Tacna')

INSERT INTO Departamento(id_dpto,nombre_dpto)
	VALUES (24,'Tumbes')

INSERT INTO Departamento(id_dpto,nombre_dpto)
	VALUES (25,'Ucayali')

--insertar datos de provincia--
/*al insertar datos en una tabla, se debe tener en cuenta los campos que no admitan NULL, 
ejm: en la tabla Provincia id_dpto no admite nulos,
que depende de la tabla Departamento
*/
INSERT INTO Provincia(id_prov,nombre_prov,id_dpto)
	VALUES	(1,'Lima',15),							--2da forma de insertar datos--
			(2,'Barranca',15),						--el campo id_dpto es una FK por lo que no admite NULL--
			(3,'Cajatambo',15),						--por eso el 3er valor debe existir
			(4,'Canta',15),							--en la 1ra forma Lima es el 15--
			(5,'Cañete',15),
			(6,'Huaral',15),						--<--DML3b--
			(7,'Huarochirí',15),
			(8,'Huara',15),
			(9,'Oyón',15),
			(10,'Yauyos',15)