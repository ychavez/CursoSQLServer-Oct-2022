SELECT *
FROM tblEmployee;

--- actualizamos el empleado 1 cambiamos el apellido a A
UPDATE tblEmployee
  SET 
      EmployeeLastName = 'A'
WHERE EmployeeNumber = 1;

--
--- creamos la tabla de transacciones
CREATE TABLE tblTransaction
(Amount            SMALLMONEY, 
 DateOfTransaction SMALLDATETIME, 
 EmployeeNumber    INT NOT NULL
);

-- yo quiero ver el nombre del empleado en cada transaccion Ok!
SELECT 
tblTransaction.Amount,
tblTransaction.DateOfTransaction,
tblEmployee.EmployeeFirstName
FROM tblTransaction
     JOIN tblEmployee ON tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
where Amount > 800

SELECT 
t.Amount,
t.DateOfTransaction,
e.EmployeeFirstName
FROM tblTransaction t
     JOIN tblEmployee e ON e.EmployeeNumber = t.EmployeeNumber
where Amount > 800



-- quiero que a los empleado que tengan una transaccion mayor a 800 le agreguemos un "." a su RFC
update e set e.EmployeeGovernmentID = '.' 
from tblEmployee e  
JOIN tblTransaction t on t.EmployeeNumber = e.EmployeeNumber
where Amount > 800


-- quiero borrar todos los empleados que tienen transacciones negativas
delete e from  tblEmployee e join 
tblTransaction t on t.EmployeeNumber = e.EmployeeNumber
where Amount < 0


select * from tblEmployee



--- Practica
/*
1.- crear tabla de categorias
  (Id,nombre de categoria, descripcion)

2.- agregar la columna de categoriaId a la tabla de productos

3.- insertar datos dummy

4.- hacer una consulta para ver la categoria en el producto

5.- hacer un script para sumarle 10 pesos al productos que este en X categoria

6.- eliminar productos que esten en una categoria

/*
