--T1(읽는 트랜잭션)
--READ UNCOMMITTED (DIRTY) 모드
-- ORACLE 에서는 실습이 불가능 **

--step1 
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

SELECT * 
FROM   Users
WHERE  id=1;

--step 3
SELECT * 
FROM   Users
WHERE  id=1;

--step 5
SELECT * 
FROM   Users
WHERE  id=1;

COMMIT;

