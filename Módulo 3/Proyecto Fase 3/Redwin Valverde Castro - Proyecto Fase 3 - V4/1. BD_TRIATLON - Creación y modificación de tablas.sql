/* Base de Datos para el: Instituto Especializado de Entrenamiento en Triatlón (IEET)
   INA
   Redwin Valverde Castro
*/

CREATE DATABASE BD_TRIATLON_Redwin_F3
GO

USE BD_TRIATLON_Redwin_F3
GO

-- *********************************** Creacion de tablas ***********************************

CREATE TABLE INSTITUTOS(
	Cod_Instituto		smallint IDENTITY, -- PK
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
	Activo_Instituto	bit
);

CREATE TABLE HORARIOS_ENTRENADORES(
	Cod_Horario_Entr			int IDENTITY, -- PK
	L_Hor						bit NOT NULL,
	K_Hor						bit NOT NULL,
	M_Hor						bit NOT NULL,
	J_Hor						bit NOT NULL,
	V_Hor						bit NOT NULL,
	S_Hor						bit NOT NULL,
	D_Hor						bit NOT NULL,	
	Hora_Inicio_Hor				time(0) NOT NULL,
	Hora_Fin_Hor				time(0) NOT NULL,
	Horas_Diarias				tinyint,
	Descripcion_Horario			varchar(200) NOT NULL
);

CREATE TABLE ENTRENADORES(
	Cod_Entrenador				int IDENTITY, -- PK
	Cod_Horario_Entr			int NOT NULL, -- FK
	Cod_Instituto				smallint NOT NULL, -- FK
	ID_Entrenador				varchar(50) NOT NULL, -- UNIQUE
	Nombre_Entrenador			varchar(20) NOT NULL,
	Apellido1_Entrenador		varchar(20) NOT NULL,
	Apellido2_Entrenador		varchar(20) NOT NULL,
	Nacimiento_Entrenador		date NOT NULL,
	Edad_Ingreso_Entrenador		tinyint,
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
	Activo_Entrenador			bit
);

CREATE TABLE MODULOS_ELEGIDOS(
	Cod_Modulo_Elegido			int IDENTITY, -- PK
	Cod_Entrenador				int NOT NULL, -- FK
	Tipo_Modulo_Elegido			varchar(50) NOT NULL,
	Fecha_Modulo_Elegido		date NOT NULL,
	Descripcion_Modulo_Elegido	varchar(150)
);

CREATE TABLE VACACIONES_INCAPACIDADES_EVENTOS(
	Cod_Vac_Inc_Evento				int IDENTITY, -- PK
	Cod_Entrenador					int NOT NULL, -- FK
	Tipo_Evento						varchar(30) NOT NULL,
	Fecha_Inicio					date NOT NULL,
	Fecha_Final						date NOT NULL,
	Detalle_Evento					varchar(150)
);

CREATE TABLE REGISTRO_HORAS_LABORADAS(
	Cod_Registro_Horas_Laboradas	int IDENTITY, -- PK
	Cod_Entrenador					int NOT NULL, -- FK
	Fecha_laborada					date NOT NULL,
	Hora_Ingreso_Laborada			time(0) NOT NULL,
	Hora_Salida_Laborada			time(0) NOT NULL,
	Detalle_Laborado				varchar(150)
);

-- ****************** ZONA ABAJO ****************** 

CREATE TABLE MODULOS(
	Cod_Modulo				int IDENTITY, -- PK
	Nombre_Modulo			varchar(15) NOT NULL,
	Duracion_Horas_Modulo	decimal(10,2) NOT NULL,
	Requisitos_Modulo		varchar(150) NOT NULL,
	Detalle_Modulo			varchar(150)
);

CREATE TABLE PROGRAMAS(
	Cod_Programa			int IDENTITY, -- PK
	Nombre_Programa			varchar(15) NOT NULL,
	Duracion_Programa		int,
	Descripcion_Programa	varchar(150) NOT NULL,
	Requisitos_Programa		varchar(150) NOT NULL,
	Observaciones_Programa	varchar(150) NOT NULL,
	Adicional_Programa		varchar(150)
);

CREATE TABLE MODULOS_PROGRAMAS(
	Cod_Modulo_Programa	int IDENTITY, -- PK
	Cod_Programa		int NOT NULL, -- FK
	Cod_Modulo			int NOT NULL -- FK
);

CREATE TABLE HORARIOS_MODULOS(
	Cod_Horario_Modulo	int IDENTITY, -- PK
	L_Mod				bit NOT NULL,
	K_Mod				bit NOT NULL,
	M_Mod				bit NOT NULL,
	J_Mod				bit NOT NULL,
	V_Mod				bit NOT NULL,
	S_Mod				bit NOT NULL,
	D_Mod				bit NOT NULL,
	Hora_Inicio_Mod		time(0) NOT NULL,
	Hora_Fin_Mod		time(0) NOT NULL,
	Descripcion_Mod		varchar(150)
);

CREATE TABLE ESTUDIANTES(
	Cod_Estudiante				int IDENTITY, -- PK
	ID_Estudiante				varchar(50) NOT NULL,
	Nombre_Estudiante			varchar(20) NOT NULL,
	Apellido1_Estudiante		varchar(20) NOT NULL,
	Apellido2_Estudiante		varchar(20) NOT NULL,
	Nacimiento_Estudiante		date NOT NULL,
	Edad_Ingreso_Estudiante		tinyint,
	Telefono1_Estudiante		varchar(30) NOT NULL,
	Telefono2_Estudiante		varchar(30),
	Email1_Estudiante			varchar(76) NOT NULL,
	Email2_Estudiante			varchar(76),
	Distrito_Estudiante			varchar(30) NOT NULL,
	Canton_Estudiante			varchar(30) NOT NULL,
	Provincia_Estudiante		varchar(10) NOT NULL,
	Pais_Estudiante				varchar(20) NOT NULL,
	Direccion_Estudiante		varchar(150) NOT NULL,
	Observacion_Estudiante		varchar(150),
	Activo_Estudiante			bit
);

CREATE TABLE MATRICULAS(
	Cod_Matricula				int IDENTITY, -- PK
	Cod_Estudiante				int NOT NULL, -- FK
	Fecha_Matricula				date NOT NULL,
	Estado_Matricula			varchar(15) NOT NULL,
	Monto_Cancelado_Matricula	decimal(10,2) NOT NULL,
	Tipo_Cobro_Matricula		varchar(20) NOT NULL,
	Tipo_Pago_Matricula			varchar(15) NOT NULL,
	Detalle_Matricula			varchar(150)
);

CREATE TABLE MODULOS_ABIERTOS(
	Cod_Modulo_Abierto	int IDENTITY, -- PK
	Cod_Entrenador		int NOT NULL, -- FK
	Cod_Modulo			int NOT NULL, -- FK
	Cod_Horario_Modulo	int NOT NULL, -- FK
	Costo_Modulo		decimal(10,2) NOT NULL,
	Inicio_Mod_A		date NOT NULL,
	Fin_Mod_A			date
);

CREATE TABLE DETALLE_MATRICULA(
	Cod_Modulo_Abierto	int NOT NULL, -- PK, FK
	Cod_Matricula		int NOT NULL, -- PK, FK
	Estado_DM			varchar(15) NOT NULL,
	Nota_Final			int
);







-- ********************************* MODIFICACIÓN TABLAS *********************************

-- _______________________ INSTITUTOS _______________________

ALTER TABLE INSTITUTOS ADD
	-- PK
	CONSTRAINT PK_Cod_Instituto PRIMARY KEY (Cod_Instituto),
	-- CHK
	CONSTRAINT CHK_Provincia_Instituto CHECK (Provincia_Instituto = UPPER(Provincia_Instituto) AND 
		Provincia_Instituto IN ('SAN JOSE','ALAJUELA','CARTAGO','HEREDIA','GUANACASTE','PUNTARENAS','LIMON'))
;





-- _______________________ HORARIOS_ENTRENADORES _______________________

ALTER TABLE HORARIOS_ENTRENADORES ADD
	-- PK
	CONSTRAINT PK_HORARIOS_ENTRENADORES PRIMARY KEY (Cod_Horario_Entr)
;








-- _______________________ ENTRENADORES _______________________

ALTER TABLE ENTRENADORES ADD
	-- PK
	CONSTRAINT PK_Cod_Entrenador PRIMARY KEY (Cod_Entrenador),
	-- FK
	CONSTRAINT FK_ENTRENADORES_HORARIOS FOREIGN KEY (Cod_Horario_Entr)
		REFERENCES HORARIOS_ENTRENADORES (Cod_Horario_Entr)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,
	CONSTRAINT FK_ENTRENADORES_INSTITUTOS FOREIGN KEY (Cod_Instituto)
		REFERENCES INSTITUTOS (Cod_Instituto)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,
	-- UC
	CONSTRAINT UC_ID_Entrenador UNIQUE (ID_Entrenador),
	-- CHK
	CONSTRAINT CHK_Provincia_Entrenador CHECK (Provincia_Entrenador = upper(Provincia_Entrenador) AND 
		Provincia_Entrenador IN ('SAN JOSÉ','ALAJUELA','CARTAGO','HEREDIA','GUANACASTE','PUNTARENAS','LIMÓN'))
;


-- _______________________ MODULOS_ELEGIDOS _______________________

ALTER TABLE MODULOS_ELEGIDOS ADD
	-- PK
	CONSTRAINT PK_MODULOS_ELEGIDOS PRIMARY KEY (Cod_Modulo_Elegido),
	-- FK
	CONSTRAINT FK_MODULOS_ELEGIDOS FOREIGN KEY (Cod_Entrenador)
		REFERENCES ENTRENADORES (Cod_Entrenador)
			ON DELETE NO ACTION
			ON UPDATE NO ACTION
;









-- _______________________ VACACIONES_INCAPACIDADES_EVENTOS _______________________

ALTER TABLE VACACIONES_INCAPACIDADES_EVENTOS ADD
	-- PK
	CONSTRAINT PK_INCAPACIDADES_EVENTOS PRIMARY KEY (Cod_Vac_Inc_Evento),
	-- FK
	CONSTRAINT FK_Vac_Inc_Eventos_Entrenadores FOREIGN KEY (Cod_Entrenador)
		REFERENCES ENTRENADORES (Cod_Entrenador)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,
	-- CHK
	CONSTRAINT CHK_Tipo_Evento CHECK (Tipo_Evento = upper(Tipo_Evento) AND 
		Tipo_Evento IN ('VACACIONES','INCAPACIDAD','PERMISO','LICENCIA','OTROS')),
	CONSTRAINT CHK_Fecha_Inicio CHECK
		(Fecha_Inicio >= CONVERT(date,CONVERT(varchar(10), getDate(), 103),103)),
	CONSTRAINT CHK_Fecha_Final CHECK
		(Fecha_Final >= CONVERT(date,CONVERT(varchar(10), getDate(), 103),103))
;




-- _______________________ REGISTRO_HORAS_LABORADAS _______________________

ALTER TABLE REGISTRO_HORAS_LABORADAS ADD
	-- PK
	CONSTRAINT PK_Cod_Registro_Horas_Laboradas PRIMARY KEY (Cod_Registro_Horas_Laboradas),
	-- FK
	CONSTRAINT FK_Registro_Horas_Laboradas_Entrenador FOREIGN KEY (Cod_Entrenador)
		REFERENCES ENTRENADORES (Cod_Entrenador)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,
	-- CHK
	CONSTRAINT CHK_Fecha_Laborada CHECK
		(Fecha_Laborada >= CONVERT(date,CONVERT(varchar(10), getDate(), 103),103))
;


-- ****************** ZONA ABAJO ****************** 

-- _______________________ MODULOS _______________________

ALTER TABLE MODULOS ADD
	-- PK
	CONSTRAINT PK_Modulo PRIMARY KEY (Cod_Modulo)
;





-- _______________________ PROGRAMAS _______________________

ALTER TABLE PROGRAMAS ADD
	-- PK
	CONSTRAINT PK_Cod_Programa PRIMARY KEY (Cod_Programa)
;




-- _______________________ MODULOS_PROGRAMAS _______________________

ALTER TABLE MODULOS_PROGRAMAS ADD
	-- PK
	CONSTRAINT PK_Cod_Modulo_Programa PRIMARY KEY (Cod_Modulo_Programa),
	-- FK
	CONSTRAINT FK_Cod_Modulo_Modulos_Programas FOREIGN KEY (Cod_Modulo)
		REFERENCES MODULOS (Cod_Modulo)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,
	CONSTRAINT FK_Cod_Programa_Modulos_Programas FOREIGN KEY (Cod_Programa)
		REFERENCES PROGRAMAS (Cod_Programa)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION
;






-- _______________________ HORARIOS_MODULOS _______________________

ALTER TABLE HORARIOS_MODULOS ADD
	-- PK
	CONSTRAINT PK_HORARIOS_MODULOS PRIMARY KEY (Cod_Horario_Modulo)
;






-- _______________________ ESTUDIANTES _______________________

ALTER TABLE ESTUDIANTES ADD
	-- PK
	CONSTRAINT PK_Cod_Estudiante PRIMARY KEY  (Cod_Estudiante),
	-- UC
	CONSTRAINT UC_ID_Estudiante UNIQUE (ID_Estudiante),
	-- CHK
	CONSTRAINT CHK_Provincia_Estudiante CHECK (Provincia_Estudiante = UPPER(Provincia_Estudiante) AND 
		Provincia_Estudiante IN ('SAN JOSÉ','ALAJUELA','CARTAGO','HEREDIA','GUANACASTE','PUNTARENAS','LIMÓN'))
;







-- _______________________ MATRICULAS _______________________

ALTER TABLE MATRICULAS ADD
	-- PK
	CONSTRAINT PK_Matriculas PRIMARY KEY (Cod_Matricula),
	-- FK
	CONSTRAINT FK_MATRICULAS_ESTUDIANTES FOREIGN KEY (Cod_Estudiante)
		REFERENCES ESTUDIANTES (Cod_Estudiante)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,
	-- CHK
	CONSTRAINT CHK_Fecha_Matricula CHECK
		(Fecha_Matricula >= CONVERT(datetime,CONVERT(varchar(10), getDate(), 103),103)),
	CONSTRAINT CHK_Estado_Matricula CHECK (Estado_Matricula = upper(Estado_Matricula) AND 
		Estado_Matricula IN ('EN CURSO','ABANDONO','APROBADO','REPROBADO')),
	-- CHK
	CONSTRAINT CHK_Monto_Cancelado_Matricula CHECK
		(Monto_Cancelado_Matricula >= 0),
	CONSTRAINT CHK_Tipo_Cobro_Matricula CHECK (Tipo_Cobro_Matricula = upper(Tipo_Cobro_Matricula) AND 
		Tipo_Cobro_Matricula IN ('CURSO','CURSO Y MATRICULA')),
	CONSTRAINT CHK_Tipo_Pago_Matricula CHECK (Tipo_Pago_Matricula = upper(Tipo_Pago_Matricula) AND 
		Tipo_Pago_Matricula IN ('TRANSFERENCIA','SINPE','TARJETA','EFECTIVO','OTRO'))
;





-- _______________________ MODULOS_ABIERTOS _______________________

ALTER TABLE MODULOS_ABIERTOS ADD
	-- PK
	CONSTRAINT PK_Modulo_Abierto PRIMARY KEY (Cod_Modulo_Abierto),
	-- FK
	CONSTRAINT FK_MODULOS_ABIERTOS_ENTRENADORES FOREIGN KEY (Cod_Entrenador)
		REFERENCES ENTRENADORES (Cod_Entrenador)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,
	CONSTRAINT FK_MODULOS_ABIERTOS_MODULOS FOREIGN KEY (Cod_Modulo)
		REFERENCES MODULOS (Cod_Modulo)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,
	CONSTRAINT FK_MODULOS_ABIERTOS_HORARIOS_MODULOS FOREIGN KEY (Cod_Horario_Modulo)
		REFERENCES HORARIOS_MODULOS (Cod_Horario_Modulo)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,
	--CHK
	CONSTRAINT CHK_Costo_Modulo CHECK 
			(Costo_Modulo >= 0),
	CONSTRAINT CHK_Inicio_Mod_A CHECK
		(Inicio_Mod_A >= CONVERT(datetime,CONVERT(varchar(10), getDate(), 103),103))
;





-- _______________________ DETALLE_MATRICULA _______________________

ALTER TABLE DETALLE_MATRICULA ADD
	-- PK
	CONSTRAINT PK_DETALLE_MATRICULA PRIMARY KEY (Cod_Modulo_Abierto, Cod_Matricula),
	-- FK
	CONSTRAINT FK_DETALLE_MATRICULA_MODULOS_ABIERTOS FOREIGN KEY (Cod_Modulo_Abierto)
		REFERENCES MODULOS_ABIERTOS (Cod_Modulo_Abierto)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,
	CONSTRAINT FK_DETALLE_MATRICULA_MATRICULAS FOREIGN KEY (Cod_Matricula)
		REFERENCES MATRICULAS (Cod_Matricula)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,
	-- CHK
	CONSTRAINT CHK_Estado_DM CHECK (Estado_DM = upper(Estado_DM) AND 
		Estado_DM IN ('MATRICULADO','APROBADO','REPROBADO','DESERTÓ')),
	CONSTRAINT CHK_Nota_Final CHECK
		(Nota_Final >= 0);