use AutoDealer
go

/*1*/
select count(*) as 'Number of cars that are red and Plate number starts with ZX' 
from RegisteredCars
where((Color='red') and (PlateNumber like 'ZX%'))
go

/*2*/

select *
from RegisteredCars
where((Color='red') and (PlateNumber like 'ZX%'))
go


/*3*/

select *
from RegisteredCars
where ((Year>'2009') and(VehicleID like '______y%'))
go

/*4*/

select *
from RegisteredCars
where ((Year>'2009') and(VehicleID like '______y%'))
order by Manufacturer,Model
go

/*5*/
select Distinct Color
from RegisteredCars
where ((Year='1997') and (model = 'camaro')and(Manufacturer='Chevrolet'))
go

/*6*/

select Manufacturer,Model,AVG(Price) as 'Average Price'
from RegisteredCars
where Year='2000'
group by Manufacturer,Model
order by Manufacturer,Model
go

