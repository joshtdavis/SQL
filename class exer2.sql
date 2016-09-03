use AutoDealer 
go

select count(*)
from RegisteredCars
go

select count(*)
from RegisteredCars
where Color='Blue'
go

select count(*)
from RegisteredCars
where ((Color='Silver') and (Year>=1997 and Year<=2005))
go

select sum(Price)/count(*)
from RegisteredCars
where ((Model='Focus') and (Manufacturer='Ford'))
go


select Convert(decimal(10,2),sum(Price)/count(*))
from RegisteredCars
where ((Model='Focus') and (Manufacturer='Ford'))
go

select Model
from RegisteredCars 
where ((Year=2011) and (Price = (select max(Price) from RegisteredCars where (year=2011)))  ) 
go

select min(Price)
from RegisteredCars
where ((Color='Red') and (Manufacturer='Volkswagen'))
go

select count(*)
from RegisteredCars
where ((Price<22000)and(Year>2005))
group by Manufacturer
go

