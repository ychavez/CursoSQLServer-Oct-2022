--- constraints
SELECT *
FROM tblEmployee;

-- Unique, esto nos sirve para decirle que los valores tienen que ser unicos
/*
codigo
1 ☺
2 ☺
3 ☺
4 ☺
5 ☺
1 X

*/

ALTER TABLE tblEmployee
ADD CONSTRAINT unqEmployeeGovermmentID UNIQUE(EmployeeGovernmentID);
SELECT *
FROM tblEmployee;
UPDATE tblEmployee
  SET 
      EmployeeGovernmentID = 'ET925170N ';

--  constraints unicos de varias columnas

ALTER TABLE tblEmployee
ADD CONSTRAINT unqFullName UNIQUE(EmployeeFirstName, EmployeeMiddleName, EmployeeLastName);
INSERT INTO tblEmployee
VALUES
(100000, 
 'Alejandro3', 
 '', 
 'Hinojosa', 
 'XB123656X3', 
 GETDATE(), 
 'TI'
);

--- creamos llave primaria
ALTER TABLE tblemployee
ADD CONSTRAINT PK_tblEmployee PRIMARY KEY(EmployeeNumber);

--- departamento no sea nuleable

ALTER TABLE tblemployee ALTER COLUMN department VARCHAR(100) NOT NULL;

-- insertamos un valor a empleados con departamento nulo

--- queremos que cuando no se especifique 
-- el nombre del departamento se ponga uno por defecto
INSERT INTO tblEmployee

VALUES
(100002, 
 'Alejandroe', 
 '', 
 'Hinojosa', 
 'XB12365eX9', 
 GETDATE(),
 'Departamento'
);

--- constraint default
alter table tblemployee
add constraint DF_department default 'Produccion' for department

select * from tblEmployee where EmployeeNumber = 100002

-- foreign key

select * from tblEmployee
select * from tblTransaction

alter table tbltransaction add constraint FK_Employee_Transaction
foreign key (employeenumber) references tblemployee(EmployeeNUMBER)



SELECT 
tblTransaction.Amount,
tblTransaction.DateOfTransaction,
tblEmployee.EmployeeFirstName
FROM tblTransaction
   left  JOIN tblEmployee ON tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
    where EmployeeFirstName is null

	-- intentamos borrar un empleado que tien transacciones

	select * from tblEmployee
	delete tblEmployee where EmployeeNumber = 1

	/*
	agregar llaves primarias y foraneas a tablas 
	categoria y producto
	
	*/


	--- tabla auto genera id numerico
	create table numeroUnico(
	Id int constraint PK_numeroUnico primary key identity(1,1),
	Nombre varchar(10)
	)

	select * from numeroUnico

	insert into numeroUnico values ('Hola')

	delete numeroUnico
	--- delete borra y deja el registro del identity

	truncate table numerounico 
	--- truncate no tiene mas clausulas

	-- GUID

	-- creacion de un Guid en SQL

	select newid()


	-- creacion de tablas con id de Guid

	create table GuidUnico(
	Id uniqueidentifier constraint PK_GuidUnico primary key default newid(),
	Nombre varchar(10)
	)
	insert into GuidUnico (Nombre) values ('Yael')


	create table GuidUnicoSecuencial(
	Id uniqueidentifier constraint PK_GuidUnicoSecuencial primary key default newsequentialid(),
	Nombre varchar(10)
	)

	insert into GuidUnicoSecuencial (Nombre) values ('Yael')

	select * from GuidUnico
	select * from GuidUnicoSecuencial