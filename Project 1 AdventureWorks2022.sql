use AdventureWorks2012

-- Project 1 : Quering a large relational database

--Perform the following with help of the above database:

-- a. Get all the details from the person table including email ID, phone number and phone number type

select * from [Person].[Person]
select * from [Person].[PersonPhone]
select * from [Person].[PhoneNumberType]
select * from [Person].[EmailAddress]

select P.firstname, P.lastname,E.emailaddress,PH.phonenumber,PHT.name from Person.Person P
inner join Person.EmailAddress E on P.BusinessEntityID=E.BusinessEntityID 
inner join person.PersonPhone PH on PH.BusinessEntityID=E.BusinessEntityID
inner join person.PhoneNumberType PHT on PHT.PhoneNumberTypeID=ph.PhoneNumberTypeID

-- b. Get the details of the sales header order made in May 2011

select * from [Sales].[SalesOrderHeader] where OrderDate between ('2011-05-01') and ('2011-05-31')

-- c. Get the details of the sales details order made in the month of May 2011

select * from [Sales].[SalesOrderDetail] SO inner join [Sales].[SalesOrderHeader] SOH 
on SO.SalesOrderID=SOH.SalesOrderID
where SOH.OrderDate between ('2011-05-01') and ('2011-05-31')

-- d. Get the total sales made in May 2011

select sum(SO.LineTotal) as totalsales from [Sales].[SalesOrderDetail] SO
inner join [Sales].[SalesOrderHeader] SOH on SO.SalesOrderID=SOH.SalesOrderID
where OrderDate between ('2011-05-01') and ('2011-05-31')

-- e. Get the total sales made in the year 2011 by month order by increasing sales
select sum(SO.LineTotal) as totalsales, month(orderdate) as salesmonth from [Sales].[SalesOrderDetail] SO
inner join [Sales].[SalesOrderHeader] SOH on SO.SalesOrderID=SOH.SalesOrderID
where year(orderdate)=2011group by month(orderdate)order by totalsales-- f. Get the total sales made to the customer with FirstName='Gustavo' and LastName ='Achong'select firstname, lastname, sum(linetotal) totalsales fromperson.Person Pinner join sales.Customer C onP.BusinessEntityID=C.PersonIDinner join sales.SalesOrderHeader SOH on SOH.CustomerID=C.CustomerIDinner join sales.SalesOrderDetail SO on SO.SalesOrderID=SOH.SalesOrderIDwhere P.FirstName='gustavo' and P.LastName='achong'group by P.BusinessEntityID,P.FirstName,P.LastName