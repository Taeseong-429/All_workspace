-- sample9.sql

-- -------------------------------------------------------------------------
-- SELECT 문의 ~~
-- -- -------------------------------------------------------------------------

-- HAVING 절은 그룹을 필터링!

-- 1. NOT 연산자

SELECT last_name, job_id, salary
FROM employees
--WHERE NOT salary < 20000; -- 크거나 같다.
--WHERE (NOT salary < 20000) ; -- 위에 결과랑 같게 나옴.
WHERE NOT (salary < 20000) ; 

-- 2. NOT IN 연산자
SELECT last_name, job_id, salary
FROM employees
--WHERE salary NOT IN (9000, 8000,6000); -- OR 연산자와 같음
WHERE NOT (salary IN(9000,8000,6000)); -- 윗줄 결과와 다름. 이거 비쥬얼 스튜디오로 하면 결과 갯수 나오지 않지만, 
                                       -- 디벨로퍼로 하면 갯수 나오는데 갯수는 같음. 의미는 다른 거임.
                                       -- 보통 NOT IN을 붙여놓긴 하지만, 혹시 모르니 알아두기.
                                       -- 정확히 이해하려면 오라클 Optimizer 로 보기 ..--같은디?

-- 3. NOT LIKE 연산자
SELECT last_name, job_id, salary
FROM employees
-- WHERE last_name NOT LIKE 'J%';       -- NOT은 단항연산자 ! 
WHERE NOT last_name LIKE 'J%';          -- NOT은 앞에 오든 뒤에 오든, 항을 부정하는건 매 한가지.
-- WHERE NOT (last_name LIKE 'J%');     -- 꼭 LIKE 옆에 쓸 필요는 없다는 얘기.

-- 4. NOT BETWEEN a AND b 연산자
--    NOT (a <= x <= b)  --> ( x < a , x > b )
SELECT last_name, job_id, salary
FROM employees
WHERE salary NOT BETWEEN 2400 AND 20000;
-- WHERE NOT (salary BETWEEN 2400 AND 20000);


-- 5. IS NULL 연산자 (*******)
SELECT last_name, job_id, salary, commission_pct
FROM employees
--WHERE commission_pct = NUll;          -- 왜 값이 안나올까 ? --> 값이 없으니 비교할 값이 없어서 비교연산자 써도 나오지 않음 !!
--WHERE commission_pct IS NULL;         -- 위 문제를 해결하기 위해 나온게 IS NULL 이다 !
WHERE NVL(commission_pct, -1) = -1;     -- 또, 이 커미션 값이 NULL 이면 NVL을 써서 가능! -1은 상징적으로 나올 수 없는 값을 입력.
                                        -- 하지만, 이렇게 NVL을 쓰면 부작용이 따름. --> INDEX 사용이 불가 !!!!

-- 6. IS NOT NULL 연산자
SELECT last_name, job_id, salary, manager_id
FROM employees
WHERE manager_id IS NOT NULL;           -- 