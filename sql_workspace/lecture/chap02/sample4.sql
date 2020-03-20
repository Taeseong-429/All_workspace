-- sample4.sql

-- -------------------------------------------------------------------------
-- 1. To remove dup~~ ## 중복값을 없애기 !
-- -------------------------------------------------------------------------
SELECT job_id
FROM employees;

SELECT DISTINCT job_id
FROM employees; -- 중복은 제거됨~~

-- SELECT DISTINCT last_name, FIRST_name 
FROM employees;이건 사용 안함 아래꺼사용.

SELECT DISTINCT * -- DISTINCT 뒤에 나열된 컬럼이 모두 같아야 중복된 값으로 취급하기 때문에, 이걸 사용.
FROM employees;