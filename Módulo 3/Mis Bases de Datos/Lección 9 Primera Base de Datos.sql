--	Instituto Nacional de Aprendizaje
/*
	Modulo: Gestion de Bases de Datos
	Fecha: 1 de Junio, 2021
	Estudiante: Redwin Valverde Castro
*/

CREATE DATABASE PRIMERA_BD
GO

USE PRIMERA_BD
GO

/*
	Por orden se recomienda primero definir las tablas, definiendo unicamente:
	- Nombre del articulo
	- Tipo de dato
	- Si es requerido (NO NULL)
	- Opcionalmente el valor por defecto (si no quiere definirlo afuera)

	y luego modificamos la tabla para arreglarle todas las caracteristicas y
	restricciones.
*/

-- ************************************ CREACION DE TABLAS ***********************************************
CREATE TABLE CLIENTES(
	ID_CLIENTE int IDENTITY(1,1) NOT NULL, -- campo PK
	CARNET int,
	IDENTIFICACION varchar(50) NOT NULL,
	NOMBRE varchar(20) NOT NULL,
	APELLIDO1 varchar(20) NOT NULL,
	APELLIDO2 varchar(20) NOT NULL,
	PROVINCIA varchar(20),
	TELEFONO varchar(20) NOT NULL,
	EMAIL varchar(20)
)
GO

CREATE TABLE BICICLETAS(
	ID_BICICLETA int IDENTITY(1,1) NOT NULL,
	NUMERO_SERIE int NOT NULL CONSTRAINT Unico_Serie UNIQUE,
	TIPO varchar(50) NOT NULL,
	MARCA varchar(50) NOT NULL,
	MODELO varchar(50) NOT NULL,
	ANIO smallint NOT NULL,
	COLOR varchar(30),
	PRECIO decimal(10,2)	NOT NULL, -- decimal(a,b) a = cantidad total de digitos, b = digitos decimales
									  -- La cantidad de digitos enteros es igual a: (a-b)
									  -- 99 999 999,99
	FECHA_INGRESO date NOT NULL
)
GO

CREATE TABLE FACTURAS(
	ID_CLIENTE int, -- FK
	ID_BICICLETA int, -- FK
	FECHA_FACTURA datetime NOT NULL,
	MONTO decimal(10,2) NOT NULL,
	DESCUENTO decimal(10,2),
	MONTO_TOTAL decimal(10,2) NOT NULL,
	OBSERVACIONES varchar(150)
)
GO



-- *********************************** MODIFICACION DE TABLAS ********************************

-- ________________ CREACION DE LLAVES PRIMARIAS: ________________

-- CONSTRAINT = restriccion
ALTER TABLE CLIENTES
	ADD CONSTRAINT PK_CLIENTES PRIMARY KEY (ID_CLIENTE)
GO

ALTER TABLE BICICLETAS
	ADD CONSTRAINT PK_BICICLETAS PRIMARY KEY (ID_BICICLETA)
GO

-- ________________ CREACION DE LLAVES SECUNDARIAS: ________________

ALTER TABLE FACTURAS
	ADD CONSTRAINT FK_FACTURAS_CLIENTES FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES (ID_CLIENTE)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO

ALTER TABLE FACTURAS
	ADD CONSTRAINT FK_FACTURAS_BICICLETAS FOREIGN KEY (ID_BICICLETA) REFERENCES BICICLETAS (ID_BICICLETA)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO

-- ____________________ AGREGAR VALORES POR DEFECTO ____________

-- No hay CONSTRAINT porque esta modificando el dato
ALTER TABLE CLIENTES ADD DEFAULT 'Alajuela' FOR PROVINCIA

ALTER TABLE BICICLETAS ADD DEFAULT 'ROAD' FOR TIPO

ALTER TABLE FACTURAS ADD DEFAULT 0 FOR DESCUENTO

ALTER TABLE FACTURAS ADD DEFAULT getDate() FOR FECHA_FACTURA

-- Agregar una restriccion NOT NULL despues de creada la tabla

ALTER TABLE FACTURAS
	ALTER COLUMN DESCUENTO decimal(10,2) NOT NULL
GO

-- Indicar que un campo sea unico, luego de crada la tabla

ALTER TABLE CLIENTES 
	ADD CONSTRAINT UnicoCarnet UNIQUE (CARNET)
GO

-- Agregar restricicones CHECK

ALTER TABLE BICICLETAS
	ADD CONSTRAINT CHK_PRECIO CHECK (PRECIO > 0 AND PRECIO < 100000000) -- Entre
GO

ALTER TABLE BICICLETAS
	ADD CONSTRAINT CHK_FECHA_INGRESO CHECK (FECHA_INGRESO >= getDate() )
GO

ALTER TABLE CLIENTES
	ADD CONSTRAINT CHK_PROVINCIA CHECK (PROVINCIA = upper(PROVINCIA) AND PROVINCIA IN ('SAN JOSE','ALAJUELA','CARTAGO','HEREDIA','GUANACASTE','PUNTARENAS','LIMON') )
GO












-- ALTER TABLE FACTURAS CHANGE DESCUENTO 



-- Como no deberia ser
CREATE TABLE BICICLETAS_OTRA_FORMA(
	ID_BICICLETA int IDENTITY(1,1) CONSTRAINT PK_BICIS_2 PRIMARY KEY,
	ID_CLIENTE int NOT NULL CONSTRAINT FK_BICIS_CLIENTES REFERENCES CLIENTES (ID_CLIENTE),
	TIPO varchar(50) NOT NULL
		CONSTRAINT DefaultTipo DEFAULT 'MTB'
		CONSTRAINT CHK_TIPO_BICI CHECK (TIPO = upper(TIPO) AND
			TIPO IN ('ROAD','MTB','GRAVEL'))


)
GO


-- *********************************** INGRESAR INFORMACION EN LAS TABLAS ********************************

-- *********************************** CONSULTAS SOBRE LAS TABLAS ********************************