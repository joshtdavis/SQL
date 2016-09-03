use AutoDealer3
go


create table SalesVisits(
visitID int not null,
customerID int not null,
salesPersonID int not null,
visitDate date not null
constraint PK_SalesVisits primary key(visitID)
constraint FK_SalesVisits foreign key(customerID) references Customers(ID) on delete cascade,
constraint FK_salesPersonID foreign key(salesPersonID) references SalesPeople(ID) on delete cascade
)
go
insert into SalesVisits(visitID,customerID,salesPersonID, visitDate)
values
('1','1','1','2-14-2013'),
('2','2','2','2-14-2013'),
('3','3','3','2-15-2013'),
('4','4','4','2-15-2013'),
('5','5','1','2-16-2013'),
('6','6','2','2-16-2013'),
('7','7','3','2-16-2013'),
('8','8','4','2-16-2013'),
('9','9','1','2-16-2013'),
('10','10','2','2-16-2013'),
('11','1','1','2-17-2013'),
('12','2','2','2-17-2013'),
('13','3','3','2-17-2013'),
('14','4','4','2-17-2013'),
('15','5','1','2-17-2013'),
('16','6','2','2-17-2013'),
('17','1','1','2-17-2013')
go

create table SalesVisitInterests(
visitID int not null,
VehcileID char(15) not null
constraint PK_SalesVisitInterests primary key(visitID,VehcileID)
constraint FK_SalesVisitInterests_VechileID foreign key(VehcileID) references Cars (VehicleID) on delete cascade,
constraint FK_SalesVisitInterests_VisitID foreign key(visitID) references SalesVisits(visitID) on delete cascade
)
go

insert into SalesVisitInterests(visitID,VehcileID)
values
('1','ATL968LXW390R'),
('1','EBR160TJU474B'),
('2','ESP390LEW281B'),
('2','FBB715DSQ874S'),
('2','GWH698TWX269W'),
('3','HTU791AKF984L'),
('4','FRC958WNB023P'),
('5','FZM316GZL472R'),
('6','LDY979WTJ060K'),
('7','KFA495UQT464S'),
('8','LKR813OSG867G'),
('9','QLT113IHU647S'),
('10','QZO626ZSA926A'),
('11','SZO056UYL283Y'),
('12','VWU519OUG411K'),
('13','TWO305EEN449V'),
('14','ZYF684IPV746C'),
('15','ZAG321TRK992M'),
('16','XZC881OSA178P'),
('17','HTU791AKF984L')
go

create table CarSales(
saleDate date,
VechileID char(15) not null,
customerID int not null,
salePrice float,
salesPersonID int not null,
Bank char(9)
constraint PK_CarSales primary key(VechileID)
constraint FK_CarSales_VechileID foreign key (VechileID) references Cars (VehicleID) on delete cascade,
constraint FK_CarSales_customer foreign key (customerID) references Customers(ID) on delete cascade,
constraint FK_CarSales_salesPersonID foreign key(salesPersonID) references SalesPeople(ID) on delete cascade,
constraint FK_CarSales_Bank foreign key(Bank) references Banks(RoutingNumber) on delete cascade
)
go

insert into CarSales(saleDate,VechileID,customerID,salePrice,salesPersonID,Bank)
values
('2-21-2013','EBR160TJU474B','1','31000','1','053000196'),
('2-20-2013','HTU791AKF984L','3','12000','3','053112712'),
('3-19-2013','FRC958WNB023P','4','32000','4','055003492'),
('4-15-2013','VWU519OUG411K','2','33658','2','053112712'),
('2-22-2013','ZAG321TRK992M','5','36521','1','055003492'),
('2-25-2013','LDY979WTJ060K','6','42156','2','053000196')
go


/*1*/
select *
from (SalesVisits JOIN Customers on Customers.ID = SalesVisits.customerID)
		JOIN SalesPeople on SalesPeople.ID = SalesVisits.salesPersonID
order by visitDate,customerID
go

/*2*/
select SalesVisits.visitDate, SalesPeople.FirstName + SalesPeople.LastName as Name,count(SalesVisits.visitID) as NumberOfVisits
from  SalesVisits JOIN SalesPeople on SalesPeople.ID = SalesVisits.salesPersonID 
go

/*3*/
select SalesVisits.visitDate as visitDate, SalesPeople.FirstName + SalesPeople.LastName as SalesPersonName,Customers.FirstName + Customers.LastName as CustomerName, Cars.Manufacturer as Manufacturer, Cars.Model as Model, Cars.Year as Year, Cars.Cost as Cost
from   (((Customers JOIN SalesVisits on Customers.ID=SalesVisits.customerID)
		JOIN SalesPeople on SalesPeople.ID = SalesVisits.salesPersonID)
		JOIN SalesVisitInterests on SalesVisitInterests.visitID=SalesVisits.visitID)
		JOIN Cars on Cars.VehicleID=SalesVisitInterests.VehcileID
go

/*4*/
select Banks.BankName, Customers.FirstName+Customers.LastName as CustomerName, Cars.Year as Year,Cars.Manufacturer as Manufacturer,Cars.Model as Model,Cars.Cost as Cost,CarSales.salePrice as PriceSold,CarSales.saleDate as saleDate,Banks.BankName as BankName, SalesPeople.FirstName+SalesPeople.LastName as SalePersonName
from (((((Customers JOIN SalesVisits on Customers.ID=SalesVisits.customerID)
		JOIN SalesPeople on SalesPeople.ID = SalesVisits.salesPersonID)
		JOIN SalesVisitInterests on SalesVisitInterests.visitID=SalesVisits.visitID)
		JOIN Cars on Cars.VehicleID=SalesVisitInterests.VehcileID)
		JOIN CarSales on CarSales.VechileID=Cars.VehicleID)
		Join Banks on Banks.RoutingNumber = CarSales.Bank
go



/*5*/
select count(CarSales.customerID) as NumberOfSales,SalesPeople.FirstName + SalesPeople.LastName as SalesPersonName
from  SalesPeople JOIN CarSales on CarSales.salesPersonID=SalesPeople.ID
where SalesPeople.ID=CarSales.salesPersonID
go

/*6*/
select Cars.Year as Year, Cars.Manufacturer as Manufacturer,Cars.Model as Model, Cars.Cost as Cost,CarSales.SalePrice as Price,Customers.FirstName+Customers.LastName as CustomerName, SalesPeople.FirstName+SalesPeople.LastName as SalesPersonName,Banks.BankName as BankName
from  (((Cars JOIN CarSales on Cars.VehicleID=CarSales.VechileID)
		JOIN Customers on Customers.ID=CarSales.customerID)
		JOIN SalesPeople on SalesPeople.ID=CarSales.salesPersonID)
		JOIN Banks on Banks.RoutingNumber=CarSales.Bank
where   (CarSales.salePrice - Cars.Cost)= (Select max (CarSales.salePrice-Cars.Cost)
							 from CarSales JOIN Cars on Cars.VehicleID=CarSales.VechileID
							 )

go
