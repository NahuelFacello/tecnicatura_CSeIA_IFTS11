--Laboratorio Tablas--
/*Para todos los ejercicios se debe preguntar si existen los objetos.
Crear una base de datos llamada Laboratorio*/

IF NOT EXISTS(SELECT 1 FROM sys.databases WHERE name='laboratoio') 
	BEGIN
		CREATE DATABASE laboratorio
	END
ELSE
	BEGIN
		PRINT 'La base ya existe'
	END

USE laboratorio
go

/*1) Crear la tabla llamada prueba, dentro de la Base de datos Laborario Campos
idCodido alfanumerico de longitud fija de 4 caracteres que no admite nulos
nombre alfanumerico de longitud variable de 30 caracteres que no admite nulos
precio decimal con dos decimales que no admite nulos.
edad numero que no adminte nulos.*/IF OBJECT_ID('prueba', 'U') IS NULL
	BEGIN
		CREATE TABLE prueba(
			idCodigo char(4) NOT NULL,
			nombre varchar(30) NOT NULL,
			precio decimal (10,2) NOT NULL, 
			edad tinyint NOT NULL)
	END

/*2) Crear una tabla llamado operador que contenga los siguientes campos
codigo_operador alfanumerico de longitud fija de 10 caracteres no admite nulos
nombre alfanumerico de longitud variable de 40 caracteres no admite nulos
fecha_ingreso de tipo fecha no admite nulos
edad numero no admite nulos
Luego de creada añadir una columna llamada telefono alfanumerico de longitud
variable de 20 caracteres*/

IF OBJECT_ID('operador', 'U') IS NULL
	BEGIN
		CREATE TABLE operador(
			codigo_operador char (10) not null,
			nombre varchar (40) not null,
			fecha_ingreso date not null,
			edad tinyint not null)
	END


/*3) Crear la tabla facturas dentro de la base de datos con el siguiente detalle:
letra alfanumerico de longitud fija 1 caracter y PK
numero numérico entero y PK
cliente_id numérico entero que no admite nulos
articulo_id numérico entero que no admite nulos
fecha_factura de tipo fecha no admite nulos
monto decimal de dos caracteres que no admite nulos
PK significa Primary Key observar que se está declarando una clave primaria compuesta
es decir (letra, código)
Cada campo por sí solo no es clave, ni tampoco identifica al registro pero la suma de los
dos forman la clave*/

IF COL_LENGTH('facturas','U') IS NULL
	BEGIN
		CREATE TABLE facturas(
			letra char(1) not null,
			numero int not null,
			cliente_id int not null,
			articulo_id int not null,
			fecha_factura datetime not null,
			monto decimal(10,2),
			PRIMARY KEY (letra,numero) --La union de ambas columnas va a ser la primary key
		)
	END

/*4) Crear la tabla articulos dentro de la base de datos con el siguiente detalle:
articulo_id numérico entero y PK auto incrementeal que comience en 1
nombre alfanumerico de longitud variable de 50 caracteres que no admite nulos
precio decimal no admite nulos
stock numérico entero que no admite nulos*/

IF OBJECT_ID('articulos','U') IS NULL
	BEGIN
		CREATE TABLE articulos(
		articlo_id int not null IDENTITY(1,1) PRIMARY KEY, -- MySQL es AUTO_INCREMENT
		nombre varchar(50) not null,
		precio decimal (10,2) not null,
		stock int not null
		)
	END

/*5) Crear la tabla clientes dentro de la base de datos con el siguiente detalle
cliente_id tipo de dato entero y PK auto incrementeal que comience en 1
nombre alfanumerico de longitud variable de 25 caracteres no admite nulos
apellido alfanumerico de longitud variable de 25 caracteres no admite nulos
cuit alfanumerico de longitud fija de 16 caracteres no adminte nulos
direccion alfanumerico de longitud variable de 50 caracteres admite nulos
comentarios alfanumerico de longitud variable de 50 caracteres admite nulos*/

IF OBJECT_ID('clientes','U') IS NULL
	BEGIN
		CREATE TABLE clientes(
		cliente_id int PRIMARY KEY not null IDENTITY(1,1), -- MySQL es AUTO_INCREMENT
		nombre varchar(25) not null,
		apellido varchar(25) not null,
		cuit char(16) not null,
		direccion varchar(50),
		comentarios varchar(50)
		)
	END

/*6) A la tabla facturas
6.1) agregar un campo observacion alfanumerico de longitud variable de 100 caracteres
que admite nulos.*/

IF COL_LENGTH('facturas', 'observacion') IS NULL
	BEGIN
		ALTER TABLE facturas ADD observacion varchar (20) NULL
	END

/*6.2) modificar el tipo de dato a alfanumerico de longitud variable de 200 caracteres que
no admite nulos.*/

ALTER TABLE facturas ALTER COLUMN observacion varchar(200) not null

/*6.3) eliminar el campo observacio*/

IF COL_LENGTH('facturas', 'observacion') IS NOT NULL
	BEGIN
		ALTER TABLE facturas DROP COLUMN observacion
	END

/*7) Dada la tabla empleados
CREATE TABLE empleados (
idempleado INT NOT NULL,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
nroDocumento VARCHAR(11) NOT NULL,
fechaCreacion DATETIME NOT NULL,
edad TINYINT NOT NULL
)*/

IF OBJECT_ID('empleaodos','U') IS NULL
	BEGIN
		CREATE TABLE empleados (
			idempleado INT NOT NULL,
			nombre VARCHAR(100) NOT NULL,
			apellido VARCHAR(100) NOT NULL,
			nroDocumento VARCHAR(11) NOT NULL,
			fechaCreacion DATETIME NOT NULL,
			edad TINYINT NOT NULL)
	END
/*7.1) Crear una restriccion de clave primaria para el campo idempleado*/

ALTER TABLE Empleados ADD PRIMARY KEY(idempleado) 

/*7.2) Crear una restriccion unique al campo nroDocument*/
ALTER TABLE empleados ADD UNIQUE (nrodocumento)/*7.3) Crear una restriccion check para que la edad no sea negativa*/ALTER TABLE empleados ADD CHECK (edad >=0)

/*7.4) Crear una restriccion default para el campo fechaCreacion que sea la fecha del
servidor (SQL → GETDATE(), MySQL →CURDATE())*/

ALTER TABLE empleados ADD DEFAULT getdate() FOR fechacreacion

/*7.5) Deshabilitar las restricciones creadas para edad*/

ALTER TABLE empleados DROP constraint CK__empleados__edad__3D5E1FD2;

/*8) A la tabla de facturas crear las restriccion FK para los campos cliente_id y articulo_id */

ALTER TABLE facturas ADD CONSTRAINT fk_facturas_cliente_id FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)

/*9) Crear la tabla usuarios que contengá los siguientes campos:
- clave: alfanumerico de 10 caracteres de longitud variable.
- nombre: alfanumerico de 30 caracteres de longitud variable,
Definir el campo "nombre" como clave primaria.*/IF OBJECT_ID('usuarios', 'U') IS NULL	BEGIN		CREATE TABLE usuarios(			clave VARCHAR(10),			nombre VARCHAR(30) PRIMARY KEY NOT NULL)	END/*10) Crear la tabla libros con la siguiente estructura
Creamos la tabla especificando que el campo "codigo" genere valores secuenciales
comenzando en 1 e incrementándose en 1 automáticamente y que sea PK.
codigo numero,
titulo alfanumerico de 50 caracteres no nulo,
autor alfanumerico de 30 caracteres no nulo,
editorial alfanumerico de 20 caracteres no nulo,
precio decimal no nulo.*/

IF OBJECT_ID('libros','U') IS NULL
	BEGIN
		CREATE TABLE libros(
			codigo INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
			titulo VARCHAR(50) NOT NULL,
			autor VARCHAR(30) NOT NULL,
			editorial VARCHAR(20) NOT NULL,
			precio DECIMAL NOT NULL)
	END

/*10.1) Al campo autor setearle por defecto el valor “Desconocido”*/

ALTER TABLE libros ADD DEFAULT 'Desconocido' FOR autor

/*10.2) Al campo precio setearlo una restricción check que su valor sea positivo*/

ALTER TABLE libros ADD CHECK (precio > 0)

/*10.3) Escribir la sintaxis para deshabilitar la restricción check sobre el campo precio*/

ALTER TABLE libros DROP CONSTRAINT CK__libros__precio__4CA06362

/*11) Escribir la sintaxis para eliminar las tablas creadas.*/

IF OBJECT_ID('libros','U') IS NOT NULL
BEGIN
    DROP TABLE libros;
    PRINT 'La libros se eliminó correctamente.'
END

IF OBJECT_ID('libros','U') IS NOT NULL
BEGIN
    DROP TABLE libros;
    PRINT 'La libros se eliminó correctamente.'
END

IF OBJECT_ID('facturas','U') IS NOT NULL
BEGIN
    DROP TABLE facturas;
    PRINT 'La facturas se eliminó correctamente.'
END

IF OBJECT_ID('operador','U') IS NOT NULL
BEGIN
    DROP TABLE operador;
    PRINT 'La operador se eliminó correctamente.'
END

IF OBJECT_ID('prueba','U') IS NOT NULL
BEGIN
    DROP TABLE prueba;
    PRINT 'La prueba se eliminó correctamente.'
END

IF OBJECT_ID('emplados','U') IS NOT NULL
BEGIN
    DROP TABLE empleados;
    PRINT 'La empleados se eliminó correctamente.'
END

IF OBJECT_ID('clientes','U') IS NOT NULL
BEGIN
    DROP TABLE clientes;
    PRINT 'La clientes se eliminó correctamente.'
END


/*12) Escribir la sintaxis para eliminar la base de datos*/

IF DB_ID('laboratorio') IS NOT NULL
	USE master
	GO
BEGIN
    DROP DATABASE laboratorio
    PRINT 'La base de datos se eliminó correctamente.'
END