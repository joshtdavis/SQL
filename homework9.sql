
create table Airport(
airportCode char(10) not null,
city	varchar(25) not null,
state char(2) not null,
name varchar(35) not null
constraint pk_airportCode Primary key (airportCode)

)
go
create table airplaneType(
typeName varchar(50) not null,
company varchar(35) not null,
maxSeats int not null
constraint pk_typeName primary key(typeName)

)
go

create table airportLanding(
code char(10) not null,
planeType varchar(50) not null
constraint fk_code foreign key(code) references Airport(airportCode) on delete cascade on update cascade,
constraint fk_planetype foreign key(planeType) references airplaneType(typeName) on delete cascade on update cascade
)go

create table flight(
number int not null,
airline varchar(50) not null,
weekdays varchar(50) 
constraint pk_number primary key(number) 
)
go

create table flightLeg(
Legnum int not null,
flightNum int not null
constraint pk_flightlegnum primary key(Legnum),
constraint fk_flightNum foreign key (flightNum) references flight(number) on delete cascade on update cascade
)
go

create table airplane(
ID int not null,
totalNumOfSeats int not null,
modelType varchar(50) not null
constraint pk_APLID primary key(ID),
constraint fk_type foreign key (modelType) references airplaneType(typeName) on delete cascade on update cascade
)
go

create table legInstance(
numberAvailSeats int not null,
theDate date not null,
legNum int not null,
airplaneID int not null 
constraint pk_date primary key(theDate),
constraint fk_legNum foreign key (legNum) references flightLeg(LegNum) on delete cascade on update cascade,
constraint fk_AID foreign key (airplaneID) references airplane(ID) on delete cascade on update cascade
)
go

create table fare(
Code char(15) not  null,
Amount decimal not null,
Restrictions varchar(25),
flightNum int not null
constraint pk_codeflightnum primary key(Code),
constraint fk_flightNum foreign key (flightNum) references flight(number) on delete cascade on update cascade 
)
go

create table schdepArrTime(
airCodeLeav char(10) not null,
airCodeArriv char(10) not null,
legNumber int not null,
schArriv varchar(10),
schDep varchar(10)
constraint fk_airAr foreign key(airCodeArriv) references Airport(airportCode) on delete cascade on update cascade,
constraint fk_airLeav foreign key(airCodeLeav) references Airport(airportCode) on delete cascade on update cascade,
constraint fk_legN foreign key(legNumber) references flightLeg(LegNum) on delete cascade on update cascade
)go

create table ActdepartArrivTime(
arrivTime varchar(10) not null,
departTime varchar(10) not null,
airportLeave char(10) not null,
airportArriv char(10) not null,
legIns date not null
constraint fk_airL foreign key (airportLeave) references Airport(airportCode) on delete cascade on update cascade,
constraint fk_leg foreign key (legIns) references legInstance(theDate) on delete cascade on update cascade,
constraint fk_airA foreign key (airportArriv) references Airport(airportCode) on delete cascade on update cascade
)
go

create table seat(
seatNum int not null
constraint pk_seat primary key(seatNum)
)
go

create table reservation(
custName varchar(25) not null,
custPhone char(10) not null,
seatNumber int not null,
aDate date not null
constraint fk_seatNumb foreign key(seatNumber) references Seat(seatNum) on delete cascade on update cascade,
constraint fk_date foreign key(aDate) references legInstance(theDate) on delete cascade on update cascade
)
go

