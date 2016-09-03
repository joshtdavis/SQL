use AutoDealer
go



select *
from   (CarOwners JOIN RegisteredCars on 
	    CarOwners.CarID = RegisteredCars.VehicleID
	   ) JOIN Customers 
	   Customers.ID = CarOwners.OwnerID
order by Price(Decs)
go


select *
from   CarOwners left JOIN Customers on
	   Customers.ID = CarOwners.OwnerID
where CarID is null
