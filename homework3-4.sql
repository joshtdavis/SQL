use homework3
go

create table work(
workerID int not null,
name varchar(70) not null,
position varchar(50) not null,
constraint uc_workerID Unique(workerID)
)
go

insert into work(workerID,name,position)
values
('89','David Waterson','stock boy')
insert into work(workerID,name,position)
values
('89','Jesse James','clerk')
go
