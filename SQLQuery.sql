create database LibraryManagementSystem;


create table Books(
ID int primary key identity(1,1),
Title nvarchar(100),
Author nvarchar(100),
Genre nvarchar(100),
PublicationYear  nvarchar(100),
AvailabilityStatus  nvarchar(100),
Categorie_id int,
foreign key (Categorie_id) references Categories(ID)

);


create table Members(
ID int primary key identity(1,1),
Name nvarchar(100),
ContactInformation nvarchar(100),
MembershipType  nvarchar(100),
RegistrationDate  date

);


create table librarystaff(
ID int primary key identity(1,1),
Name nvarchar(100),
ContactInfo nvarchar(100),
AssignedSection  nvarchar(100),
EmploymentDate  date

);

create table Categories(
ID int primary key identity(1,1),
Name nvarchar(100),
Description nvarchar(100)

);

create table borrowing(
ID int primary key ,
MemberID int ,
bookID int ,
Borrowingdate date,
duedate date,
returndate date,
foreign key (MemberID) references Members(ID),
foreign key (bookID) references Books(ID),


);

create table Reservations(
ID int primary key ,
MemberID int ,
bookID int ,
ReservationDate date,
Status nvarchar(100),
foreign key (MemberID) references Members(ID),
foreign key (bookID) references Books(ID),
);


-- Inserting records into Categories
INSERT INTO Categories (Name, Description) VALUES
('Fiction', 'Fictional books'),
('Non-Fiction', 'Informative and factual books'),
('Science', 'Books related to science'),
('History', 'Books about historical events'),
('Fantasy', 'Fantasy genre books');

-- Inserting records into Books
INSERT INTO Books (Title, Author, Genre, PublicationYear, AvailabilityStatus, Categorie_id) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', '1925', 'Available', 1),
('A Brief History of Time', 'Stephen Hawking', 'Science', '1988', 'Available', 3),
('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', '1937', 'Checked Out', 5),
('1984', 'George Orwell', 'Fiction', '1949', 'Available', 1),
('Sapiens', 'Yuval Noah Harari', 'Non-Fiction', '2011', 'Available', 2);

-- Inserting records into Members
INSERT INTO Members (Name, ContactInformation, MembershipType, RegistrationDate) VALUES
('John Doe', 'john.doe@example.com', 'Standard', '2022-01-15'),
('Jane Smith', 'jane.smith@example.com', 'Premium', '2021-12-20'),
('Alice Johnson', 'alice.johnson@example.com', 'Standard', '2023-03-05'),
('Bob Brown', 'bob.brown@example.com', 'Premium', '2022-05-11'),
('Charlie Davis', 'charlie.davis@example.com', 'Standard', '2021-08-30');

-- Inserting records into LibraryStaff
INSERT INTO LibraryStaff (Name, ContactInfo, AssignedSection, EmploymentDate) VALUES
('Sarah Connor', 'sarah.connor@example.com', 'Fiction', '2020-06-01'),
('Kyle Reese', 'kyle.reese@example.com', 'Science', '2019-09-15'),
('Ellen Ripley', 'ellen.ripley@example.com', 'History', '2021-03-23'),
('Peter Venkman', 'peter.venkman@example.com', 'Non-Fiction', '2022-11-12'),
('Dana Barrett', 'dana.barrett@example.com', 'Fantasy', '2023-01-08');

-- Inserting records into Borrowing
INSERT INTO Borrowing (ID, MemberID, BookID, BorrowingDate, DueDate, ReturnDate) VALUES
(1, 1, 3, '2023-01-01', '2023-01-15', '2023-01-14'),
(2, 2, 2, '2023-02-10', '2023-02-24', NULL),
(3, 3, 5, '2023-03-05', '2023-03-19', '2023-03-18'),
(4, 4, 1, '2023-04-12', '2023-04-26', NULL),
(5, 5, 4, '2023-05-20', '2023-06-03', '2023-06-01');

-- Inserting records into Reservations
INSERT INTO Reservations (ID, MemberID, BookID, ReservationDate, Status) VALUES
(1, 1, 2, '2023-01-05', 'Active'),
(2, 2, 3, '2023-02-15', 'Completed'),
(3, 3, 1, '2023-03-10', 'Cancelled'),
(4, 4, 5, '2023-04-18', 'Active'),
(5, 5, 2, '2023-05-25', 'Completed');






select *
from Members where RegistrationDate = '2021-08-30'

select * 
from Books where Title = 'The Hobbit';

ALTER TABLE Members 
ADD Email varchar(255);

insert into Members (Name,ContactInformation,MembershipType,RegistrationDate,Email)
Values ('Omar',9876543210,'Student',2024-06-05,'Omar@gmail.com')

SELECT * FROM Reservations;


select *
from Members 
join Reservations on Members.ID = Reservations.MemberID 


select *
from Members 
join borrowing on Members.ID = borrowing.MemberID
join Books on borrowing.bookID = bookID 
where Title = 'The Great Gatsby'


select *
from Members 
join borrowing on Members.ID = borrowing.MemberID
join Books on borrowing.bookID = bookID 
where borrowing.returndate IS NOT NULL  and Books.Title = 'The Hobbit' 



select *
from Members 
join borrowing on Members.ID = borrowing.MemberID
join Books on borrowing.bookID = Books.ID 
where borrowing.returndate > borrowing.duedate  




select Books.Title, borrowing.bookID, COUNT(borrowing.bookID) as countRepeat
from Members 
join borrowing on Members.ID = borrowing.MemberID
join Books on borrowing.bookID = Books.ID 

group by borrowing.bookID , Books.Title
having COUNT(borrowing.bookID) >= 3


select *
from Members 
join borrowing on Members.ID = borrowing.MemberID
join Books on borrowing.bookID = Books.ID 
where borrowing.Borrowingdate  BETWEEN  '2023-01-01' and '2023-01-01'


select COUNT (AvailabilityStatus) from Books as totalnumberofbooks 
where AvailabilityStatus = 'Available';













