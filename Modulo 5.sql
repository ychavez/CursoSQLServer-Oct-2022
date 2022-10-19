DECLARE @numero INT;
DECLARE @numero2 INT;

-- queremos validar que si @numero es null nos regrese un 10 a cambio en la consulta

IF(@numero IS NULL)
    SET @numero = 10;

--select 1+ @numero + 1 + 1 + 1
-- isnull
SELECT 1 + ISNULL(@numero, @numero2) + 1 + 1 + 1;
SELECT 1 + COALESCE(@numero, @numero2, 13) + 1 + 1 + 1;
SELECT 1 + ISNULL(ISNULL(@numero, @numero2), 13) + 1 + 1 + 1;

--- if y iif

IF 1 = 1
    BEGIN
        SELECT 'fue verdadero';
    END;
    ELSE
    BEGIN
        SELECT 'fue falso';
    END;
--operador ternareo
SELECT IIF(1 = 1, 'fue verdadero', 'fue falso');

--Case switch
DECLARE @myVar INT= 1;

-- yo quiero que cuando sea uno me imprima el valor 'Jefe'
-- con valor dos sera 'Gerente'
-- con valor 3 produccion
-- con valor 4 Ayudante

--SELECT IIF(@myVar = 1, 'Jefe', IIF(@myvar = 2, 'Gerente', IIF(@myvar = 3, 'Produccion', 'Ayudante'))); 
--X
--☺
SELECT CASE
           WHEN @myVar = 1
           THEN 'Jefe'
           WHEN @myVar = 2
           THEN 'Gerente'
           WHEN @myVar = 3
           THEN 'produccion'
           ELSE 'Ayudante'
       END;

	   SELECT CASE @myVar
           WHEN  1
           THEN 'Jefe'
           WHEN  2
           THEN 'Gerente'
           WHEN  3
           THEN 'produccion'
           ELSE 'Ayudante'
       END;