--- quiero tener la cuenta de los empleados
SELECT COUNT(*)
FROM tblEmployee;
SELECT COUNT(*), 
       Department
FROM tblEmployee
GROUP BY Department;

--- obtenemos los departamentos unicos agrupados
SELECT Department
FROM tblEmployee
GROUP BY Department;

--- nos traemos lo valores unicos

SELECT DISTINCT 
       department
FROM tblEmployee;

-- traeme los empleados por departamento sin contar a los de TI
SELECT COUNT(*), 
       Department
FROM tblEmployee
WHERE Department != 'TI'
GROUP BY Department;

--- quiero ver los empleados por año nacimiento
SELECT COUNT(*), 
       YEAR(DateOfBirth)
FROM tblemployee
GROUP BY YEAR(DateOfBirth);

--- quiero ver los empleados por año nacimiento sin contar los del 92
SELECT COUNT(*), 
       YEAR(DateOfBirth)
FROM tblemployee
WHERE YEAR(DateOfBirth) < 1981
GROUP BY YEAR(DateOfBirth);

--- quiero ver los empleados por año nacimiento solo quiero los que tengan mas de 80
SELECT COUNT(*) Cuenta, 
       LEFT(EmployeeFirstName, 1) Inicial
FROM tblemployee
GROUP BY LEFT(EmployeeFirstName, 1)
HAVING COUNT(*) > 80
ORDER BY 1 DESC;
-- el having nos sirve para filtrar por lo ya agrupado
----------------------------------Merge----------------------
SELECT *
FROM tblTransaction;
SELECT *
FROM tblTransaction2;

--- merge nos servira para combinar la informacion de dos tablas------

MERGE INTO tbltransaction AS t
USING tbltransaction2 AS t2
ON t.employeenumber = t2.employeenumber
   AND t.dateoftransaction = t2.dateoftransaction
   AND t.amount = t2.amount
    WHEN MATCHED
    THEN UPDATE SET 
                    amount = t.amount + t2.amount
    WHEN NOT MATCHED
    THEN
      INSERT(amount, 
             dateoftransaction, 
             employeenumber)
      VALUES
(t2.amount, 
 t2.dateoftransaction, 
 t2.employeenumber
)
OUTPUT deleted.*, 
       inserted.*;

---	   select * into estaTablanoExiste from tblEmployee

/*
1.- haciendo uso del select into crearemos una tabla nueva de productos
2.- a esa tabla nueva le modificaremos y agregaremos algunos datos
3.- mezclamos los datos de estas dos tablas sobre la tabla productos
4.- consultar la cantidad de productos que tengo por cada categoria
5.- consultar las categorias y poner el valor total de productos en esta ctegoria
	solamente los que sean mayores a 10
 -------
 cat    |  precio
 Salas     $10,000
 */

 select * from tblEmployee