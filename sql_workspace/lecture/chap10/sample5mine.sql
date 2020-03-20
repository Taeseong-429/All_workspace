-- sample5mine.sql


-- ------------------------------------------------------
-- 5. Index 삭제(DROP)
-- ------------------------------------------------------
-- Basic syntax:
--
--  DROP INDEX <삭제할 인덱스명>;
-- -----------------------------------------------------------------------------------------
DROP INDEX emp_ename_idx;

-- ---------------------
-- 6. Index 활성화(Enable)와 비활성화(Disable)
-- -------------
-- Basic syntax:
--
-- ALTER INDEX <인덱스명> ENABLE; -- 활성화
-- ALTER INDEX <인덱스명> DISABLE; -- 비활성화 --> 옛버전에만?
-- or
-- ALTER INDEX <인덱스명> REBUILD; -- 활성화
-- ALTER INDEX <인덱스명> UNUSABLE; -- 비활성화
---------------------------------------------------------------------------
ALTER INDEX pk_emp UNUSABLE;    -- DISABLE
ALTER INDEX pk_emp REBUILD;     -- ENABLE

DESC USER_INDEXES;

SELECT INDEX_NAME, TABLE_NAME, STATUS
FROM USER_INDEXES
WHERE INDEX_NAME = 'PK_EMP';