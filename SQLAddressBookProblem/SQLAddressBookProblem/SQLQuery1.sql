------------UC1 CREATE DATABASE-------------
CREATE DATABASE ADDRESSBOOK_SERVICES;
-------UC2-create table for addressbook servoces -----------
CREATE TABLE AddressBook(
FirstName varchar(200),
LastName varchar(200),
Address varchar(1000),
City char(100),
State char(100),
Zip bigint,
PhoneNumber bigint,
Email varchar(200)

);
----------------------UC-3----------------------
--insert contact details into table--
insert into AddressBook(FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email)
values('Gurpreet Singh','Port Blair','Andaman And Nicobar Islands',744101,953182464,'gsgurpreet766@gmail.com'),
('Chinna','Gurgaon','New Delhi',110001,6239458567,'chinna5869@gmail.com'),
('Vivek','Greater Noida','New Delhi',110001,9645065768,'Vivek5868@gmail.com'),
('Gayatri','Port Blair','Andaman And Nicobar Islands',744105,7892100876,'gayatri5869@gmail.com');
select * from AddressBook;