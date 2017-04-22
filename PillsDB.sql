DROP DATABASE IF EXISTS PillDatabase;
create database PillDatabase;
USE PillDatabase;

create table Users(
	userID int NOT NULL AUTO_INCREMENT,
	firstName varchar(20) NOT NULL,
	lastName varchar(25) NOT NULL,
	email varchar(40) NOT NULL,
	address1 varchar(80) NOT NULL,
	address2 varchar(80) NOT NULL,
	city varchar(50) NOT NULL,
	theState varchar(50) NOT NULL,
	postalCode varchar(20) NOT NULL,
	country varchar(35) NOT NULL,
	password varchar(80) NOT NULL,
	role varchar(10) NOT NUll,
	salt int NOT NULL,
	PRIMARY KEY (userID),
	CONSTRAINT u_email UNIQUE (email)
);

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
