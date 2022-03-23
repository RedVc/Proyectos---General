USE BD_TRIATLON_Redwin_F3
GO


-- ********************************* FUNCIONES *********************************
		-- 1 --

-- Función que calcula la edad cuando la llaman madiante el uso de una función predefinida del sistema
GO
CREATE OR ALTER FUNCTION FN_CALCULAR_EDAD(@nacimiento date)
RETURNS tinyint 
AS
	BEGIN
		DECLARE @resultado tinyint
			
			SET @resultado = DATEDIFF(YY, @nacimiento, GETDATE())

		RETURN @resultado
	END
GO

-- 2 --
GO
CREATE OR ALTER FUNCTION FN_CONFIRMAR_ACTIVO(@activo int)
RETURNS varchar(2)
AS
	BEGIN
		DECLARE @resultado varchar(2)
			
			IF	@activo = 1
				SET	@resultado = 'Si'
			else
				SET @resultado = 'No'

		RETURN @resultado
	END
	
GO

-- ---------------------------------------------------------------------------------------------------------------- --

-- 3 --
-- Cálculo de fechas

-- Verificar si un día es laborable

GO
CREATE OR ALTER FUNCTION FN_VERIFICAR_UN_DIA(@DiaEnRevision date, @cod_entrenador int, @cod_horario_modulo int)

RETURNS bit
AS
BEGIN 
	DECLARE @resultado bit = 0
	IF EXISTS (	SELECT 1 
				
				FROM HORARIOS_MODULOS 

				WHERE	Cod_Horario_Modulo = @cod_horario_modulo 
						
						AND 
						-- Corresponda con un día en que se imparte el curso, por ejemplo si ingresamos un 
						-- domingo y el curso es de L a V, retorna que NO es un día de clases.

						-- Obtenemos cuál día de la semana es (del 1 al 7, lunes = 1, domingo = 7)
						-- Si el día es 1 (lunes) y en el horario el lunes está ACTIVO(1), o
						-- Si el día es 2 (martes) y en el horario el martes está ACTIVO(1), o ...

						(	( DATEPART(DW,@DiaEnRevision) = 1 AND HORARIOS_MODULOS.L_Mod = 1) OR
							( DATEPART(DW,@DiaEnRevision) = 2 AND HORARIOS_MODULOS.K_Mod = 1) OR
							( DATEPART(DW,@DiaEnRevision) = 3 AND HORARIOS_MODULOS.M_Mod = 1) OR
							( DATEPART(DW,@DiaEnRevision) = 4 AND HORARIOS_MODULOS.J_Mod = 1) OR
							( DATEPART(DW,@DiaEnRevision) = 5 AND HORARIOS_MODULOS.V_Mod = 1) OR
							( DATEPART(DW,@DiaEnRevision) = 6 AND HORARIOS_MODULOS.S_Mod = 1) OR
							( DATEPART(DW,@DiaEnRevision) = 7 AND HORARIOS_MODULOS.D_Mod = 1) 
						 )
						
						AND
						-- la fecha no esté dentro de las fechas de dias de VACACIONES_INCAPACIDADES_EVENTOS:
						(NOT EXISTS(SELECT	1
									FROM	VACACIONES_INCAPACIDADES_EVENTOS
									WHERE	(VACACIONES_INCAPACIDADES_EVENTOS.Cod_Entrenador = @cod_entrenador) 
											AND (@DiaEnRevision >= VACACIONES_INCAPACIDADES_EVENTOS.Fecha_Inicio) 
											AND (@DiaEnRevision <= VACACIONES_INCAPACIDADES_EVENTOS.Fecha_Final) ))
				) -- if exists
											
				-- Si el dia dado ES un dia laborable y ademas NO esta dentro de las fechas de vacaciones, permisos, eventos, reuniones, etc.

				SET @resultado = 1
			ELSE
				SET @resultado = 0
			-- FIN DEL IF

	RETURN @resultado
END

GO

-->> PRUEBAS
/*
--								Día a revisar/	cod_entrenador/ cod_horario_modulo
SELECT dbo.FN_VERIFICAR_UN_DIA('20220210',			1,				1)
*/

-- ---------------------------------------------------------------------------------------------------------------- --

-- 4 --
-- Calcula la fecha de finalización de un módulo
GO
CREATE OR ALTER FUNCTION FN_CALCULAR_FECHA_FIN_MODULO(	@fechainicio date, 
														@cod_horario_modulo int, 
														@cod_modulo int, 
														@cod_entrenador int)

RETURNS DATE

AS
	BEGIN
		DECLARE @FechaEnRevision date = @fechainicio -- FechaEnRevisión es UN día (no un rango)
		DECLARE @horasdiarias decimal(4,2)
		DECLARE @HorasModulo int
		DECLARE @diasDuracion int
				
		SET @horasdiarias  = (	SELECT CAST( DATEDIFF(MINUTE, HORARIOS_MODULOS.Hora_Inicio_Mod, HORARIOS_MODULOS.Hora_Fin_Mod)  AS float) / CAST(60 AS float)
								FROM HORARIOS_MODULOS
								WHERE HORARIOS_MODULOS.Cod_Horario_Modulo = @cod_horario_modulo
								)

		SET @HorasModulo = (SELECT Duracion_Horas_Modulo FROM MODULOS WHERE MODULOS.Cod_Modulo = @cod_modulo) 

		SET @diasDuracion =	CEILING(@HorasModulo / @horasdiarias)
		
		/*	
			Calcular de forma correcta la diferencia en HORAS entre dos horas:

			declare @a time = '09:00'
			declare @b time = '11:25'
			declare @res decimal(4,2)
			set @res = CAST( DATEDIFF(MINUTE, @a, @b)  AS float) / CAST(60 AS float)
			print @res
		*/
		

		DECLARE @cuentadias int = 1
		
		WHILE(@cuentadias < @diasDuracion)
			BEGIN
				
				IF	((SELECT DBO.FN_VERIFICAR_UN_DIA(@FechaEnRevision, @cod_entrenador, @cod_entrenador)) = 1)
					
					-- Si es un día en que hay clases:
					BEGIN	
						SET @FechaEnRevision =  DATEADD(day, 1, @FechaEnRevision) -- le suma un día a la fecha
						SET @cuentadias = @cuentadias + 1 -- y aumenta con contador
					END

				ELSE 
					
					SET @FechaEnRevision =  DATEADD(day, 1, @FechaEnRevision)
					/*
						NO AUMENTA EL CONTADOR PORQUE EL DIA NO ES LABORABLE, ENTONCES EL WHILE REPITE EL CICLO Y
						AUMENTA EN 1 EL CONTADOR Y VUELVE A VERIFICAR SI ES UN DÍA LABORABLE
					*/

				END -- if
			
			/* 
				Después de termiando el IF - ELSE:
			
				Esta función es necesaria porque en las líneas anteriores, por ejemplo si es viernes (y el horario es de LaV) la 
				última ejecución del ciclo simplemente SUMA un día a la fecha (dando SÁBADO), y envía que el curso termina un sábado. 
				Y es incorrecto si el horario fuera de LaV, debería terminar el lunes siguiente, por eso se llama a esta
				otra función
				La diferencia es que esta función en el IF y el ELSE en ambos casos SUMA un día, y en la función SIGUIENTE DIA DE CLASES
				en caso positivo no suma otro día ya que no debe serguir buscando. 
			*/

			SET @FechaEnRevision = DBO.FN_SIGUIENTE_DIA_DE_CLASES(@FechaEnRevision, @cod_horario_modulo, @cod_entrenador)

		RETURN @FechaEnRevision
		END -- while

GO


-- ---------------------------------------------------------------------------------------------------------------- --

-- 5 --
--	FUNCION: retornar el siguiente dia de clases:

--	Esta función la utiliza la función de arriba (calcular fecha de fin del curso)


GO

CREATE OR ALTER FUNCTION FN_SIGUIENTE_DIA_DE_CLASES(	@fechainicio date, 
														@cod_horario_para_modulo int, 
														@cod_entr int)
RETURNS DATE
AS
	BEGIN
		DECLARE @fechavalida date = @fechainicio
		DECLARE @continuar bit = 1

		WHILE(@continuar = 1)
			BEGIN
			
				IF ((SELECT DBO.FN_VERIFICAR_UN_DIA(@fechavalida, @cod_entr, @cod_horario_para_modulo)) = 1)
														
					BEGIN	
						SET @continuar = 0
						-- Si es un dia en que hay clases, termina
					END
				ELSE 
					SET @fechavalida =  DATEADD(day, 1, @fechavalida) -- le agrega 1 y finaliza
			
			END -- while
		
		RETURN @fechavalida
	END

GO

-->> PRUEBAS
/*
--										   fecha inicio / cod_horario_mod / cod_modulo / cod_entrenador
SELECT dbo.FN_CALCULAR_FECHA_FIN_MODULO(	'20220207',		    1,				1,			  1)
*/


-- ---------------------------------------------------------------------------------------------------------------- --	







-- ********************************* TRIGGERS *********************************
	-- INSTITUTOS --

-- 1 --
-- Al ingresar un nuevo Instituto se colocará automáticamente activo.
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
-- Luego de actualizar el dato activo del Instituto y este es 0, todos los
-- profesores ligados a su PK serán desactivados

GO
CREATE OR ALTER TRIGGER TR_UPDATE_INSTITUTOS
ON INSTITUTOS FOR UPDATE
AS
	BEGIN
		IF EXISTS (SELECT 1
				   FROM inserted
				   WHERE Activo_Instituto = 0)
		UPDATE	ENTRENADORES
		SET		Activo_Entrenador = 0
		FROM	inserted
		WHERE	inserted.Cod_Instituto = ENTRENADORES.Cod_Instituto

	END
GO




	-- HORARIOS_ENTRENADORES --

-- Calcula las horas a laborar en el horario después de ingresar uno o varios datos.

GO
CREATE OR ALTER TRIGGER TR_HORAS_DIARIAS
ON HORARIOS_ENTRENADORES FOR INSERT
AS
	UPDATE	HORARIOS_ENTRENADORES
	SET		Horas_Diarias = DATEDIFF(HH, inserted.Hora_Inicio_Hor, inserted.Hora_Fin_Hor)
	FROM	inserted
	WHERE	HORARIOS_ENTRENADORES.Cod_Horario_Entr = inserted.Cod_Horario_Entr

GO




	-- ENTRENADORES --

-- 1. Coloca automáticamente después de ingresar un nuevo profesor que está activo.
-- 2. Calcula la edad del profesor en el momento que fue ingresado, la columna sigue igual después de los años.

GO
CREATE OR ALTER TRIGGER TR_DEFAULT_ENTRENADORES
ON ENTRENADORES FOR INSERT
AS
	-- 1 --
	UPDATE	ENTRENADORES
	SET		Activo_Entrenador = 1
	FROM	inserted i
	WHERE	ENTRENADORES.Cod_Entrenador = i.Cod_Entrenador

	-- 2 --
	UPDATE	ENTRENADORES
	SET		Edad_Ingreso_Entrenador = (SELECT dbo.FN_CALCULAR_EDAD(inserted.Nacimiento_Entrenador))
	FROM	inserted
	WHERE	ENTRENADORES.Cod_Entrenador = inserted.Cod_Entrenador
GO




	-- MODULOS_ELEGIDOS --

-- En el momento de actualizar MODULOS_ELEGIDOS, verifica si se intenta cambiar código del entrenador, si es así,
-- manda un mensaje de error, de lo contrario actualiza los datos.

GO
CREATE OR ALTER TRIGGER TR_UPDATE_MODULOS_ELEGIDOS
ON MODULOS_ELEGIDOS INSTEAD OF UPDATE
AS
	BEGIN TRY
		IF UPDATE(Cod_Entrenador)
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR('No es permitido cambiar el código del entrenador', 16, 1)
			END
		ELSE
			UPDATE	MODULOS_ELEGIDOS
			SET		Cod_Entrenador = i.Cod_Entrenador,
					Tipo_Modulo_Elegido = i.Cod_Modulo_Elegido,
					Fecha_Modulo_Elegido = i.Fecha_Modulo_Elegido,
					Descripcion_Modulo_Elegido = i.Descripcion_Modulo_Elegido
			FROM	inserted i INNER JOIN MODULOS_ELEGIDOS ME
						ON i.Cod_Modulo_Elegido = ME.Cod_Modulo_Elegido
	END TRY

	BEGIN CATCH
				PRINT ERROR_MESSAGE()
	END CATCH
GO




	-- VACACIONES_INCAPACIDADES_EVENTOS --

-- En el momento de actualizar MODULOS_ELEGIDOS, verifica si se intenta cambiar código del entrenador, si es así,
-- manda un mensaje de error, de lo contrario actualiza los datos.

GO
CREATE OR ALTER TRIGGER TR_UPDATE_VACACIONES_INCAPACIDADES_EVENTOS
ON VACACIONES_INCAPACIDADES_EVENTOS INSTEAD OF UPDATE
AS
	BEGIN TRY
		IF UPDATE(Cod_Entrenador)
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR('No es permitido cambiar el código del entrenador', 16, 1)
			END
		ELSE
			UPDATE	VACACIONES_INCAPACIDADES_EVENTOS
			SET		Cod_Entrenador = i.Cod_Entrenador,
					Tipo_Evento = i.Tipo_Evento,
					Fecha_Inicio = i.Fecha_Inicio,
					Fecha_Final = i.Fecha_Final,
					Detalle_Evento = i.Detalle_Evento
			FROM	inserted i INNER JOIN VACACIONES_INCAPACIDADES_EVENTOS VCE
						ON i.Cod_Vac_Inc_Evento = VCE.Cod_Vac_Inc_Evento
	END TRY

	BEGIN CATCH
				PRINT ERROR_MESSAGE()
	END CATCH
GO




	-- REGISTRO_HORAS_LABORADAS --

-- En el momento de actualizar REGISTRO_HORAS_LABORADAS, verifica si se intenta cambiar el código del entrenador, si es así,
-- manda un mensaje de error, de lo contrario actualiza los datos.

GO
CREATE OR ALTER TRIGGER TR_UPDATE_REGISTRO_HORAS_LABORADAS
ON REGISTRO_HORAS_LABORADAS INSTEAD OF UPDATE
AS
	BEGIN TRY
		IF UPDATE(Cod_Entrenador)
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR('No es permitido cambiar el código del entrenador', 16, 1)
			END
		ELSE
			UPDATE	REGISTRO_HORAS_LABORADAS
			SET		Cod_Entrenador = i.Cod_Entrenador,
					Fecha_laborada = i.Fecha_laborada,
					Hora_Ingreso_Laborada = i.Hora_Ingreso_Laborada,
					Hora_Salida_Laborada = i.Hora_Salida_Laborada,
					Detalle_Laborado = i.Detalle_Laborado
			FROM	inserted i INNER JOIN REGISTRO_HORAS_LABORADAS RHL
						ON i.Cod_Registro_Horas_Laboradas = RHL.Cod_Registro_Horas_Laboradas
	END TRY

	BEGIN CATCH
				PRINT ERROR_MESSAGE()
	END CATCH
GO



-- ****************** ZONA ABAJO ******************


	-- MODULOS -- 
-- En el momento de actualizar MODULOS, verifica si se intenta cambiar el nombre, si es así, manda un mensaje de error,
-- de lo contrario actualiza los datos.

GO
CREATE OR ALTER TRIGGER TR_UPDATE_MODULOS
ON MODULOS INSTEAD OF UPDATE
AS
	BEGIN TRY
		IF UPDATE(Nombre_Modulo)
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR('No es permitido cambiar el nombre del módulo', 16, 1)
			END
		ELSE
			UPDATE	MODULOS
			SET		Nombre_Modulo = i.Nombre_Modulo,
					Duracion_Horas_Modulo = i.Duracion_Horas_Modulo,
					Requisitos_Modulo = i.Requisitos_Modulo,
					Detalle_Modulo = i.Detalle_Modulo
			FROM	inserted i INNER JOIN MODULOS M
						ON i.Cod_Modulo = M.Cod_Modulo
	END TRY

	BEGIN CATCH
				PRINT ERROR_MESSAGE()
	END CATCH
GO



	-- PROGRAMAS --

-- En el momento de actualizar PROGRAMAS, verifica si se intenta cambiar el nombre, si es así, manda un mensaje de error,
-- de lo contrario actualiza los datos.

GO
CREATE OR ALTER TRIGGER TR_UPDATE_PROGRAMAS
ON PROGRAMAS INSTEAD OF UPDATE
AS
	BEGIN TRY
		IF UPDATE(Nombre_Programa)
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR('No es permitido cambiar el nombre del Programa', 16, 1)
			END
		ELSE
			UPDATE	PROGRAMAS
			SET		Nombre_Programa = i.Nombre_Programa,
					Duracion_Programa = i.Duracion_Programa,
					Descripcion_Programa = i.Descripcion_Programa,
					Requisitos_Programa = i.Requisitos_Programa,
					Observaciones_Programa = i.Observaciones_Programa,
					Adicional_Programa = i.Adicional_Programa
			FROM	inserted i INNER JOIN PROGRAMAS P
						ON i.Cod_Programa = P.Cod_Programa
	END TRY

	BEGIN CATCH
				PRINT ERROR_MESSAGE()
	END CATCH
GO



	-- MODULOS_PROGRAMAS --

-->> ODIÉ CON TODA MI ALMA HACER ESTE TRIGGER HASTA QUE LOGRÉ HACER QUE FUNCIONE Y ME SALIÓ UNA LÁGRIMA

-- Cuando se ingresa uno o muchos datos a MODULOS_PROGRAMAS suma las horas de
-- los Módulos para colocar el resultado en PROGRAMAS.

GO
CREATE OR ALTER TRIGGER TR_CALCULAR_HORAS_PROGRAMA
ON MODULOS_PROGRAMAS FOR INSERT
AS
	BEGIN
		DECLARE @total int = 0;

		SET @total = (SELECT	SUM(Duracion_Horas_Modulo)
					  FROM		MODULOS INNER JOIN inserted
									ON MODULOS.Cod_Modulo = inserted.Cod_Modulo
								INNER JOIN PROGRAMAS
									ON inserted.Cod_Programa = PROGRAMAS.Cod_Programa
					  WHERE		inserted.Cod_Programa = PROGRAMAS.Cod_Programa)
		
		UPDATE	PROGRAMAS
		SET		Duracion_Programa = @total
		FROM	inserted
		WHERE	inserted.Cod_Programa = PROGRAMAS.Cod_Programa
	END
GO





	-- HORARIOS_MODULOS --

-- Si se actualiza algunos de los días de la tabla HORARIOS_MODULOS presentra un error
-- ya que los días de los horarios no deberían cambiar, solo se puede cambiar la descripción de este.

GO
CREATE OR ALTER TRIGGER TR_UPDATE_HORARIOS_MODULOS
ON HORARIOS_MODULOS INSTEAD OF UPDATE
AS
	BEGIN TRY
		IF UPDATE(L_Mod) OR UPDATE(K_Mod) OR UPDATE(M_Mod) OR UPDATE(J_Mod) OR UPDATE(V_Mod) OR UPDATE(S_Mod) OR UPDATE(D_Mod) OR UPDATE(Hora_Inicio_Mod) OR UPDATE(Hora_Fin_Mod)
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR('Solo es permitido cambiar la descripción', 16, 1)
			END
		ELSE
			
			UPDATE	HORARIOS_MODULOS
			SET		L_Mod = i.L_Mod,
					K_Mod = i.K_Mod,
					M_Mod = i.M_Mod,
					J_Mod = i.J_Mod,
					V_Mod = i.V_Mod,
					S_Mod = i.S_Mod,
					D_Mod = i.D_Mod,
					Hora_Inicio_Mod = i.Hora_Inicio_Mod,
					Hora_Fin_Mod = i.Hora_Fin_Mod,
					Descripcion_Mod = i.Descripcion_Mod
			FROM	inserted i INNER JOIN HORARIOS_MODULOS HM
						ON i.Cod_Horario_Modulo = HM.Cod_Horario_Modulo
	END TRY

	BEGIN CATCH
				PRINT ERROR_MESSAGE()
	END CATCH
GO




	-- ESTUDIANTES --

-- 1 --
-- 1. Coloca como activo al estudiante ingresado.
-- 2. Calcula la edad del estudiante por  medio de una función.

GO
CREATE OR ALTER TRIGGER TR_DEFAULT_ESTUDIANTES
ON ESTUDIANTES FOR INSERT
AS
	BEGIN
		-- 1 --
		UPDATE	ESTUDIANTES
		SET		Activo_Estudiante = 1
		FROM	inserted i
		WHERE	ESTUDIANTES.Cod_Estudiante = i.Cod_Estudiante;

		-- 2 --
		UPDATE	ESTUDIANTES
		--SET		Edad_Estudiante = DATEDIFF(YY, inserted.Nacimiento_Estudiante, GETDATE()) -- Primer prueba funcional para calcular una 
																							  -- edad, pero queria realizarlo por medio de 
																							  -- una funcion para calcular la edad de los profesores
		SET		Edad_Ingreso_Estudiante = (SELECT dbo.FN_CALCULAR_EDAD(inserted.Nacimiento_Estudiante))
		FROM	inserted
		WHERE	ESTUDIANTES.Cod_Estudiante = inserted.Cod_Estudiante
	END
GO

-- 2 --
-- No permite que se actualice la identificación del estudiante, ya que, es única.

GO
CREATE OR ALTER TRIGGER TR_UPDATE_ESTUDIANTES
ON ESTUDIANTES INSTEAD OF UPDATE
AS
	BEGIN TRY
		IF UPDATE(ID_Estudiante)
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR('No se puede cambiar la identificación del estudiante', 16, 1)
			END
		ELSE
			
			UPDATE	ESTUDIANTES
			SET		ID_Estudiante = i.ID_Estudiante,
					Nombre_Estudiante = i.Nombre_Estudiante,
					Apellido1_Estudiante = i.Apellido1_Estudiante,
					Apellido2_Estudiante = i.Apellido2_Estudiante,
					Nacimiento_Estudiante = i.Nacimiento_Estudiante,
					Edad_Ingreso_Estudiante = i.Edad_Ingreso_Estudiante,
					Telefono1_Estudiante = i.Telefono1_Estudiante,
					Telefono2_Estudiante = i.Telefono2_Estudiante,
					Email1_Estudiante = i.Email1_Estudiante,
					Email2_Estudiante = i.Email2_Estudiante,
					Distrito_Estudiante = i.Distrito_Estudiante,
					Canton_Estudiante = i.Canton_Estudiante,
					Provincia_Estudiante = i.Provincia_Estudiante,
					Pais_Estudiante = i.Pais_Estudiante,
					Direccion_Estudiante = i.Direccion_Estudiante,
					Observacion_Estudiante = i.Observacion_Estudiante,
					Activo_Estudiante = i.Activo_Estudiante
			FROM	inserted i INNER JOIN ESTUDIANTES E
						ON i.Cod_Estudiante = E.Cod_Estudiante
	END TRY

	BEGIN CATCH
				PRINT ERROR_MESSAGE()
	END CATCH
GO
 
 -- 3 --
 -- Si se actualiza un estudiante a inactivo, su matrícula será 'abandono'
/*GO
CREATE OR ALTER TRIGGER TR_ACTIVO_ESTUDIANTE
ON ESTUDIANTES FOR UPDATE
AS
	IF (SELECT	Activo_Estudiante
		FROM	inserted) = 0

		UPDATE	MATRICULAS
		SET		Estado_Matricula = 'Abandono'
		FROM	inserted i INNER JOIN MATRICULAS M
					ON i.Cod_Estudiante = M.Cod_Estudiante

GO

alter table ESTUDIANTES 
disable TR_ACTIVO_ESTUDIANTE
-->> PRUEBAS


UPDATE ESTUDIANTES
SET	Activo_Estudiante = 0
WHERE Cod_Estudiante = 1

SELECT * FROM MATRICULAS
SELECT * FROM ESTUDIANTES
*/




-- MATRICULAS --

-- No deja que se cambie el código del estudiante ya que cambiaría la forma de ver la tabla.

GO
CREATE OR ALTER TRIGGER TR_UPDATE_MATRICULAS
ON MATRICULAS INSTEAD OF UPDATE
AS
	BEGIN TRY
		IF UPDATE(Cod_Estudiante)
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR('No se puede cambiar el código del estudiante', 16, 1)
			END
		ELSE
			
			UPDATE	MATRICULAS
			SET		Cod_Estudiante = i.Cod_Estudiante,
					Fecha_Matricula = i.Fecha_Matricula,
					Estado_Matricula = i.Estado_Matricula,
					Monto_Cancelado_Matricula = i.Monto_Cancelado_Matricula,
					Tipo_Cobro_Matricula = i.Tipo_Cobro_Matricula,
					Tipo_Pago_Matricula = i.Tipo_Pago_Matricula,
					Detalle_Matricula = i.Detalle_Matricula
			FROM	inserted i INNER JOIN MATRICULAS M
						ON i.Cod_Matricula = M.Cod_Matricula
	END TRY

	BEGIN CATCH
				PRINT ERROR_MESSAGE()
	END CATCH
GO




-- MODULOS_ABIERTOS --

-- 1 --
-- No permite cambiar el código del entrendador, el código del módulo ni el código de horarios módulos
-- ya que, la tabla dejaría de tener sentido.

GO
CREATE OR ALTER TRIGGER TR_UPDATE_MODULOS_ABIERTOS
ON MODULOS_ABIERTOS INSTEAD OF UPDATE
AS
	BEGIN TRY
		IF UPDATE(Cod_Entrenador) OR UPDATE(Cod_Modulo) OR UPDATE(Cod_Horario_Modulo)
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR('Solo es permitido cambiar el costo y el inicio del módulo abierto', 16, 1)
			END
		ELSE
			
			UPDATE	MODULOS_ABIERTOS
			SET		Cod_Entrenador = i.Cod_Entrenador,
					Cod_Modulo = i.Cod_Modulo,
					Cod_Horario_Modulo = i.Cod_Horario_Modulo,
					Costo_Modulo = i.Costo_Modulo,
					Inicio_Mod_A = i.Inicio_Mod_A,
					Fin_Mod_A = i.Fin_Mod_A
			FROM	inserted i INNER JOIN MODULOS_ABIERTOS
						ON i.Cod_Modulo_Abierto = MODULOS_ABIERTOS.Cod_Modulo_Abierto
	END TRY

	BEGIN CATCH
				PRINT ERROR_MESSAGE()
	END CATCH
GO

-- 2 --
GO
CREATE OR ALTER TRIGGER TR_FECHA_FINALIZACION
ON MODULOS_ABIERTOS FOR INSERT
AS
	BEGIN
		
		UPDATE	MODULOS_ABIERTOS
		SET		Fin_Mod_A = (SELECT dbo.FN_CALCULAR_FECHA_FIN_MODULO(i.Inicio_Mod_A, i.Cod_Horario_Modulo, i.Cod_Modulo, i.Cod_Entrenador))
		FROM	inserted i INNER JOIN MODULOS_ABIERTOS MA
				ON i.Cod_Modulo_Abierto = MA.Cod_Modulo_Abierto

	END
GO







-- DETALLE_MATRICULA --
-->> No encontré una forma de hacer un trigger aquí
