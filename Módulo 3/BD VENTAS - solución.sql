/*	Practica BD VENTAS
	(Solución del docente)
*/

/* ------------------------------- CREACION DE LA BASE DE DATOS -------------------------------  */

CREATE DATABASE VENTAS
GO 

USE VENTAS
GO 

/* ------------------------------------ CREACION DE TABLAS ------------------------------------  */

-- TABLA ZONA_VENTAS _________________________________________________

CREATE TABLE ZONA_VENTAS(
	CODIGO_ZONA int IDENTITY, 
	DESCRIPCION varchar(150) NOT NULL
)

-- CLAVES Y RESTRICCIONES: 

ALTER TABLE ZONA_VENTAS
	ADD CONSTRAINT PK_CODIGO_ZONA PRIMARY KEY(CODIGO_ZONA)


-- TABLA CLIENTES _________________________________________________

CREATE TABLE CLIENTES(
	CODIGO_CLIENTE int IDENTITY,
	NOMBRE varchar(80) NOT NULL, 
	TELEFONO varchar(10) NOT NULL, 
	DIRECCION varchar(20), 
	CODIGO_ZONA int NOT NULL
)

-- CLAVES Y RESTRICCIONES: 

ALTER TABLE CLIENTES
	ADD CONSTRAINT PK_CODIGO_CLIENTE PRIMARY KEY(CODIGO_CLIENTE)

ALTER TABLE CLIENTES
	ADD CONSTRAINT FK_CODIGO_ZONA FOREIGN KEY (CODIGO_ZONA) REFERENCES ZONA_VENTAS(CODIGO_ZONA)

-- TABLA PRODUCTOS _________________________________________________

CREATE TABLE PRODUCTOS(
	CODIGO_PRODUCTO int IDENTITY, 
	NOMBRE_PRODUCTO varchar(50) NOT NULL,
	CANTIDAD_EXISTENTE int NOT NULL,
	PRECIO_VENTA decimal(10,2) NOT NULL
)

-- CLAVES Y RESTRICCIONES: 

ALTER TABLE PRODUCTOS
	ADD CONSTRAINT PK_CODIGO_PRODUCTO PRIMARY KEY(CODIGO_PRODUCTO)

ALTER TABLE PRODUCTOS
	ADD CONSTRAINT CHK_CANTIDAD_EXISTENTE CHECK(CANTIDAD_EXISTENTE BETWEEN 0 AND 100)

ALTER TABLE PRODUCTOS
	ADD CONSTRAINT CHK_PRECIO_VENTA CHECK(PRECIO_VENTA >= 0)

-- TABLA PEDIDOS _________________________________________________

CREATE TABLE PEDIDOS(
	NUMERO_PEDIDO int IDENTITY, 
	CODIGO_CLIENTE int NOT NULL,
	CODIGO_PRODUCTO int NOT NULL,
	CANTIDAD_PEDIDO int NOT NULL,
	FECHA_PEDIDO datetime NOT NULL DEFAULT GETDATE(),
	OBSERVACIONES varchar(150) DEFAULT 'NO REGISTRA'
)

-- CLAVES Y RESTRICCIONES: 

ALTER TABLE PEDIDOS
	ADD CONSTRAINT PK_NUMERO_PEDIDO PRIMARY KEY(NUMERO_PEDIDO)

ALTER TABLE PEDIDOS
	ADD CONSTRAINT FK_CODIGO_CLIENTE FOREIGN KEY(CODIGO_CLIENTE) REFERENCES CLIENTES(CODIGO_CLIENTE)

ALTER TABLE PEDIDOS
	ADD CONSTRAINT FK_CODIGO_PRODUCTO FOREIGN KEY(CODIGO_PRODUCTO) REFERENCES PRODUCTOS(CODIGO_PRODUCTO)


/* ------------------------------------ INSERTAR DATOS EN LAS TABLAS ------------------------------------  */

INSERT INTO PRODUCTOS( NOMBRE_PRODUCTO, CANTIDAD_EXISTENTE, PRECIO_VENTA)
VALUES	('ARROZ GRANO ENTERO', 80, 2300),
		('FRIJOLES ROJOS', 60, 2500),
		('HARINA DE MAIZ', 50, 1250),
		('PASTA DENTAL', 90, 3200),
		('DETERGENTE EN POLVO', 68, 3600),
		('ATUN EN LOMOS', 98, 1750)

INSERT INTO ZONA_VENTAS(DESCRIPCION)
VALUES	('PACIFICO CENTRAL'),
		('PACIFICO NORTE'),
		('PACIFICO SUR'),
		('VALLE CENTRAL'),
		('HUETAR NORTE'),
		('HUETAR ATLANTICO')

INSERT INTO CLIENTES(NOMBRE, TELEFONO, DIRECCION, CODIGO_ZONA)
VALUES	('LA BODEGUITA', '87459862', 'PALMAR NORTE', 3),
		('SUPER EL PORVENIR', '22456398', 'HEREDIA CENTRO', 4),
		('ABASTECEDOR 3s', '24589656', 'NARANJO', 4),
		('SUPER LA ANGOSTURA', '26356588', 'CHACARITA', 1), 
		('SUPER SANTA TERESA', '60607070', 'CÓBANO', 2)

INSERT INTO PEDIDOS(CODIGO_CLIENTE, CODIGO_PRODUCTO, CANTIDAD_PEDIDO)
VALUES	(1, 5, 30),
		(2, 1, 20),
		(3, 2, 10),
		(3, 1, 50),
		(5, 6, 60)

INSERT INTO PEDIDOS(CODIGO_CLIENTE, CODIGO_PRODUCTO, CANTIDAD_PEDIDO, FECHA_PEDIDO)
VALUES	(1, 4, 25, '20201120')
		

/* ----------------------------- VER DATOS DE LAS TABLAS -----------------------------  */

SELECT * FROM ZONA_VENTAS
SELECT * FROM PRODUCTOS
SELECT * FROM CLIENTES 
SELECT * FROM PEDIDOS

SELECT NUMERO_PEDIDO, CODIGO_CLIENTE, CODIGO_PRODUCTO, CANTIDAD_PEDIDO FROM PEDIDOS

/* ------------------------------------ CONSULTAS ------------------------------------  */

/*
1.	Genere una consulta que muestre: 
	- El código, el nombre y la dirección del cliente, 
	- la descripción de la zona de ventas y 
	- la cantidad de pedidos que han realizado los clientes. 
	
	Los que no han hecho pedidos deben mostrarse en cero
*/

SELECT	CLIENTES.CODIGO_CLIENTE, NOMBRE, DIRECCION, DESCRIPCION, ISNULL(CANTIDAD_PEDIDO, 0) AS CantidadPedido
FROM	CLIENTES INNER JOIN ZONA_VENTAS
ON		CLIENTES.CODIGO_ZONA = ZONA_VENTAS.CODIGO_ZONA

		LEFT OUTER JOIN PEDIDOS 
		ON CLIENTES.CODIGO_CLIENTE = PEDIDOS.CODIGO_CLIENTE;


/*
2.	Crear una consulta que muestre: 
	- el código de pedido, [NUMERO PEDIDO]
	- el nombre del cliente, 
	- descripción del artículo,  [NOMBRE PRODUCTO]
	- la fecha de pedido y 
	- el monto total por articulo pedido (utilice una función para obtener este monto), 
	  este último campo (total) se obtiene al multiplicar las unidades por el precio de venta.
*/
SELECT	NUMERO_PEDIDO, NOMBRE, NOMBRE_PRODUCTO, CONVERT(varchar, FECHA_PEDIDO, 101) as FechaPedido, CANTIDAD_PEDIDO * PRECIO_VENTA AS Total
FROM	PEDIDOS INNER JOIN CLIENTES 
		ON PEDIDOS.CODIGO_CLIENTE = CLIENTES.CODIGO_CLIENTE

		INNER JOIN PRODUCTOS
		ON PEDIDOS.CODIGO_PRODUCTO = PRODUCTOS.CODIGO_PRODUCTO;


/*
3.	Crear una consulta que muestre 
	- el total de unidades pedidas por artículo 
	(debe mostrar la descripción del producto y el total de unidades), 
	
	- el total de unidades lo puede obtener utilizando una función
*/
SELECT	NOMBRE_PRODUCTO, SUM(CANTIDAD_PEDIDO) AS TotalUnidadesPedidas
		
FROM	PEDIDOS INNER JOIN PRODUCTOS 
ON		PEDIDOS.CODIGO_PRODUCTO = PRODUCTOS.CODIGO_PRODUCTO

GROUP BY NOMBRE_PRODUCTO;


/*
4.	Crear una consulta que muestre 
	- el total de unidades pedidas en total(sin importar el producto) en los últimos dos meses
*/

SELECT	NOMBRE_PRODUCTO, SUM(CANTIDAD_PEDIDO) AS TotalUnidadesPedidas
		
FROM	PEDIDOS INNER JOIN PRODUCTOS 
ON		PEDIDOS.CODIGO_PRODUCTO = PRODUCTOS.CODIGO_PRODUCTO

WHERE	DATEDIFF(MONTH, FECHA_PEDIDO, GETDATE()) <= 2

GROUP BY NOMBRE_PRODUCTO;


/*
5.	Crear una consulta que muestre 
	- el número de pedido, 
	- nombre del cliente, 
	- teléfono del cliente, 
	- fecha de pedido, 
	- descripción del artículo, 
	- unidades pedido, y 
	- el nombre de la zona de ventas 
	
	siempre y cuando la zona de ventas pertenezca al pacífico 
*/

SELECT	NUMERO_PEDIDO, NOMBRE, TELEFONO, CONVERT(varchar, FECHA_PEDIDO, 101), NOMBRE_PRODUCTO, CANTIDAD_PEDIDO, DESCRIPCION
FROM	CLIENTES INNER JOIN PEDIDOS
		ON CLIENTES.CODIGO_CLIENTE = PEDIDOS.CODIGO_CLIENTE

		INNER JOIN PRODUCTOS
		ON PEDIDOS.CODIGO_PRODUCTO = PRODUCTOS.CODIGO_PRODUCTO

		INNER JOIN ZONA_VENTAS
		ON CLIENTES.CODIGO_ZONA = ZONA_VENTAS.CODIGO_ZONA

WHERE	DESCRIPCION LIKE('PACIFICO%');


/*
6.	Crear una consulta que muestre: 
	- el código de pedido,  
	- el nombre del cliente, 
	- la fecha de pedido, 
	- el nombre del producto, 
	- la cantidad de pedido, 
	- el precio del producto, 
	- el descuento por producto(que es un 5% sobre el precio y puede calcularlo por medio de una función) 
*/

SELECT	NUMERO_PEDIDO, NOMBRE, CONVERT(varchar, FECHA_PEDIDO, 101) AS FechaPedido, NOMBRE_PRODUCTO, CANTIDAD_PEDIDO, 
		PRECIO_VENTA, CONVERT(decimal(10,2),PRECIO_VENTA*0.05) AS Descuento

FROM	PEDIDOS INNER JOIN CLIENTES 
		ON PEDIDOS.CODIGO_CLIENTE = CLIENTES.CODIGO_CLIENTE

		INNER JOIN PRODUCTOS 
		ON PEDIDOS.CODIGO_PRODUCTO = PRODUCTOS.CODIGO_PRODUCTO;

/*
7.	Mostrar la cantidad de pedido realizados por zona de ventas
*/
SELECT	DESCRIPCION, SUM(CANTIDAD_PEDIDO) CantidadDePedidos

FROM	ZONA_VENTAS INNER JOIN CLIENTES
		ON ZONA_VENTAS.CODIGO_ZONA = CLIENTES.CODIGO_CLIENTE

		INNER JOIN PEDIDOS 
		ON CLIENTES.CODIGO_CLIENTE = PEDIDOS.CODIGO_CLIENTE

GROUP BY DESCRIPCION;


/*
8.	Mostrar el nombre del producto y el monto total de ingresos por pedidos
*/
SELECT	NUMERO_PEDIDO, NOMBRE_PRODUCTO, SUM(PRECIO_VENTA) AS TotalIngreso
FROM	PRODUCTOS INNER JOIN PEDIDOS 
ON		PRODUCTOS.CODIGO_PRODUCTO = PEDIDOS.CODIGO_PRODUCTO

GROUP BY NUMERO_PEDIDO, NOMBRE_PRODUCTO;


/*
9.	Muestre el nombre y código de productos que no han sido pedidos
*/
SELECT	NOMBRE_PRODUCTO, ISNULL(PEDIDOS.CODIGO_PRODUCTO, 0) AS Pedidos
FROM	PRODUCTOS LEFT OUTER JOIN PEDIDOS 
ON		PRODUCTOS.CODIGO_PRODUCTO = PEDIDOS.CODIGO_PRODUCTO

WHERE	PEDIDOS.CODIGO_PRODUCTO IS NULL;


/*
10.	Modificar la tabla de Pedidos para que tenga un campo más llamado cancelado, 
	donde el tipo de dato sea un bit con valor predeterminado en 0, 
	debe hacer que este campo permita nulos
*/

ALTER TABLE PEDIDOS
	ADD CANCELADO bit DEFAULT 0;

SELECT * FROM PEDIDOS;

/*
11.	Elimine la restricción check del campo cantidad_existente en la tabla de productos
*/

ALTER TABLE PRODUCTOS
DROP CONSTRAINT CHK_CANTIDAD_EXISTENTE;

/*
12.	Modifique la tabla de Pedidos para que el campo que acaba de crear guarde un cero
*/

UPDATE PEDIDOS
SET CANCELADO = 0;

/*
13.	Agregue una restricción check a la tabla de Zona de Ventas para que solo admita las descripciones 
que ya están digitadas
*/

ALTER TABLE ZONA_VENTAS
ADD CONSTRAINT CHK_DESCRIPCIONES CHECK(DESCRIPCION IN ( 'PACIFICO CENTRAL',
														'PACIFICO NORTE',
														'PACIFICO SUR',
														'VALLE CENTRAL',
														'HUETAR NORTE',
														'HUETAR ATLANTICO'));

/*
14.	Crear una nueva tabla llamada Abonos_a_Pedidos, que tenga los siguientes campos:
(observar tabla en el documento) 

El número de recibo es PK identity, 

el número de pedido es FK y hace referencia a la tabla de pedidos, 

el monto de abono tiene una restricción para que el valor no sea menor a cero y 

la fecha tiene como valor predeterminado la fecha de hoy

*/

CREATE TABLE ABONOS_A_PEDIDOS (
	NUMERO_RECIBO int IDENTITY NOT NULL, 
	NUMERO_PEDIDO int NOT NULL, 
	MONTO_ABONO decimal(10,2) NOT NULL, 
	FECHA_ABONO datetime DEFAULT GETDATE() NOT NULL
)

-- CLAVES Y RESTRICCIONES: 

ALTER TABLE ABONOS_A_PEDIDOS
ADD CONSTRAINT PK_NUMERO_RECIBO PRIMARY KEY(NUMERO_RECIBO)

ALTER TABLE ABONOS_A_PEDIDOS
ADD CONSTRAINT FK_NUMERO_PEDIDO FOREIGN KEY(NUMERO_PEDIDO) REFERENCES PEDIDOS(NUMERO_PEDIDO)

ALTER TABLE ABONOS_A_PEDIDOS
ADD CONSTRAINT CHK_MONTO_ABONO CHECK(MONTO_ABONO >= 0)

/*
15.	Crear un procedimiento almacenado que inserte un pedido, y 

	- si el pedido ya existe debe actualizar los datos. 
	
	- Tome en cuenta que todos los pedidos son a crédito por lo que el campo cancelado siempre 
	  se debe insertar en cero y no debería permitir actualizar dicho dato.

	  [Al igual que con los campos de BORRADO LOGICO el campo CANCELADO no se usa, ya que siempre
	  debe estar sin cancelar segun se indica en este caso. Analogo a los campos de BORRADO LOGICO
	  que no tiene sentido que se vaya a ACTIVAR un borrado logico en un campo nuevo que se esta ingresando]

*/

GO
CREATE PROCEDURE SP_INSERTAR_PEDIDO( @NumeroPedido int OUT
									,@CodigoCliente int
									,@CodigoProducto int
									,@CantidadPedido int
									,@FechaPedido datetime
									,@Observaciones varchar(150)
									,@MSG varchar(150) OUT )

AS
BEGIN TRY
	BEGIN TRANSACTION 
		IF (EXISTS(		SELECT 1
						FROM PEDIDOS 
						WHERE @NumeroPedido = NUMERO_PEDIDO))
		
		-- Si existe se actualizan los datos de ese pedido
		BEGIN 
			UPDATE PEDIDOS
			SET	CODIGO_CLIENTE = @CodigoCliente,
				CODIGO_PRODUCTO = @CodigoProducto,
				CANTIDAD_PEDIDO = @CantidadPedido,
				FECHA_PEDIDO = @FechaPedido,
				OBSERVACIONES = @Observaciones
									
			WHERE @NumeroPedido = NUMERO_PEDIDO
			
			SET @MSG = 'Se actualizo el registro existente'
		END

		ELSE
			-- Si no existe, se crea un registro nuevo para ese pedido
			BEGIN
				INSERT INTO PEDIDOS(CODIGO_CLIENTE, CODIGO_PRODUCTO, CANTIDAD_PEDIDO, FECHA_PEDIDO, OBSERVACIONES)	
				VALUES (@CodigoCliente, @CodigoProducto, @CantidadPedido, @FechaPedido, @Observaciones)

				SET @MSG = 'Se creo un registro nuevo'

			END

	COMMIT TRANSACTION 
	RETURN 1
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION 
	SET @MSG = @@ERROR
	RETURN 0
END CATCH
GO

/*
-- codigo para probar el procedimiento 

DECLARE @NumeroPedido int = 22
DECLARE @CodigoCliente int = 4
DECLARE @CodigoProducto int = 4
DECLARE @CantidadPedido int = 44
DECLARE @FechaPedido datetime = '20200104'
DECLARE @Observaciones varchar(150) = 'llevar'
DECLARE @MSG varchar(150) 

EXECUTE [DBO].[SP_INSERTAR_PEDIDO] 
		@NumeroPedido OUTPUT
		,@CodigoCliente 
		,@CodigoProducto 
		,@CantidadPedido 
		,@FechaPedido 
		,@Observaciones 
		,@MSG OUTPUT

PRINT @MSG
GO

SELECT * FROM PEDIDOS 
SELECT * FROM CLIENTES
SELECT * FROM PRODUCTOS
*/

/*
16.	Crear un trigger en la tabla de pedidos para que 

	- cuando inserte un pedido 
		- reste la cantidad_existente en la tabla de productos
		  (tome en cuenta que no se debe crear un pedido 
		   si no hay cantidad suficiente en la tabla de productos)
*/

GO
CREATE TRIGGER TR_INSERT_PEDIDOS

	ON PEDIDOS FOR INSERT AS

	DECLARE @EXISTENCIAS int


	SELECT @EXISTENCIAS = PRODUCTOS.CANTIDAD_EXISTENTE
	FROM	PRODUCTOS INNER JOIN inserted
	ON		PRODUCTOS.CODIGO_PRODUCTO = inserted.CODIGO_PRODUCTO
	/*	funciona si se inserta un solo productos a la vez, compara 
		el codigo del producto que se va a insertar (tabla temporal inserted)
		con la tabla PRODUCTOS, para determinar la cantidad disponible
	*/  

	IF(@EXISTENCIAS >= (SELECT CANTIDAD_PEDIDO FROM inserted))
		UPDATE PRODUCTOS
		SET CANTIDAD_EXISTENTE = CANTIDAD_EXISTENTE - inserted.CANTIDAD_PEDIDO
		FROM PRODUCTOS INNER JOIN inserted
		ON	PRODUCTOS.CODIGO_PRODUCTO = inserted.CODIGO_PRODUCTO

	ELSE
		BEGIN
			ROLLBACK TRAN
			RAISERROR('Cantidad insuficiente de productos disponibles', 16, 1)
		END
GO

/*
-- codigo para probar el TRIGGER

INSERT INTO PEDIDOS(CODIGO_CLIENTE, CODIGO_PRODUCTO, CANTIDAD_PEDIDO)
VALUES	(2, 1, 400) 
-- con una cantidad muy alta dispara el trigger e indica que no hay suficientes productos

SELECT * FROM PEDIDOS
SELECT * FROM PRODUCTOS
*/


/*
17.	Crear un trigger en la tabla de pedidos para que 

	cuando actualice un pedido reste o sume la cantidad_existente en 
	la tabla de productos
	
	(tome en cuenta que no se debe modificar un pedido si no hay 
	cantidad suficiente en la tabla de productos)
*/

GO

CREATE OR ALTER TRIGGER TR_ACTUALIZAR_PEDIDOS
	
	ON PEDIDOS FOR UPDATE AS

	DECLARE @EXISTENCIAS int

	SELECT @EXISTENCIAS = PRODUCTOS.CANTIDAD_EXISTENTE
	FROM PRODUCTOS INNER JOIN inserted
	ON PRODUCTOS.CODIGO_PRODUCTO = inserted.CODIGO_PRODUCTO

	IF (@EXISTENCIAS >= (SELECT CANTIDAD_PEDIDO FROM  inserted))

		UPDATE	PRODUCTOS
		SET		CANTIDAD_EXISTENTE = CANTIDAD_EXISTENTE - inserted.CANTIDAD_PEDIDO
		from	inserted INNER JOIN PRODUCTOS 
		ON		inserted.CODIGO_PRODUCTO = PRODUCTOS.CODIGO_PRODUCTO

	ELSE
		BEGIN
			ROLLBACK TRANSACTION 
			RAISERROR('Cantidad insuficiente de producto disponible', 16, 1)
		END
GO

/*
-- codigo para probar el trigger

UPDATE	PEDIDOS
SET		CANTIDAD_PEDIDO = 600
WHERE	NUMERO_PEDIDO = 2


SELECT * FROM PEDIDOS
SELECT * FROM PRODUCTOS
*/

/*
18.	Crear un procedimiento almacenado que 

	inserte un monto de abono al pedido, 
	
	lo primero que debe hacer será sumar el total de abonos que se han hecho 
	al pedido que se desea insertar, 
	
	ese monto debe compararlo contra el total del pedido (cantidad*precio) 
	y si el monto de abono más la suma de abonos anteriores es 
	mayor o igual al total del pedido además de insertar el abono deberá 
	modificar el pedido para que esté cancelado (=1). 
	
	No olvide usar transacciones y manejo de excepciones 
*/

GO
CREATE or ALTER PROCEDURE SP_ABONAR(  @montoDelAbono int
							,@NumeroPedido int 
							,@MSG varchar(150) OUT)

AS
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @DeudaRestante int =   (SELECT	SUM(CANTIDAD_PEDIDO * PRECIO_VENTA)
											FROM	PEDIDOS INNER JOIN PRODUCTOS 
											ON		PEDIDOS.CODIGO_PRODUCTO = PRODUCTOS.CODIGO_PRODUCTO
											WHERE	PEDIDOS.NUMERO_PEDIDO = @NumeroPedido)
			
			DECLARE @SumaDeAbonos int =		((SELECT SUM(MONTO_ABONO)
											FROM ABONOS_A_PEDIDOS
											WHERE NUMERO_PEDIDO = @NumeroPedido) + @montoDelAbono)

			IF (@SumaDeAbonos >= @DeudaRestante)
			
			-- Verdadero significa que ya termino de pagar la deuda
			BEGIN
				UPDATE PEDIDOS
				SET CANCELADO = 1
				WHERE NUMERO_PEDIDO = @NumeroPedido

				INSERT INTO ABONOS_A_PEDIDOS(NUMERO_PEDIDO, MONTO_ABONO, FECHA_ABONO)
				VALUES(@NumeroPedido, @montoDelAbono, getdate())
				
				SET @MSG = 'Se ha cancelado toda la deuda. Se registro el abono. Restante: ' + CAST((@DeudaRestante - @SumaDeAbonos) AS varchar(15))

			END

			-- Falso significa que aun le falta para pagar el total de la deuda
			ELSE
				BEGIN
					INSERT INTO ABONOS_A_PEDIDOS(NUMERO_PEDIDO, MONTO_ABONO, FECHA_ABONO)
					VALUES(@NumeroPedido, @montoDelAbono, getdate())

					SET @MSG = 'Se registro el abono. Deuda restante: ' + CAST((@DeudaRestante - @SumaDeAbonos) AS varchar(15))
				END

		COMMIT TRANSACTION
		RETURN 1
	END TRY

	BEGIN CATCH
		ROLLBACK TRANSACTION
		SET @MSG = @@ERROR
		RETURN 0
	END CATCH
GO

/*
-- codigo para probar el procedimiento

DECLARE @montoDelAbono int = 6000
DECLARE @NumeroPedido int = 13
DECLARE @MSG varchar(150)

EXECUTE [DBO].[SP_ABONAR]
	 @montoDelAbono 
	,@NumeroPedido 
	,@MSG OUTPUT

PRINT @MSG
GO

SELECT * FROM PEDIDOS
SELECT * FROM ABONOS_A_PEDIDOS
*/

/*
19.	Crear un trigger para la tabla de abonos que cuando 
	
	Se realice un cambio a la tabla
	
	no permita modificar un monto de abono
*/

GO
CREATE OR ALTER TRIGGER TR_MONTO_ABONO
	ON ABONOS_A_PEDIDOS INSTEAD OF UPDATE AS

	IF UPDATE(MONTO_ABONO)
		BEGIN
			ROLLBACK TRANSACTION
			RAISERROR('El monto del abono no puede modificarse', 16, 1)
		END
	ELSE
		BEGIN
			UPDATE ABONOS_A_PEDIDOS
				SET NUMERO_PEDIDO = inserted.NUMERO_PEDIDO,
					FECHA_ABONO = inserted.FECHA_ABONO
				FROM ABONOS_A_PEDIDOS INNER JOIN inserted
				ON ABONOS_A_PEDIDOS.NUMERO_RECIBO = inserted.NUMERO_RECIBO
		END

GO

/*
-- codigo para probar el trigger

UPDATE ABONOS_A_PEDIDOS

	SET NUMERO_PEDIDO = 1,
		--FECHA_ABONO = getdate(), -- Esto dispara el trigger
		MONTO_ABONO = 88000

WHERE NUMERO_RECIBO = 1 

GO

SELECT * FROM ABONOS_A_PEDIDOS
*/


/*
20.	Crear una función que devuelva una tabla con

	- el nombre del cliente, 
	- el número de pedido, 
	- el monto total del pedido (cantidad por precio) y 
	- el total pagado(suma de abonos para cada pedido), 
	
	en caso de que no haya pagado nada mostrar un cero
*/

GO
CREATE OR ALTER FUNCTION FN_MOSTRAR_PEDIDO(@CodigoCliente int)
RETURNS @TMP_PEDIDO TABLE(
						--ID int IDENTITY(1,1) PRIMARY KEY,
						NombreCliente varchar(50), 
						NumPedido int, 
						MontoTotal int, 
						TotalPagado int	)
AS
	BEGIN
		INSERT INTO @TMP_PEDIDO 
			SELECT	NOMBRE, PEDIDOS.NUMERO_PEDIDO, CANTIDAD_PEDIDO*PRECIO_VENTA, SUM(MONTO_ABONO)
			FROM	CLIENTES INNER JOIN PEDIDOS
			ON		CLIENTES.CODIGO_CLIENTE = PEDIDOS.CODIGO_CLIENTE

					INNER JOIN PRODUCTOS 
					ON PEDIDOS.CODIGO_PRODUCTO = PRODUCTOS.CODIGO_PRODUCTO

					LEFT JOIN ABONOS_A_PEDIDOS
					ON PEDIDOS.NUMERO_PEDIDO = ABONOS_A_PEDIDOS.NUMERO_PEDIDO
			
			WHERE @CodigoCliente = CLIENTES.CODIGO_CLIENTE

			GROUP BY NOMBRE, PEDIDOS.NUMERO_PEDIDO, CANTIDAD_PEDIDO*PRECIO_VENTA

					   			
		RETURN 
	END
GO

/*
-- codigo para probar la funcion

SELECT * FROM FN_MOSTRAR_PEDIDO(2)

*/
