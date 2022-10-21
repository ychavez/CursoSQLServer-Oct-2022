--CTE
---with

DECLARE @rowNo INT= 80



--;WITH MiCte2 (Hola)
-- AS
--(
-- SELECT @rowNo AS  Hola
--         UNION ALL
--         SELECT Hola + 1 
--         FROM MiCte2
--         WHERE Hola < 101
		 
--)



--select 
--e.EmployeeNumber,
--YEAR(t.dateOfTransaction) Year,
--sum(t.amount) Quota
--into SalesQuota
--from tblEmployee e 
--join tblTransaction t on t.EmployeeNumber = e.EmployeeNumber
--group by e.EmployeeNumber, YEAR(t.dateOfTransaction)

---select * from SalesQuota



-- reporte de ventas por año por empleado y comparado con el objetivo de ventas 
 ;with Reporte (EmpNumber,TotalSales, SalesYear)
as
(
select EmployeeNumber as EmpNumber , sum(Amount) as TotalSales, Year(DateOfTransaction) SalesYear   from tblTransaction
group by  EmployeeNumber, Year(DateOfTransaction)
)

select r.EmpNumber,r.SalesYear,TotalSales, s.Quota

from Reporte r join SalesQuota s on s.EmployeeNumber = r.EmpNumber and s.Year = r.SalesYear order by EmployeeNumber, SalesYear




