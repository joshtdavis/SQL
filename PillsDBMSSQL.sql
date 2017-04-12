USE master
IF EXISTS(select * from sys.databases where name='PillDatabase')
DROP DATABASE PillDatabase
go

CREATE DATABASE PillDatabase
go

USE PillDatabase
go

create table Product(
upcCode int NOT NULL PRIMARY KEY,
SKU varchar(25) NOT NULL,
name varchar(50) NOT NULL,
manufacturer varchar(35) NOT NULL,
servingSizeInTablets int,
tabletSizeInGrams int
stockInBottles int DEFAULT 0,
stockInUse int,
);
go

create table Ingredient(
ingredientID int IDENTITY(1,1) PRIMARY KEY,
name varchar(35) NOT NULL,
dailyDoseNeededInGrams int
);
go

create table ProdectIngredients(
id int IDENTITY(1,1) PRIMARY KEY,
productID int NOT NULL,
ingredientID int NOT NULL,
amountInGrams int,
CONSTRAINT fk_ProductBridge FOREIGN KEY (productID) REFERENCES Product (upcCode) on delete cascade,
CONSTRAINT fk_IngredientBridge FOREIGN KEY (ingredientID) REFERENCES Ingredient (ingredientID) on delete cascade
);
go

create index IX_ProductID
on ProdectIngredients (productID);
go

create table ProductLocations(
id int IDENTITY(1,1) PRIMARY KEY,
url varchar(55) NOT NULL,
productID int NOT NULL,
retailPrice float NOT NULL,
salePrice float,
specialGroupPrice float,
CONSTRAINT fk_productLoc FOREIGN KEY (productID) REFERENCES Product (upcCode) on delete cascade
);
go

create index IX_ProductID
on ProductLocations (productID);
go