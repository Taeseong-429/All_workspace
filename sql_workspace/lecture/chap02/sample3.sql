-- sample3.sql

-- -------------------------------------------------------------------------
-- 1. Concat~~
-- -------------------------------------------------------------------------
-- SELECT col
-- FROm
-- -------------------------------------------------------------------------
-- (1) 문자열 + 숫자
SELECT last_name || salary AS " 이름 월급"
FROM employees;

-- (2) 문자열 + 날짜
SELECT last_name || hire_date AS "이름 날짜"
FROM employees;
-- -------------------------------------------------------------------------
-- 2. Conca~
-- -------------------------------------------------------------------------
-- SELECT column~
--
-- -------------------------------------------------------------------------
-- (3) 문자열 + 리터럴(문자열)
SELECT last_name || '사원'
FROM employees;
-- -------------------------------------------------------------------------
-- 3. Concate      
-- -------------------------------------------------------------------------
SELECT last_name || '의 직업은' || job_id || ' 입니다.' AS "사원별 직급"
FROM employees;

SELECT 
    last_name ||
    '의 직업은 ' ||
    job_id || 
    ' 입니다.' 
    AS "사원별 직급"
FROM 
    employees
WHERE 
    last_name = 'Smith';   -- # 순서에 따라 임플로이에서 뽑아서 선택하고 last_name에서 스미스가 있으면 나오는건데 없으니까 표시할 데이터가 없음. 대소문자 맞춰주니 됨.
                           -- # = : 동등비교연산자