DROP DATABASE IF EXISTS PillDatabase;
create database PillDatabase;
USE PillDatabase;

create table Product(
upcCode int NOT NULL,
SKU varchar(25) NOT NULL,
name varchar(50) NOT NULL,
manufacturer varchar(35) NOT NULL,
servingSizeInTablets int,
tabletSizeInGrams int,
stockInBottles int DEFAULT 0,
stockInUse int,  
Primary Key (upcCode)
);

create table Ingredient(
ingredientID int AUTO_INCREMENT,
name varchar(35) NOT NULL,
dailyDoseNeededInGrams int, 
PRIMARY KEY (ingredientID)
);

create table ProdectIngredients(
id int AUTO_INCREMENT,
productID int NOT NULL,
ingredientID int NOT NULL,
amountInGrams int,
Primary Key (id),
CONSTRAINT fk_ProductBridge FOREIGN KEY (productID) REFERENCES Product (upcCode) on delete cascade,
CONSTRAINT fk_IngredientBridge FOREIGN KEY (ingredientID) REFERENCES Ingredient (ingredientID) on delete cascade
);

create index IX_ProductID
on ProdectIngredients (productID);

create table ProductLocations(
id int AUTO_INCREMENT,
url varchar(55) NOT NULL,
productID int NOT NULL,
retailPrice float NOT NULL,
salePrice float,
specialGroupPrice float,
PRIMARY KEY (id),
CONSTRAINT fk_productLoc FOREIGN KEY (productID) REFERENCES Product (upcCode) on delete cascade
);

create index IX_ProductID
on ProductLocations (productID);