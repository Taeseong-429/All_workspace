-- sample11.sql

-- SELECT [DISTINCT]
-- FROM 테이블명
-- [WHERE 조건식]
-- ORDER BY {column|표현식} [ASC|DESC] --> 대괄호는 전체가 생략 가능.
-- ------------------------------------------------------

-- ------------------------------------------------------
-- 1. 숫자 데이터 정렬
-- ------------------------------------------------------
SELECT employee_id, last_name, job_id, salary
FROM employees
ORDER BY salary;                -- default : ASC (오름차순 정렬)
-- ORDER BY salary ASC;             -- 오름차순 정렬 (Ascending)
-- ORDER BY salary DESC;            -- 내림차순 정렬 (Descending)

-- ORDER BY 절에 별칭(alias) 사용
SELECT employee_id, last_name, job_id, salary+100 AS "월급"
FROM employees
ORDER BY salary + 100 DESC;                 
-- ORDER BY 월급 DESC;                 -- 컬럼별칭으로/ 꼭 별칭으로 쓸 필요 없지만, 별칭으로 지정해줬으면
                                    -- 여기도 별칭으로 써주는게 좋음.

-- ORDER BY 절에 컬럼인덱스 사용
-- (주의) Oracle은 인덱스가 1부터 시작함을 명심할 것 !!
SELECT employee_id,         --1 
        first_name,         --2
        last_name,          --3
        job_id,             --4
        salary AS "월급"    --5
FROM employees
-- 다른 대안이 없는 경우에만 쓸 것 !!(부작용) 
--> 1) SELECT절이 그 구성컬럼 내역이 바뀔 수 있기 때문에 !
--  2) 내가 의도한 컬럼이 아닌 다른 컬럼을 지정하는 문제가 다른 응용프로그램에서도 발생하기 때문에 !
-- (SELECT 절에 ~~)
ORDER BY 4 DESC;            -- 컬럼인덱스로 정렬.

-- ------------------------------------------------------
-- 2. 문자 데이터 정렬
-- ------------------------------------------------------
SELECT employee_id, last_name AS 이름, job_id, salary
FROM employees
-- ORDER BY last_name ASC;     -- 컬럼명으로 정렬
ORDER BY 이름 ASC;       -- 컬럼별칭으로 정렬
-- ORDER BY 2 ASC;          -- 컬럼인덱스로 정렬

-- ------------------------------------------------------
-- 3. 날짜 데이터 정렬
-- ------------------------------------------------------

SELECT employee_id, last_name, salary, hire_date AS 입사일
FROM employees
--ORDER BY hire_date DESC;    -- 컬럼명으로 정렬
ORDER BY 입사일 DESC;     -- 컬럼별칭으로 정렬
-- ORDER BY 4 DESC; -- 컬럼인덱스로 정렬

-- ------------------------------------------------------
-- 4. 다중컬럼 정렬
-- ------------------------------------------------------
-- 문법)
--~~~ 여기 안씀
-- ------------------------------------------------------
SELECT employee_id, last_name, salary, hire_date
FROM employees
ORDER BY
    salary DESC,                -- 컬럼명1로 내림차순 정렬
    hire_date;                  -- 컬럼명2로 오름차순 정렬 
                                -- 첫번째 나온대로 컬럼 정렬하고 고정시킨 다음에 salary 같으면 오름차순 날짜로 지정되는듯 ??

-- ------------------------------------------------------
-- 5. NULL값 정렬
-- ------------------------------------------------------
-- (주의) Oracle 에서 가장 큰 값은, NULL 값임!!!
--       (값이 없기 때문에, 값의 크기를 비교 불가)
--       따라서, 내림차순 정렬시, 가장 큰 값이 NULL 이 우선
-- ------------------------------------------------------
SELECT employee_id, last_name, commission_pct
FROM employees
-- ORDER BY commission_pct DESC;
ORDER BY commission_pct ASC; --> NULL 값을 가진게 많다면 어떻게 정렬되는가 ?? -> 순서는 없음! 데이터 성질이 수학의 집합과 동일하기 때문이다.
--                               여기서 나온 결과는 그냥 원래 있던대로 나오는 것임. 순서 정렬된 거 아님 !
-- (주의) 관계형 데이터베이스의 테이블은, 수학의 집합과 동일.
-- 즉, 수학의 집합의 성질을 그대로 물려받음:
--      (1) 레코드의 순서를 보장하지 않음(즉, 무작위로 저장)
--      (2) 중복을 허용하지 않음
--          (단, 관계형 테이블은 중복행을 포함할 수는 있으나
--            기본키(PK)가 저장되어있다면, 당연히 중복은 없음!)