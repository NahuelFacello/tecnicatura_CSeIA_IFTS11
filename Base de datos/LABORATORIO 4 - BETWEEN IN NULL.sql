--LABORATORIO BETWEEN IN NULL--

/*Laboratorio BETWEEN
1) Mostrar todos los productos cuyo precio de lista esté entre 200 y 300.
SQL tabla: Production.Product
MySQL tabla: product
campos: ListPrice*/USE AdventureWorks2019GOSELECT *FROM Production.ProductWHERE listPrice BETWEEN 200 AND 300/*2) Mostrar todos los empleados que nacieron entre 1970 y 1985.
SQL tabla: HumanResources.Employee
MySQL tabla: employee
campos: BirthDate*/

SELECT *FROM HumanResources.EmployeeWHERE YEAR(BirthDate) BETWEEN 1970 AND 1985/*3) Mostrar el la fecha,numero de version y subtotal de las ventas efectuadas en los años
2000 y 2006.
SQL tabla:Sales.SalesOrderHeader
MySQL tabla: SalesOrderHeader
campos: OrderDate, AccountNumber, SubTotal*/SELECT OrderDate, RevisionNumber, SubTotalFROM Sales.SalesOrderHeaderWHERE YEAR(OrderDate) BETWEEN 2000 AND 2006/*4) Mostrar todos los productos cuyo precio de lista no esté entre 50 y 70.
SQL tabla: Production.Product
MySQL tabla: product
campos: ListPrice*/SELECT *FROM Production.ProductWHERE ListPrice NOT BETWEEN 50 AND 70/*Laboratorio IN
1) Mostrar los códigos de venta y producto, cantidad de venta y precio unitario de los
artículos 750, 753 y 770.
SQL tablas: Sales.SalesOrderDetail
MySQL tabla: SalesOrderDetail
campos: SalesOrderID, ProductID, OrderQty, UnitPrice*/SELECT SalesOrderID, ProductID, OrderQty, UnitPriceFROM Sales.SalesOrderDetailWHERE ProductID IN (750, 753, 770)/*2) Mostrar todos los productos cuyo color no sea verde, blanco y azul.
SQL tabla: Production.Product
MySQL tabla: product
campos: Color*/SELECT *FROM Production.ProductWHERE Color NOT IN ('green','white','blue')/*Laboratorio NULL
1) Mostrar los representantes de ventas (vendedores) que no tienen definido el número
de territorio.
SQL tablas: Sales.SalesPerson
MySQL tabla: SalesPerson
campos: BusinessEntityID, TerritoryID*/


SELECT BusinessEntityID, TerritoryID
FROM Sales.SalesPerson
WHERE TerritoryID IS NULL

/*2) Mostrar el peso de todos los artículos. si el peso no estuviese definido, reemplazar
por cero.
SQL tabla: Production.Product
MySQL tabla: product
campos: Weight*/

SELECT ISNULL(Weight, 0) AS peso
FROM Production.Product


