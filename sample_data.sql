-- sample_data.sql
INSERT INTO Books (BookID, Title, Author, Category, Copies) VALUES
(1, 'DBMS Concepts', 'Korth', 'CS', 5),
(2, 'Operating Systems', 'Galvin', 'CS', 4),
(3, 'Modern Physics', 'H Clarke', 'Science', 3),
(4, 'Digital Logic', 'M Morris', 'Electronics', 6);

INSERT INTO Members (MemberID, Name, JoinDate) VALUES
(101, 'Riya', '2022-01-10'),
(102, 'Arjun', '2023-03-15'),
(103, 'Meera', '2022-06-20');

INSERT INTO Borrow (BorrowID, MemberID, BookID, BorrowDate, ReturnDate) VALUES
(1, 101, 1, '2024-01-02', '2024-01-20'),
(2, 102, 1, '2024-02-11', '2024-02-28'),
(3, 101, 2, '2024-03-01', '2024-03-15'),
(4, 103, 3, '2024-04-10', '2024-04-29'),
(5, 102, 1, '2024-05-05', '2024-05-28');
