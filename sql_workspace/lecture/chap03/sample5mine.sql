-- sample5mine.sql

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
-- 1. 단일(행) (반환)함수
-- ------------------------------------------------------
-- 단일(행) (반환)함수의 구분:
--
--  (1) 문자 (처리)함수 : 문자와 관련된 특별한 조작을 위한 함수
--  (2) 숫자 (처리)함수 : 
--  (3) 날짜 (처리)함수 :
--  (4) 변환 (처리)함수 : 숫자/문자/날짜 데이터 간의 형 변환 함수
--  (5) 조건 (처리)함수 : if 조건문, switch 다중 조건문을 함수형태로 제공
--      a. DECODE   - if 조건문 제공
--      b. CASE     - switch 다중 조건문 제공 
--
--  * 단일(행) (반환)함수는, 테이블의 행 단위로 처리됨!
-- ------------------------------------------------------
-- (Chapter03 - page 60 참고)
-- ------------------------------------------------------

-- ------------------------------------------------------
-- (5) 조건 (처리)함수 - DECODE
-- ------------------------------------------------------
-- 조건이 반드시 일치하는 경우에 사용하는 함수
-- 즉, 동등비교연산자(=)가 사용가능한 경우에만 사용가능 --> 동등비교 용
-- ------------------------------------------------------
-- 문법) DECODE(
--          column, 
--          비교값1, 결과값1,          -->비교값1과 1과 같다면 결과값1을 리턴해라..
--          비교값2, 결과값2,
--          ...
--          비교값n, 결과값n,
--          기본결과값
--      )
-- ------------------------------------------------------
SELECT 
    last_name,
    salary,
    24000*.4 AS TEMP,
    decode(
        salary,
            1000, salary * 0.1,  --> 받는게 1000이면 0.1 곱해라 !
            2000, salary * 0.2,     --> elif (salary = 2000):
            3000, salary * 0.3,     --> elif (salary = 3000):
            salary * 0.4            --> else:
    ) AS "수당?",
    --decode(salary,1000,salary*.1,salary*0.4) AS TEMP2-- > 위에처럼 여러 조건 복잡하게는 잘 안쓰고 이것 처럼 참이면 뭐, 거짓이면 뭐 이렇게 자주 씀. 
    decode(salary,1000, salary* 0.1) AS TEMP3 --> false 값을 지정 안해주면 NULL 값으로 만들어버림!!
                                              --> 이렇게 NULL 값을 유도시키는 경우가 많음.
FROM
    employees;

-- 월급여액 별, 보너스 계산하기
SELECT 
    last_name,
    salary,
    decode(salary, 
            24000, salary * 0.3, -> --> king만 받음.
            17000, salary * 0.2, 
            salary
        ) AS 보너스  --> else 일때는 그냥 아무것도 salary만 받음.
FROM
    employees
ORDER BY
    2 desc;

SELECT

        CASE salary
            WHEN 1000 THEN salary * 0.1

-- 입사년도별, 사원들의 인원수 구하기
SELECT 
        count(*), 
        sum(1), 
        sum(0) --> SELECT의 * 는 ALL column의 의미. 모든 컬럼을 표시하라!! but, count함수에서는 전체 레코드를 세라 !!
FROM employees; -- > 몇개의 레코드인지 세고싶을 때 카운트 사용.

SELECT 
    count(*) AS "총인원수", --> count는 레코드 갯수를 세는 것임.
    sum(1) AS "2001",
    -- sum(decode(to_char(hire_date, 'YYYY'), 2001, 1, 0)) AS "2001", --> to_char 결과는 문자열..2001은 숫자. 자동형변환해서 비교됨.
    sum(decode(to_char(hire_date, 'YYYY'), 2002, 1, 0)) AS "2002", --> 문자연도가 2002이면 1을 반환하고 아니면 0을 반환해라.
    sum(decode(to_char(hire_date, 'YYYY'), 2003, 1, 0)) AS "2003", --> 즉, 입사연도가 2003이면 1을 계속 더해서 인원 수 세라.
    sum(decode(to_char(hire_date, 'YYYY'), 2004, 1, 0)) AS "2004",
    sum(decode(to_char(hire_date, 'YYYY'), 2005, 1, 0)) AS "2005",
    sum(decode(to_char(hire_date, 'YYYY'), 2006, 1, 0)) AS "2006",
    sum(decode(to_char(hire_date, 'YYYY'), 2007, 1, 0)) AS "2007",
    sum(decode(to_char(hire_date, 'YYYY'), 2008, 1, 0)) AS "2008"
FROM
    employees;
-- ------------------------------------------------------
-- (6) 조건 (처리)함수 - CASE
-- ------------------------------------------------------
-- 조건이 반드시 일치하지 않아도,
-- 범위 및 비교가 가능한 경우에 사용하는 함수
-- ------------------------------------------------------
-- 문법1) 조건이 반드시 일치하는 경우
--      CASE column
--          WHEN 비교값1 THEN 결과값1
--          WHEN 비교값2 THEN 결과값2
--          ...
--          ELSE 결과값n
--      END
-- ------------------------------------------------------
SELECT

    CASE salary
        WHEN 1000 THEN salary * 0.1
        WHEN 2000 THEN salary * 0.2
        WHEN 3000 THEN salary * 0.3
        --ELSE salary * 0.4 --> ELSE절 생략 가능, 위에 3줄에 해당되지 않으면 NULL값 출력.
    END AS bonus

FROM
    employees;
-- ------------------------------------------------------
-- 문법2) 조건이 반드시 일치하지 않는 경우
--      CASE 
--          WHEN 조건1 THEN 결과값1
--          WHEN 조건2 THEN 결과값2
--          ...
--          ELSE 결과값n
--      END
-- ------------------------------------------------------
-- SELECT


--     CASE
--         -- 1000 < salary <= 2000
--         WHEN salary > 1000 THEN salary * 0.1
--         -- 2000 < salary <= 3000
--         WHEN salary > 2000 THEN salary * 0.2
--         -- salary > 3000
--         WHEN salary > 3000 THEN salary * 0.3
--         -- salary <= 1000
--         ELSE salary * 0.4
--     END
+
SELECT

    CASE
        WHEN salary > 3000 THEN salary * 0.3
        WHEN salary > 2000 THEN salary * 0.2
        WHEN salary > 1000 THEN salary * 0.1
        ELSE salary * 0.4
    END AS bonus
FROM
    employees;