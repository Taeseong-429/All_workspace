-- sample2mine.sql

-- ******************************************************
-- SELECT 문의 기본구조와 각 절의 실행순서
-- ******************************************************
--  - Clauses -                 - 실행순서 -
--
-- SELECT clause                        (5)
-- FROM clause                          (1)
-- [ WHERE clause ]                     (2)
-- [ GROUP BY clause ]                  (3)
-- [ HAVING clause ]                    (4)
-- [ ORDER BY clause ]                  (6)
-- ******************************************************

-- ------------------------------------------------------
-- 2. 단일 행 Sub-query
-- ------------------------------------------------------
-- 가. 하나의 행을 반환
-- 나. 반드시 단일 행 서브쿼리를 사용해야만 하는 경우:
--      - 기본키(Primary Key)를 이용하는 경우
--      - 그룹함수(MAX, MIN, SUM 등)를 이용하는 경우
-- ------------------------------------------------------
-- * Please refer to the chapter 06, page 6.
-- ------------------------------------------------------

-- ------------------------------------------------------
-- (1) 평균 월급여보다 많은 월급을 받는 사원조회
-- ------------------------------------------------------
-- 평균 급여를 먼저 구하기 위해, 단일 행 서브쿼리 및 그룹함수 AVG 사용
-- 따라서, 메인쿼리에서 사용가능한 연산자는 하나의 값과 비교하는 비교연산자임!

SELECT
    last_name,
    salary
FROM
    employees
WHERE
    -- 메인쿼리 : 단일행 서브쿼리가 사용되었으므로, 단일 값과 비교가능한 
    --            비교연산자 사용가능
    salary >= (
        -- 단일 행 비상관 서브쿼리 : 모든 사원의 평균 월급여 반환. 단일 행인 이유는 아래 집계함수라서 하나의 값만 반환해주기 때문.!!
        -- 메인쿼리로 결과값 전달.
        SELECT avg(salary) --> 이 집계함수는 하나의 값을 반환해줌. 그래서 바로 윗줄 비교연산자로 비교가능..
        FROM employees
    );

-- ------------------------------------------------------
-- (2) 100번 부서의 최대 월급여와 동일한 월급을 받는 사원조회
-- ------------------------------------------------------
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    -- 메인쿼리: 단일행 서브쿼리가 사용되었으므로, 단일 값과 비교가능한
    --           비교연산자 사용가능
    salary = (
        -- 단일 행 비상관 서브쿼리: 100번 부서의 최대 월급여 반환
        -- 메인쿼리로 결과값 전달
        SELECT max(salary) --> 집계함수인 max라서 한개의 행 반환.
        FROM employees
        WHERE department_id = 100
    );

-- ------------------------------------------------------
-- (3) 100번 부서의 최대 월급여보다, 많은 월급을 받는 부서조회
-- ------------------------------------------------------
SELECT
    -- 최종적으로 선택된, 각 부서의 번호와 최소 월급여 출력
    department_id,
    min(salary)
FROM
    employees
GROUP BY
    -- 부서별 그룹 생성
    department_id
HAVING
    -- 메인쿼리 2차 필터링: 조건에 부합하는 그룹만 필터링
    -- 단일행 서브쿼리가 사용되었으므로, 단일 값과 비교가능한 비교연산자 사용가능
    min(salary) > (
        -- 단일 행 비상관 서브쿼리: 100번 부서의 최대 월급여 반환
        -- 메인쿼리로 결과값 전달
        SELECT max(salary)
        FROM employees
        WHERE department_id = 100
    );

-- ------------------------------------------------------
-- (4) 사원 Whalen 보다, 채용일자가 느린 사원조회
-- ------------------------------------------------------
SELECT 
    last_name,
    hire_date
FROM
    employees
WHERE 
    -- 메인쿼리 1차 필터링 : 단일행 서브쿼리가 사용되었으므로,
    -- 단일 값과 비교가능한 비교연산자 사용가능
    hire_date > (
        -- 단일 행 비상관 서브쿼리: Whalen의 채용일자 반환
        -- 메인쿼리로 결과값 전달
        SELECT hire_date
        FROM employees
        WHERE last_name = 'Whalen'
    );
