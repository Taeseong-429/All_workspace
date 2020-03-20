-- assignment2.sql

-- 1.
SELECT first_name|| ' ' ||last_name AS "Name", salary
FROM employees
WHERE NOT (salary BETWEEN 7000 and 10000)
ORDER BY salary;

-- 2. 
SELECT first_name||' '||last_name AS "Name", salary, job_id, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC, commission_pct DESC ; -- 급여 같고, 수당율 NULL 로 같으면 ??

--3. 
SELECT employee_id, 
        first_name||' '||last_name AS "Name",
        salary, 
        round((salary + (salary * 0.123))) AS "Increase Salary"
FROM employees
WHERE department_id = 60;

DESC departments;