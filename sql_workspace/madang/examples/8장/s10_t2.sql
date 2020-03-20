--트랜잭션 T2
--READ COMMITTED 모드(기본 모드)
--step 2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT SUM(price) 총액
FROM   Book;

UPDATE Book 
SET     price=price+500
WHERE  bookid=1;

SELECT SUM(price) 총액 
FROM   Book;

COMMIT;


