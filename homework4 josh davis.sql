/*1
*/
create database LemonadeStand
go

use LemonadeStand
go

create table EmployeeSales(
ID int not null,
FirstName varchar(50),
LastName varchar(50),
Year int not null,
firstQSales float,
secondQSales float,
thirdQSales float,
fourthQSales float,
constraint pk_EmployeeSales Primary key (ID , Year)
)
go
/*2*/
Insert into EmployeeSales(ID,FirstName,LastName,Year,firstQSales,secondQSales,thirdQSales,fourthQSales)
values
('1','Christina','Yonkers','2011','268.39','310.43','410.11','289.92'),
('1','Christina','Yonkers','2012','292.03','305.25','499.84','416.22'),
('2','Bill','Chisholm','2012','199.44','215.55','312.50','278.88'),
('3','Belinda','Johnson','2011','215.25','188.14','266.34','244.20'),
('4','Greg','Hathaway','2010','188.15','205.11','383.75','301.01'),
('4','Greg','Hathaway','2011','245.96','360.33','588.02','489.00'),
('4','Greg','Hathaway','2012','307.68','362.66','601.23','501.17')
go

/*3*/
select LastName +  ' , ' + FirstName as FullName, Year,firstQSales,secondQSales,thirdQSales,fourthQSales
from EmployeeSales
go

/*4*/
select LastName +  ' ' + FirstName as FullName, Year,firstQSales,secondQSales,thirdQSales,fourthQSales,firstQSales + secondQSales + thirdQSales + fourthQSales as YearlySales
from EmployeeSales
go
