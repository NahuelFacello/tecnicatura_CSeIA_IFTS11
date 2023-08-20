--Laboratorio Funciones de Agregado--
/*1) Mostrar la fecha m�s reciente de venta
SQL Tabla: Sales.SalesOrderHeader
MySQL Tabla: SalesOrderHeader
Campos: OrderDate
SQL Tabla: Production.Product
MySQL Tabla: Product
Campos: ListPrice, Name*/
SQL Tabla: HumanResources.Employee
MySQL Tabla: Employee
Campos: BirthDate*/
SQL Tabla: Production.Product
MySQL Tabla: Product
Campos: ListPrice
SQL Tabla: Sales.SalesOrderDetail
MySQL Tabla: SalesOrderDetail
Campos: LineTotal, OrderQty
1) Mostrar el c�digo de subcategor�a y el precio del producto m�s barato de cada una
de ellas
SQL Tabla: Production.Product
MySQL Tabla: Product
Campos: ProductSubcategoryID, ListPrice
SQL Tabla: Sales.SalesOrderDetail
MySQL Tabla: SalesOrderDetail
Campos: ProductID, OrderQty*/

SELECT ProductID, SUM(OrderQty) AS 'Cantidad ventidad'
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY ProductID

/*3)Mostrar los productos y el total vendido de cada uno de ellos, ordenarlos por el total
vendido
SQL Tabla: Sales.SalesOrderDetail
MySQL Tabla: SalesOrderDetail
Campos: ProductID, LineTotal*/

SELECT ProductID, SUM(LineTotal) AS 'Total ventas'
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY SUM(LineTotal) DESC

/*4) Mostrar el promedio vendido por factura.
SQL Tabla: Sales.SalesOrderDetail
MySQL Tabla: SalesOrderDetail
Campos: SalesOrderID, LineTotal*/

SELECT SalesOrderID, AVG(LineTotal)AS promedio
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID

/*5) Trabajamos con la tabla "libros" de una librer�a
Creamos la tabla:*/

IF OBJECT_ID ('libros', 'u') IS NULL
BEGIN
	CREATE TABLE libros(
	 codigo int identity,
	 titulo varchar(40),
	 autor varchar(30),
	 editorial varchar(15),
	 precio decimal(5,2),
	 cantidad tinyint,
	 primary key(codigo)
	);
END
ELSE
BEGIN
	 PRINT ' YA EXISTE'
END

/*Ingresamos algunos registros:*/
insert into libros values('El aleph','Borges','Planeta',15,null);
insert into libros values('Martin Fierro','Jose Hernandez','Emece',22.20,200);
insert into libros values('Antologia poetica','J.L. Borges','Planeta',null,150);
insert into libros values('Aprenda PHP','Mario Molina','Emece',18.20,null);
insert into libros values('Cervantes y el quijote','Bioy Casares- J.L.Borges','Paidos',null,100);
insert into libros values('Manual de PHP', 'J.C. Paez', 'Siglo XXI',31.80,120);
insert into libros values('Harry Potter y la piedra filosofal','J.K.Rowling',default,45.00,90);
insert into libros values('Harry Potter y la camara secreta','J.K.Rowling','Emece',null,100);
insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',22.50,200);
insert into libros values('PHP de la A a la Z',null,null,null,0);

/*5.1) Obtener la cantidad de libros de cada editorial*/
SELECT editorial, COUNT(cantidad) AS Cantidad
FROM libros 
GROUP BY editorial

/*5.2) Conocer el total en dinero de los libros agrupados por editorial*/

SELECT editorial, SUM(precio) as dinero
FROM libros
GROUP BY editorial

/*5.3) Obtenemos el m�ximo y m�nimo valor de los libros agrupados por editorial*/

SELECT editorial, MAX(precio) as 'Precio Maximo', MIN(precio) AS 'Precio minimo'
FROM libros
GROUP BY editorial

/*5.4) Calcular el promedio del valor de los libros agrupados por editorial*/

SELECT editorial, AVG(precio) as 'Promedio Precios'
FROM libros
GROUP BY editorial

/*5.5) Contar y agrupar por editorial considerando solamente los libros cuyo precio es
menor a 30 pesos*/
1) Mostrar todas las facturas realizadas y el total facturado de cada una de ellas
ordenado por n�mero de factura pero s�lo de aquellas �rdenes superen un total de
$10.000
SQL Tabla: Sales.SalesOrderDetail
MySQL Tabla: SalesOrderDetail
Campos: SalesOrderID, LineTotal*/
SQL Tabla: Sales.SalesOrderDetail
MySQL Tabla: SalesOrderDetail
Campos: SalesOrderID, OrderQty*/
cuestan menos de $150
SQL Tabla: Production.Product
MySQL Tabla: Product
Campos: ProductSubcategoryID, ListPrice*/
productos y el precio de lista promedio por cada uno de aquellos productos que
cuestan m�s de $ 70 y el precio promedio es mayor a $ 300.
SQL Tabla: Production.Product
MySQL Tabla: Product
Campos: ProductSubcategoryID, ListPrice*/