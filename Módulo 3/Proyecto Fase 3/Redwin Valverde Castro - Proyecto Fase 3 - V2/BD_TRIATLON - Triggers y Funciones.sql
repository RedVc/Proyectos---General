USE BD_TRIATLON_Redwin_F3
GO

--	**************************************** Modificacion Tablas y Triggers ****************************************


-- _______________________ INSTITUTOS _______________________

ALTER TABLE INSTITUTOS ADD
	-- PK
	CONSTRAINT PK_Cod_Instituto PRIMARY KEY (Cod_Instituto),
	-- CHK
	CONSTRAINT CHK_Provincia_Instituto CHECK (Provincia_Instituto = UPPER(Provincia_Instituto) AND 
		Provincia_Instituto IN ('SAN JOSE','ALAJUELA','CARTAGO','HEREDIA','GUANACASTE','PUNTARENAS','LIMON'))
;

-- TRIGGERS
-- 1 --
GO
CREATE OR ALTER TRIGGER TR_DEFAULT_INSTITUTOS
ON INSTITUTOS FOR INSERT
AS
	UPDATE	INSTITUTOS
	SET		Activo_Instituto = 1
	FROM	inserted i
	WHERE	INSTITUTOS.Cod_Instituto = i.Cod_Instituto
GO

-- 2 --



-- ------------- --
INSERT INTO INSTITUTOS
						(Nombre_Instituto,
						Telefono1_Instituto,
						Telefono2_Instituto,
						Email1_Instituto,
						Email2_Instituto,
						SitioWeb_Instituto,
						Horario_Instituto,
						Distrito_Instituto,
						Canton_Instituto,
						Provincia_Instituto,
						Pais_Instituto,
						Direccion_Instituto)
				VALUES	('IEET',
						 '800-TRIATLON',
						 NULL,
						 'InstitutoEspecializadoTriatlon@gmail.com',
						 NULL,
						 'triatloncr.cr',
						 'de 8am a 6pm',
						 'San Juan',
						 'San Ramón',
						 'Alajuela',
						 'Costa Rica',
						 '500 metros norte de la Iglesia'
						 );
SELECT * FROM INSTITUTOS;
-- -------------- --




-- _______________________ HORARIOS_ENTRENADORES _______________________

ALTER TABLE HORARIOS_ENTRENADORES ADD
	-- PK
	CONSTRAINT PK_HORARIOS_ENTRENADORES PRIMARY KEY (Cod_Horario_Entr)
;

-- TRIGGERS
-- 1 --



-- 2 --


-- ----------- --
INSERT INTO HORARIOS_ENTRENADORES
								(L_Hor, K_Hor, M_Hor, J_Hor, V_Hor, S_Hor, D_Hor, Hora_Inicio_Hor, Hora_Fin_Hor,Descripcion_Horario)
						VALUES	(1,		1,		1,		0,	0,		0,		0,		'7am',			'11am',		'Lunes a miercoles de 7am a 11am');
SELECT * FROM HORARIOS_ENTRENADORES;
-- ----------- --


-- _______________________ ENTRENADORES _______________________

ALTER TABLE ENTRENADORES ADD
	-- PK
	CONSTRAINT PK_Cod_Entrenador PRIMARY KEY (Cod_Entrenador),
	-- FK
	CONSTRAINT FK_ENTRENADORES_HORARIOS FOREIGN KEY (Cod_Horario_Entr)
		REFERENCES HORARIOS_ENTRENADORES (Cod_Horario_Entr)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION,
	-- UC
	CONSTRAINT UC_ID_Entrenador UNIQUE (ID_Entrenador),
	-- CHK
	CONSTRAINT CHK_Provincia_Entrenador CHECK (Provincia_Entrenador = upper(Provincia_Entrenador) AND 
		Provincia_Entrenador IN ('SAN JOSÉ','ALAJUELA','CARTAGO','HEREDIA','GUANACASTE','PUNTARENAS','LIMÓN'))
;

-- TRIGGERS
-- 1 --
GO
CREATE OR ALTER TRIGGER TR_DEFAULT_ENTRENADORES
ON ENTRENADORES FOR INSERT
AS
	UPDATE	ENTRENADORES
	SET		Activo_Entrenador = 1
	FROM	inserted i
	WHERE	ENTRENADORES.Cod_Entrenador = i.Cod_Entrenador
GO

-- 2 --

-- -------------------- --
INSERT INTO ENTRENADORES
						(Cod_Horario_Entr ,ID_Entrenador, Nombre_Entrenador, Apellido1_Entrenador, Apellido2_Entrenador, Nacimiento_Entrenador, Telefono1_Entrenador, Telefono2_Entrenador, Email1_Entrenador,			Email2_Entrenador,			Distrito_Entrenador, Canton_Entrenador, Provincia_Entrenador, Pais_Entrenador, Direccion_Entrenador,				     Cuenta_Bancaria_Entrenador)
				VALUES	(1,					'207890555',	  'Erik',			 'Rashid',			   'Benedic',			 '19660531',			'86638521',			  '45632145',		    'erikBene@hotmail.com',		'erikBene2@gmail.com',		'Cahuita',           'Talamanca',		'Limón',			  'Costa Rica',	   '80 metros noreste salón comunal',	     'CR45698712345678564'),
					    (1,					'206560456',	  'Ábrahám',		 'Zlatko',			   'Amator',			 '19780716',			'84569212',			  '56321245',		    'amator15@gmail.com',		'amator@ina.cr',			'Roxana',			 'Pococí',			'Limón',			  'Costa Rica',	   'Frente a la plaza principal',	         'BR46564545468789362'),
						(1,					'206710854',	  'Ozi',			 'Fortunato',		   'Siena',				 '19790626',			'86322547',			  '85264921',		    'oziSiena@gmail.com',		'oziFortunato@hotmail.com', 'Las Juntas',		 'Abangares',	    'Guanacaste',		  'Costa Rica',	   '50 metros sur de la Escuela Rodrigo',    'BN85274196326547462'),
						(1,					'203250855',	  'Kestrel',		 'Sybil',			   'Louise',			 '19961227',			'89321475',			  '65321457',		    'kestelSybil@hotmail.com',  'kestelSybil2@gmail.com',   'San Antonio',		 'Desamparados',    'San José',			  'Costa Rica',	   'Frente al ebais',				         'PJ54876512327889561'),
						(1,					'205550856',	  'Aleah',			 'Winslow',			   'Merril',			 '19821101',			'44026532',			  '78542136',		    'AleahMerril13@gmail.com',  'AleahMerril13@ina.cr',     'Naranjito',		 'Quepos',			'Puntarenas',		  'Costa Rica',	   '100 metros sueste del abastecedor Rita', 'FN85632197659863197');
SELECT * FROM ENTRENADORES;
-- -------------------- --

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

-- TRIGGERS
-- 1 --



-- 2 --


-- ----------------- --
INSERT INTO VACACIONES_INCAPACIDADES_EVENTOS
											(Cod_Entrenador, Tipo_Evento, Fecha_Inicio, Fecha_Final, Detalle_Evento)
									VALUES	(1,				'Vacaciones', '20210809',	'20210816',		NULL);
SELECT * FROM VACACIONES_INCAPACIDADES_EVENTOS;
-- ----------------- --




/*
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
*/