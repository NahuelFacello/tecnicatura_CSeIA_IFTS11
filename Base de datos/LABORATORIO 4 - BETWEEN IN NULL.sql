--LABORATORIO BETWEEN IN NULL--

/*Laboratorio BETWEEN
1) Mostrar todos los productos cuyo precio de lista est� entre 200 y 300.
SQL tabla: Production.Product
MySQL tabla: product
campos: ListPrice
SQL tabla: HumanResources.Employee
MySQL tabla: employee
campos: BirthDate*/

SELECT *
2000 y 2006.
SQL tabla:Sales.SalesOrderHeader
MySQL tabla: SalesOrderHeader
campos: OrderDate, AccountNumber, SubTotal
SQL tabla: Production.Product
MySQL tabla: product
campos: ListPrice*/
1) Mostrar los c�digos de venta y producto, cantidad de venta y precio unitario de los
art�culos 750, 753 y 770.
SQL tablas: Sales.SalesOrderDetail
MySQL tabla: SalesOrderDetail
campos: SalesOrderID, ProductID, OrderQty, UnitPrice
SQL tabla: Production.Product
MySQL tabla: product
campos: Color*/
1) Mostrar los representantes de ventas (vendedores) que no tienen definido el n�mero
de territorio.
SQL tablas: Sales.SalesPerson
MySQL tabla: SalesPerson
campos: BusinessEntityID, TerritoryID*/


SELECT BusinessEntityID, TerritoryID
FROM Sales.SalesPerson
WHERE TerritoryID IS NULL

/*2) Mostrar el peso de todos los art�culos. si el peso no estuviese definido, reemplazar
por cero.
SQL tabla: Production.Product
MySQL tabla: product
campos: Weight*/

SELECT ISNULL(Weight, 0) AS peso
FROM Production.Product

