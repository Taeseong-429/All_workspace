--트랜잭션 T1
--SERIALIZABLE 모드
--step 1
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SELECT SUM(price) 총액
FROM   Book;

--step 3
SELECT SUM(price) 총액
FROM   Book;
/* 앞의 결과와 같음 */


COMMIT;

