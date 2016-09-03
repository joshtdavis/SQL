create database homework3
go

use homework3
go

create table employees(
employeeID int not null,
firstName varchar(50),
lastName varchar(50),
position varchar(50)
)
Insert into employees(employeeID,firstName,lastName,position)
values
('65238','Dave','Smith','manager')
Insert into employees(employeeID,firstName,lastName,position)
values
(null,'Jack', 'Wishman','waiter')
go
