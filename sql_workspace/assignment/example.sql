-- 1. 

ALTER USER hr IDENTIFIED BY hr
ACCOUNT UNLOCKED ;

-- 3.
DESC employees;

SELECT employee_id, 
        last_name|| ' ' || first_name AS "Name", 
        salary, 
        ROUND(salary+(salary*0.123),0) AS "Increase Salary"
FROM employees
WHERE department_id = 60;

-- 4.
DESC employees;

SELECT first_name||' '||last_name AS "Name",
        salary,
        NVL2(commission_pct,'Salary + Commission', 'Salary only') AS "수당여부",
        NVL2(commission_pct, salary*12+(salary*commission_pct)*12, salary*12) AS "연봉"
FROM employees
ORDER BY 연봉 DESC;

-- 5.
DESC employees;

SELECT job_id, avg(salary) AS "급여 평균"
FROM employees
WHERE job_id NOT LIKE '%CLERK%'
GROUP BY job_id
HAVING avg(salary) > 10000
ORDER BY 2 DESC;