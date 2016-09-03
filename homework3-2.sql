use homework3
go

create table alchool(
personAge int not null,
personWeight int not null,
amount int not null,
name varchar(70),
constraint ck_Minage check(personage>=21),
constraint ck_weightAmountCombo check((personWeight>150) AND (amount<8))
)
go

insert into alchool(personAge,personWeight,amount,name)
values
('8','90','1','Phil Dawson')
insert into alchool(personAge,personWeight,amount,name)
values
('22','294','6','Kevin James')
insert into alchool(personAge,personWeight,amount,name)
values
('23','140','7','Fred Jackson')
insert into alchool(personAge,personWeight,amount,name)
values
('25','200','45','tavarius quaser')
go

