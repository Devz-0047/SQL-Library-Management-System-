# SQL-Library-Management-System
Introduction
This document provides an overview and documentation for the SQL code that implements a Library Database Management System. The system manages readers, books, active reader accounts, and book issuance records. The SQL code consists of table creation, data insertion, and data retrieval operations. This system is designed for libraries to manage their resources and reader accounts efficiently.

Features
The Library Database Management System includes the following features:

Readers Management:

Create and manage reader accounts, including personal information such as name, contact details, occupation, and date of birth.
Ensure data integrity by assigning a unique reader ID to each account.
Store reader data in the 'readers' table.
Books Management:

Create and manage book records, including book ID, book name, and domain (genre).
Maintain data accuracy by enforcing a primary key constraint on the book ID.
Store book data in the 'Book' table.
Active Readers Management:

Create and manage active reader accounts, associating readers with books they have borrowed.
Track the account type ('atype') and account status ('astatus') of each active reader.
Maintain data integrity by enforcing primary key and foreign key constraints.
Store active reader data in the 'active_readers' table.
Book Issuance Management:

Record book issuance transactions, associating them with active reader accounts.
Track the issuance number ('issuenumber') and the number of books issued ('numbers_of_books_issued') in each transaction.
Ensure data accuracy by enforcing primary key and foreign key constraints.
Store issuance data in the 'bookissue_details' table.
Design
The Library Database Management System is designed with a focus on data integrity and efficient data management. Here's an overview of the database schema:

readers Table:

Stores information about library readers.
Primary key: reader_id
Book Table:

Stores information about library books.
Primary key: bid
active_readers Table:

Stores information about active reader accounts and their associated books.
Primary key: account_id
Foreign key: reader_id references readers(reader_id)
Foreign key: bid references Book(bid)
bookissue_details Table:

Records book issuance transactions associated with active reader accounts.
Primary key: issuenumber
Foreign key: account_id references active_readers(account_id)
Working
The SQL code works as follows:

Database Creation:

A new database named 'librarydb' is created to store all library-related data.
Table Creation:

Four tables are created to manage readers, books, active reader accounts, and book issuance details: 'readers,' 'Book,' 'active_readers,' and 'bookissue_details.'
Each table has specific columns to store relevant data.
Data Insertion:

Data is inserted into each table to populate the database with sample information.
Sample reader, book, active reader, and book issuance records are created to demonstrate the functionality of the system.
Data Retrieval:

SELECT statements are used to retrieve data from the 'active_readers' table.
The SELECT statements demonstrate filtering by account status ('astatus') and account type ('atype').
A COUNT query calculates the number of 'Premium' active reader accounts.
Conclusion
The Library Database Management System provides an efficient and structured way to manage reader accounts, books, active reader accounts, and book issuance records in a library. The SQL code demonstrates the creation of the necessary tables, data insertion, and data retrieval operations, highlighting key features of the system. This system can serve as a foundation for building a comprehensive library management system with additional functionalities.
