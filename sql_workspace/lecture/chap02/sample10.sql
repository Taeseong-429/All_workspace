-- sample10.sql

-- -------------------------------------------------------------------------
-- 연산자 우선순위 ( ~~~~
-- -------------------------------------------------------------------------
-- (1) 괄호( )              --> 괄호가 가장 우선순위 높음.
-- (2) 비교 연산자
-- (3) NOT 연산자
-- (4) AND 연산자           --> AND가 OR보다 우선순위 높음.
-- (5) OR 연산자 

-- 우선순위 : 괄호() > 비교 > NOT > AND > OR

-- 1. AND 연산자가 우선실행 : 예상치 못한 결과
SELECT last_name, job_id, salary, commission_pct
FROM employees
WHERE 
    job_id = 'AC_MGR' OR job_id = 'MK_REP'
    AND commission_pct IS NULL
    AND salary >= 4000
    AND salary <= 9000;                     --> 연산자 우선순위 미스때문에 결과 이상하게 나옴 !!

-- 2. 연산자 우선순위 조정(소괄호 이용) : 올바른 결과
SELECT last_name, job_id, salary, commission_pct
FROM employees
WHERE
    ( job_id = 'AC_MGR' OR job_id = 'MK_REP')
    AND commission_pct IS NULL
    AND salary BETWEEN 4000 AND 9000;

    