-- T2(쓰는 트랜잭션)
-- READ COMMITTED 모드
--step 2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

INSERT INTO Users VALUES (3, 'Bob', 27);

COMMIT;

SELECT * 
FROM   Users
WHERE age BETWEEN 10 AND 30;


