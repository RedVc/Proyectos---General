/* Base de Datos para el: Instituto Especializado de Entrenamiento en Triatlón (IEET)
   INA
   Redwin Valverde Castro
*/

CREATE DATABASE BD_TRIATLON 
GO

USE BD_TRIATLON;

-- *********************************** Creacion de tablas ***********************************

CREATE TABLE INSTITUTOS(
	ID_Instituto		tinyint IDENTITY,
	Nombre_Instituto	varchar(30) NOT NULL,
	Telefono1_Instituto varchar(30) NOT NULL,
	Telefono2_Instituto varchar(30),
	Email1_Instituto	varchar(76) NOT NULL,
	Email2_Instituto	varchar(76),
	SitioWeb_Instituto	varchar(150) NOT NULL,
	Horario_Instituto	varchar(30) NOT NULL,
	Distrito_Instituto	varchar(30) NOT NULL,
	Canton_Instituto	varchar(30) NOT NULL,
	Provincia_Instituto varchar(10) NOT NULL,
	Pais_Instituto		varchar(20) NOT NULL,
	Direccion_Instituto varchar(150) NOT NULL,
	Activo_Instituto	bit NOT NULL
);

CREATE TABLE ENTRENADORES(
	Cod_Entrenador				int IDENTITY,
	ID_Instituto				tinyint NOT NULL,
	ID_Entrenador				varchar(50) NOT NULL,
	Nombre_Entrenador			varchar(20) NOT NULL,
	Apellido1_Entrenador		varchar(20) NOT NULL,
	Apellido2_Entrenador		varchar(20) NOT NULL,
	Nacimiento_Entrenador		date NOT NULL,
	Telefono1_Entrenador		varchar(30) NOT NULL,
	Telefono2_Entrenador		varchar(30),
	Email1_Entrenador			varchar(76) NOT NULL,
	Email2_Entrenador			varchar(76),
	Distrito_Entrenador			varchar(30) NOT NULL,
	Canton_Entrenador			varchar(30) NOT NULL,
	Provincia_Entrenador		varchar(10) NOT NULL,
	Pais_Entrenador				varchar(20) NOT NULL,
	Direccion_Entrenador		varchar(150) NOT NULL,
	Cuenta_Bancaria_Entrenador	varchar(20) NOT NULL,
	Gimnasio_Entrenador			bit NOT NULL,
	Natacion_Entrenador			bit NOT NULL,
	Maraton_Entrenador			bit NOT NULL,
	Ciclismo_Entrenador			bit NOT NULL,
	Activo_Entrenador			bit NOT NULL
);

CREATE TABLE VACACIONES_ENTRENADOR(
	Cod_Entrenador					int NOT NULL,
	Inicio_Vacaciones_Entrenador	date NOT NULL,
	Cantidad_Vacaciones_Entrenador	tinyint NOT NULL,
	Detalle_Vacaciones_Entrenador	varchar(150) NOT NULL
);

CREATE TABLE CERTIFICACIONES_ENTRENADOR(
	ID_Certificacion			int IDENTITY,
	Cod_Entrenador				int NOT NULL,
	Tipo_Certificacion			varchar(50) NOT NULL,
	Descripcion_Certificacion	varchar(150) NOT NULL
);

CREATE TABLE REGISTRO_HORAS_LABORADAS_ENTRENADOR(
	ID_Registro_Horas_Laboradas_Entrenador	int IDENTITY,
	Cod_Entrenador							int NOT NULL,
	Dia_Laborado_Entrenador					date NOT NULL,
	Detalle_Dia_Laborado_Entrenador			varchar(150)
);

CREATE TABLE HORARIOS_ENTRENADOR(
	ID_Registro_Horas_Laboradas_Entrenador	int NOT NULL,
	Entrada1_Entrenador						time(0) NOT NULL,
	Salida1_Entrenador						time(0) NOT NULL,
	Detalle_Horario1_Entrenador				varchar(150) NOT NULL,
	Entrada2_Entrenador						time(0),
	Salida2_Entrenador						time(0),
	Detalle_Horario2_Entrenador				varchar(150),
	Entrada3_Entrenador						time(0),
	Salida3_Entrenador						time(0),
	Detalle_Horario3_Entrenador				varchar(150),
	Entrada4_Entrenador						time(0),
	Salida4_Entrenador						time(0),
	Detalle_Horario4_Entrenador				varchar(150)
);

CREATE TABLE INCAPACIDADES_EVENTOS(
	Cod_Entrenador				int NOT NULL,
	Fecha_Incapacidad_Evento	date NOT NULL,
	Tipo_Incapacidad_Evento		varchar(50) NOT NULL,
	Dias_Incapacidad_Evento		tinyint NOT NULL,
	Detalle_Incapacida_Evento	varchar(150) NOT NULL
);

CREATE TABLE ESTUDIANTES(
	Cod_Estudiante				int IDENTITY,
	ID_Matricula				int NOT NULL,
	ID_Estudiante				varchar(50) NOT NULL,
	Nombre_Estudiante			varchar(20) NOT NULL,
	Apellido1_Estudiante		varchar(20) NOT NULL,
	Apellido2_Estudiante		varchar(20) NOT NULL,
	Nacimiento_Estudiante		date NOT NULL,
	Telefono1_Estudiante		varchar(30) NOT NULL,
	Telefono2_Estudiante		varchar(30),
	Email1_Estudiante			varchar(76) NOT NULL,
	Email2_Estudiante			varchar(76),
	Distrito_Estudiante			varchar(30) NOT NULL,
	Canton_Estudiante			varchar(30) NOT NULL,
	Provincia_Estudiante		varchar(10) NOT NULL,
	Pais_Estudiante				varchar(20) NOT NULL,
	Direccion_Estudiante		varchar(150) NOT NULL,
	Observacion_Estudiante		varchar(150) NOT NULL,
	Activo_Estudiante			bit NOT NULL
);

CREATE TABLE MATRICULAS(
	ID_Matricula				int IDENTITY,
	Fecha_Matricula				date NOT NULL,
	Estado_Matricula			varchar(15) NOT NULL,
	Nota_Final					tinyint NOT NULL,
	Monto_Cancelado_Matricula	smallmoney NOT NULL,
	Tipo_Cobro_Matricula		varchar(20) NOT NULL,
	Tipo_Pago_Matricula			varchar(15) NOT NULL,
	Detalle_Matricula			varchar(150)
);

CREATE TABLE MODULOS_ABIERTOS(
	ID_Modulo_Abierto				int IDENTITY NOT NULL,
	ID_Matricula					int NOT NULL,
	ID_Modulo						int NOT NULL,
	Cod_Entrenador					int NOT NULL,
	Dias_Modulo_Abierto				varchar(50) NOT NULL,
	Horario_Modulo_Abierto			varchar(50) NOT NULL,
	Fecha_Inicio_Modulo_Abierto		date NOT NULL,
	Detalles_Modulo_Abierto			varchar(150) 
);

CREATE TABLE MODULOS(
	ID_Modulo			int IDENTITY,
	Nombre_Modulo		varchar(15) NOT NULL,
	Duracion_Modulo		varchar(10) NOT NULL,
	Requisitos_Modulo	varchar(150) NOT NULL,
	Detalle_Modulo		varchar(150) NOT NULL
);

CREATE TABLE MODULOS_PROGRAMAS(
	ID_Modulo_Programa	int IDENTITY,
	ID_Modulo			int NOT NULL,
	ID_Programa			int NOT NULL
);

CREATE TABLE PROGRAMAS(
	ID_Programa				int IDENTITY,
	Nombre_Programa			varchar(15) NOT NULL,
	Descripcion_Programa	varchar(150) NOT NULL,
	Requisitos_Programa		varchar(150) NOT NULL,
	Observaciones_Programa	varchar(150) NOT NULL,
	Adicional_Programa		varchar(150) NOT NULL
);

--	**************************************** Modificacion Tablas ****************************************


-- _______________________ INSTITUTOS _______________________

ALTER TABLE INSTITUTOS ADD
	-- PK
	CONSTRAINT PK_ID_Instituto PRIMARY KEY (ID_Instituto),
	-- CHK
	CONSTRAINT CHK_Provincia_Instituto CHECK (Provincia_Instituto = upper(Provincia_Instituto) AND 
		Provincia_Instituto IN ('SAN JOSE','ALAJUELA','CARTAGO','HEREDIA','GUANACASTE','PUNTARENAS','LIMON')),
	-- DF
	CONSTRAINT DF_Activo_Instituto DEFAULT (1) FOR Activo_Instituto
;

-- _______________________ ENTRENADORES _______________________

ALTER TABLE ENTRENADORES ADD
	-- PK
	CONSTRAINT PK_Cod_Entrenador PRIMARY KEY (Cod_Entrenador),
	-- FK
	CONSTRAINT FK_ID_Instituto_Entrenadores FOREIGN KEY (ID_Instituto)
		REFERENCES INSTITUTOS (ID_Instituto)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,
	-- UC
	CONSTRAINT UC_ID_Entrenador UNIQUE (ID_Entrenador),
	-- CHK
	CONSTRAINT CHK_Provincia_Entrenador CHECK (Provincia_Entrenador = upper(Provincia_Entrenador) AND 
		Provincia_Entrenador IN ('SAN JOSÉ','ALAJUELA','CARTAGO','HEREDIA','GUANACASTE','PUNTARENAS','LIMÓN')),
		-- DF
	CONSTRAINT DF_Gimnasio_Entrenador	DEFAULT (0) FOR Gimnasio_Entrenador,
	CONSTRAINT DF_Natacion_Entrenador	DEFAULT (0) FOR Natacion_Entrenador,
	CONSTRAINT DF_Maraton_Entrenador	DEFAULT (0) FOR Maraton_Entrenador,
	CONSTRAINT DF_Ciclismo_Entrenador	DEFAULT (0) FOR Ciclismo_Entrenador,
	CONSTRAINT DF_Activo_Entrenador		DEFAULT (1) FOR Activo_Entrenador
;

-- _______________________ VACACIONES_ENTRENADORES _______________________

ALTER TABLE VACACIONES_ENTRENADOR ADD
	-- FK
	CONSTRAINT FK_Cod_Entrenador_Vacaciones_Entrenadores FOREIGN KEY (Cod_Entrenador)
		REFERENCES ENTRENADORES (Cod_Entrenador)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,
	-- CHK
	CONSTRAINT CHK_Inicio_Vacaciones_Entrenador CHECK
		(Inicio_Vacaciones_Entrenador >= CONVERT(datetime,CONVERT(varchar(10), getDate(), 103),103)),
	-- DF
	CONSTRAINT DF_Cantidad_Vacaciones_Entrenador DEFAULT (1) FOR Cantidad_Vacaciones_Entrenador
;

-- _______________________ CERTIFICACIONES_ENTRENADOR _______________________

ALTER TABLE CERTIFICACIONES_ENTRENADOR ADD
	-- PK
	CONSTRAINT PK_ID_Certificacion PRIMARY KEY (ID_Certificacion),
	-- FK
	CONSTRAINT FK_Cod_Entrenador_Certificaciones_Entrenador FOREIGN KEY (Cod_Entrenador)
		REFERENCES ENTRENADORES (Cod_Entrenador)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION
;

-- _______________________ REGISTRO_HORAS_LABORADAS_ENTRENADOR _______________________

ALTER TABLE REGISTRO_HORAS_LABORADAS_ENTRENADOR ADD
	-- PK
	CONSTRAINT PK_ID_Registro_Horas_Laboradas_Entrenador PRIMARY KEY (ID_Registro_Horas_Laboradas_Entrenador),
	-- FK
	CONSTRAINT FK_Cod_Entrenador_Registro_Horas_Laboradas_Entrenador FOREIGN KEY (Cod_Entrenador)
		REFERENCES ENTRENADORES (Cod_Entrenador)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION
;

-- _______________________ HORARIOS_ENTRENADOR _______________________

ALTER TABLE HORARIOS_ENTRENADOR ADD
	-- FK
	CONSTRAINT FK_ID_Registro_Horas_Laboradas_Entrenador_Horarios_Entrenador FOREIGN KEY (ID_Registro_Horas_Laboradas_Entrenador)
		REFERENCES REGISTRO_HORAS_LABORADAS_ENTRENADOR (ID_Registro_Horas_Laboradas_Entrenador)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION
;

-- _______________________ INCAPACIDADES_EVENTOS _______________________

ALTER TABLE INCAPACIDADES_EVENTOS ADD
	-- FK
	CONSTRAINT FK_Cod_Entrenador_Incapacidades_Eventos FOREIGN KEY (Cod_Entrenador)
		REFERENCES ENTRENADORES (Cod_Entrenador)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,
	--CHK
	CONSTRAINT CHK_Fecha_Incapacidad_Evento CHECK
		(Fecha_Incapacidad_Evento >= CONVERT(datetime,CONVERT(varchar(10), getDate(), 103),103)),
	CONSTRAINT CHK_Tipo_Incapacidad_Evento CHECK (Tipo_Incapacidad_Evento = upper(Tipo_Incapacidad_Evento) AND 
		Tipo_Incapacidad_Evento IN ('INCAPACIDAD','EVENTO')),
	-- DF
	CONSTRAINT DF_Dias_Incapacidad_Evento DEFAULT (1) FOR Dias_Incapacidad_Evento
;


-- _______________________ MATRICULAS _______________________

ALTER TABLE MATRICULAS ADD
	-- PK
	CONSTRAINT PK_ID_Matricula PRIMARY KEY (ID_Matricula),
	--CHK
	CONSTRAINT CHK_Fecha_Matricula CHECK
		(Fecha_Matricula >= CONVERT(datetime,CONVERT(varchar(10), getDate(), 103),103)),
	CONSTRAINT CHK_Estado_Matricula CHECK (Estado_Matricula = upper(Estado_Matricula) AND 
		Estado_Matricula IN ('EN CURSO','ABANDONO','APROBADO','REPROBADO')),
	-- DF
	CONSTRAINT DF_Nota_Final				DEFAULT (0) FOR Nota_Final,
	CONSTRAINT DF_Monto_Cancelado_Matricula DEFAULT (0) FOR Monto_Cancelado_Matricula,
	-- CHK
	CONSTRAINT CHK_Tipo_Cobro_Matricula CHECK (Tipo_Cobro_Matricula = upper(Tipo_Cobro_Matricula) AND 
		Tipo_Cobro_Matricula IN ('CURSO','CURSO Y MATRICULA')),
	CONSTRAINT CHK_Tipo_Pago_Matricula CHECK (Tipo_Pago_Matricula = upper(Tipo_Pago_Matricula) AND 
		Tipo_Pago_Matricula IN ('TRANSFERENCIA','SINPE','TARJETA','EFECTIVO','OTRO'))
;


-- _______________________ ESTUDIANTES _______________________

ALTER TABLE ESTUDIANTES ADD
	-- PK
	CONSTRAINT PK_Cod_Estudiante PRIMARY KEY  (Cod_Estudiante),
	-- FK
	CONSTRAINT FK_ID_Matricula_Estudiantes FOREIGN KEY (ID_Matricula)
		REFERENCES MATRICULAS (ID_Matricula)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,
	-- UC
	CONSTRAINT UC_ID_Estudiante UNIQUE (ID_Estudiante),
	-- CHK
	CONSTRAINT CHK_Provincia_Estudiante CHECK (Provincia_Estudiante = upper(Provincia_Estudiante) AND 
		Provincia_Estudiante IN ('SAN JOSÉ','ALAJUELA','CARTAGO','HEREDIA','GUANACASTE','PUNTARENAS','LIMÓN')),
	-- DF
	CONSTRAINT DF_Activo_Estudiante DEFAULT (1) FOR Activo_Estudiante
;


-- _______________________ MODULOS _______________________

ALTER TABLE MODULOS ADD
	-- PK
	CONSTRAINT PK_ID_Modulo PRIMARY KEY (ID_Modulo)
;


-- _______________________ MODULOS_ABIERTOS _______________________

ALTER TABLE MODULOS_ABIERTOS ADD
	-- PK
	CONSTRAINT PK_ID_Modulo_Abierto PRIMARY KEY (ID_Modulo_Abierto),
	-- FK
	CONSTRAINT FK_ID_Matricula_Modulos_Abiertos FOREIGN KEY (ID_Matricula)
		REFERENCES MATRICULAS (ID_Matricula)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,
	CONSTRAINT FK_ID_Modulo_Modulos_Abiertos FOREIGN KEY (ID_Modulo)
		REFERENCES MODULOS (ID_Modulo)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,
	CONSTRAINT FK_Cod_Entrenador_Modulos_Abiertos FOREIGN KEY (Cod_Entrenador)
		REFERENCES ENTRENADORES (Cod_Entrenador)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,
	--CHK
	CONSTRAINT CHK_Fecha_Inicio_Modulo_Abierto CHECK
		(Fecha_Inicio_Modulo_Abierto >= CONVERT(datetime,CONVERT(varchar(10), getDate(), 103),103))
;


-- _______________________ PROGRAMAS _______________________

ALTER TABLE PROGRAMAS ADD
	-- PK
	CONSTRAINT PK_ID_Programa PRIMARY KEY (ID_Programa)
;



-- _______________________ MODULOS_PROGRAMAS _______________________

ALTER TABLE MODULOS_PROGRAMAS ADD
	-- PK
	CONSTRAINT PK_ID_Modulo_Programa PRIMARY KEY (ID_Modulo_Programa),
	-- FK
	CONSTRAINT FK_ID_Modulo_Modulos_Programas FOREIGN KEY (ID_Modulo)
		REFERENCES MODULOS (ID_Modulo)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,
	CONSTRAINT FK_ID_Programa_Modulos_Programas FOREIGN KEY (ID_Programa)
		REFERENCES PROGRAMAS (ID_Programa)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION
;

-- *********************************** DEFAULTS ***********************************