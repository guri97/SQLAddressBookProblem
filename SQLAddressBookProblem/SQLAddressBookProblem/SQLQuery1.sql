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
----------------------UC-11----------------------
--Add person to both family and friend--
insert into AddressBook(FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email,ContactType)
values('Varsha','Raj','Marine Hill','Port Blair','Andaman And Nicobar Islands',744101,8596325698,'varsharaj5258@gmail.com','Friend'),
('Amardeep','Kaur','Aberdeen Bazar','Port Blair','Andaman And Nicobar Islands',744105,5874693652,'kaur52869@gmail.com','Family');
select * from AddressBook;
--UC12:Ability to create ER diagram
CREATE table ContactType(
ID		int identity(1, 1),
Type varchar(20),
Constraint TypePrimaryKey PRIMARY KEY(ID)
);

INSERT INTO ContactType select Type from AddressBook ;

select * from ContactType;
alter table AddressBook drop column Type;

Create table country(
ID int Identity(1,1),
Country varchar(20),
Constraint CountryPrimayKay PRIMARY KEY (ID)
);
Insert into country select Country from AddressBook;
select * from country;
alter table AddressBook drop column Country;

Create table FullAddress(
ID int ,
Address varchar(20),
City varchar(10),
State Varchar(20),
Zip int 
constraint FullAddress_foreign_Key_ID foreign key(ID) references AddressBook(ID) on delete cascade
);
insert into FullAddress select ID,Address,City,State,Zip from AddressBook;
select * from FullAddress;
alter table AddressBook drop column Address,City,State,Zip;
--UC13:Ability to perform the other functionality
SELECT CITY, COUNT(CITY) AS CITY_COUNT FROM FullAddress,AddressBook where FullAddress.Id=AddressBook.ID GROUP BY City;
SELECT State, COUNT(State) AS State_COUNT FROM FullAddress,AddressBook where FullAddress.Id=AddressBook.ID GROUP BY State;


SELECT Type, COUNT(*) AS TYPE_COUNT FROM ContactType, AddressBook where ContactType.ID = AddressBook.ID GROUP BY Type;


select AddressBook.ID,firstName,lastName,Email,PhoneNumber,Address,City,State,zip,Country
 from AddressBook, ContactType,FullAddress,Country
where AddressBook.ID = ContactType.ID and
      AddressBook.ID = FullAddress.ID and
	  AddressBook.ID = Country.ID; 

use AddressBook;
select * from AddressBook

select City from FullAddress where ID = (select ID from AddressBook where FirstName = 'Gurpreet')
select state from FullAddress where ID = (select ID from AddressBook where FirstName = 'Gurpreet')

SELECT * FROM AddressBook ORDER BY FirstName;
