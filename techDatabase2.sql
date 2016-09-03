DROP DATABASE IF EXISTS projectDatabase;
create database projectDatabase;
USE projectDatabase;

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

create table products(
	productCode int NOT NULL,
	productName varchar(45) NOT NULL,
	category varchar(40) NOT NULL,
	wholesalePrice decimal NOT NULL,
	price decimal NOT NULL,
	description varchar(250),
	imageURL varchar(100),
	PRIMARY KEY (productCode)
);

create table Orders(
orderNumber int NOT NULL AUTO_INCREMENT,
theDate timestamp NOT NULL,
userID int NOT NULL,
taxRate DOUBLE NOT NULL,
totalCost Double NOT NULL,
shippingAddr varchar(50) NOT NULL,
shippingCity varchar(20) NOT NULL,
shippingState varchar(2) NOT NULL,
shippingZIP varchar(15) NOT NULL,
captured bit(1) NOT NULL,
capturedAmount double,
total Double NOT NULL,
PRIMARY KEY(orderNumber),
CONSTRAINT fk_user FOREIGN KEY (UserID) REFERENCES Users (userID) on delete cascade
);

create table AnomyOrders(
orderNumber int NOT NULL AUTO_INCREMENT,
theDate timestamp NOT NULL,
customerName varchar(25) NOT NULL,
customerAddr varchar(50) NOT NULL,
cuatomerCity varchar(20) NOT NULL,
customerState varchar(2) NOT NULL,
customerZIP varchar(15) NOT NULL,
customerPhone varchar(11) NOT NULL,
cuatomerEmail varchar(35) NOT NULL,
shippingAddr varchar(50) NOT NULL,
shippingCity varchar(20) NOT NULL,
shippingState varchar(2) NOT NULL,
shippingZIP varchar(15) NOT NULL,
taxRate DOUBLE NOT NULL,
totalCost Double NOT NULL,
captured bit(1) NOT NULL,
capturedAmount double NOT NULL,
paymentType varchar(15),
total Double NOT NULL,
PRIMARY KEY(orderNumber),
);

create table AnomyOrderItem(
OrderNumber int NOT NULL,
productCode int NOT NULL,
quanity int NOT NULL,
PRIMARY KEY(AnomyOrderNumber,productCode),
CONSTRAINT fk_prodCode FOREIGN KEY (productCode) REFERENCES products (productCode) on delete cascade
CONSTRAINT fk_prodCode FOREIGN KEY (OrderNumber) REFERENCES  Orders(orderNumber) on delete cascade
);

create table Orderitem(
OrderNumber int NOT NULL,
productCode int NOT NULL,
quanity int NOT NULL,
PRIMARY KEY(OrderNumber,productCode),
CONSTRAINT fk_prodCode FOREIGN KEY (productCode) REFERENCES products (productCode) on delete cascade
CONSTRAINT fk_prodCode FOREIGN KEY (OrderNumber) REFERENCES  AnomyOrders(orderNumber) on delete cascade
);

Insert into products (productCode, productName, category, price, description, imageURL)
values (2154879,"Nightblade XLS 1.0","Laptop", 500.00, "Basic Laptop" ,"images/Lap1.png"),
	   (2154880,"Nightblade XLS 2.0","Laptop", 1025.00, "Gaming Laptop" ,"images/Lap2.png"),
	   (2154881,"Nightblade XSS 1.0","Server", 50000.00, "Basic industry server" ,"images/Serv1.jpg"),
	   (2154882,"Nightblade XCS 1.0","Laptop", 115.00, "Cheap Laptop" ,"images/Lap3.jpg"),
	   (2154883,"Nightblade XSS 2.0","Server", 500000.00, "Heavy-duty industrial Server","images/Serv2.jpg"),
	   (2154884,"Nightblade XCSS 1.0","Server", 3005.00, "Cheap industrial Server","images/Serv3.png");
       
       
Insert into Users (firstName, lastName, email, address1, address2, city, theState, postalCode, country, password, role)
values ("Jake","Matthews","jake@yahoo.com","6598 Stupid drive","","Shigansha","HU","874521","Titan","password","customer"),
	   ("Jane","Matthews","jane@yahoo.com","6598 Stupid drive","","Shigansha","HU","874521","Titan","longerPassword", "customer"),
	   ("John","Matthews","john@yahoo.com","6598 Stupid drive","","Shigansha","HU","874521","Titan","pass", "customer"),
       ("Morgan","Overman","randomEmail@gmail.com","6999 Stupid drive","","Shigansha","HU","874521","Titan","neptune", "customer");
       
