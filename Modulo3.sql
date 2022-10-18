

select * from tblEmployee where EmployeeFirstName = 'Juan'
-- filtramos por todos los que se llamen Juan

select * from tblEmployee where EmployeeFirstName <> 'Juan'
select * from tblEmployee where EmployeeFirstName != 'Juan'
-- filtramos por todos los que no se llamen Juan


-- trame todos los que su nombre comiencen con la letra J

select * from tblEmployee where EmployeeFirstName like 'J%'

-- trame todos los que su nombre termine con la letra J

select * from tblEmployee where EmployeeFirstName like '%J'

-- trame todos los que su nombre contenga la  letra J

select * from tblEmployee where EmployeeFirstName like '%J%'

--- traeme todos los que la segunda letra de su nombre sea la J

select * from tblEmployee where EmployeeFirstName like '_J%'

---traeme todos los que esten desde a A hasta la  J en su primer letra

select * from tblEmployee where EmployeeFirstName like '[a-j]%' 

-- traeme todos los que su letra de inicio sea la A, la R y la T

select * from tblEmployee where EmployeeFirstName like '[ART]%' 

-- traeme todos los que su letra de inicio no  sea la A, la R y la T

select * from tblEmployee where EmployeeFirstName  like '[^ART]%' 

