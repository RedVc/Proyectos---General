/* Base de Datos para el: Instituto Especializado de Entrenamiento en Triatlón (IEET)
   INA
   Redwin Valverde Castro
*/

CREATE DATABASE BD_TRIATLON_Redwin_F3
GO

USE BD_TRIATLON_Redwin_F3
GO

-- *********************************** Creacion de tablas ***********************************

CREATE TABLE INSTITUTOS(
	Cod_Instituto		smallint IDENTITY, -- PK
	Nombre_Instituto	varchar(30) NOT NULL,
	Telefono1_Instituto varchar(30) NOT NULL,
	Telefono2_Instituto varchar(30),
	Email1_Instituto	varchar(76) NOT NULL,
	Email2_Instituto	varchar(76),
	SitioWeb_Instituto	varchar(150) NOT NULL,
	Horario_Instituto	varchar(30) NOT NULL,
	Distrito_Instituto	varchar(30) NOT NULL,
	Canton_Instituto	varchar(30) NOT NULL,
	Provincia_Instituto varchar(10) NOT NULL,
	Pais_Instituto		varchar(20) NOT NULL,
	Direccion_Instituto varchar(150) NOT NULL,
	Activo_Instituto	bit
);

CREATE TABLE HORARIOS_ENTRENADORES(
	Cod_Horario_Entr			int IDENTITY, -- PK
	L_Hor						bit NOT NULL,
	K_Hor						bit NOT NULL,
	M_Hor						bit NOT NULL,
	J_Hor						bit NOT NULL,
	V_Hor						bit NOT NULL,
	S_Hor						bit NOT NULL,
	D_Hor						bit NOT NULL,	
	Hora_Inicio_Hor				time(0) NOT NULL,
	Hora_Fin_Hor				time(0) NOT NULL,
	Descripcion_Horario			varchar(200) NOT NULL
);

CREATE TABLE ENTRENADORES(
	Cod_Entrenador				int IDENTITY, -- PK
	Cod_Horario_Entr			int NOT NULL, -- FK
	ID_Entrenador				varchar(50) NOT NULL, -- UNIQUE
	Nombre_Entrenador			varchar(20) NOT NULL,
	Apellido1_Entrenador		varchar(20) NOT NULL,
	Apellido2_Entrenador		varchar(20) NOT NULL,
	Nacimiento_Entrenador		date NOT NULL,
	Telefono1_Entrenador		varchar(30) NOT NULL,
	Telefono2_Entrenador		varchar(30),
	Email1_Entrenador			varchar(76) NOT NULL,
	Email2_Entrenador			varchar(76),
	Distrito_Entrenador			varchar(30) NOT NULL,
	Canton_Entrenador			varchar(30) NOT NULL,
	Provincia_Entrenador		varchar(10) NOT NULL,
	Pais_Entrenador				varchar(20) NOT NULL,
	Direccion_Entrenador		varchar(150) NOT NULL,
	Cuenta_Bancaria_Entrenador	varchar(20) NOT NULL,
	Activo_Entrenador			bit
);

CREATE TABLE CERTIFICACIONES_ENTRENADORES(
	Cod_Certificacion			int IDENTITY, -- PK
	Cod_Entrenador				int NOT NULL, -- FK
	Cod_Instituto				smallint NOT NULL, -- FK
	Fecha_Certificacion			date NOT NULL,
	Tipo_Certificacion			varchar(50) NOT NULL,
	Descripcion_Certificacion	varchar(150) NOT NULL
);

CREATE TABLE VACACIONES_INCAPACIDADES_EVENTOS(
	Cod_Vac_Inc_Evento				int IDENTITY, -- PK
	Cod_Entrenador					int NOT NULL, -- FK
	Tipo_Evento						varchar(30) NOT NULL,
	Fecha_Inicio					date NOT NULL,
	Fecha_Final						date NOT NULL,
	Detalle_Evento					varchar(150)
);

CREATE TABLE REGISTRO_HORAS_LABORADAS_ENTRENADOR(
	Cod_Registro_Horas_Laboradas		int IDENTITY, -- PK
	Cod_Entrenador					int NOT NULL, -- FK
	Fecha_laborada					date NOT NULL,
	Hora_Ingreso_Laborada			time(0) NOT NULL,
	Hora_Salida_Laborada			time(0) NOT NULL,
	Detalle_Laborado				varchar(150)
);

-- ****************** ZONA ABAJO ****************** 

CREATE TABLE PROGRAMAS(
	Cod_Programa			int IDENTITY, -- PK
	Nombre_Programa			varchar(15) NOT NULL,
	Duracion_Programa		int NOT NULL,
	Descripcion_Programa	varchar(150) NOT NULL,
	Requisitos_Programa		varchar(150) NOT NULL,
	Observaciones_Programa	varchar(150) NOT NULL,
	Adicional_Programa		varchar(150) NOT NULL
);

CREATE TABLE MODULOS(
	Cod_Modulo			int IDENTITY, -- PK
	Nombre_Modulo		varchar(15) NOT NULL,
	Duracion_Modulo		decimal(10,2) NOT NULL,
	Requisitos_Modulo	varchar(150) NOT NULL,
	Detalle_Modulo		varchar(150) NOT NULL
);

CREATE TABLE MODULOS_PROGRAMAS(
	Cod_Modulo_Programa	int IDENTITY, -- PK
	Cod_Programa		int NOT NULL, -- FK
	Cod_Modulo			int NOT NULL -- FK
);

CREATE TABLE HORARIOS_MODULOS(
	Cod_Horario_Modulo	int IDENTITY, -- PK
	L_Mod				bit NOT NULL,
	K_Mod				bit NOT NULL,
	M_Mod				bit NOT NULL,
	J_Mod				bit NOT NULL,
	V_Mod				bit NOT NULL,
	S_Mod				bit NOT NULL,
	D_Mod				bit NOT NULL,
	Hora_Inicio_Mod	time(0) NOT NULL,
	Hora_Fin_Mod	time(0) NOT NULL,
	Descripcion_Mod	varchar(150)
);

CREATE TABLE ESTUDIANTES(
	Cod_Estudiante				int IDENTITY, -- PK
	ID_Estudiante				varchar(50) NOT NULL,
	Nombre_Estudiante			varchar(20) NOT NULL,
	Apellido1_Estudiante		varchar(20) NOT NULL,
	Apellido2_Estudiante		varchar(20) NOT NULL,
	Nacimiento_Estudiante		date NOT NULL,
	Telefono1_Estudiante		varchar(30) NOT NULL,
	Telefono2_Estudiante		varchar(30),
	Email1_Estudiante			varchar(76) NOT NULL,
	Email2_Estudiante			varchar(76),
	Distrito_Estudiante			varchar(30) NOT NULL,
	Canton_Estudiante			varchar(30) NOT NULL,
	Provincia_Estudiante		varchar(10) NOT NULL,
	Pais_Estudiante				varchar(20) NOT NULL,
	Direccion_Estudiante		varchar(150) NOT NULL,
	Observacion_Estudiante		varchar(150),
	Activo_Estudiante			bit
);

CREATE TABLE MATRICULAS(
	Cod_Matricula				int IDENTITY, -- PK
	Cod_Estudiante				int NOT NULL, -- FK
	Fecha_Matricula				date NOT NULL,
	Estado_Matricula			varchar(15) NOT NULL,
	Monto_Cancelado_Matricula	decimal(10,2) NOT NULL,
	Tipo_Cobro_Matricula		varchar(20) NOT NULL,
	Tipo_Pago_Matricula			varchar(15) NOT NULL,
	Detalle_Matricula			varchar(150)
);

CREATE TABLE MODULOS_ABIERTOS(
	Cod_Modulo_Abierto	int IDENTITY NOT NULL, -- PK
	Cod_Entrenador		int NOT NULL, -- FK
	Cod_Modulo			int NOT NULL, -- FK
	Cod_Horario_Modulo	int NOT NULL, -- FK
	Costo_Modulo		decimal(10,2) NOT NULL,
	Inicio_Mod_A		date NOT NULL,
	Fin_Mod_A			date NOT NULL
);

CREATE TABLE DETALLE_MATRICULA(
	Cod_Modulo_Abierto	int, -- PK, FK
	Cod_Matricula		int, -- PK, FK
	Estado_DM			varchar(15) NOT NULL,
	Nota_Final			int
);