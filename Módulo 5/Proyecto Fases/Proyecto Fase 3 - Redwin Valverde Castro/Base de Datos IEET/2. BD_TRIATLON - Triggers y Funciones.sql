USE BD_TRIATLON_Redwin
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



-- ****************** ZONA ABAJO ******************

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
