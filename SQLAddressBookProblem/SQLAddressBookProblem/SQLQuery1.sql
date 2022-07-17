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
----------------------UC-4----------------------
--edit contact by person's name--
update AddressBook set PhoneNumber=9645065768 where FirstName='Vivek';
----------------------UC-5----------------------
--Delete existing contact using name--
delete AddressBook where FirstName='Gayatri';
select * from AddressBook;
select * from AddressBook;
----------------------UC-6----------------------
--Retrieve person belonging to city or state--
select * from AddressBook where City = 'Port Blair' or State = 'Andaman And Nicobar Islands'; 
----------------------UC-7----------------------
--Size of addressbook--
select COUNT(*) as StateCount, State from AddressBook group by State;
select COUNT(*) as StateCount, City from AddressBook group by City;
----------------------UC-8----------------------
--Sort entries by name alphbatically--
select * from AddressBook order by FirstName;
----------------------UC-9----------------------
--Identify each addressboook with name and type--
alter table Addressbook add ContactType varchar(100) not null default 'Friend';
update AddressBook set ContactType = 'Family' where FirstName = 'Vivek';
select * from AddressBook;
----------------------UC-10----------------------
--Get contact count by type--
select COUNT(*) as Type, ContactType from AddressBook group by ContactType;