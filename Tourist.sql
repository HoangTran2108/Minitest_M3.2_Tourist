create database tour_manager;
use tour_manager;

create table City(
cityId int primary key auto_increment,
cityName varchar(50) not null
);

create table Destination(
dId int primary key auto_increment,
dName varchar(50) not null,
dStatus bit,
dPrice double,
cityId int,
foreign key (cityId) references City (cityId)
);

create table customer(
customerId int primary key auto_increment,
customerName varchar(50) not null,
baseNumber varchar(50),
bird varchar(50),
cityId int,
foreign key (cityId) references City (cityId)
);

create table Type_tour(
tyId int primary key auto_increment,
tyCode varchar(25),
tyName varchar(25)
);

create table Tour(
tourId int primary key auto_increment,
tyId int,
dId int,
startDate datetime,
endDate datetime,
foreign key (tyId) references Type_tour(tyId),
foreign key (dId) references Destination(dId)
);

create table Bill(
billId int primary key auto_increment,
tourId int,
customerId int,
bStatus bit,
foreign key (tourId) references Tour(tourId),
foreign key (customerId) references customer(customerId)
);

insert into City(cityId, cityName)
values (cityId, "Hanoi"),
(cityId, "Seoul"),
(cityId, "Tokyo"),
(cityId, "Beijing"),
(cityId, "Moscow");

insert into Destination(dId, dName, dStatus, dPrice, cityId)
values (dId, "CodeGym", 1, 1000.0, 1),
(dId, "Gyeongbokgung", 1, 500.5, 2),
(dId, "Skytree ", 1, 700.0, 3),
(dId, "Yiheyuan", 1, 800.8, 4),
(dId, "St.Basil", 1, 900.9, 5);

insert into customer(customerId, customerName, baseNumber, bird, cityId)
values (customerId, "Hoàng", "12345", "1997-08-08", 1),
(customerId, "Hoàng1", "12346", "1997-08-11", 1),
(customerId, "Hoàng2", "12347", "1998-08-09", 2),
(customerId, "Hoàng3", "12348", "1999-09-08", 3),
(customerId, "Hoàng4", "12340", "2000-10-08", 3),
(customerId, "Hoàng5", "12341", "1995-11-08", 4),
(customerId, "Hoàng6", "12342", "1996-11-11", 5),
(customerId, "Hoàng7", "12343", "1997-10-08", 5),
(customerId, "Hoàng8", "12344", "2001-10-10", 4),
(customerId, "Hoàng9", "12339", "1997-02-22", 1);

insert into Type_tour(tyId, tyCode, tyName)
values (tyId, "T1", "Vip"),
(tyId, "T2", "Nomal");

insert into Tour(tourId, tyId, dId, startDate, endDate)
values (tourId, 1, 1, "2020-03-21", "2020-04-30"),
(tourId, 1, 1, "2020-03-21", "2020-04-30"),
(tourId, 2, 1, "2020-05-29", "2020-07-20"),
(tourId, 2, 1, "2020-02-21", "2020-04-21"),
(tourId, 1, 2, "2020-03-16", "2020-04-03"),
(tourId, 2, 2, "2020-01-21", "2020-02-28"),
(tourId, 1, 2, "2020-02-24", "2020-04-30"),
(tourId, 1, 3, "2020-03-12", "2020-04-11"),
(tourId, 2, 3, "2020-04-21", "2020-05-30"),
(tourId, 2, 5, "2020-06-21", "2020-08-31"),
(tourId, 2, 4, "2020-09-02", "2020-10-10"),
(tourId, 1, 4, "2020-03-21", "2020-04-15"),
(tourId, 1, 4, "2020-11-20", "2020-12-12"),
(tourId, 2, 5, "2020-03-22", "2020-05-06"),
(tourId, 1, 5, "2020-03-23", "2020-04-29");

insert into Bill(billId, tourId, customerId, bStatus)
values (billId, 1, 1, 1),
(billId, 3, 2, 1),
(billId, 6, 3, 1),
(billId, 5, 4, 1),
(billId, 7, 5, 1),
(billId, 8, 6, 1),
(billId, 10, 7, 1),
(billId, 11, 8, 1),
(billId, 12, 9, 1),
(billId, 15, 10, 1);

#Thống kê số lượng tour của các thành phố
select City.cityName, count(tour.dId)
from (tour join Destination on tour.dId = Destination.dId) join city on Destination.cityId = city.cityId
group by City.cityName;

#Tính số tour có ngày bắt đầu trong tháng 3 năm 2020
select count(tour.tourId) as "số tour bắt đầu trong tháng 3/2020"
from tour
where tour.startDate like "2020-03-%";

#Tính số tour có ngày kết thúc trong tháng 4 năm 2020
select count(tour.tourId) as "số tour kết thúc trong tháng 4/2020"
from tour
where tour.endDate like "2020-04-%";