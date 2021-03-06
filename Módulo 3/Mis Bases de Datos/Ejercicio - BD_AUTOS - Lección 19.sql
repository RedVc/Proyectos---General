CREATE DATABASE BD_AUTOS
GO

USE BD_AUTOS;

-- ******************************* Creacion de tablas *******************************

CREATE TABLE AUTOS_INVENTARIO(
	PLACA			varchar(7) CONSTRAINT PK_AUTOS_INVENTARIO PRIMARY KEY,
	COLOR			varchar(20) NOT NULL,
	CILINDRADA		varchar(30) NOT NULL,
	COMBUSTIBLE		varchar(30) NOT NULL,
	CANT_PUERTAS	smallint NOT NULL,
	ANIO			smallint NOT NULL
);

CREATE TABLE AUTOS_PARA_VENDER(
	PLACA_V			varchar(7) CONSTRAINT PK_AUTOS_PARA_VENDER PRIMARY KEY,
	COLOR_V			varchar(20) NOT NULL,
	CILINDRADA_V	varchar(30) NOT NULL,
	COMBUSTIBLE_V	varchar(30) NOT NULL,
	CANT_PUERTAS_V	smallint NOT NULL,
	ANIO_V			smallint NOT NULL
);

CREATE TABLE CHOFERES(
	COD_CHOFER			int IDENTITY,
	ID_CHOFER			varchar(20) NOT NULL,
	NOMBRE_CHOFER		varchar(20) NOT NULL,
	APELLIDO1_CHOFER	varchar(20) NOT NULL,
	APELLIDO2_CHOFER	varchar(20) NOT NULL,
	TELEFONO_CHOFER		varchar(20) NOT NULL,
	NACIMIENTO_CHOFER	date NOT NULL,
	DIRECCION_CHOFER	varchar(200)
);

CREATE TABLE ASIGNACION_CHOFERES(
	COD_ASIGNACION int IDENTITY,
	PLACA varchar(7) NOT NULL,
	COD_CHOFER int NOT NULL
);

-- ******************************* Modificacion de tablas *******************************
-- CHOFERES
ALTER TABLE CHOFERES ADD
	-- PK
	CONSTRAINT PK_CHOFERES PRIMARY KEY (COD_CHOFER),
	-- UC
	CONSTRAINT UC_ID_CHOFER UNIQUE (ID_CHOFER),
	-- CHK
	CONSTRAINT CHK_NACIMIENTO_CHOFER CHECK
		(NACIMIENTO_CHOFER <= CONVERT(datetime,CONVERT(varchar(10), getDate(), 103),103));

-- ASIGNACION_CHOFERES
ALTER TABLE ASIGNACION_CHOFERES ADD
	-- PK
	CONSTRAINT PK_ASIGNACION_CHOFERES PRIMARY KEY (COD_ASIGNACION),
	-- FK
	CONSTRAINT FK_ASIGNACION_INVENTARIO FOREIGN KEY (PLACA)
		REFERENCES AUTOS_INVENTARIO (PLACA)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,
	CONSTRAINT FK_ASIGNACION_CHOFERES FOREIGN KEY (COD_CHOFER)
		REFERENCES CHOFERES (COD_CHOFER)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION;

-- ******************************* Ingreso de datos*******************************

INSERT INTO AUTOS_INVENTARIO
							(PLACA,		COLOR,		CILINDRADA, COMBUSTIBLE, CANT_PUERTAS, ANIO)
					VALUES	('INA-963',	'NARANJA',	'750',		'DIESEL',	 4,			   2000),
							('LOL-552',	'AZUL',		'1200',		'GASOLINA',	 2,			   2005),
							('POP-123',	'VERDE',	'500',		'EL?CTTRICO',4,			   2020),
							('ADN-333',	'ROJO',		'800',		'DIESEL',	 4,			   2003),
							('ARN-153',	'GRIS',		'900',		'GASOLINA',	 2,			   1996),
							('WOW-569',	'BLANCO',	'5000',		'EL?CTRICO', 4,			   1998),
							('GON-321',	'NEGRO',	'550',		'GASOLINA',	 2,			   2010),
							('DED-741',	'AMARILLO',	'1000',		'DIESEL',	 4,			   2000);

INSERT INTO AUTOS_PARA_VENDER(PLACA_V, COLOR_V, CILINDRADA_V, COMBUSTIBLE_V, CANT_PUERTAS_V, ANIO_V)
	 SELECT PLACA, COLOR, CILINDRADA, COMBUSTIBLE, CANT_PUERTAS, ANIO
	 FROM AUTOS_INVENTARIO
	 WHERE ANIO < 2015;

--SELECT * FROM AUTOS_INVENTARIO;

--SELECT * FROM AUTOS_PARA_VENDER;

/* DELETE FROM AUTOS_INVENTARIO
WHERE ANIO < 2015;
*/
INSERT INTO CHOFERES
					(ID_CHOFER,   NOMBRE_CHOFER, APELLIDO1_CHOFER, APELLIDO2_CHOFER, TELEFONO_CHOFER, NACIMIENTO_CHOFER, DIRECCION_CHOFER)
			VALUES	('506320159', 'Pepe',		 'Figu?res',	   'Ram?rez',		 '88888889',	  '19950201',		 'Piedades Norte'),
					('703350523', 'Juan',		 'Castro',		   'Fern?ndez',		 '88888888',	  '19820315',		 'San Pedro'),
					('102560231', 'Armando',	 'Segura',		   'Castro',		 '88888887',	  '19781113',		 'Las Musas'),
					('603240555', 'Pedro',		 'Valverde',	   'Jim?nez',		 '88888886',	  '19850507',		 'Piedades Norte'),
					('206540951', 'Emily',		 'Salazar',		   'Ram?rez',		 '88888885',	  '19990313',		 'La Paz'),
					('306540987', 'Andr?s',		 'Carballo',	   'Valverde',		 '88888884',	  '19850408',		 'San Ram?n'),
					('506540326', 'Margaret',	 'Moya',		   'L?pez',			 '88888883',	  '19660712',		 'Palmares');

SELECT * FROM CHOFERES;

INSERT INTO ASIGNACION_CHOFERES
								(PLACA, COD_CHOFER)
						VALUES	('ARN-153', 5),
								('DED-741', 1),
								('GON-321', 4),
								('POP-123', 3);

SELECT * FROM ASIGNACION_CHOFERES;

-- Terminar lecci?n 17 para continuar esta pr?ctica

-- ************************ CONSULTAS *****************************

/*
INSERT INTO AUTOS_PARA_VENDER(PLACA_AUTO, COLOR, ANIO, ESTADO, PUERTAS)
		SELECT PLACA_AUTO, COLOR, ANIO, ESTADO, PUERTAS
		FROM AUTOS_INVENTARIO
		WHERE ANIO > 2015;
*/
SELECT * FROM AUTOS_INVENTARIO;

SELECT * FROM AUTOS_PARA_VENDER;

DELETE FROM AUTOS_INVENTARIO
	WHERE ANIO > 2015;

--------------------- ACTIVIDAD A --------------------------------------

SELECT AC.PLACA, COLOR, ANIO, NOMBRE_CHOFER, APELLIDO1_CHOFER, APELLIDO2_CHOFER

FROM CHOFERES C INNER JOIN ASIGNACION_CHOFERES AC
	ON C.COD_CHOFER = AC.COD_CHOFER

	INNER JOIN AUTOS_INVENTARIO AI
	ON AC.PLACA = AI.PLACA;


------------------- ACTIVIDAD B --------------------------------------


SELECT AI.PLACA, AI.COLOR, AI.ANIO, NOMBRE_CHOFER, APELLIDO1_CHOFER, APELLIDO2_CHOFER

FROM	AUTOS_INVENTARIO AI INNER JOIN ASIGNACION_CHOFERES AC
			ON AI.PLACA = AC.PLACA
		INNER JOIN CHOFERES C
			ON AC.COD_CHOFER = C.COD_CHOFER	

WHERE AI.ANIO < 2018;

-- SUBCONSULTAS
SELECT * FROM CHOFERES;
SELECT * FROM ASIGNACION_CHOFERES;
SELECT * FROM AUTOS_INVENTARIO;

-- 1
SELECT	C.NOMBRE_CHOFER + ' ' + C.APELLIDO1_CHOFER + ' ' + C.APELLIDO2_CHOFER AS 'CHOFER ASIGNADO', AC.PLACA, AI.ANIO
FROM	AUTOS_INVENTARIO AI INNER JOIN ASIGNACION_CHOFERES AC
			ON AI.PLACA = AC.PLACA
		INNER JOIN CHOFERES C
			ON C.COD_CHOFER = AC.COD_CHOFER
WHERE AI.ANIO BETWEEN 2000 AND 2015