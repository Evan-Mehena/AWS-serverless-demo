-- schema.sql
CREATE TABLE IF NOT EXISTS Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Category VARCHAR(50),
    Copies INT
);

CREATE TABLE IF NOT EXISTS Members (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(100),
    JoinDate DATE
);

CREATE TABLE IF NOT EXISTS Borrow (
    BorrowID INT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    BorrowDate DATE,
    ReturnDate DATE
);
