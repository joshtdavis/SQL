CREATE DATABASE Auto
GO

BEGIN
	WAITFOR DELAY'00:00:10';
	Execute sp_helpdb;
	END;
GO


USE Auto
GO

CREATE TABLE Car (
		Model	     varchar(50)  NOT NULL,
		YearMod	     int          NOT NULL,
		Manufacturer varchar(50)  NOT NULL
		)
		GO


		INSERT INTO Car
		(Model, YearMod, Manufacturer)
		VALUES
			('Ford Fusion','1997','Ford'),
			('Chevey Impala','2008','Chevey'),
			('Toyota Camery','2010','Toyota')
			GO


CREATE DATABASE Cust
GO

BEGIN
	WAITFOR DELAY'00:01:00';
	Execute sp_helpdb;
	END;
GO

USE Cust
GO

CREATE TABLE Custo (
			CustomerID    int         NOT NULL,
			Name          varchar(50) NOT NULL,
			PhoneNum      varchar(20) NOT NULL
			)
			GO


			INSERT INTO Custo
				( CustomerID, Name, PhoneNum)
				VALUES
				('5684','John','852-958-9685'),
				('2314','Gary','241-234-5435'),
				('4321','Fred','342-564-3342')
				GO

CREATE DATABASE House
GO

BEGIN
	WAITFOR DELAY'00:00:10';
	Execute sp_helpdb;
	END;
GO

USE House
GO

CREATE TABLE Home (
				SquareFT     int    NOT NULL,
				BedroomNum   int    NOT NULL,
				BathNum      float  NOT NULL
				)
				GO


				INSERT INTO Home
				( SquareFT, BedroomNum , BathNum)
				VALUES
				('200000','2','2'),
				('300000','4','3.5'),
				('9000000','9','7')
				GO

CREATE DATABASE Baseball
GO

BEGIN
	WAITFOR DELAY'00:00:10';
	Execute sp_helpdb;
	END;
GO

USE Baseball
GO

CREATE TABLE Player (
				Name     varchar(50)    NOT NULL,
				Postion  varchar(50)    NOT NULL,
				Salary   int			NOT NULL
				)
				GO


				INSERT INTO Player
				( Name, Postion, Salary)
				VALUES
				('Steve','Pitcher','2000000'),
				('Kevin','First Basemen','1562300'),
				('Dave','Designated Hitter','8465320')
				GO

CREATE DATABASE Basketball
GO

BEGIN
	WAITFOR DELAY'00:00:10';
	Execute sp_helpdb;
	END;
GO

USE Basketball
GO

CREATE TABLE BasketBallPlayer (
				Name     varchar(50)    NOT NULL,
				Postion  varchar(50)    NOT NULL,
				Salary   int			NOT NULL
				)
				GO


				INSERT INTO BasketBallPlayer
				( Name, Postion, Salary)
				VALUES
				('Steven','Center','760000'),
				('Karl','Forward','762300'),
				('Draven','Guard','946532')
				GO