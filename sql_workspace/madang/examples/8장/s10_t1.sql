--트랜잭션 T1
--READ COMMITTED 모드(기본 모드)
--step 1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT SUM(price) 총액
FROM   Book;

--step 3
SELECT SUM(price) 총액
FROM   Book;
/* 앞의 결과와 다름 */

COMMIT;
