
--declare @contador int = 1
--while @contador < 100
--begin
--select @contador
--set @contador = @contador + 1
--end

DECLARE @Employyenumber INT, @FirstName VARCHAR(50), @Middlename VARCHAR(50), @LastName VARCHAR(50);
DECLARE crfEmployee CURSOR
FOR SELECT top 10 EmployeeNumber, 
           EmployeeFirstName, 
           EmployeeMiddleName, 
           EmployeeLastName
    FROM tblEmployee;
OPEN crfEmployee;
FETCH NEXT FROM crfEmployee INTO @Employyenumber, @FirstName, @Middlename, @LastName;
WHILE @@FETCH_STATUS = 0
    BEGIN

        --- aqui va el codigo de las iteraciones

        SELECT @Employyenumber, 
               @FirstName, 
               @Middlename, 
               @LastName;
        FETCH NEXT FROM crfEmployee INTO @Employyenumber, @FirstName, @Middlename, @LastName;
    END;
close crfEmployee
deallocate  crfEmployee