/*Laboratorio DISTINCT, UNION, CASE
1) Mostrar los diferentes productos vendidos
SQL Tabla: Sales.SalesOrderDetail
MySQL Tabla: SalesOrderDetail
Campos: ProductID*/

USE AdventureWorks2019
GO

SELECT DISTINCT ProductID
FROM Sales.SalesOrderDetail 

/*UNION
2) Mostrar todos los productos vendidos y ordenados
SQL Tablas: Sales.SalesOrderDetail, Production.WorkOrder
MySQL Tablas: SalesOrderDetail, WorkOrder
Campos: ProductID*/

SELECT ProductID
FROM Sales.SalesOrderDetail
UNION
SELECT ProductID
FROM Production.WorkOrder
ORDER BY ProductID

/*3) Mostrar los diferentes productos vendidos y ordenados
SQL Tablas: Sales.SalesOrderDetail, Production.WorkOrder
MySQL Tablas: SalesOrderDetail, WorkOrder
Campos: ProductID*/

SELECT ProductID
FROM Sales.SalesOrderDetail
UNION
SELECT ProductID
FROM Production.WorkOrder
ORDER BY ProductID

/*CASE
4) Obtener el id y una columna denominada sexo cuyo valores disponibles sean
“Masculino” y ”Femenino”
SQL Tabla: HumanResources.Employee
MySQL Tabla: Employee
Campos: BusinessEntityID, Gender*/

SELECT BusinessEntityID, 
       CASE Gender
            WHEN 'M' THEN 'Masculino'
            WHEN 'F' THEN 'Femenino'
            ELSE 'Desconocido'
       END AS Sexo
FROM HumanResources.Employee;

/*5) Mostrar el id de los empleados si tiene salario deberá mostrarse descendente de
lo contrario ascendente
SQL Tabla: HumanResources.Employee
MySQL Tabla: Employee
Campos: BusinessEntityID, SalariedFlag*/

SELECT BusinessEntityID, SalariedFlag
FROM HumanResources.Employee
ORDER BY
    CASE SalariedFlag WHEN  1 THEN BusinessEntityID END DESC,
    CASE SalariedFlag WHEN 0 THEN BusinessEntityID END ASC;