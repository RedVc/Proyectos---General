USE BD_MATRICULA;

INSERT INTO ESTUDIANTES 
			(CARNET, ID_ESTUDIANTE, NOMBRE_ESTUDIANTE, PRIMER_APELLIDO_E, SEGUNDO_APELLIDO_E, TELEFONO_ESTUDIANTE, CORREO_ESTUDIANTE, FECHA_INGRESO)
	 VALUES ('INA210','208250591',  'Miriam',          'Cubero',          'Arias',            '88-90-10-01',       '208250591@ina.cr','20220603'),
			('INA211','208250592',  'Redwin',          'Valverde',        'Castro',           '86-63-97-00',       '207890853@ina.cr','20220604'),
			('INA212','208258888',  'Jonatan',         'Naranjo',         'Abarca',           '88-90-10-02',       '208258888@ina.cr','20220605'),
			('INA213','208255555',  'Andres',          'Villalobos',      'Mejia',            '88-90-10-01',       '208255555@ina.cr','20220609'),
			('INA214','208253333',  'David',           'Leiton',          'Salas',            '88-90-10-05',       '208253333@ina.cr','20220605');

SELECT * FROM ESTUDIANTES;

DELETE FROM ESTUDIANTES; -- COMO NO SE INCLUYO where BORRA TODOS LOS REGISTROS DE LA TABLA

INSERT INTO MATRICULAS (CARNET,FECHA,MONTO,DESCUENTO,USUARIO_MATRICULA,OBSERVACIONES_MATRICULAS)
				VALUES ('INA215','20210603',145000.00,0,'Sofia',       'Observacion'),
					   ('INA216','20210603',165000.00,0,'Marta',       'Observacion');

SELECT * FROM MATRICULAS;

DELETE FROM MATRICULAS;