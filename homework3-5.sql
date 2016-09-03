use homework3
go

create table Students(
studentID int not null,
name varchar(70) not null,
addr varchar(50) not null,
constraint pk_studentID primary key (studentID)
)
go
insert into Students(studentID,name,addr)
values
('9878986','Ryan Clay','2342 windrow drive')
insert into Students(studentID,name,addr)
values
('9875421','Jake Kovas','8742 peach road')
insert into Students(studentID,name,addr)
values
('9485622','Max Bryant','3423 martin street')
go


create table Classes(
classID int not null,
className varchar(50) not null,
constraint pk_classID primary key (classID)
)
go
insert into Classes(classID,className)
values
('1101','Intro to computer science')
insert into Classes(classID,className)
values
('1102','Intro to computer science two')
insert into Classes(classID,className)
values
('2054','Data Structers')
go

create table classRegistration(
studentID int not null,
classID int not null
constraint fk_classRegistration_Students foreign key (studentID) references Students (studentID) on delete cascade,
constraint fk_classRegistration_Classes foreign key (classID) references Classes (classID) on delete no action
)
go

insert into classRegistration(studentID,classID)
values
('9878986','1101')
insert into classRegistration(studentID,classID)
values
('9875421','1102')
insert into classRegistration(studentID,classID)
values
('9485622','2054')
go

delete from Students
where studentID='9878986'
go

delete from Classes
where classID='1102'
go
