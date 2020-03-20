-- sample7.sql

-- 1. LIKE Operators (패턴매칭연산자)
-- -------------------------------------------------------------------------
-- WHERE column LIKE <패턴> 
-- -------------------------------------------------------------------------
-- <패턴>에 사용가능한 Wildcard 문자들 :
-- ~~~~~~~~ ## 여기서 x는 문자의 갯수임 !@!!!@#!@#!@#!@#!
-- -------------------------------------------------------------------------

SELECT employee_id, last_name, salary
FROM employees
WHERE last_name LIKE 'J%'; --직원 이름이 대문자 J로 시작하는 모든 직원을 뽑아내라. -- % : x >= 0  -- 대문자로 한 이유는 첫글자를 다 대문자로 하니까 한듯 !
-- -------------------------------------------------------------------------
SELECT employee_id, last_name, salary
FROM employees
WHERE last_name LIKE '%ai%'; -- % : x >= 0 --# ai 만 겹쳐서 나오면 뽑아낸다는 얘기..
-- -------------------------------------------------------------------------
SELECT employee_id, last_name, salary
FROM employees
WHERE last_name LIKE '%in'; -- lastname이 in으로 끝나는 직원을 뽑아내라.
-- -------------------------------------------------------------------------
SELECT employee_id, last_name, salary
FROM employees
WHERE last_name LIKE '_b%';  -- 앞에는 문자 1개, 뒤에는 문자 몇개가 와도 됨.
-- -------------------------------------------------------------------------
SELECT employee_id, last_name, salary
FROM employees
WHERE last_name LIKE '_____d';  
-----------------------------화장실,,,
SELECT employee_id, last_name, salary, job_id
FROM employees
WHERE job_id LIKE '%D_%' ESCAPE 'D' ; 

SELECT employee_id, last_name, salary, job_id
FROM employees
WHERE job_id LIKE '%E____' ESCAPE 'E' ;  

-- -------------------------------------------------------------------------
SELECT 
    last_name,
    job_id, 
    salary
FROM 
    employees
WHERE 
    ( job_id = 'IT_PROG' ) 
    AND ( salary >= 5000 );  -- AND는 이항.  괄호를 아끼지 말자~!

SELECT 
    last_name,
    job_id, salary
FROM 
    EMPLOYESS
WHERE 
( job_id = 'IT_PROG' ) 
OR ( salary >= 5000 );
