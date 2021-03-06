CREATE DATABASE BD_REGISTRO_COVID
GO

USE BD_REGISTRO_COVID;

-- ********************************* CREACI?N DE TABLAS *********************************

CREATE TABLE TBL_PACIENTES(
	CEDULA int
		CONSTRAINT PK_PACIENTES PRIMARY KEY,
	NOMBRE varchar(20) NOT NULL,
	APELLIDO varchar(20) NOT NULL
);

CREATE TABLE TBL_TIPOS_VACUNA(
	CODIGO_V varchar(4)
		CONSTRAINT PK_TIPOS_VACUNA PRIMARY KEY,
	NOMBRE_V varchar(20) NOT NULL
);

CREATE TABLE TBL_REGISTROS_VACUNAS(
	CEDULA int NOT NULL
		CONSTRAINT FK_CED_REGISTROS_PARIENTES FOREIGN KEY
			REFERENCES TBL_PACIENTES (CEDULA)
				ON UPDATE NO ACTION
				ON DELETE NO ACTION,
	CODIGO_V varchar(4) NOT NULL
		CONSTRAINT FK_COD_REGISTROS_TIPO FOREIGN KEY
			REFERENCES TBL_TIPOS_VACUNA (CODIGO_V)
				ON UPDATE NO ACTION
				ON DELETE NO ACTION,
	F_DOSIS1 date NOT NULL,
	F_DOSIS2 DATE
);

-- ********************************* INGRESO DE DATOS *********************************

/*
	TBL_PACIENTES
*/

INSERT INTO TBL_PACIENTES
							(CEDULA,	NOMBRE,		APELLIDO)
					VALUES	(205550101, 'ANA',		'AMADOR'),
							(205550102, 'BRENDA',	'BRENES'),
							(205550103, 'CARLOS',	'CARRANZA'),
							(205550104, 'DANIEL',	'D?AS'),
							(205550105, 'ELENA',	'ESCALANTE'),
							(205550106, 'FRANCISCO','FUENTES'),
							(205550107, 'GABRIELA',	'G?MEZ'),
							(205550108, 'H?CTOR',	'HIDALGO'),
							(205550109, 'ISA?AS',	'IBARRA');

SELECT * FROM TBL_PACIENTES;

/*
	TBL_TIPOS_VACUNA
*/

INSERT INTO TBL_TIPOS_VACUNA
							(CODIGO_V, NOMBRE_V)
					VALUES	('V-01',   'PFIZER'),
							('V-02',   'ASTRAZENECA'),
							('V-03',   'JANSSEN'),
							('V-04',   'MODERNA');

SELECT * FROM TBL_TIPOS_VACUNA;

/*
	TBL_REGISTROS_VACUNAS
*/

INSERT INTO TBL_REGISTROS_VACUNAS
								 (CEDULA,	CODIGO_V, F_DOSIS1,		F_DOSIS2)
						VALUES	 (205550103,'V-01',	  '20210401',	'20210422'),
								 (205550104,'V-01',	  '20210415',	'20210507'),
								 (205550105,'V-02',	  '20210517',	NULL),
								 (205550108,'V-02',	  '20210718',	NULL),
								 (205550109,'V-03',	  '20210722',	NULL);

SELECT * FROM TBL_REGISTROS_VACUNAS;

-- EJERCICIO 1
SELECT	CEDULA, NOMBRE, APELLIDO
FROM	TBL_PACIENTES;

-- EJERCICIO 2
SELECT	CODIGO_V, NOMBRE_V
FROM	TBL_TIPOS_VACUNA;

-- EJERCICIO 3
SELECT	P.CEDULA, P.NOMBRE, P.APELLIDO, RV.F_DOSIS1, RV.F_DOSIS2
FROM	TBL_PACIENTES P LEFT JOIN TBL_REGISTROS_VACUNAS RV
	ON P.CEDULA = RV.CEDULA
WHERE	RV.F_DOSIS1 IS NULL;

-- EJERCICIO 4
SELECT	P.CEDULA, P.NOMBRE, P.APELLIDO, TV.CODIGO_V, TV.NOMBRE_V, RV.F_DOSIS1, RV.F_DOSIS2
FROM	TBL_PACIENTES P INNER JOIN TBL_REGISTROS_VACUNAS RV
	ON P.CEDULA = RV.CEDULA
		INNER JOIN TBL_TIPOS_VACUNA TV
	ON RV.CODIGO_V = TV.CODIGO_V
WHERE	RV.F_DOSIS1 IS NOT NULL;

-- EJERCICIO 5.1
SELECT	P.CEDULA, P.NOMBRE, P.APELLIDO, TV.CODIGO_V, TV.NOMBRE_V, RV.F_DOSIS1, RV.F_DOSIS2
FROM	TBL_PACIENTES P INNER JOIN TBL_REGISTROS_VACUNAS RV
	ON P.CEDULA = RV.CEDULA
		INNER JOIN TBL_TIPOS_VACUNA TV
	ON RV.CODIGO_V = TV.CODIGO_V
WHERE	RV.F_DOSIS1 IS NOT NULL AND RV.F_DOSIS2 IS NULL;

-- 5.2
SELECT	P.CEDULA, P.NOMBRE, P.APELLIDO, TV.CODIGO_V, TV.NOMBRE_V, RV.F_DOSIS1, RV.F_DOSIS2
FROM	TBL_PACIENTES P LEFT JOIN TBL_REGISTROS_VACUNAS RV
	ON P.CEDULA = RV.CEDULA
		INNER JOIN TBL_TIPOS_VACUNA TV
	ON RV.CODIGO_V = TV.CODIGO_V
WHERE	RV.F_DOSIS1 IS NOT NULL AND RV.F_DOSIS2 IS NULL;

-- EJERCICIO 6.1
SELECT	P.CEDULA, P.NOMBRE, P.APELLIDO, TV.CODIGO_V, TV.NOMBRE_V, RV.F_DOSIS1, RV.F_DOSIS2
FROM	TBL_PACIENTES P INNER JOIN TBL_REGISTROS_VACUNAS RV
	ON P.CEDULA = RV.CEDULA
		INNER JOIN TBL_TIPOS_VACUNA TV
	ON RV.CODIGO_V = TV.CODIGO_V
WHERE	RV.F_DOSIS1 IS NOT NULL AND RV.F_DOSIS2 IS NOT NULL;

-- 6.2
SELECT	P.CEDULA, P.NOMBRE, P.APELLIDO, TV.CODIGO_V, TV.NOMBRE_V, RV.F_DOSIS1, RV.F_DOSIS2
FROM	TBL_PACIENTES P LEFT JOIN TBL_REGISTROS_VACUNAS RV
	ON P.CEDULA = RV.CEDULA
		INNER JOIN TBL_TIPOS_VACUNA TV
	ON RV.CODIGO_V = TV.CODIGO_V
WHERE	RV.F_DOSIS1 IS NOT NULL AND RV.F_DOSIS2 IS NOT NULL;

-- 6.3
SELECT	P.CEDULA, P.NOMBRE, P.APELLIDO, TV.CODIGO_V, TV.NOMBRE_V, RV.F_DOSIS1, RV.F_DOSIS2
FROM	TBL_PACIENTES P RIGHT JOIN TBL_REGISTROS_VACUNAS RV
	ON P.CEDULA = RV.CEDULA
		INNER JOIN TBL_TIPOS_VACUNA TV
	ON RV.CODIGO_V = TV.CODIGO_V
WHERE	RV.F_DOSIS1 IS NOT NULL AND RV.F_DOSIS2 IS NOT NULL;

-- EJERCICIO 7
SELECT	TV.CODIGO_V, TV.NOMBRE_V
FROM	TBL_REGISTROS_VACUNAS RV RIGHT JOIN TBL_TIPOS_VACUNA TV
	ON	TV.CODIGO_V = RV.CODIGO_V
WHERE	RV.CODIGO_V IS NULL;