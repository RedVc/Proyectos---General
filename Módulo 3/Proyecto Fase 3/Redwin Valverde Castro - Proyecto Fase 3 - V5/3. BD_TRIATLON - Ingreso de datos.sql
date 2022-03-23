/* Base de Datos para el: Instituto Especializado de Entrenamiento en Triatlón (IEET)
   INA
   Redwin Valverde Castro

   ******************************************* INGRESO DE DATOS A LAS TABLAS *******************************************
*/

-- Llenar cada tabla con 10 registros, en el caso de que no sea posible, justificar

USE BD_TRIATLON_Redwin_F3
GO


-- *_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*

/*
												IMPORTANTE
*/

-- *_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*



-->>>>>>>>>>>>>>>>		TODAS LAS FECHAS INGRESADAS SERÁN A PARTIR DEL 2022 PARA EVITAR PROBLEMAS DE COMPILACIÓN

-->>>>>>>>>>>>>>>>		LAS LECCIONES COMIENZAN EL LUNES 7 DE FEBRERO DEL 2022





-- ********************************************** INSTITUTOS **********************************************

-- En este caso solo se ingresa un registro a la tabla INSTITUTOS porque solo hay uno, aunque queda abierta la posibilidad para más

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
						 80055632,
						 'InstitutoEspecializadoTriatlon@gmail.com',
						 NULL,
						 'triatloncr.cr',
						 'De 7am a 6pm',
						 'San Juan',
						 'San Ramón',
						 'Alajuela',
						 'Costa Rica',
						 '500 metros norte de la Iglesia');

SELECT * FROM INSTITUTOS;

--DELETE FROM INSTITUTOS;



-- ********************************************** HORARIOS_ENTRENADORES **********************************************

INSERT INTO HORARIOS_ENTRENADORES
								(L_Hor, K_Hor, M_Hor, J_Hor, V_Hor, S_Hor, D_Hor, Hora_Inicio_Hor, Hora_Fin_Hor, Descripcion_Horario)
						VALUES	(1,		1,	   1,	  0,	 0,		0,	   0,	  '07:00',		   '12:00',		 'De lunes a miercoles de 7am a 12md'),
								(1,		1,	   1,	  0,	 0,		0,	   0,	  '12:00',		   '17:00',		 'De lunes a miercoles de 12md a 5pm'),
								(0,		0,	   0,	  1,	 1,		1,	   0,	  '07:00',		   '12:00',		 'De jueves a sábado de 7am a 12md'),
								(0,		0,	   0,	  1,	 1,		1,	   0,	  '12:00',		   '17:00',		 'De jueves a sábado de 12md a 5pm'),
								(1,		1,	   1,	  1,	 1,		1,	   0,	  '07:00',		   '12:00',		 'De lunes a sábado de 7am a 12md'),
								(1,		1,	   1,	  1,	 1,		1,	   0,	  '12:00',		   '17:00',		 'De lunes a sábado de 12md a 5pm'),
								(0,		0,	   0,	  0,	 1,		1,	   1,	  '07:00',		   '12:00',		 'De viernes a domingo de 7am a 12md'),
								(0,		0,	   0,	  0,	 1,		1,	   1,	  '12:00',		   '17:00',		 'De viernes a domingo de 12md a 5pm'),
								(1,		0,	   1,	  0,	 1,		0,	   1,	  '07:00',		   '12:00',		 'Lunes, miércoles, viernes y domingo de 7am a 12md'),
								(1,		0,	   1,	  0,	 1,		0,	   1,	  '12:00',		   '17:00',		 'Lunes, miércoles, viernes y domingo de 12md a 5pm'),
								(0,		1,	   0,	  1,	 0,		1,	   0,	  '07:00',		   '12:00',		 'Martes, jueves y sábado de 7am a 12md'),
								(0,		1,	   0,	  1,	 0,		1,	   0,	  '12:00',		   '17:00',		 'Martes, jueves y sábado de 12md a 5pm');
SELECT * FROM HORARIOS_ENTRENADORES;














-- ********************************************** ENTRENADORES **********************************************

INSERT INTO ENTRENADORES
						(Cod_Instituto, Cod_Horario_Entr, ID_Entrenador, Nombre_Entrenador, Apellido1_Entrenador, Apellido2_Entrenador, Nacimiento_Entrenador, Telefono1_Entrenador, Telefono2_Entrenador, Email1_Entrenador,			Email2_Entrenador,			Distrito_Entrenador, Canton_Entrenador, Provincia_Entrenador, Pais_Entrenador, Direccion_Entrenador,				     Cuenta_Bancaria_Entrenador)
				VALUES	(1,			    1,				  '207890555',	  'Erik',			 'Rashid',			   'Benedic',			 '19660531',			'86638521',			  '45632145',		    'erikBene@hotmail.com',		'erikBene2@gmail.com',		'Cahuita',           'Talamanca',		'Limón',			  'Costa Rica',	   '80 metros noreste salón comunal',	     'CR45698712345678564'),
					    (1,			    2,				  '206560456',	  'Ábrahám',		 'Zlatko',			   'Amator',			 '19780716',			'84569212',			  '56321245',		    'amator15@gmail.com',		'amator@ina.cr',			'Roxana',			 'Pococí',			'Limón',			  'Costa Rica',	   'Frente a la plaza principal',	         'BR46564545468789362'),
						(1,			    1,				  '206710854',	  'Ozi',			 'Fortunato',		   'Siena',				 '19790626',			'86322547',			  '85264921',		    'oziSiena@gmail.com',		'oziFortunato@hotmail.com', 'Las Juntas',		 'Abangares',	    'Guanacaste',		  'Costa Rica',	   '50 metros sur de la Escuela Rodrigo',    'BN85274196326547462'),
						(1,			    1,				  '203250855',	  'Kestrel',		 'Sybil',			   'Louise',			 '19961227',			'89321475',			  '65321457',		    'kestelSybil@hotmail.com',  'kestelSybil2@gmail.com',   'San Antonio',		 'Desamparados',    'San José',			  'Costa Rica',	   'Frente al ebais',				         'PJ54876512327889561'),
						(1,			    3,				  '205550856',	  'Aleah',			 'Winslow',			   'Merril',			 '19821101',			'44026532',			  '78542136',		    'AleahMerril13@gmail.com',  'AleahMerril13@ina.cr',     'Naranjito',		 'Quepos',			'Puntarenas',		  'Costa Rica',	   '100 metros sueste del abastecedor Rita', 'FN85632197659863197'),
						(1,			    3,				  '207890853',	  'Redwin',			 'Valverde',		   'Castro',			 '19990313',			'86639700',			  NULL,					'redvc13.03@gmail.com',     NULL,						'Piedades Norte',	  'San Ramón',		 'Alajuela',		   'Costa Rica',    'Frente al abastecedor La Esperanza',	   'BR46564455321315487'),
						(1,			    1,				  '305690741',	  'Alexa',			 'Ramirez',			   'Valerio',			 '19650815',			'87862522',			  NULL,					'lexaValerio@hotmail.com',  NULL,						'La Granja',		  'Palmares',		 'Alajuela',		   'Costa Rica',	'500 metros norte de la cancha de futbol', 'CR15158787864565489'),
						(1,			    2,				  '705140134',	  'Ari',			 'Peggy',			   'Pauletta',			 '19850422',			'65782431',			  NULL,					'aripeggy@ina.com',			NULL,						'Bajo Tejar',		  'San Ramón',		 'Alajuela',		   'Costa Rica',	'100 metros sur buses Empresarios Unidos', 'BN54548787543121587'),
						(1,			    5,				  '604470878',	  'Millard',		 'Ulric',			   'Patrik',			 '19740331',			'45896321',			  NULL,					'millardPatrik@gmail.com',  NULL,						'Merced',			  'San José',		 'San José',		   'Costa Rica',	'50 sur de la escuela Juan Antonio',	   'CR55565687897892131'),
						(1,			    6,				  '104180798',	  'Pavel',			 'Lilibet',			   'Maleah',			 '19931224',			'65478923',			  NULL,					'soloPavel@hotmail.com',	NULL,						'San Roque',		  'Barva',			 'Heredia',			   'Costa Rica',	'75 metros este abastecedor Los Jardines', 'BR85747454653215748');

SELECT * FROM ENTRENADORES;

-- ÍNDICES -- 
CREATE INDEX IDX_Nombre_Entrenador ON ENTRENADORES (Nombre_Entrenador);
CREATE INDEX IDX_Nombre_EntrenadorDESC ON ENTRENADORES (Nombre_Entrenador DESC);

CREATE INDEX IDX_Apellido1_Entrenador ON ENTRENADORES (Apellido1_Entrenador);
CREATE INDEX IDX_Apellido1_EntrenadorDESC ON ENTRENADORES (Apellido1_Entrenador DESC);

CREATE INDEX IDX_Nacimiento_Entrenador ON ENTRENADORES (Nacimiento_Entrenador);
CREATE INDEX IDX_Nacimiento_EntrenadorDESC ON ENTRENADORES (Nacimiento_Entrenador DESC);

CREATE INDEX IDX_Canton_Entrenador ON ENTRENADORES (Canton_Entrenador);
CREATE INDEX IDX_Canton_EntrenadorDESC ON ENTRENADORES (Canton_Entrenador DESC);








-- ********************************************** MODULOS_ELEGIDOS **********************************************

-->> NOTAS

-- TODOS LOS PROFESORES ELEGIRAN TODOS LOS MÓDULOS PORQUE SON LOS PRIMEROS EN INGRESAR AL INSTITUTO

INSERT INTO MODULOS_ELEGIDOS
							(Cod_Entrenador, Tipo_Modulo_Elegido, Fecha_Modulo_Elegido, Descripcion_Modulo_Elegido)
					VALUES	(1,				 'Gimnasio',		  '20220103',			NULL),
							(1,				 'Natación',		  '20220103',			NULL),
							(1,				 'Maratón',			  '20220103',			NULL),
							(1,				 'Ciclismo',		  '20220103',			NULL),
							(2,				 'Gimnasio',		  '20220104',			NULL),
							(2,				 'Natación',		  '20220104',			NULL),
							(2,				 'Maratón',			  '20220104',			NULL),
							(2,				 'Ciclismo',		  '20220104',			NULL),
							(3,				 'Gimnasio',		  '20220104',			NULL),
							(3,				 'Natación',		  '20220104',			NULL),
							(3,				 'Maratón',			  '20220104',			NULL),
							(3,				 'Ciclismo',		  '20220104',			NULL),
							(4,				 'Gimnasio',		  '20220104',			NULL),
							(4,				 'Natación',		  '20220104',			NULL),
							(4,				 'Maratón',			  '20220104',			NULL),
							(4,				 'Ciclismo',		  '20220104',			NULL),
							(5,				 'Gimnasio',		  '20220105',			NULL),
							(5,				 'Natación',		  '20220105',			NULL),
							(5,				 'Maratón',			  '20220105',			NULL),
							(5,				 'Ciclismo',		  '20220105',			NULL),
							(6,				 'Gimnasio',		  '20220106',			NULL),
							(6,				 'Natación',		  '20220106',			NULL),
							(6,				 'Maratón',			  '20220106',			NULL),
							(6,				 'Ciclismo',		  '20220106',			NULL),
							(7,				 'Gimnasio',		  '20220106',			NULL),
							(7,				 'Natación',		  '20220106',			NULL),
							(7,				 'Maratón',			  '20220106',			NULL),
							(7,				 'Ciclismo',		  '20220106',			NULL),
							(8,				 'Gimnasio',		  '20220106',			NULL),
							(8,				 'Natación',		  '20220106',			NULL),
							(8,				 'Maratón',			  '20220106',			NULL),
							(8,				 'Ciclismo',		  '20220106',			NULL),
							(9,				 'Gimnasio',		  '20220107',			NULL),
							(9,				 'Natación',		  '20220107',			NULL),
							(9,				 'Maratón',			  '20220107',			NULL),
							(9,				 'Ciclismo',		  '20220107',			NULL),
							(10,			 'Gimnasio',		  '20220107',			NULL),
							(10,			 'Natación',		  '20220107',			NULL),
							(10,			 'Maratón',			  '20220107',			NULL),
							(10,			 'Ciclismo',		  '20220107',			NULL);

SELECT * FROM MODULOS_ELEGIDOS;






-- ********************************************** VACACIONES_INCAPACIDADES_EVENTOS **********************************************

-->> NOTAS

-- El Cod_Entrenador debe existir antes para poder crear el enlace

-- VAN EN ORDEN Y TODAS SON 2 SEMANAS DE VACACIONES PARA
-- MEJOR ENTENDIMIENTO AUNQUE SE ADMITE LO QUE SEA MIENTRAS ESTÉ PERMITIDO POR LA BD

INSERT INTO VACACIONES_INCAPACIDADES_EVENTOS
											(Cod_Entrenador, Tipo_Evento, Fecha_Inicio, Fecha_Final, Detalle_Evento)
						VALUES				(1,				'Vacaciones', '20220313',	'20220327',	 'Playa'),
											(2,				'Vacaciones', '20220401',	'20220415',	 'Montaña'),
											(3,				'Vacaciones', '20220406',	'20220420',	 'Montaña'),
											(4,				'Vacaciones', '20220405',	'20220419',	 'Familia'),
											(5,				'Vacaciones', '20220412',	'20220426',	 'Abuelos'),
											(6,				'Vacaciones', '20220404',	'20220418',	 'Playa'),
											(7,				'Vacaciones', '20220309',	'20220323',	 'Playa'),
											(8,				'Vacaciones', '20220317',	'20220331',	 'Abuelos'),
											(9,				'Vacaciones', '20220410',	'20220424',	 'Playa'),
											(10,			'Vacaciones', '20220501',	'20220515',	 'Familia');

SELECT * FROM VACACIONES_INCAPACIDADES_EVENTOS;










-- ********************************************** REGISTRO_HORAS_LABORADAS **********************************************

-->> NOTAS

-- LA IDEA ES QUE SE ACTIVE SI SE CONFIRMA EL DÍA LABORADO POR MEDIO DE UNA MÁQUINA
-- DE IGUAL MANERA SE HIZO UNA REVISIÓN CUIDADOSA DE LOS HORARIOS DE CADA ENTRENADOR

INSERT INTO REGISTRO_HORAS_LABORADAS
												(Cod_Entrenador, Fecha_laborada, Hora_Ingreso_Laborada, Hora_Salida_Laborada, Detalle_Laborado)
										VALUES	(1,				 '20220207',	 '06:55',				'12:10',				NULL),
												(3,				 '20220207',	 '06:50',				'12:08',				NULL),
												(4,				 '20220207',	 '06:48',				'12:15',				NULL),
												(5,				 '20220210',	 '06:55',				'12:08',				NULL),
												(6,				 '20220210',	 '06:50',				'12:03',				NULL),
												(7,				 '20220207',	 '06:58',				'12:07',				NULL),
												(9,				 '20220207',	 '06:57',				'12:02',				NULL),
												(10,			 '20220207',	 '11:50',				'17:15',				NULL),
												(1,				 '20220208',	 '06:50',				'12:14',				NULL),
												(3,				 '20220208',	 '06:56',				'12:09',				NULL);

SELECT * FROM REGISTRO_HORAS_LABORADAS;









-- ========================================================================================================================================================================================================


-- ********************************************** MODULOS **********************************************

INSERT INTO MODULOS
					(Nombre_Modulo, Duracion_Horas_Modulo, Requisitos_Modulo, Detalle_Modulo)
			VALUES	('Gimnasio',	80,					   'Bachillerato',	  NULL),
					('Natación',	110,				   'Bachillerato',	  NULL),
					('Maratón',		120,				   'Bachillerato',	  NULL),
					('Ciclismo',	90,					   'Bachillerato',	  NULL);

SELECT * FROM MODULOS;







-- ********************************************** PROGRAMAS **********************************************

-- Solo contiene un registro pero queda abierta la posibilidad para más

INSERT INTO PROGRAMAS
					 (Nombre_Programa, Descripcion_Programa,					Requisitos_Programa, Observaciones_Programa, Adicional_Programa)
			VALUES	 ('Triatlón',	   'Contiene los 4 principales módulos',	'Voluntad',			 '',					 NULL);

SELECT * FROM PROGRAMAS;







-- ********************************************** MODULOS_PROGRAMAS **********************************************

-- Solo se llenan 4 campos porque solo hay 4 modulos

INSERT INTO MODULOS_PROGRAMAS
							 (Cod_Programa, Cod_Modulo)
					VALUES	 (1,		 1),
							 (1,		 2),
							 (1,		 3),
							 (1,		 4);

SELECT * FROM MODULOS_PROGRAMAS;





-- ********************************************** HORARIOS_MODULOS **********************************************
INSERT INTO HORARIOS_MODULOS
								(L_Mod, K_Mod, M_Mod, J_Mod, V_Mod, S_Mod, D_Mod, Hora_Inicio_Mod, Hora_Fin_Mod, Descripcion_Mod)
						VALUES	(1,		1,	   1,	  0,	 0,		0,	   0,	  '07:00',		   '12:00',		 'De lunes a miercoles de 7am a 12md'),
								(1,		1,	   1,	  0,	 0,		0,	   0,	  '12:00',		   '17:00',		 'De lunes a miercoles de 12md a 5pm'),
								(0,		0,	   0,	  1,	 1,		1,	   0,	  '07:00',		   '12:00',		 'De jueves a sábado de 7am a 12md'),
								(0,		0,	   0,	  1,	 1,		1,	   0,	  '12:00',		   '17:00',		 'De jueves a sábado de 12md a 5pm'),
								(1,		1,	   1,	  1,	 1,		1,	   0,	  '07:00',		   '12:00',		 'De lunes a sábado de 7am a 12md'),
								(1,		1,	   1,	  1,	 1,		1,	   0,	  '12:00',		   '17:00',		 'De lunes a sábado de 12md a 5pm'),
								(0,		0,	   0,	  0,	 1,		1,	   1,	  '07:00',		   '12:00',		 'De viernes a domingo de 7am a 12md'),
								(0,		0,	   0,	  0,	 1,		1,	   1,	  '12:00',		   '17:00',		 'De viernes a domingo de 12md a 5pm'),
								(1,		0,	   1,	  0,	 1,		0,	   1,	  '07:00',		   '12:00',		 'Lunes, miércoles, viernes y domingo de 7am a 12md'),
								(1,		0,	   1,	  0,	 1,		0,	   1,	  '12:00',		   '17:00',		 'Lunes, miércoles, viernes y domingo de 12md a 5pm'),
								(0,		1,	   0,	  1,	 0,		1,	   0,	  '07:00',		   '12:00',		 'Martes, jueves y sábado de 7am a 12md'),
								(0,		1,	   0,	  1,	 0,		1,	   0,	  '12:00',		   '17:00',		 'Martes, jueves y sábado de 12md a 5pm');
SELECT * FROM HORARIOS_MODULOS;




-- ********************************************** ESTUDIANTES **********************************************

INSERT INTO ESTUDIANTES
						(ID_Estudiante, Nombre_Estudiante, Apellido1_Estudiante, Apellido2_Estudiante, Nacimiento_Estudiante, Telefono1_Estudiante, Telefono2_Estudiante, Email1_Estudiante,			Email2_Estudiante,			Distrito_Estudiante, Canton_Estudiante, Provincia_Estudiante, Pais_Estudiante, Direccion_Estudiante,					 Observacion_Estudiante)
				VALUES	('102540762',	  'Florentina',		 'Santos',			   'Nataniel',			 '20020522',			'84663791',			  NULL,					'flornat@hotmail.com',		'flornat2@hotmail.com',		'Piedades Norte',    'San Ramón',		'Alajuela',			  'Costa Rica',	   '30 metros oeste parada de autobus',	     NULL),
					    ('506980452',	  'Ercilia',		 'Marcelino',		   'Domingo',			 '20031113',			'65482837',			  '45622483',		    'erMarDo@gmail.com',		'erMarDo2@gmail.com',		'San Miguel',		 'Naranjo',			'Alajuela',			  'Costa Rica',	   'Frente al salón comunal',		         NULL),
						('205470214',	  'Román',			 'Victorino',		   'Basilio',			 '20030415',			'40915421',			  NULL,					'ViROBa@gmail.com',			NULL,						'Buenos Aires',		 'Palmares',	    'Alajuela',			  'Costa Rica',	   '70 metros sureste bibioteca comunal',    NULL),
						('603210541',	  'Anselma',		 'Melania',			   'Lorenza',			 '20020101',			'87188655',			  '84715451',		    'anselo@hotmail.com',		NULL,						'Grecia',			 'Grecia',			'Alajuela',			  'Costa Rica',	   '50 metros oeste iglesia',				 NULL),
						('703520741',	  'Pío',			 'Areceli',			   'Chema',				 '20040203',			'44185724',			  '84099662',		    'pio@gmail.com',			'pio2@gmail.com',			'Tacares',			 'Grecia',			'Alajuela',			  'Costa Rica',	   '10 metros sur del abastecedor',			 NULL),
						('407530159',	  'José',			 'Urbana',			   'Teodosio',			 '20040815',			'68862853',			  NULL,				    'josecito@gmail.com',		'josecito3@gmail.com',		'Candelaria',		 'Palmares',	    'Alajuela',			  'Costa Rica',	   'Frente al abastecedor',			         NULL),
						('202580963',	  'María',			 'Alexis',			   'Calisto',			 '20030430',			'66578397',			  '68126608',		    'mariaAlexis@gmail.com',	'mariaAlexis34@gmail.com',  'Volio',			 'San Ramón',	    'Alajuela',			  'Costa Rica',	   '100 metros norte salón comunal',         NULL),
						('104570964',	  'Esteban',		 'Guadalupe',		   'Sigfrido',			 '20020615',			'62766274',			  '43409809',		    'estebancito@gmail.com',	NULL,						'Piedades Norte',	 'San Ramón',	    'Alajuela',			  'Costa Rica',	   '300 metros sur de la plaza',	         NULL),
						('302540143',	  'Bernarda',		 'Toño',			   'Sabina',			 '20050108',			'47248134',			  '85966090',		    'berniSabina@gmail.com',	'berni65Sabina@gmail.com',  'Piedades Sur',		 'San Ramón',		'Alajuela',			  'Costa Rica',	   '50 metros noreste salón comunal',		 NULL),
						('207680543',	  'Rosa',			 'Faustino',		   'Corona',			 '20030201',			'89649307',			  NULL,				    'rosacorona@gmail.com',		NULL,						'Buenos Aires',		 'Palmares',	    'Alajuela',			  'Costa Rica',	   '30 metros noroeste inglesia católica',   NULL);

SELECT * FROM ESTUDIANTES;


CREATE INDEX IDX_Nombre_Estudiante ON ESTUDIANTES (Nombre_Estudiante);
CREATE INDEX IDX_Nombre_EstudianteDESC ON ESTUDIANTES (Nombre_Estudiante DESC);

CREATE INDEX IDX_Apellido1_Estudiante ON ESTUDIANTES (Apellido1_Estudiante);
CREATE INDEX IDX_Apellido1_EstudianteDESC ON ESTUDIANTES (Apellido1_Estudiante DESC);

CREATE INDEX IDX_Nacimiento_Estudiante ON ESTUDIANTES (Nacimiento_Estudiante);
CREATE INDEX IDX_Nacimiento_EstudianteDESC ON ESTUDIANTES (Nacimiento_Estudiante DESC);

CREATE INDEX IDX_Canton_Estudiante ON ESTUDIANTES (Canton_Estudiante);
CREATE INDEX IDX_Canton_EstudianteDESC ON ESTUDIANTES (Canton_Estudiante DESC);





-- ========================================================================================================================================================================================================


-- ********************************************** MATRICULAS **********************************************

INSERT INTO MATRICULAS
						(Cod_Estudiante, Fecha_Matricula, Estado_Matricula,	Monto_Cancelado_Matricula, Tipo_Cobro_Matricula, Tipo_Pago_Matricula, Detalle_Matricula)
				VALUES	(1,				 '20221215',	  'En curso',		15000,					   'Curso',				 'Efectivo',		  NULL),
						(2,				 '20221215',	  'Aprobado',		15000,					   'Curso y matricula',	 'Sinpe',			  NULL),
						(3,				 '20221215',	  'Abandono',		15000,					   'Curso y matricula',	 'Tarjeta',			  NULL),
						(4,				 '20221215',	  'En curso',		15000,					   'Curso',				 'Efectivo',		  NULL),
						(5,				 '20221216',	  'En curso',		15000,					   'Curso',				 'Sinpe',			  NULL),
						(6,				 '20221216',	  'Reprobado',		15000,					   'Curso y matricula',	 'Efectivo',		  NULL),
						(7,				 '20221216',	  'En curso',		15000,					   'Curso',				 'Sinpe',			  NULL),
						(8,				 '20221216',	  'Aprobado',		15000,					   'Curso y matricula',	 'Tarjeta',			  NULL),
						(9,				 '20221217',	  'En curso',		15000,					   'Curso',				 'Efectivo',		  NULL),
						(10,			 '20221217',	  'Aprobado',		15000,					   'Curso y matricula',	 'Sinpe',			  NULL);

SELECT * FROM MATRICULAS;




-- ********************************************** MODULOS_ABIERTOS **********************************************


INSERT INTO MODULOS_ABIERTOS
							(Cod_Entrenador, Cod_Modulo, Cod_Horario_Modulo, Costo_Modulo, Inicio_Mod_A)
					VALUES	(1,				 1,			 1,					 125000,		  '20220207'),
							(1,				 2,			 1,					 125000,		  '20220207'),
							(1,				 3,			 1,					 125000,		  '20220207'),
							(1,				 4,			 1,					 125000,		  '20220207'),

							(2,				 1,			 2,					 125000,		  '20220207'),
							(2,				 2,			 2,					 125000,		  '20220207'),
							(2,				 3,			 2,					 125000,		  '20220207'),
							(2,				 4,			 2,					 125000,		  '20220207'),

							(3,				 1,			 1,					 125000,		  '20220207'),
							(3,				 2,			 1,					 125000,		  '20220207'),
							(3,				 3,			 1,					 125000,		  '20220207'),
							(3,				 4,			 1,					 125000,		  '20220207'),

							(4,			     1,			 1,					 125000,		  '20220207'),
							(4,			     2,			 1,					 125000,		  '20220207'),
							(4,			     3,			 1,					 125000,		  '20220207'),
							(4,			     4,			 1,					 125000,		  '20220207'),

							(5,			     1,			 3,					 125000,		  '20220210'),
							(5,				 2,			 3,					 125000,		  '20220210'),
							(5,			     3,			 3,					 125000,		  '20220210'),
							(5,			     4,			 3,					 125000,		  '20220210'),
							
							(6,			     1,			 3,					 125000,		  '20220210'),
							(6,			     2,			 3,					 125000,		  '20220210'),
							(6,			     3,			 3,					 125000,		  '20220210'),
							(6,				 4,			 3,					 125000,		  '20220210'),
							
							(7,			     1,			 1,					 125000,		  '20220207'),
							(7,			     2,			 1,					 125000,		  '20220207'),
							(7,			     3,			 1,					 125000,		  '20220207'),
							(7,			     4,			 1,					 125000,		  '20220207'),
							
							(8,			     1,			 2,					 125000,		  '20220207'),
							(8,			     2,			 2,					 125000,		  '20220207'),
							(8,			     3,			 2,					 125000,		  '20220207'),
							(8,			     4,			 2,					 125000,		  '20220207'),
							
							(9,			     1,			 5,					 125000,		  '20220207'),
							(9,			     2,			 5,					 125000,		  '20220207'),
							(9,			     3,			 5,					 125000,		  '20220207'),
							(9,			     4,			 5,					 125000,		  '20220207'),
							
							(10,		     1,			 6,					 125000,		  '20220207'),
							(10,		     2,			 6,					 125000,		  '20220207'),
							(10,		     3,			 6,					 125000,		  '20220207'),
							(10,		     4,			 6,					 125000,		  '20220207');

SELECT * FROM MODULOS_ABIERTOS;





-- ********************************************** DETALLE_MATRICULA **********************************************

INSERT INTO DETALLE_MATRICULA
							(Cod_Modulo_Abierto, Cod_Matricula, Estado_DM,		Nota_Final)
					VALUES	(1,					 1,				'Matriculado',  0),
							(5,					 2,				'Matriculado',  0),
							(9,					 3,				'Matriculado',  0),
							(13,				 4,				'Matriculado',  0),
							(17,				 5,				'Matriculado',  0),
							(21,				 6,				'Matriculado',  0),
							(25,				 7,				'Matriculado',  0),
							(29,				 8,				'Matriculado',  0),
							(33,				 9,				'Matriculado',  0),
							(37,				 10,			'Matriculado',  0);

SELECT * FROM DETALLE_MATRICULA;