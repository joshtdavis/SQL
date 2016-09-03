use homework3
go

create table student(
studentID int not null,
name varchar(50) not null,
constraint pk_student primary key (studentID)
)
go

insert into student(studentID,name)
values
(null,'Gary Mathis')
insert into student(studentID,name)
values
('9846524','Craig Williams')
go
