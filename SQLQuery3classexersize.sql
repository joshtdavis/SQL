create table SportingEvents(
EventID   int NOT NUll,
EventName varchar(50)  not null
Constraint PK_SportingEvents Primary Key Clustered (EventID ASC)
)

go
create table Athletes( 
AthleteID  int not null,
AthleteName varchar(50) not null
Constraint PK_Athetes Primary Key clustered (AthleteID ASC)
)
go
create table EventRegistration(
AthleteID   int not null,
EventID    int not null
constraint PK_EventRegistration primary key clustered (AthleteID ASC, EventID ASC)
constraint FK_EventRegistration_Athete foreign key (AthleteID) references Athletes (AthleteID) on delete cascade
constraint FK_EventRegistration_SportingEvents foreign key (EventID) references SportingEvents (EventID) on delete no action
)
go

create table employee(
EmployeeID   int not null,
EmployeeFirstName varchar(50) not null,
EmployeeLastName  varchar(50) not null,
position varchar(50)  not null
constraint primary key (EmployeeID)
constraint PK_employee primary key clustered (EmployeeID ASC)
)
go 
insert into employee{
('2185876','George','Hanson', 'Chef')
('2863982','Lisa','Browers','Manager')
('7643382','Suzette','Crenshaw','Hostess')
('4322121','David','Summers','Waiter')
('6555322','Craig','Franks','Dishwasher')
('2322391','Billy','Thompson','Busboy')
}
go
Alter table employee
add 

