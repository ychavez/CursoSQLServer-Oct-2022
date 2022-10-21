
--declare @x xml = '<Shopping ShopperName="Phillip Burton" Weather="Nice">
--<ShoppingTrip ShoppingTripID="L1">
--    <Item Cost="5">Bananas</Item>
--    <Item Cost="4">Apples</Item>
--    <Item Cost="3">Cherries</Item>
--</ShoppingTrip>
--<ShoppingTrip ShoppingTripID="L2">
--    <Item>Emeralds</Item
--    <Item>Diamonds</Item>
--    <Item>Furniture</Item>
--</ShoppingTrip>
--</Shopping>
--'
--select @x

----alter table tblemployee add XMLOutput XML

----update tblEmployee set XMLOutput = @x where EmployeeNumber = 200

--select * from tblEmployee where EmployeeNumber = 200

--/* de manera automatica genera un XML con los valores como propiedad o como valor*/
--select e.EmployeeFirstName, e.EmployeeMiddleName, e.EmployeeLastName, e.DateOfBirth, t.Amount, t.DateOfTransaction 
--from tblEmployee e 
--left join tbltransaction t 
--on t.EmployeeNumber = e.EmployeeNumber 
--where e.EmployeeNumber between 200 and 210
--for XML auto--, elements


--select 
--e.EmployeeFirstName as '@EmployeeFirstName',
--e.EmployeeLastName as '@EmployeeLastName', 
--e.EmployeeNumber,
--e.DateOfBirth, 
--t.Amount as 'Transaction/Amount', 
--t.DateOfTransaction  as 'Transaction/DateOfTransaction'
--from tblEmployee e 
--left join tbltransaction t 
--on t.EmployeeNumber = e.EmployeeNumber 
--where e.EmployeeNumber between 200 and 210
--for xml path('Employees'), Root('MyXml')


---- XQUERY
--go

declare @x xml = '<Shopping ShopperName="Phillip Burton" Weather="Nice">
<ShoppingTrip ShoppingTripID="L1">
    <Item Cost="10">Bananas</Item>
    <Item Cost="2">Apples</Item>
    <Item Cost="30">Cherries</Item>
</ShoppingTrip>
<ShoppingTrip ShoppingTripID="L2">
    <Item>Emeralds</Item>
    <Item>Diamonds</Item>
    <Item>Furniture</Item>
</ShoppingTrip>
</Shopping>
'

--select @x.value('(/Shopping/ShoppingTrip/Item/@Cost)[1]','varchar(50)');

--set @x.modify('replace value of (/Shopping/ShoppingTrip/Item/@Cost)[1] with "40"')

---select @x.value('(/Shopping/ShoppingTrip/Item/@Cost)[1]','varchar(50)');

--select @x

--set @x.modify('insert  <Item Cost="50">Tomate</Item> into (/Shopping/ShoppingTrip)[1]')

set @x.modify('delete  /Shopping/ShoppingTrip/Item[1]/@Cost')

set @x.modify('delete  /Shopping/ShoppingTrip/Item[1]')
select @x

--select @x.query(' for $ValueRetrived in /Shopping/ShoppingTrip/Item 
--                      return $ValueRetrived ')

--select @x.query(' for $ValueRetrived in /Shopping/ShoppingTrip/Item 
--                      return  string($ValueRetrived) ')

--select @x.query(' for $ValueRetrived in /Shopping/ShoppingTrip/Item 
--                      return  concat(string($ValueRetrived),";") ')

----- regresar separado por comas el item siempre y cuando el costo sea mayor o igual a 4 y se ordene por costo

--select @x.query(' for $ValueRetrived in /Shopping/ShoppingTrip[1]/Item 
--                      let $CostVariable := $ValueRetrived/@Cost
--					  where $CostVariable >= 4
--					  order by $CostVariable
--                      return  $ValueRetrived ')

select 
tbl.col.value('.','varchar(50)' ) as Item,
tbl.col.value('@Cost','varchar(50)' ) as Cost
into #tblItems
from @x.nodes('/Shopping/ShoppingTrip/Item')  as tbl(col)

select * from #tblItems

drop table #tblItems


--- practica
/*

1.- Crear un XML que contenga informacion sobre productos con categorias
2.- consultar haciendo uso del Value el primer producto
3.- modificar algun dato de un product
4.- insertar un producto

6.- traer todos los nombres del producto separados por ; siempre filtrado por categoria
7.- traernos el xml de productos como tabla
8.- de las tablas que ya tenemos de productos y categorias hacer la consulta transformando a XML

*/