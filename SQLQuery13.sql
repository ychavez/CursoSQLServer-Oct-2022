RETURN
     SELECT *
     FROM ReporteDeVentas
     WHERE empnumber = 1;



	

--- Funciones tipo tabla
CREATE FUNCTION ReporteDeVentasPorEmpleado
(@EmpNumber INT
)
RETURNS TABLE
AS
     RETURN
     SELECT *
     FROM ReporteDeVentas
     WHERE empnumber = @EmpNumber;