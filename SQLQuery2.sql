--- tablas temporales ----
create table #MiTablaTemporal(
id int,
nombre varchar(10)
)
go

insert into #MiTablaTemporal values(1,'Juan')

select * from #MiTablaTemporal




create table ##MiTablaTemporalGlobal(
id int,
nombre varchar(10)
)

insert into ##MiTablaTemporalGlobal values(1,'Juan')

select * from ##MiTablaTemporalGlobal


select * into ##MiNuevaTabla from tblEmployee

drop table ##MiTablaTemporalGlobal

--- tablas temporales de # o ## se almacenan en disco duro
-- las # son por usuario
-- las ## son globales
-- persisten 


----- tablas temporales @ de tipo variable
declare @MiTabla as table
( id int,
  nombre varchar(100)
)


insert into @MiTabla values(1,'Juan')

select * from @MiTabla

