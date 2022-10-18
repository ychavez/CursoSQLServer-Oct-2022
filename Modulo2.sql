create database CursoSQlServerOct2022
go
use CursoSQlServerOct2022
go
create table tblEmployee
(
	EmployeeNumber INT NOT NULL,
	EmployeeFirstName VARCHAR(50) NOT NULL,
	EmployeeMiddleName VARCHAR(50) NULL,
	EmployeeLastName VARCHAR(50) NOT NULL,
	EmployeeGovernmentID CHAR(10) NULL,
	DateOfBirth DATE NOT NULL
)

go

select * from tblEmployee

--- para modificar una tabla o casi cualquier cosa ya creada en una base de datos usaremos ALTER

alter table tblEmployee
add Department varchar(10);

go
select * from tblEmployee





--- Practica:
-- crear una base de datos con codigo llamada "PracticaCursoSQL"
-- dentro de esta base crear una tabla llamada productos con los campos
/*
Id
Nombre
Descripcion
Precio
*/
--despues agregar mediante alter la columna Categoria

insert into tblEmployee
values (1,'Juan','Jacinto','Perez','asdfghjklu',getdate(),'RH')

select * from tblEmployee

insert into tblEmployee
(
EmployeeNumber
,EmployeeFirstName
,EmployeeMiddleName
,EmployeeLastName
,EmployeeGovernmentID
,DateOfBirth)

values (2,'Jose','Jaime','Ruiz','asdfghcklu',getdate())


insert into tblEmployee
values (3,'Alfredo','R','Adame','asdfghjklu',getdate(),'Especialista en seguridad y Sacaborrachos')


--- eliminamos columnas de una tabla
alter table tblEmployee drop column Department


select * from tblEmployee

-- modificamos una columna de una tabla

alter table tblEmployee alter column department varchar(100)