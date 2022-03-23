CREATE DATABASE DB_PRUEBAS
GO

USE DB_PRUEBAS
GO

-- NO FUNCIONA

/*
DECLARE @N_tabla int = 1;

WHILE	(@N_tabla >= 100)
		BEGIN
			CREATE TABLE TBL_N + CAST(@N_tabla AS varchar)
						 (nombre varchar(1))
		END
		SET @N_tabla = @N_tabla + 1
GO
*/

-- CICLO DIVISIBLES

/*
DECLARE @contador int
SET @contador = 0

WHILE (@contador <= 100)
BEGIN
	--SET @contador = @contador + 1
	--PRINT 'Iteración del bucle: ' + cast(@contador AS varchar)
	IF(@contador = 1)
		PRINT @contador + ' hola'

END
*/


DECLARE @N INT
SET @N = 1 

WHILE @N <= 30
BEGIN
	IF (@N % 2) = 0
		BEGIN
			PRINT CAST(@N AS varchar) + ' pepe'
			SET @N = @N + 1
		END
	ELSE 
		--IF(@N % 3) = 0
			BEGIN
				PRINT CAST(@N AS varchar) + ' JUAN'
				SET @N = @N + 1
			END
END
