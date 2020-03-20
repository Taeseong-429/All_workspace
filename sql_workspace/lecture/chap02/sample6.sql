-- sample6.sql

-- 1. IN Operators (집합연산자) # 집합안의 원소 중 하나라도 값이 표현되어있으면 참, 뽑아라,,,, 등등 이런식으로 
-- -------------------------------------------------------------------------
-- WHERE~~~
-- -------------------------------------------------------------------------
SELECT employee_id, last_name, salary, hire_date
FROM employees
-- WHERE employee_id IN (100,200,300);
WHERE employee_id IN (100,100, 200, 200, 300); -- 이렇게 중복해서 넣어도 중복 출력 되지는 않음. 파이썬 집합도 중복 허용 X, 보장 X
-- 수학의 집합의 성질을 기억해야 합니다!!!
-- (중복 비허용, 순서 보장 X)
-- -------------------------------------------------------------------------
-- 논리연산자 (and,or,not)
SELECT
    employee_id, 
    last_name, salary, 
    hire_date
FROM 
    employees
-- 참고 : 논리연산자 (AND, OR, NOT) = (그리고, 또는, 부정)
WHERE 
    employee_id = 100  -- OR 이라 처리속도 빠름, 하나만 맞으면 되니깐
    OR employee_id = 200  -- 이렇게 논리연산자를 앞에 두는게 관례임.
    OR employee_id = 300 ; -- OR 보단 IN 쓰는게 빠르다...
-- -------------------------------------------------------------------------

SELECT 
    employee_id, 
    first_name, 
    last_name, 
    salary, 
    hire_date
    job_id
FROM 
    employees
WHERE 
    last_name 
    IN ('King', 'Abel', 'Jones'); -- 집합원소유
-- -------------------------------------------------------------------------

SELECT
    employee_id, 
    last_name, 
    salary, 
    hire_date 
FROM 
    employees -- to_date 는 날짜형식을 지정해주는거 ! 뒤에 날짜 타입 변수로
WHERE 
    hire_date 
    IN (
        to_date('01/01/13', 'RR/MM/DD'), 
        to_date('07/02/07', 'RR/MM/DD')
        ); -- 이렇게 to_date도 집합으로 사용가능
