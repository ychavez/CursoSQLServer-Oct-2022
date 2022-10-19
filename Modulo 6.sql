-- union except intersect

select top 100  * into tbltransaction2 from tblTransaction

select * from tbltransaction2


-- Union

select * from tblTransaction
union --- union solo nos traera los valores que no esten repetidos
select * from tbltransaction2

select * from tblTransaction
union all--- union all une las dos tablas
select * from tbltransaction2

-- except

select * from tblTransaction
except--- except me traera solo los que esten una sola ves en ambas
select * from tbltransaction2

select * from tblTransaction
intersect--- intersect me traera solamente los duplicados
select * from tbltransaction2