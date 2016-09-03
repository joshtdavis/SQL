use AutoDealer
go

select Name , Revenue
from SimpleSales
order by Revenue[DESC]
go

select Name , Revenue , profit , profit/revenue as profitpercent
from SimpleSales
order by profitpercent[desc]
go

select count(profit) as NumerofProfitSalesPeople
from SimpleSales
where profit>5000
go

select Name, count(profit) as NumerofProfitSalesPeople
from SimpleSales
where profit>5000
go