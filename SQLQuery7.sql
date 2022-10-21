--- transacciones y manejo de errores
BEGIN TRAN;
SELECT *
FROM tbltransaction2;
DELETE tbltransaction2;
SELECT *
FROM tbltransaction2;
ROLLBACK;
BEGIN TRAN;
UPDATE tbltransaction2
  SET 
      Amount = Amount + 10
WHERE EmployeeNumber = 695;
WAITFOR DELAY '00:00:10';
ROLLBACK TRAN;
SELECT *
FROM tbltransaction2;


BEGIN TRAN;
BEGIN TRY
    SELECT 1 / 1 AS numero;
    UPDATE tbltransaction2
      SET 
          Amount = Amount + 10
    WHERE EmployeeNumber = 695;
    COMMIT TRAN;
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS MensajeError, 
           ERROR_SEVERITY() AS Severidad;
    ROLLBACK TRAN;
END CATCH;