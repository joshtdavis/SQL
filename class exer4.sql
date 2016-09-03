use AutoDealer
go

create table salesVistInterest(
VID int not null,
VechileID char(13) NOT NULL,
)
GO

create table carSale(
saleDate date,
VechileID char(13) not null,
customer varchar(50),
salePrice float,
salesPerson varchar(50),
Bank varchar(50),
)
go