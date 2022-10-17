Select 1,2

-- tipos de valor en TSQL
-- declaracion simple de variable
declare @myVar as TinyInt;

-- asignacion de variable de manera simple
set @myVar = 255;

select @myVar

-- tipos de datos entero
-- BigInt 9,223,372,036,854,775,807  , -9,223,372,036,854,775,807
-- Int   +- 2,000,000,000
-- SmallInt +- 32,767
-- TinyInt +- 255


-- tipos de datos string
--char --ASCII - 1 byte
--varchar --ASCII - 1 byte
--nchar --UNICODE - 2 bytes
--nvarchar --UNICODE - 2 bytes
-- text
-- 1 = chr
declare @chrNombre varchar(max);
set @chrNombre = 'Juan'
select @chrNombre, LEN(@chrNombre) tamaño, DATALENGTH(@chrNombre) peso


-- NULL
-- asignamos valor a una variable durante la declaracion
declare @myvar as int

select 1+1+1+@myVar+1







