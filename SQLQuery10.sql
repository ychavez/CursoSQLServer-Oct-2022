---- en un trigger validar que las transacciones sean solo a empleados mayores de 40 año

CREATE OR ALTER TRIGGER TR_tblTransaction ON tbltransaction

/*instead of | after*/

INSTEAD OF INSERT, UPDATE AS
BEGIN
    DECLARE @EmployeeNumber AS INT;
    DECLARE @Edad AS INT;
    SELECT @EmployeeNumber = EmployeeNumber
    FROM inserted;
    SELECT @Edad = YEAR(GETDATE()) - YEAR(DateOfBirth)
    FROM tblEmployee
    WHERE EmployeeNumber = @EmployeeNumber;
    IF(@Edad > 40)
        -- para saber dentro de un trigger si fue insert o delete
        IF(EXISTS
        (
            SELECT *
            FROM inserted
        )
           AND NOT EXISTS
        (
            SELECT *
            FROM deleted
        ))
            INSERT INTO tblTransaction
                   SELECT *
                   FROM inserted;
            ELSE
            -- aqui estamos seguros que fue un Update
            UPDATE t
              SET 
                  t.Amount = i.Amount
            FROM tblTransaction t
                 JOIN inserted i ON i.EmployeeNumber = t.EmployeeNumber;
        ELSE
        SELECT 'no tiene edad para transacciones';
END;
select * from tblTransaction where EmployeeNumber = 129
select * from tblTransaction where EmployeeNumber = 629

update tblTransaction set EmployeeNumber = 129 where EmployeeNumber = 629 



select * from tblTransaction where EmployeeNumber = 629
select * from tblTransaction where EmployeeNumber = 129


select * from tblEmployee where YEAR(DateOfBirth) < 1980



/*
1.- queremos agregar una validacion al insertar productos
	esta validacion es de que un producto no puede insertarse con una categoria que ya tiene un valor mayor a N y regresar un mensaje que diga el precio 
	total de la catgoria ya es de N
*/
