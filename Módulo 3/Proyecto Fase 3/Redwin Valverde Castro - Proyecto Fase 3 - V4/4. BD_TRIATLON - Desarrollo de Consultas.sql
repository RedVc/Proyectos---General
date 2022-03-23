USE BD_TRIATLON_Redwin_F3
GO


-- *********************** Consultas de selección simple ***********************
-- 1 -- inner join
SELECT	Nombre_Instituto, Nombre_Entrenador, Apellido1_Entrenador, Apellido2_Entrenador
FROM	INSTITUTOS I INNER JOIN ENTRENADORES E
			ON I.Cod_Instituto = E.Cod_Instituto 


-- 2 -- inner join
SELECT	Nombre_Entrenador, Apellido1_Entrenador, Apellido2_Entrenador, Descripcion_Horario
FROM	ENTRENADORES E INNER JOIN HORARIOS_ENTRENADORES HE
			ON E.Cod_Horario_Entr = HE.Cod_Horario_Entr


-- 3 -- left join
SELECT	E.Cod_Entrenador, Nombre_Entrenador, Nombre_Modulo
FROM	ENTRENADORES E LEFT JOIN MODULOS_ABIERTOS MA
			ON E.Cod_Entrenador = MA.Cod_Entrenador
		INNER JOIN MODULOS M
			ON MA.Cod_Modulo = M.Cod_Modulo


-- 4 -- left join
SELECT	P.Nombre_Programa, Nombre_Modulo
FROM	PROGRAMAS P INNER JOIN MODULOS_PROGRAMAS MP
			ON P.Cod_Programa = MP.Cod_Programa
		LEFT JOIN MODULOS M
			ON MP.Cod_Modulo = M.Cod_Modulo


-- 5 -- right join
SELECT	Nombre_Estudiante, Apellido1_Estudiante, Estado_Matricula
FROM	MATRICULAS M RIGHT JOIN ESTUDIANTES E
			ON M.Cod_Estudiante = E.Cod_Estudiante


-- 6 -- right join
SELECT	Nombre_Entrenador, Apellido1_Entrenador, Fecha_laborada
FROM	ENTRENADORES E RIGHT JOIN REGISTRO_HORAS_LABORADAS RHL 
			ON RHL.Cod_Entrenador = E.Cod_Entrenador




-- *********************** Consultas de selección con funciones agregadas (having, group by) ***********************
-- 1 --
-- Confirma si el entrenador tiene otro número 
SELECT		Nombre_Entrenador, Telefono1_Entrenador, count(Telefono2_Entrenador) AS 'Segundo número'
FROM		ENTRENADORES
GROUP BY	Nombre_Entrenador, Telefono1_Entrenador


-- 2 --
-- Muestra los nombres de los profesores que tengan un segundo número
SELECT	UPPER(Nombre_Entrenador) AS Nombre, Telefono2_Entrenador AS 'Número de teléfono 2'
FROM	ENTRENADORES
WHERE	Telefono2_Entrenador IS NOT NULL


-- 3 --
-- Muestra quién da el módulo, redondea el costo y muestra el inicio del mismo
SELECT	UPPER(Nombre_Entrenador), FLOOR(Costo_Modulo) AS COSTO, Inicio_Mod_A
FROM	MODULOS_ABIERTOS MA INNER JOIN ENTRENADORES E
			ON MA.Cod_Entrenador = E.Cod_Entrenador


-- 4 --
-- Separa la fecha de nacimiento de los estudiantes
SELECT	Nombre_Estudiante AS Nombre, Apellido1_Estudiante + ' ' + Apellido2_Estudiante AS Apellidos,
		DAY(Nacimiento_Estudiante) AS Día, MONTH(Nacimiento_Estudiante) AS Mes, YEAR(Nacimiento_Estudiante) AS Año 
FROM	ESTUDIANTES


-- 5 --	
-- Caracteres totales del nombre completo
SELECT	LEN(Nombre_Estudiante) + LEN(Apellido1_Estudiante) + LEN(Apellido2_Estudiante) AS 'Caracteres totales',
		Nombre_Estudiante + ' ' + Apellido1_Estudiante + ' ' + Apellido2_Estudiante AS 'Nombre completo'
FROM	ESTUDIANTES



-- 6 --
-- Mitad de nombre en mayúsculas, mitad del apellido minúsculas.
SELECT	UPPER(SUBSTRING(Nombre_Entrenador, 1, 2)) + LOWER(SUBSTRING(Nombre_Entrenador, 3, 3)) AS NOmbre,
		LOWER(SUBSTRING(Apellido1_Entrenador, 1, 3)) + UPPER(SUBSTRING(Apellido1_Entrenador, 4, 3)) AS apeLLIDOS
FROM	ENTRENADORES


-- 7 --
-- Muestra correctamente los caracteres de los estudiantes.
SELECT	UPPER(SUBSTRING(Nombre_Estudiante, 1, 1)) + LOWER(SUBSTRING(Nombre_Estudiante, 2, 35)) AS Nombre,
		UPPER(SUBSTRING(Apellido1_Estudiante, 1, 1)) + LOWER(SUBSTRING(Apellido2_Estudiante, 2, 35)) + ' ' +
		UPPER(SUBSTRING(Apellido2_Estudiante, 1, 1)) + LOWER(SUBSTRING(Apellido2_Estudiante, 2, 30)) AS Apellidos
FROM	ESTUDIANTES


-- 8 --
-- Separa la fecha de nacimiento de los entrenadores.
SELECT	Nombre_Entrenador AS Nombre, Apellido1_Entrenador + ' ' + Apellido2_Entrenador AS Apellidos,
		DAY(Nacimiento_Entrenador) AS Día, MONTH(Nacimiento_Entrenador) AS Mes, YEAR(Nacimiento_Entrenador) AS Año 
FROM	ENTRENADORES





-- *********************** Consultas de selección ordenando datos (order by) ***********************
-- 1 --

-- Horario del instituto y los entrenadores que trabajan en él, más su edad ordenado por su nombre.

SELECT	I.Nombre_Instituto, I.Horario_Instituto, E.Nombre_Entrenador,
		E.Apellido1_Entrenador + ' ' + E.Apellido2_Entrenador AS 'Apellidos del entrenador',
		DATEDIFF(YY, Nacimiento_Entrenador, GETDATE()) AS 'Edad del entrenador',
		Descripcion_Horario AS 'Horario entrenador'
FROM	INSTITUTOS I INNER JOIN ENTRENADORES E
			ON I.Cod_Instituto = E.Cod_Instituto
		INNER JOIN HORARIOS_ENTRENADORES HE
			ON E.Cod_Horario_Entr = HE.Cod_Horario_Entr
ORDER BY E.Nombre_Entrenador


-- 2 --
-- Nombre y apellidos del entrenador junto con los días que es activo ordenado por los apellidos.

SELECT	E.Nombre_Entrenador,
		E.Apellido1_Entrenador + ' ' + E.Apellido2_Entrenador AS 'Apellidos del entrenador',
			CAST(L_Hor AS varchar) + ' ' + CAST(K_Hor AS varchar) + ' ' + CAST(M_Hor AS varchar) + ' ' + CAST(J_Hor AS varchar) + ' ' + CAST(V_Hor AS varchar) + ' ' + CAST(S_Hor AS varchar) + ' ' + CAST(D_Hor AS varchar) AS 'Días activos',
			Descripcion_Horario AS 'Horario del entrenador'
FROM	ENTRENADORES E LEFT JOIN HORARIOS_ENTRENADORES HE
			ON E.Cod_Horario_Entr = HE.Cod_Horario_Entr
ORDER BY [Apellidos del entrenador]


-- 3 --
-- Estudiantes que contengan almenos una "E" en su nombre.

SELECT	ID_Estudiante, Nombre_Estudiante, Apellido1_Estudiante + ' ' + Apellido2_Estudiante AS Apellidos,
		DATEDIFF(YY, Nacimiento_Estudiante, GETDATE()) AS Edad
FROM	ESTUDIANTES
WHERE ESTUDIANTES.Nombre_Estudiante LIKE '%E%'
ORDER BY Nombre_Estudiante;




-- *********************** Consultas de selección con unión o con subconsultas ***********************
-- 1 -- UNION
-- Une los entrenadores y los estudiantes, luego ordena alfabeticamente el nombre.
SELECT	ID_Entrenador, Nombre_Entrenador, Apellido1_Entrenador + ' ' + Apellido2_Entrenador AS Apellidos,
		Email1_Entrenador, Telefono1_Entrenador, Pais_Entrenador, Provincia_Entrenador, Canton_Entrenador, Distrito_Entrenador
FROM	ENTRENADORES

UNION

SELECT	ID_Estudiante, Nombre_Estudiante, Apellido1_Estudiante + ' ' + Apellido2_Estudiante AS Apellidos,
		Email1_Estudiante, Telefono1_Estudiante, Pais_Estudiante, Provincia_Estudiante, Canton_Estudiante, Distrito_Estudiante
FROM	ESTUDIANTES
ORDER BY Nombre_Entrenador


-- 2 -- INION
-- Como una reflja a la otra, no se repiten datos
SELECT	Descripcion_Horario
FROM	HORARIOS_ENTRENADORES

UNION

SELECT	Descripcion_Mod
FROM	HORARIOS_MODULOS



-- *********************** Consultas del tipo que uno elija (en vista) ***********************
-- 1 --
-- Estudiantes, el profesor que los entrena y el programa que llevan.
GO
CREATE OR ALTER VIEW vista_ESTUDIANTES
AS
SELECT	Nombre_Entrenador + ' ' + Apellido1_Entrenador + ' ' + Apellido2_Entrenador AS 'Nombre entrenador',
		P.Nombre_Programa AS Programa, E.Cod_Estudiante AS 'Código del estudiante', ID_Estudiante AS Identificación, Nombre_Estudiante + ' ' + Apellido1_Estudiante + ' ' + Apellido2_Estudiante AS 'Nombre estudiante',
		'/' AS 'Nacimiento -->>', DAY(Nacimiento_Estudiante) AS Día, MONTH(Nacimiento_Estudiante) AS Mes, YEAR(Nacimiento_Estudiante) AS Año,
		DATEDIFF(YY, Nacimiento_Estudiante, GETDATE()) AS Edad, '\' AS '<<--',
		Telefono1_Estudiante AS Teléfono1, Telefono2_Estudiante AS Teléfono2, Pais_Estudiante AS País,
		Provincia_Estudiante AS Provincia, Canton_Estudiante AS Cantón, Distrito_Estudiante AS Distrito, Direccion_Estudiante AS Dirección,
		(SELECT dbo.FN_CONFIRMAR_ACTIVO(Activo_Estudiante)) AS Activo
FROM	ESTUDIANTES E INNER JOIN MATRICULAS M
			ON E.Cod_Estudiante = M.Cod_Matricula
		INNER JOIN DETALLE_MATRICULA DM
			ON M.Cod_Matricula = DM.Cod_Matricula
		INNER JOIN MODULOS_ABIERTOS MA
			ON DM.Cod_Modulo_Abierto = MA.Cod_Modulo_Abierto
		INNER JOIN ENTRENADORES EN
			ON MA.Cod_Entrenador = EN.Cod_Entrenador
		INNER JOIN MODULOS MO
			ON MA.Cod_Modulo = MO.Cod_Modulo
		INNER JOIN MODULOS_PROGRAMAS MP
			ON MO.Cod_Modulo = MP.Cod_Modulo
		INNER JOIN PROGRAMAS P
			ON MP.Cod_Programa = P.Cod_Programa
GO


SELECT * FROM vista_ESTUDIANTES


-->> PRUEBA
/*
select * from ESTUDIANTES

update ESTUDIANTES
set Activo_Estudiante = 1
where Cod_Estudiante = 5
*/




-- 2 --
-- Datos de los profesores, el instituto y el horario al que pertenecen.

GO
CREATE OR ALTER VIEW vista_Profesores
AS
	SELECT	Nombre_Instituto AS Instituto, Descripcion_Horario AS Horario,
			Nombre_Entrenador + ' ' + Apellido1_Entrenador + ' ' + Apellido2_Entrenador AS Entrenador,
			CAST(DAY(Nacimiento_Entrenador)AS varchar) + ' / ' + CAST(MONTH(Nacimiento_Entrenador)AS varchar) + ' / ' + CAST(YEAR(Nacimiento_Entrenador)AS varchar) AS Nacimiento, -- Lo hice de esa manera porque el cambio de formato con convert no me gustaba, aunque de esta manera tampoco me gusta mucho.
			Telefono1_Entrenador AS Teléfono1, Telefono2_Entrenador AS Teléfono2, Email1_Entrenador AS 'Correo electrónico',
			Pais_Entrenador AS País, Provincia_Entrenador AS Provincia, Canton_Entrenador AS Cantón, Distrito_Entrenador AS Distrito,
			Direccion_Entrenador AS Dirección, Cuenta_Bancaria_Entrenador AS 'Cuenta bancaria',
			(SELECT dbo.FN_CONFIRMAR_ACTIVO(Activo_Entrenador)) AS Activo
	FROM	INSTITUTOS I INNER JOIN ENTRENADORES E
				ON I.Cod_Instituto = E.Cod_Instituto
			INNER JOIN HORARIOS_ENTRENADORES HE
				ON HE.Cod_Horario_Entr = E.Cod_Horario_Entr
GO

SELECT * FROM vista_Profesores
-->> PRUEBA
select * from ENTRENADORES






-- *********************** Procedimientos almacenados ***********************
-- 1 --
-- Ingreso de un profesor nuevo
GO
CREATE OR ALTER PROCEDURE SP_NUEVO_ENTRENADOR (@cod_horario int, @cod_instituto int, @id varchar(50),
											  @nombre varchar(20), @apellido1 varchar(20), @apellido2 varchar(20),
											  @nacimiento date,	@telefono1 varchar(30), @telefono2	varchar(30),
											  @email1 varchar(76), @email2 varchar(76), @distrito varchar(30),
											  @canton varchar(30), @provincia varchar(10), @pais varchar(20),
											  @direccion varchar(150), @cuenta_bancaria	varchar(20))
AS
	BEGIN TRY
			BEGIN TRANSACTION
					BEGIN
							INSERT INTO ENTRENADORES(Cod_Horario_Entr, Cod_Instituto, ID_Entrenador,
													 Nombre_Entrenador, Apellido1_Entrenador, Apellido2_Entrenador,
													 Nacimiento_Entrenador, Telefono1_Entrenador, Telefono2_Entrenador,
													 Email1_Entrenador,	Email2_Entrenador, Distrito_Entrenador,
													 Canton_Entrenador, Provincia_Entrenador, Pais_Entrenador,
													 Direccion_Entrenador, Cuenta_Bancaria_Entrenador)
											VALUES	(@cod_horario, @cod_instituto, @id,
													@nombre, @apellido1, @apellido2,
													@nacimiento, @telefono1, @telefono2,
													@email1, @email2, @distrito,
													@canton, @provincia, @pais,
													@direccion, @cuenta_bancaria)
							PRINT 'Entrenador ingresado correctamente'
			
					END
			COMMIT TRANSACTION
	END TRY

BEGIN CATCH
			ROLLBACK TRANSACTION
			PRINT ERROR_MESSAGE()
END CATCH
GO

/*
DECLARE @cod_horario int = 10,
		@cod_instituto int = 1,
		@id varchar(50) = '201470963',
		@nombre varchar(20) = 'Juan',
		@apellido1 varchar(20) = 'Ramírez',
		@apellido2 varchar(20) = 'Fernández',
		@nacimiento date = '19560514',
		@telefono1 varchar(30) = '85213697',
		@telefono2	varchar(30) = NULL,
		@email1 varchar(76) = 'juanRF@gmail.com',
		@email2 varchar(76) = 'RFjuan@hotmail.com',
		@distrito varchar(30) = 'Bajo La Paz',
		@canton varchar(30) = 'San Ramón',
		@provincia varchar(10) = 'Alajuela',
		@pais varchar(20) = 'Costa Rica',
		@direccion varchar(150) = 'Frente a la escuela',
		@cuenta_bancaria varchar(20) = 'BR75315962686314785'

EXECUTE SP_NUEVO_ENTRENADOR
		@cod_horario, @cod_instituto, @id,
		@nombre, @apellido1, @apellido2,
		@nacimiento, @telefono1, @telefono2,
		@email1, @email2, @distrito,
		@canton, @provincia, @pais,
		@direccion, @cuenta_bancaria


SELECT * FROM INSTITUTOS
select * from ENTRENADORES
*/

-- 2 --
-- Ingreso de un estudiante nuevo
GO
CREATE OR ALTER PROCEDURE SP_NUEVO_ESTUDIANTE  (@id varchar(50),
											    @nombre varchar(20),
												@apellido1 varchar(20),
												@apellido2 varchar(20),
												@nacimiento date,
												@telefono1 varchar(30),
												@telefono2 varchar(30),
												@email1 varchar(76),
												@email2 varchar(76),
												@distrito varchar(30),
												@canton varchar(30),
												@provincia varchar(10),
												@pais varchar(20),
												@direccion varchar(150),
												@observacion varchar(150))
AS
	BEGIN TRY
			BEGIN TRANSACTION
					BEGIN
							INSERT INTO ESTUDIANTES(ID_Estudiante, Nombre_Estudiante, Apellido1_Estudiante,
													Apellido2_Estudiante, Nacimiento_Estudiante,
													Telefono1_Estudiante, Telefono2_Estudiante, Email1_Estudiante,
													Email2_Estudiante, Distrito_Estudiante, Canton_Estudiante,
													Provincia_Estudiante, Pais_Estudiante, Direccion_Estudiante,
													Observacion_Estudiante)
											VALUES	(@id,
													@nombre,
													@apellido1,
													@apellido2,
													@nacimiento,
													@telefono1,
													@telefono2,
													@email1,
													@email2,
													@distrito,
													@canton,
													@provincia,
													@pais,
													@direccion,
													@observacion)
							PRINT 'Estudiante ingresado correctamente'
			
					END
			COMMIT TRANSACTION
	END TRY

BEGIN CATCH
			ROLLBACK TRANSACTION
			PRINT ERROR_MESSAGE()
END CATCH
GO

/*
DECLARE	@id varchar(50) = '405260851',
		@nombre varchar(20) = 'Mariela',
		@apellido1 varchar(20) = 'Cárdenas',
		@apellido2 varchar(20) = 'Moya',
		@nacimiento date = '20000101',
		@telefono1 varchar(30) = '87631598',
		@telefono2 varchar(30) = NULL,
		@email1 varchar(76) = 'marCM@gmail.com',
		@email2 varchar(76) = 'CMmar@hotmail.com',
		@distrito varchar(30) = 'Tacares',
		@canton varchar(30) = 'Grecia',
		@provincia varchar(10) = 'Alajuela',
		@pais varchar(20) = 'Costa Rica',
		@direccion varchar(150) = 'Frente al abastecedor Quincho',
		@observacion varchar(150) = NULL


EXECUTE SP_NUEVO_ESTUDIANTE
		@id,
		@nombre,
		@apellido1,
		@apellido2,
		@nacimiento,
		@telefono1,
		@telefono2,
		@email1,
		@email2,
		@distrito,
		@canton,
		@provincia,
		@pais,
		@direccion,
		@observacion
*/