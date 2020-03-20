--트랜잭션 T2
--READ COMMITTED 모드(기본 모드)

-- step 2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT SUM(price) 총액
FROM   Book;


INSERT INTO Book VALUES (11, '테스트', '테스트출판사', 5500);

SELECT SUM(price) 총액
FROM   Book;


COMMIT;

