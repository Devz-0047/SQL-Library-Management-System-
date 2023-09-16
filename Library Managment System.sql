-- Create the 'librarydb' database
CREATE DATABASE librarydb;

-- Show databases (optional)
SHOW DATABASES;

-- Use the 'librarydb' database
USE librarydb;

-- Create the 'readers' table
CREATE TABLE readers (
    reader_id VARCHAR(6),
    fname VARCHAR(30),
    mname VARCHAR(30),
    ltname VARCHAR(30),
    city VARCHAR(15),
    mobileno VARCHAR(10),
    occupation VARCHAR(10),
    dob DATE,
    CONSTRAINT readers_pk PRIMARY KEY(reader_id)
);

-- Insert data into the 'readers' table
INSERT INTO readers VALUES
    ('D0010', 'Ramesh', 'Chandra', 'Sharma', 'Delhi', '7845389021', 'Service', '1997-12-06'),
    ('D0011', 'Daron', 'Will', 'Hyder', 'Gurugram', '7845382314', 'Student', '1994-11-16'),
    ('D0012', 'Jason', 'Mac', 'Smith', 'Delhi', '7845389021', 'Service', '1997-12-06'),
    ('D0013', 'Ryana', 'Lesgon', 'Triam', 'Delhi', '7845389021', 'Service', '1997-12-06'),
    ('D0014', 'Solen', 'Clemens', 'Hoffman', 'Delhi', '7845389021', 'Service', '1997-12-06'),
    ('D0015', 'Macron', 'Dowel', 'Kahn', 'Mumbai', '7845389034', 'Student', '2001-03-06');

-- Create the 'Book' table
CREATE TABLE Book (
    bid VARCHAR(6),
    bname VARCHAR(45),
    bdomain VARCHAR(30),
    CONSTRAINT book_bid_pk PRIMARY KEY(bid)
);

-- Insert data into the 'Book' table
INSERT INTO Book VALUES
    ('B0001', 'Dune the Messiah', 'Fiction'),
    ('B0002', 'Meditation', 'Philosophy'),  
    ('B0003', 'Witcher The Elf blood', 'Fiction');

-- Create the 'active_readers' table
CREATE TABLE active_readers (
    account_id VARCHAR(6),
    reader_id VARCHAR(6),
    bid VARCHAR(6),
    atype VARCHAR(10),
    astatus VARCHAR(10),
    CONSTRAINT activereaders_acnumber_pk PRIMARY KEY(account_id),
    CONSTRAINT account_readerid_fk FOREIGN KEY(reader_id) REFERENCES readers(reader_id),
    CONSTRAINT account_bid_fk FOREIGN KEY(bid) REFERENCES Book(bid)  
);

-- Insert data into the 'active_readers' table
INSERT INTO active_readers VALUES
    ('A0001', 'D0010', 'B0001', 'Premium', 'Active'),
    ('A0002', 'D0011', 'B0002', 'Regular', 'Active'),
    ('A0003', 'D0010', 'B0002', 'Regular', 'Active'),
    ('A0004', 'D0013', 'B0001', 'Premium', 'Active'),
    ('A0005', 'D0015', 'B0003', 'Premium', 'Active');

-- Create the 'bookissue_details' table
CREATE TABLE bookissue_details (
    issuenumber VARCHAR(6),
    account_id VARCHAR(6),
    bid VARCHAR(6),
    bookname VARCHAR(50),
    numbers_of_books_issued INT(7),
    CONSTRAINT trandetails_tnumber_pk PRIMARY KEY(issuenumber),
    CONSTRAINT trandetails_acnumber_fk FOREIGN KEY(account_id) REFERENCES active_readers(account_id) 
);

-- Show tables (optional)
SHOW TABLES;

-- Insert data into the 'bookissue_details' table
INSERT INTO bookissue_details VALUES
    ('T0001', 'A0001', 'B0001', 'Dune the Messiah', 1),
    ('T0002', 'A0002', 'B0002', 'Meditation', 1),
    ('T0003', 'A0003', 'B0003', 'Witcher The Elf blood', 1);  

-- Select data from the 'active_readers' table
SELECT * FROM active_readers;

-- Select data from the 'active_readers' table where 'astatus' is 'Terminated'
SELECT * FROM active_readers WHERE astatus = 'Terminated';

-- Select data from the 'active_readers' table where 'astatus' is 'Active'
SELECT * FROM active_readers WHERE astatus = 'Active';

-- Count the number of records in the 'active_readers' table where 'atype' is 'Premium'
SELECT COUNT(account_id) FROM active_readers WHERE atype = 'Premium';
