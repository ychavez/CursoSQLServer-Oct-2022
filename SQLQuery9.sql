begin tran

update tbltransaction2 set Amount = Amount + 10 where EmployeeNumber = 695

waitfor delay '00:00:10'

commit tran