--트랜잭션 T2
--READ COMMITTED (기본 모드)
--step2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT SUM(price) 총액
FROM   Book;

/* 여기까지 실행해본 후 진행 */

INSERT INTO Book VALUES (12, '테스트', '테스트출판사', 5500);

--step 4
SELECT SUM(price) 총액
FROM   Book;


COMMIT;
