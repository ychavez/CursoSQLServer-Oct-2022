create proc sp_Sumar @num1 int, @num2 int
as
begin
select @num1 + @num2 as resultado
end

exec sp_Sumar 2, 5

go


/**************************************************
** este sp aumenta el precio de las transacciones positivas
**
****************************************************/
create proc sp_AumentarPrecioTransacciones @Aumento money
as
begin
select * from tblTransaction
update tblTransaction set Amount = Amount + @Aumento where Amount > 0
select * from tblTransaction
end

exec sp_AumentarPrecioTransacciones 20

go

/**************************************************
** este sp aumenta el precio de las transacciones de un empleado
**
****************************************************/
create or alter proc sp_AumentarPrecioTransaccionEmpleado @Aumento money, @NumeroEmpleado int
as
begin

select * from tblTransaction where @NumeroEmpleado = EmployeeNumber
update tblTransaction set Amount = Amount + @Aumento where EmployeeNumber = @NumeroEmpleado 
select * from tblTransaction where  @NumeroEmpleado = EmployeeNumber

end

go

--- Tipos tabla

create type tblEmpleadoAumento as table (
amount money,
employeenumber int
)



/**************************************************
** este sp aumenta el precio de las transacciones de un empleado por lote
**
****************************************************/


go

CREATE OR ALTER PROC sp_AumentarPrecioTransaccionEmpleadoPorLote @Lote AS TBLEMPLEADOAUMENTO READONLY
AS
    BEGIN
        MERGE INTO tblTransaction AS T
        USING @Lote L
        ON t.EmployeeNumber = l.employeenumber
            WHEN MATCHED
            THEN UPDATE SET 
                            Amount = t.Amount + l.amount
        OUTPUT inserted.*, 
               deleted.*;
    END;

	go

	declare @Lote AS TBLEMPLEADOAUMENTO

	insert into @Lote values(50,123),(100,127),(25,126)

	exec sp_AumentarPrecioTransaccionEmpleadoPorLote @Lote