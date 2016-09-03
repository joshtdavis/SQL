DROP DATABASE IF EXISTS pantryDatabase;
create database pantryDatabase;
USE pantryDatabase;


create table Dishes(
dishID in NOT NULL AUTO_INCREMENT,
dishName varchar(35) NOT NULL,
calories int,
caloriesFromFat int,
totalFat int,
saturatedFat int,
transFat int,
cholesterol int,
sodium int,
totalCarb int,
dietaryFiber int,
sugars int,
protein int,
vitaminA int,
vitaminC int,
calcium int,
iron int,
catagory varchar(15) NOT NULL,
PRIMARY KEY (dishID)
);

create index dishCatagory on Dishs (catagory);

create table GroceryItems(
groceryID int NOT NULL AUTO_INCREMENT,
groceryItemName varchar(35) NOT NULL,
currentStock int NOT NULL,
minimumStock int NOT NULL,
calories int,
caloriesFromFat int,
totalFat int,
saturatedFat int,
transFat int,
cholesterol int,
sodium int,
totalCarb int,
dietaryFiber int,
sugars int,
protein int,
vitaminA int,
vitaminC int,
calcium int,
iron int,
PRIMARY KEY (groceryID)
);

create table DishItemBridge(
id int NOT NULL AUTO_INCREMENT,
dishID int NOT NULL,
groceryID int NOT NULL,
servings int NOT NULL,
PRIMARY KEY (id),
CONSTRAINT fk_groceryItemBridge FOREIGN KEY (groceryID) REFERENCES GroceryItems (groceryID) on delete cascade,
CONSTRAINT fk_groceryDishBridge FOREIGN KEY (dishID) REFERENCES Dishs (dishID) on delete cascade
);

create index dishItem on DishItemBridge (dishID);

create table GrociePrices(
groceryPriceID int NOT NULL AUTO_INCREMENT,
groceryPrice decimal NOT NULL,
groceryID int NOT NULL,
store varchar(30),
onSale bit(1),
dateEntered datetime, 
PRIMARY KEY (groceryPriceID),
CONSTRAINT fk_grocery FOREIGN KEY (groceryID) REFERENCES GroceryItems (groceryID) on delete cascade
);

create index groceryIDPrice on GrociePrices (groceryID);


create user 'admin' identified by 'password';
Grant all privileges on *.* to 'admin';
create user 'app' identified by 'passwords';
Grant insert,select,update,delete on pantryDatabase.* to 'app';
FLUSH privileges;

DELIMITER $$
drop procedure if exists sproc_getAverageGroceryPrice $$

create procedure sproc_getAverageGroceryPrice(in ID int)
begin
select AVG(groceryPrice)
from GrociePrices
where groceryID=ID;
end$$
DELIMITER ;