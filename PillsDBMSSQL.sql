USE master
IF EXISTS(select * from sys.databases where name='PillDatabase')
DROP DATABASE PillDatabase
go

CREATE DATABASE PillDatabase
go

USE PillDatabase
go

create table ActiveUsers(
	userID int NOT NULL IDENTITY(1,1),
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
	lastActivity datetime NOT NULL,
	PRIMARY KEY (userID),
	CONSTRAINT UC_email UNIQUE (email)
);
go

create table InActiveUsers(
	userID int NOT NULL,
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
	lastActivity datetime NOT NULL,
	PRIMARY KEY (userID),
	CONSTRAINT u_email UNIQUE (email)
);
go

create table Products(
upcCode int NOT NULL PRIMARY KEY,
SKU varchar(25) NOT NULL,
name varchar(50) NOT NULL,
manufacturer varchar(35) NOT NULL,
servingSizeInTablets int,
tabletSizeInGrams int
);
go

create table Ingredients(
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
CONSTRAINT fk_ProductBridge FOREIGN KEY (productID) REFERENCES Products (upcCode) on delete cascade,
CONSTRAINT fk_IngredientBridge FOREIGN KEY (ingredientID) REFERENCES Ingredients (ingredientID) on delete cascade
);
go

create table UserProducts(
  id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  userID int NOT NULL,
  productID int NOT NULL,
  stockInBottles int DEFAULT 0,
  stockInUse int,
  CONSTRAINT fk_UserProd FOREIGN KEY (productID) REFERENCES Products (upcCode) on delete no action,
	CONSTRAINT fk_UserID FOREIGN KEY (userID) REFERENCES ActiveUsers (userID) on delete no action
);go
create index IX_UserProducts
  on UserProducts (userID)
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
CONSTRAINT fk_productLoc FOREIGN KEY (productID) REFERENCES Products (upcCode) on delete cascade
);
go

create index IX_ProductID
  on ProductLocations (productID);
  go
