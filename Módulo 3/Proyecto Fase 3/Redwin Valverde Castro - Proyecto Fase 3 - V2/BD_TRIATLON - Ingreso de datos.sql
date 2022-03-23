/* Base de Datos para el: Instituto Especializado de Entrenamiento en Triatlón (IEET)
   INA
   Redwin Valverde Castro

   ******************************************* INGRESO DE DATOS A LAS TABLAS *******************************************
*/

-- Llenar cada tabla con 10 registros, en el caso de que no sea posible, justificar

USE BD_TRIATLON_Redwin_F3
GO


-- ********************************************** INSTITUTOS **********************************************

-- En este caso solo ingresaré un registro a la tabla INSTITUTOS porque solo hay uno, pero queda abierta la posibilidad para más

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
						 Direccion_Instituto,
						 Activo_Instituto)
				VALUES	('IEET',
						 '800-TRIATLON',
						 80055632,
						 'InstitutoEspecializadoTriatlon@gmail.com',
						 'riatlonCR@gmail.com',
						 'triatloncr.cr',
						 'de 8am a 6pm',
						 'San Juan',
						 'San Ramón',
						 'Alajuela',
						 'Costa Rica',
						 '500 metros norte de la Iglesia',
						 1);

--SELECT * FROM INSTITUTOS;

--DELETE FROM INSTITUTOS;





-- ********************************************** ENTRENADORES **********************************************

-- Ingreso de datos completos NOT NULL

INSERT INTO ENTRENADORES
						(ID_Instituto, ID_Entrenador, Nombre_Entrenador, Apellido1_Entrenador, Apellido2_Entrenador, Nacimiento_Entrenador, Telefono1_Entrenador, Telefono2_Entrenador, Email1_Entrenador,			Email2_Entrenador,			Distrito_Entrenador, Canton_Entrenador, Provincia_Entrenador, Pais_Entrenador, Direccion_Entrenador,				     Cuenta_Bancaria_Entrenador, Gimnasio_Entrenador, Natacion_Entrenador, Maraton_Entrenador, Ciclismo_Entrenador, Activo_Entrenador)
				VALUES	(1,			   '207890555',	  'Erik',			 'Rashid',			   'Benedic',			 '19660531',			'86638521',			  '45632145',		    'erikBene@hotmail.com',		'erikBene2@gmail.com',		'Cahuita',           'Talamanca',		'Limón',			  'Costa Rica',	   '80 metros noreste salón comunal',	     'CR45698712345678564',		 1,					  0,				   1,				   0,					1),
					    (1,			   '206560456',	  'Ábrahám',		 'Zlatko',			   'Amator',			 '19780716',			'84569212',			  '56321245',		    'amator15@gmail.com',		'amator@ina.cr',			'Roxana',			 'Pococí',			'Limón',			  'Costa Rica',	   'Frente a la plaza principal',	         'BR46564545468789362',		 0,					  1,				   0,				   1,					0),
						(1,			   '206710854',	  'Ozi',			 'Fortunato',		   'Siena',				 '19790626',			'86322547',			  '85264921',		    'oziSiena@gmail.com',		'oziFortunato@hotmail.com', 'Las Juntas',		 'Abangares',	    'Guanacaste',		  'Costa Rica',	   '50 metros sur de la Escuela Rodrigo',    'BN85274196326547462',		 1,					  0,				   1,				   0,					1),
						(1,			   '203250855',	  'Kestrel',		 'Sybil',			   'Louise',			 '19961227',			'89321475',			  '65321457',		    'kestelSybil@hotmail.com',  'kestelSybil2@gmail.com',   'San Antonio',		 'Desamparados',    'San José',			  'Costa Rica',	   'Frente al ebais',				         'PJ54876512327889561',		 0,					  1,				   0,				   1,					1),
						(1,			   '205550856',	  'Aleah',			 'Winslow',			   'Merril',			 '19821101',			'44026532',			  '78542136',		    'AleahMerril13@gmail.com',  'AleahMerril13@ina.cr',     'Naranjito',		 'Quepos',			'Puntarenas',		  'Costa Rica',	   '100 metros sueste del abastecedor Rita', 'FN85632197659863197',		 1,					  0,				   0,				   0,					1);

-- Ingreso de datos completos NULL

INSERT INTO ENTRENADORES
						(ID_Instituto, ID_Entrenador, Nombre_Entrenador, Apellido1_Entrenador, Apellido2_Entrenador, Nacimiento_Entrenador, Telefono1_Entrenador, Email1_Entrenador,	     Distrito_Entrenador, Canton_Entrenador, Provincia_Entrenador, Pais_Entrenador, Direccion_Entrenador,					   Cuenta_Bancaria_Entrenador,  Gimnasio_Entrenador, Natacion_Entrenador, Maraton_Entrenador, Ciclismo_Entrenador, Activo_Entrenador)
				VALUES  (1,			   '207890853',	  'Redwin',			 'Valverde',		   'Castro',			 '19990313',			'86639700',			  'redvc13.03@gmail.com',    'Piedades Norte',	  'San Ramón',		 'Alajuela',		   'Costa Rica',    'Frente al abastecedor La Esperanza',	   'BR46564455321315487',	    1,					 1,				      1,				  1,				   1),
						(1,			   '305690741',	  'Alexa',			 'Ramirez',			   'Valerio',			 '19650815',			'87862522',			  'lexaValerio@hotmail.com', 'La Granja',		  'Palmares',		 'Alajuela',		   'Costa Rica',	'500 metros norte de la cancha de futbol', 'CR15158787864565489',		0,					 1,					  0,				  0,				   1),
						(1,			   '705140134',	  'Ari',			 'Peggy',			   'Pauletta',			 '19850422',			'65782431',			  'aripeggy@ina.com',		 'Bajo Tejar',		  'San Ramón',		 'Alajuela',		   'Costa Rica',	'100 metros sur buses Empresarios Unidos', 'BN54548787543121587',		1,					 0,					  1,				  0,				   0),
						(1,			   '604470878',	  'Millard',		 'Ulric',			   'Patrik',			 '19740331',			'45896321',			  'millardPatrik@gmail.com', 'Merced',			  'San José',		 'San José',		   'Costa Rica',	'50 sur de la escuela Juan Antonio',	   'CR55565687897892131',		0,					 1,					  0,				  0,				   1),
						(1,			   '104180798',	  'Pavel',			 'Lilibet',			   'Maleah',			 '19931224',			'65478923',			  'soloPavel@hotmail.com',	 'San Roque',		  'Barva',			 'Heredia',			   'Costa Rica',	'75 metros este abastecedor Los Jardines', 'BR85747454653215748',		0,					 0,					  1,				  1,				   1);

--SELECT * FROM ENTRENADORES;

--DELETE FROM ENTRENADORES;

CREATE INDEX IDX_Nombre_Entrenador ON ENTRENADORES (Nombre_Entrenador);
-- CREATE INDEX IDX_Nombre_Entrenador ON ENTRENADORES (Nombre_Entrenador DESC);

CREATE INDEX IDX_Apellido1_Entrenador ON ENTRENADORES (Apellido1_Entrenador);
-- CREATE INDEX IDX_Apellido1_Entrenador ON ENTRENADORES (Apellido1_Entrenador DESC);

CREATE INDEX IDX_Nacimiento_Entrenador ON ENTRENADORES (Nacimiento_Entrenador);
-- CREATE INDEX IDX_Nacimiento_Entrenador ON ENTRENADORES (Nacimiento_Entrenador DESC);

CREATE INDEX IDX_Canton_Entrenador ON ENTRENADORES (Canton_Entrenador);
-- CREATE INDEX IDX_Canton_Entrenador ON ENTRENADORES (Canton_Entrenador DESC);



-- ********************************************** VACACIONES_ENTRENADOR **********************************************

-- El Cod_Entrenador debe existir antes para poder crear el enlace

INSERT INTO VACACIONES_ENTRENADOR
								 (Cod_Entrenador, Inicio_Vacaciones_Entrenador, Cantidad_Vacaciones_Entrenador, Detalle_Vacaciones_Entrenador)
						VALUES	 (5,			  '20220313',					5,								'Familia'),
								 (3,			  '20220515',					10,								'Relajación'),
								 (8,			  '20221125',					8,								'Viaje'),
								 (10,			  '20220811',					2,								'Caminata'),
								 (1,			  '20220602',					6,								'Volcán'),
								 (7,			  '20220403',					5,								'Bosque'),
								 (9,			  '20220414',					4,								'Playa'),
								 (2,			  '20220209',					3,								'Familia'),
								 (5,			  '20220710',					4,								'Abuelos'),
								 (3,			  '20221004',					2,								'Hijos');

--SELECT * FROM VACACIONES_ENTRENADOR;

--DELETE FROM VACACIONES_ENTRENADOR;





-- ********************************************** CERTIFICACIONES_ENTRENADOR **********************************************

-- NOTA: Certificación referente a cada curso
INSERT INTO CERTIFICACIONES_ENTRENADOR
									  (Cod_Entrenador, Tipo_Certificacion, Descripcion_Certificacion)
							VALUES	  (5,			   'Trabajo',		   'Gozo de trabajo'),
									  (6,			   'Transporte',	   'Cantidad dada por transporte'),
									  (2,			   'Salario',		   'Cantidad neta de salario'),
									  (1,			   'Trabajo',		   'Gozo de trabajo'),
									  (3,			   'Trabajo',		   'Gozo de trabajo'),
									  (9,			   'Salario',		   'Cantidad neta de salario'),
									  (5,			   'Transporte',	   'Cantidad dada por transporte'),
									  (5,			   'Salario',		   'Cantidad neta de salario'),
									  (2,			   'Trabajo',		   'Gozo de trabajo'),
									  (7,			   'Transporte',	   'Cantidad dada por transporte');

--SELECT * FROM CERTIFICACIONES_ENTRENADOR;

--DELETE FROM CERTIFICACIONES_ENTRENADOR;





-- ********************************************** REGISTRO_HORAS_LABORADAS_ENTRENADOR **********************************************

INSERT INTO REGISTRO_HORAS_LABORADAS_ENTRENADOR
												(Cod_Entrenador, Dia_Laborado_Entrenador, Detalle_Dia_Laborado_Entrenador)
										VALUES	(1,				 '20220301',			  ''),
												(3,				 '20220301',			  ''),
												(4,				 '20220301',			  ''),
												(5,				 '20220301',			  ''),
												(6,				 '20220301',			  ''),
												(7,				 '20220301',			  ''),
												(9,				 '20220301',			  ''),
												(10,			 '20220301',			  ''),
												(1,				 '20220302',			  ''),
												(3,				 '20220302',			  '');

--SELECT * FROM REGISTRO_HORAS_LABORADAS_ENTRENADOR;

--DELETE FROM REGISTRO_HORAS_LABORADAS_ENTRENADOR;






-- ********************************************** HORARIOS_ENTRENADOR **********************************************

-- Preguntar sobre el uso de TIME y modificar valores de la tabla

INSERT INTO HORARIOS_ENTRENADOR
								(ID_Registro_Horas_Laboradas_Entrenador, Entrada1_Entrenador, Salida1_Entrenador, Detalle_Horario1_Entrenador, Entrada2_Entrenador, Salida2_Entrenador, Detalle_Horario2_Entrenador, Entrada3_Entrenador, Salida3_Entrenador, Detalle_Horario3_Entrenador, Entrada4_Entrenador, Salida4_Entrenador, Detalle_Horario4_Entrenador)
						VALUES	(2,										 '08:00',			  '10:00',			  '',						   '10:00',				'12:00',			'',							 '12:00',			  '02:00',				  '',					   '02:00',				'06:00',					''),
								(3,										 '08:00',			  '10:00',			  '',						   '10:00',				'12:00',			'',							 '12:00',			  '02:00',				  '',					   '02:00',				'06:00',					''),
								(1,										 '08:00',			  '10:00',			  '',						   '10:00',				'12:00',			'',							 '12:00',			  '02:00',				  '',					   '02:00',				'06:00',					''),
								(5,										 '08:00',			  '10:00',			  '',						   '10:00',				'12:00',			'',							 '12:00',			  '02:00',				  '',					   '02:00',				'06:00',					''),
								(10,									 '08:00',			  '10:00',			  '',						   '10:00',				'12:00',			'',							 '12:00',			  '02:00',				  '',					   '02:00',				'06:00',					''),
								(7,										 '08:00',			  '10:00',			  '',						   '10:00',				'12:00',			'',							 '12:00',			  '02:00',				  '',					   '02:00',				'06:00',					''),
								(4,										 '08:00',			  '10:00',			  '',						   '10:00',				'12:00',			'',							 '12:00',			  '02:00',				  '',					   '02:00',				'06:00',					''),
								(9,										 '08:00',			  '10:00',			  '',						   '10:00',				'12:00',			'',							 '12:00',			  '02:00',				  '',					   '02:00',				'06:00',					''),
								(8,										 '08:00',			  '10:00',			  '',						   '10:00',				'12:00',			'',							 '12:00',			  '02:00',				  '',					   '02:00',				'06:00',					''),
								(6,										 '08:00',			  '10:00',			  '',						   '10:00',				'12:00',			'',							 '12:00',			  '02:00',				  '',					   '02:00',				'06:00',					'');

--SELECT * FROM HORARIOS_ENTRENADOR;

--DELETE FROM HORARIOS_ENTRENADOR;




-- ********************************************** INCAPACIDADES_EVENTOS **********************************************

INSERT INTO INCAPACIDADES_EVENTOS
								 (Cod_Entrenador, Fecha_Incapacidad_Evento, Tipo_Incapacidad_Evento, Dias_Incapacidad_Evento, Detalle_Incapacida_Evento)
						VALUES	 (4,			  '20220319',				'Incapacidad',			 2,						  ''),
								 (9,			  '20220615',				'Incapacidad',			 5,						  ''),
								 (1,			  '20220721',				'Evento',				 1,						  ''),
								 (7,			  '20220330',				'Incapacidad',			 3,						  ''),
								 (3,			  '20220716',				'Evento',				 1,						  ''),
								 (5,			  '20220505',				'Evento',				 2,						  ''),
								 (4,			  '20220403',				'Evento',				 3,						  ''),
								 (10,			  '20220609',				'Incapacidad',			 8,						  ''),
								 (9,			  '20221002',				'Incapacidad',			 4,						  ''),
								 (6,			  '20221115',				'Evento',				 1,						  '');

--SELECT * FROM INCAPACIDADES_EVENTOS;

--DELETE FROM INCAPACIDADES_EVENTOS;


-- ========================================================================================================================================================================================================



-- ********************************************** PROGRAMAS **********************************************

-- Solo contiene un registro pero queda abierta la posibilidad para más

INSERT INTO PROGRAMAS
					 (Nombre_Programa, Descripcion_Programa,					Requisitos_Programa, Observaciones_Programa, Adicional_Programa)
			VALUES	 ('Triatlón',	   'Contiene los 4 principales módulos',	'',					 '',					 '');

--SELECT * FROM PROGRAMAS;

--DELETE FROM PROGRAMAS;




-- ********************************************** MODULOS **********************************************

INSERT INTO MODULOS
					(Nombre_Modulo, Duracion_Modulo, Requisitos_Modulo, Detalle_Modulo)
			VALUES	('Gimnasio',	'80 horas',		 '',				''),
					('Natación',	'110 horas',	 '',				''),
					('Maratón',		'120 horas',	 '',				''),
					('Ciclismo',	'90 horas',		 '',				'');

--SELECT * FROM MODULOS;

--DELETE FROM MODULOS;





-- ********************************************** MODULOS_PROGRAMAS **********************************************

-- Solo se llenan 4 campos porque solo hay 4 modulos

INSERT INTO MODULOS_PROGRAMAS
							 (ID_Modulo, ID_Programa)
					VALUES	 (1,		 1),
							 (2,		 1),
							 (3,		 1),
							 (4,		 1);

--SELECT * FROM MODULOS_PROGRAMAS;

--DELETE FROM MODULOS_PROGRAMAS;




-- ========================================================================================================================================================================================================


-- ********************************************** MATRICULAS **********************************************

INSERT INTO MATRICULAS
						(Fecha_Matricula, Estado_Matricula, Nota_Final,	Monto_Cancelado_Matricula, Tipo_Cobro_Matricula, Tipo_Pago_Matricula, Detalle_Matricula)
				VALUES	('20221215',	  'En curso',		70,			15000,					   'Curso',				 'Efectivo',		  ''),
						('20221215',	  'Aprobado',		0,			15000,					   'Curso y matricula',	 'Sinpe',			  ''),
						('20221215',	  'Abandono',		0,			15000,					   'Curso y matricula',	 'Tarjeta',			  ''),
						('20221215',	  'En curso',		80,			15000,					   'Curso',				 'Efectivo',		  ''),
						('20221216',	  'En curso',		95,			15000,					   'Curso',				 'Sinpe',			  ''),
						('20221216',	  'Reprobado',		0,			15000,					   'Curso y matricula',	 'Efectivo',		  ''),
						('20221216',	  'En curso',		92,			15000,					   'Curso',				 'Sinpe',			  ''),
						('20221216',	  'Aprobado',		0,			15000,					   'Curso y matricula',	 'Tarjeta',			  ''),
						('20221217',	  'En curso',		85,			15000,					   'Curso',				 'Efectivo',		  ''),
						('20221217',	  'Aprobado',		0,			15000,					   'Curso y matricula',	 'Sinpe',			  '');

--SELECT * FROM MATRICULAS;

--DELETE FROM MATRICULAS;




-- ********************************************** ESTUDIANTES **********************************************

INSERT INTO ESTUDIANTES
						(ID_Matricula, ID_Estudiante, Nombre_Estudiante, Apellido1_Estudiante, Apellido2_Estudiante, Nacimiento_Estudiante, Telefono1_Estudiante, Telefono2_Estudiante, Email1_Estudiante,			Email2_Estudiante,			Distrito_Estudiante, Canton_Estudiante, Provincia_Estudiante, Pais_Estudiante, Direccion_Estudiante,					 Observacion_Estudiante, Activo_Estudiante)
				VALUES	(10,		   '102540762',	  'Florentina',		 'Santos',			   'Nataniel',			 '20020522',			'84663791',			  '86351925',		    'flornat@hotmail.com',		'flornat2@hotmail.com',		'Piedades Norte',    'San Ramón',		'Alajuela',			  'Costa Rica',	   '30 metros oeste parada de autobus',	     '', 					 1),
					    (5,			   '506980452',	  'Ercilia',		 'Marcelino',		   'Domingo',			 '20031113',			'65482837',			  '45622483',		    'erMarDo@gmail.com',		'erMarDo2@gmail.com',		'San Miguel',		 'Naranjo',			'Alajuela',			  'Costa Rica',	   'Frente al salón comunal',		         '',					 1),
						(2,			   '205470214',	  'Román',			 'Victorino',		   'Basilio',			 '20030415',			'40915421',			  '68825304',		    'ViROBa@gmail.com',			'',							'Buenos Aires',		 'Palmares',	    'Alajuela',			  'Costa Rica',	   '70 metros sureste bibioteca comunal',    '',					 1),
						(1,			   '603210541',	  'Anselma',		 'Melania',			   'Lorenza',			 '20020101',			'87188655',			  '84715451',		    'anselo@hotmail.com',		'',							'Grecia',			 'Grecia',			'Alajuela',			  'Costa Rica',	   '50 metros oeste iglesia',				 '',					 1),
						(4,			   '703520741',	  'Pío',			 'Areceli',			   'Chema',				 '20040203',			'44185724',			  '84099662',		    'pio@gmail.com',			'pio2@gmail.com',			'Tacares',			 'Grecia',			'Alajuela',			  'Costa Rica',	   '10 metros sur del abastecedor',			 '',					 1),
						(3,			   '407530159',	  'José',			 'Urbana',			   'Teodosio',			 '20040815',			'68862853',			  '80346128',		    'josecito@gmail.com',		'josecito3@gmail.com',		'Candelaria',		 'Palmares',	    'Alajuela',			  'Costa Rica',	   'Frente al abastecedor',			         '',					 1),
						(8,			   '202580963',	  'María',			 'Alexis',			   'Calisto',			 '20030430',			'66578397',			  '68126608',		    'mariaAlexis@gmail.com',	'mariaAlexis34@gmail.com',  'Volio',			 'San Ramón',	    'Alajuela',			  'Costa Rica',	   '100 metros norte salón comunal',         '',					 1),
						(7,			   '104570964',	  'Esteban',		 'Guadalupe',		   'Sigfrido',			 '20020615',			'62766274',			  '43409809',		    'estebancito@gmail.com',	'',							'Piedades Norte',	 'San Ramón',	    'Alajuela',			  'Costa Rica',	   '300 metros sur de la plaza',	         '',					 1),
						(6,			   '302540143',	  'Bernarda',		 'Toño',			   'Sabina',			 '20050108',			'47248134',			  '85966090',		    'berniSabina@gmail.com',	'berni65Sabina@gmail.com',  'Piedades Sur',		 'San Ramón',		'Alajuela',			  'Costa Rica',	   '50 metros noreste salón comunal',		 '',					 1),
						(9,			   '207680543',	  'Rosa',			 'Faustino',		   'Corona',			 '20030201',			'89649307',			  '83489301',		    'rosacorona@gmail.com',		'',							'Buenos Aires',		 'Palmares',	    'Alajuela',			  'Costa Rica',	   '30 metros noroeste inglesia católica',   '',					 1);

--SELECT * FROM ESTUDIANTES;

--DELETE FROM ESTUDIANTES;

CREATE INDEX IDX_Nombre_Estudiante ON ESTUDIANTES (Nombre_Estudiante);
-- CREATE INDEX IDX_Nombre_Estudiante ON ESTUDIANTES (Nombre_Estudiante DESC);

CREATE INDEX IDX_Apellido1_Estudiante ON ESTUDIANTES (Apellido1_Estudiante);
-- CREATE INDEX IDX_Apellido1_Estudiante ON ESTUDIANTES (Apellido1_Estudiante DESC);

CREATE INDEX IDX_Nacimiento_Estudiante ON ESTUDIANTES (Nacimiento_Estudiante);
-- CREATE INDEX IDX_Nacimiento_Estudiante ON ESTUDIANTES (Nacimiento_Estudiante DESC);

CREATE INDEX IDX_Canton_Estudiante ON ESTUDIANTES (Canton_Estudiante);
-- CREATE INDEX IDX_Canton_Estudiante ON ESTUDIANTES (Canton_Estudiante DESC);




-- ********************************************** MODULOS_ABIERTOS **********************************************

INSERT INTO MODULOS_ABIERTOS
							(ID_Matricula, ID_Modulo, Cod_Entrenador, Dias_Modulo_Abierto,		Horario_Modulo_Abierto,		Fecha_Inicio_Modulo_Abierto, Detalles_Modulo_Abierto)
					VALUES	(5,			   1,		  6,			  'De lunes a sábado',		'De 8am a 10am',			'20220228',					''),
							(3,			   3,		  6,			  'Miércoles',				'De 12md a 2pm',			'20220302',					''),
							(1,			   2,		  6,			  'De jueves a sábado',		'De 10am a 12md',			'20220303',					''),
							(6,			   4,		  6,			  'De lunes a sábado',		'De 2pm a 4pm',				'20220228',					''),
							(8,			   1,		  6,			  'De lunes a miércoles',	'De 8am a 10am',			'20220228',					''),
							(10,		   4,		  6,			  'Viernes',				'De 2pm a 4pm',				'20220304',					''),
							(2,			   2,		  6,			  'De lunes a sábado',		'De 10am a 12md',			'20220228',					''),
							(4,			   3,		  6,			  'De martes a viernes',	'De 12md a 2pm',			'20220301',					''),
							(9,			   3,		  6,			  'Jueves',					'De 12md a 2pm',			'20220303',					''),
							(7,			   1,		  6,			  'De lunes a sábado',		'De 8am a 10am',			'20220228',					'');

-- SELECT * FROM MODULOS_ABIERTOS;

-- DELETE FROM MODULOS_ABIERTOS;