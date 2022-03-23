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
		DECLARE @resultado varchar
			
			IF	@activo = 1
				SET	@resultado = 'Si'
			else
				SET @resultado = 'No'

		RETURN @resultado
	END
	
GO












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






-- DETALLE_MATRICULA --
-->> No encontré una forma de hacer un trigger aquí
