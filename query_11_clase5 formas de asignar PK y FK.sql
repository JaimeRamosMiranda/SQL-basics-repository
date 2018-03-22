CREATE DATABASE Prueba
USE Prueba

--1ra forma de indicar PK--
CREATE TABLE Departamento(
	id_dpto INT NOT NULL,
	nombre_dpto varchar (20)
	)

ALTER TABLE Departamento
	ADD CONSTRAINT PK_Departamento_1001
	PRIMARY KEY (id_dpto)

--2da forma de indicar PK--
CREATE TABLE Departamento1(
	id_dpto INT NOT NULL Primary KEY,		--<--DDL17--
	nombre_dpto varchar(20)
	)

--3ra forma de indicar PK--
CREATE TABLE Departamento2(
	id_dpto INT NOT NULL,
	nombre_dpto varchar(20),
	CONSTRAINT PK_departamento2_2001		--<--DDL18--
	PRIMARY KEY (id_dpto)
	)

--FK--
CREATE TABLE Provincia(
	id_prov INT NOT NULL,
	nombre_provincia varchar(20),
	id_dpto INT NOT NULL 
	FOREIGN KEY (id_dpto) REFERENCES Departamento1 (id_dpto)		--<--DDL19--
	)