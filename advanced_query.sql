-- advanced_query.sql
WITH BorrowStats AS (
    SELECT 
        b.BookID,
        bk.Title,
        bk.Category,
        COUNT(*) AS TimesBorrowed,
        AVG(DATEDIFF(ReturnDate, BorrowDate)) AS AvgDelay,
        COUNT(DISTINCT b.MemberID) AS UniqueMembers
    FROM Borrow b
    JOIN Books bk ON b.BookID = bk.BookID
    WHERE BorrowDate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
    GROUP BY b.BookID, bk.Title, bk.Category
),
CategoryRank AS (
    SELECT
        *,
        RANK() OVER(
            PARTITION BY Category
            ORDER BY TimesBorrowed DESC
        ) AS CatRank
    FROM BorrowStats
)
SELECT 
    BookID,
    Title,
    Category,
    TimesBorrowed,
    AvgDelay,
    UniqueMembers,
    CatRank
FROM CategoryRank
WHERE CatRank <= 3
  AND AvgDelay > 2
ORDER BY Category, CatRank;
