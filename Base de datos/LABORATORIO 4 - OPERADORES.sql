--Laboratorio OPERADORES--
/*1) Mostrar los empleados que tienen más de 90 horas de vacaciones.
SQL tabla: HumanResources.Employee
MySQL tabla: Employee
campos: VacationHours*/

USE AdventureWorks2019
GO

SELECT *
FROM HumanResources.Employee
WHERE VacationHours > 90
ORDER BY VacationHours

/*2) Mostrar el nombre, precio y precio con iva de los productos con precio distinto de
cero.
SQL tabla: Production.Product
MySQL tabla: product
campos: Name, ListPrice*/

SELECT Name, ListPrice AS Precio, CAST(ListPrice*1.21 AS DECIMAL(10,2)) AS PrecioConIVA
FROM Production.Product
WHERE ListPrice != 0
ORDER BY precio

/*3) Mostrar precio y nombre de los productos 776, 777, 778.
SQL tabla: Production.Product
MySQL tabla: product
campos: ProductID, Name, ListPrice*/SELECT ProductID, Name, ListPriceFROM Production.ProductWHERE ProductID = 776 OR ProductID = 777 OR ProductID = 778ORDER BY ProductID/*4) Mostrar el nombre concatenado con el apellido de las personas cuyo apellido sea
johnson.
SQL tabla: Person.Person
MySQL tabla: contact
campos: FirstName, LastName*/SELECT FirstName + ' ' + LastNameFROM Person.PersonWHERE LastName = 'johnson'ORDER BY FirstName/*5) Mostrar todos los productos cuyo precio sea inferior a 150$ de color rojo o cuyo
precio sea mayor a 500$ de color negro.
SQL tabla: Production.Product
MySQL tabla: product
campos: ListPrice, Color*/SELECT ListPrice, ColorFROM Production.ProductWHERE ListPrice < 150 AND Color = 'red' OR ListPrice > 500 AND Color = 'black'ORDER BY COLOR, ListPrice/*6) Mostrar el código, fecha de ingreso y horas de vacaciones de los empleados
ingresaron a partir del año 2000.
SQL tabla: HumanResources.Employee
MySQL tabla: Employee
campos: BusinessEntityID, HireDate, VacationHours*/

SELECT BusinessEntityID, HireDate, VacationHours
FROM HumanResources.Employee
WHERE YEAR(HireDate) > 2000
ORDER BY HireDate

/*7) Mostrar el nombre, número de producto, precio de lista y el precio de lista
incrementado en un 10% de los productos cuya fecha de fin de venta sea anterior al día
de hoy.
SQL tabla: Production.Product
MySQL tabla: product
campos: Name, ProductNumber, ListPrice, SellStartDate
campos: Weight*/

SELECT Name, ProductNumber, ListPrice, CAST(ListPrice*1.1 AS DECIMAL(10,2)) AS ListPrice10Increase, YEAR(SellStartDate) AS Year_
FROM Production.Product
WHERE SellStartDate < GETDATE()
ORDER BY SellStartDate


