-- 1. 

ALTER USER hr IDENTIFIED BY hr
ACCOUNT UNLOCK;

-- 2.

-- 3. 
SELECT employee_id, last_name|| ' ' || first_name, salary, ROUND(salary+(salary*0.123)) AS "Increas Saalry"
FROM employees
WHERE department_id = 60

-- 4. 
SELECT first_name|| ' ' || last_name,
        salary,
        NVL2(commission_pct,'Salary + Commission','Salary only'),
        NVL2(commission_pct, (salary*12+(salary*commission_pct)*12), salary*12) AS "연봉"
FROM employees
ORDER BY 4 DESC;

-- 5. 
SELECT job_id, avg(salary) AS "급여 평균"
FROM employees
WHERE job_id NOT LIKE '%CLERK%'
GROUP BY job_id
HAVING avg(salary) > 10000
ORDER BY avg(salary) DESC;