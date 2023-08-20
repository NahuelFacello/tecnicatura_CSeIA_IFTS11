--Laboratorio ORDER BY--
/*1) Mostrar las personas ordenadas primero por su apellido y luego por su nombre
SQL Tabla: Person.Person
MySQL Tabla: contact
Campos: Firstname, Lastname */

SELECT Firstname, Lastname
FROM Person.Person
ORDER BY LastName,FirstName

/*2) Mostrar cinco productos más caros y su nombre ordenado en forma alfabética
SQL Tabla: Production.Product
MySQL Tabla: Product
Campos: Name, ListPrice*/

SELECT TOP 5 ListPrice,Name
FROM Production.Product
ORDER BY ListPrice DESC, Name

/*3) Trabajamos con la tabla "libros" de una librería.
 Eliminamos la tabla si existe*/

IF OBJECT_ID('libros','U') IS NOT NULL
BEGIN
	DROP TABLE libros
END
/*Creamos la tabla:*/

create table libros(
	codigo int identity,
	titulo varchar(40) not null,
	autor varchar(20) default 'Desconocido',
	editorial varchar(20),
	precio decimal(6,2),
	primary key (codigo)
);
/*Ingresamos algunos registros:*/
insert into libros (titulo,autor,editorial,precio) values('El aleph','Borges','Emece',25.33);
insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI',50.65);
insert into libros (titulo,autor,editorial,precio) values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',19.95);
insert into libros (titulo,autor,editorial,precio) values('Alicia en el pais de las maravillas','Lewis Carroll','Planeta',15)/*3.1) Recuperamos los registros ordenados por el título*/SELECT *FROM librosORDER BY titulo/*3.2) Ordenamos los registros por el campo "precio"*/SELECT *FROM librosORDER BY precio/*3.3) Los ordenamos por "editorial", de mayor a menor empleando*/SELECT *FROM librosORDER BY editorial DESC/*3.4) Ordenamos por dos campos, titulo en forma alfabetica y editorial en forma
descendente.*/SELECT *FROM librosORDER BY titulo, editorial DESC