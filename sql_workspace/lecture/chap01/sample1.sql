-- sample1.sql

-- -------------------------------------------------------------------------
-- 1. To change the password of the specified user
-- -------------------------------------------------------------------------
ALTER USER hr identified by hr;

-- -------------------------------------------------------------------------
-- 2. To lock the specified user _ACTUAL_EDITION_OBJ # 잠가서 못쓰게 하는 거 !
-- -------------------------------------------------------------------------
-- AlTER USER <사용자명> ACCOUNT LOCK; # 잠긴지 확인하는법 1) 로그인해보기 (터미널 켜서 sqlplus~~)
-- -------------------------------------------------------------------------
ALTER USER hr ACCOUNT LOCK;

DESC DBA_USERS; -- 테이블을 묘사하라!, 여기선 잠겨있는지 확인하는 과정! USERS에 있는 컬럼들..
SELECT USERNAME, ACCOUNT_STATUS FROM DBA_USERS; -- USERS 테이블에 있는 거에서 유저네임이랑, 상태만 뽑아내기
-- -------------------------------------------------------------------------
-- 3. To unlock the specified user
-- -------------------------------------------------------------------------
--
-- -------------------------------------------------------------------------
ALTER USER hr ACCOUNT UNLOCK;

DESC DBA_USERS;
SELECT USERNAME, ACCOUNT_STATUS FROM DBA_USERS; -- 오픈됐는지 확인
-- -------------------------------------------------------------------------
-- 4. To change the password and [un]lock
--    of the specified USER                    # 위에서 했던 락, 언락을 한번에 가능하게 !
-- -------------------------------------------------------------------------
ALTER USER hr ACCOUNT LOCK IDENTIFIED BY hr;
ALTER USER hr ACCOUNT UNLOCK IDENTIFIED BY hr;

DESC DBA_USERS;
SELECT USERNAME, PASSWORD, ACCOUNT_STATUS FROM DBA_USERS; -- 위에 한줄씩 수행하고, 이 문장 실행. --> 암호는 안보임 !
-- 이런 ALTER 문장은 DDL문장 중 하나임@@
