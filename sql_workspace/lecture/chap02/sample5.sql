-- sample5.sql 비교연산자.

-- -------------------------------------------------------------------------
-- 1. Compar
-- -------------------------------------------------------------------------
-- 1. operand1 = operand2
-- 2. operand1 = operand2
--    operand1 = operand2
--    operand1 = operand2
-- 3. operand1 = operand2
-- 4. operand1 = operand2
-- 5. operand1 = operand2
-- 1. operand1 = operand2
-- 1. operand1 = operand2
-- -------------------------------------------------------------------------

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 10000; -- 산술연산자는 select에 썼지만, 비교연산자는 조건절인 where에 사용.

SELECT employee_id, last_name, salary, hire_date 
FROM employees
-- WHERE hire_date > '07/12/31' -- 이게 책에 나와있는거. sql devel 여기선 됨.
WHERE hire_date > to_date('07/12/31', 'RR/MM/DD');  -- 2008년이후 고용된 직원 뽑아라. -- 뒤에 RR~~이건 포매팅한거. 
-- -------------------------------------------------------------------------
-- 2. BETWEEN ~~  
-- -------------------------------------------------------------------------
-- WHERE column BETWEEN ~~ start 랑 end 가 포함된다!! AND 도써야함.
-- -------------------------------------------------------------------------
SELECT 
    employee_id, 
    last_name, 
    salary, 
    hire_date
FROM 
    employees
WHERE 
    salary 
    BETWEEN 
    7000 AND 8000 ; -- 

SELECT 
    employee_id, 
    last_name, 
    salary, 
    hire_date
FROM 
    employees
--- WHERE
---  hire_date BETWEEN '07/01/01' AND '08/12/31' ; -- 여기서는 수행 안됨. 형변환 시켜줘야함 ~!

WHERE 
    hire_date 
        BETWEEN 
            to_date('07/12/31', 'RR/MM/DD')
            AND to_date('08/12/31','RR/MM/DD');
            