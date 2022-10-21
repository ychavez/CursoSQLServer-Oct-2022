
create view ReporteDeVentas
as

WITH Reporte(EmpNumber, 
             TotalSales, 
             SalesYear)
     AS (SELECT EmployeeNumber AS EmpNumber, 
                SUM(Amount) AS TotalSales, 
                YEAR(DateOfTransaction) SalesYear
         FROM tblTransaction
         GROUP BY EmployeeNumber, 
                  YEAR(DateOfTransaction))
     SELECT r.EmpNumber, 
            r.SalesYear, 
            TotalSales, 
            s.Quota
     FROM Reporte r
          JOIN SalesQuota s ON s.EmployeeNumber = r.EmpNumber
                               AND s.Year = r.SalesYear
   