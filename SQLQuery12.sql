 
 
 declare @numeroEmpleado int = 501



 select a.*, e.EmployeeFirstName
 from ReporteDeVentasPorEmpleado(@numeroEmpleado) 
 a join tblEmployee e on e.EmployeeNumber = a.EmpNumber


 select Year(getdate())



 create or alter function suma(@numero1 int, @numero2 int)
 returns int
 as
 begin
 return @numero1 +  @numero2
 end

 select  dbo.suma(1,4)


 select EmpNumber, SalesYear, dbo.sumA(TOTALSALES,QUOTA) AS Total , TOTALSALES,QUOTA from ReporteDeVentas