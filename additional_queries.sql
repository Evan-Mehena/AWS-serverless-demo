-- additional_queries.sql
-- 1. List all books with available copies
SELECT * FROM Books WHERE Copies > 0;

-- 2. Find members who borrowed more than 5 books
SELECT MemberID, COUNT(*) AS borrows FROM Borrow GROUP BY MemberID HAVING COUNT(*) > 5;

-- 3. Books never borrowed
SELECT b.* FROM Books b LEFT JOIN Borrow br ON b.BookID = br.BookID WHERE br.BookID IS NULL;

-- 4. Most active member (max borrows)
SELECT MemberID, COUNT(*) AS borrows FROM Borrow GROUP BY MemberID ORDER BY borrows DESC LIMIT 1;

-- 5. Category-wise book count
SELECT Category, COUNT(*) FROM Books GROUP BY Category;

-- 6. Average borrowing duration per member
SELECT MemberID, AVG(DATEDIFF(ReturnDate, BorrowDate)) AS avg_days FROM Borrow GROUP BY MemberID;

-- 7. Members with overdue returns (assuming 15-day rule)
SELECT MemberID, COUNT(*) AS overdue_count FROM Borrow WHERE DATEDIFF(ReturnDate, BorrowDate) > 15 GROUP BY MemberID;

-- 8. Books returned late by more than 10 days
SELECT * FROM Borrow WHERE DATEDIFF(ReturnDate, BorrowDate) > 10;

-- 9. Borrow history of a particular member
SELECT * FROM Borrow WHERE MemberID = 101 ORDER BY BorrowDate DESC;

-- 10. All books borrowed in the last 30 days
SELECT b.* FROM Borrow br JOIN Books b ON br.BookID = b.BookID WHERE br.BorrowDate >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- 11. Count books by category
SELECT Category, COUNT(*) FROM Books GROUP BY Category;

-- 12. Top authors by total borrows
SELECT bk.Author, COUNT(*) AS borrows FROM Borrow br JOIN Books bk ON br.BookID = bk.BookID GROUP BY bk.Author ORDER BY borrows DESC;

-- 13. Members who never returned a book (NULL ReturnDate)
SELECT * FROM Borrow WHERE ReturnDate IS NULL;

-- 14. Highest penalty members (assuming ₹10 per day after 15 days)
SELECT MemberID, SUM(GREATEST(DATEDIFF(ReturnDate,BorrowDate)-15,0)*10) AS penalty FROM Borrow GROUP BY MemberID ORDER BY penalty DESC;

-- 15. Books borrowed by multiple members
SELECT BookID FROM Borrow GROUP BY BookID HAVING COUNT(DISTINCT MemberID) > 1;

-- 16. Return rate per category
SELECT bk.Category, COUNT(*) AS returns FROM Borrow br JOIN Books bk ON br.BookID = bk.BookID GROUP BY bk.Category;

-- 17. Month-wise borrowing report
SELECT DATE_FORMAT(BorrowDate, '%Y-%m') AS month, COUNT(*) FROM Borrow GROUP BY month ORDER BY month;

-- 18. Longest-kept book record
SELECT *, DATEDIFF(ReturnDate, BorrowDate) AS days_kept FROM Borrow ORDER BY days_kept DESC LIMIT 1;

-- 19. List books borrowed more than 3 times
SELECT BookID, COUNT(*) FROM Borrow GROUP BY BookID HAVING COUNT(*) > 3;

-- 20. Books borrowed by all members (requires knowing total members)
-- Example when there are N members: find books with distinct member count = N
