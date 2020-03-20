-- sample1mine.sql

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
-- 2. 그룹 (처리)함수
-- ------------------------------------------------------
-- 그룹 (처리)함수의 구분:
--
--  (1) SUM     - 해당 열의 총합계를 구한다
--  (2) AVG     - 해당 열의 평균을 구한다
--  (3) MAX     - 해당 열의 총 행중에 최대값을 구한다
--  (3) MIN     - 해당 열의 총 행중에 최소값을 구한다
--  (4) COUNT   - 행의 개수를 카운트한다
--
--  * 그룹 (처리)함수는, 1) 여러 행 또는 2) 테이블 전체에 대해, 
--    함수가 적용되어, 하나의 결과를 반환!
-- ------------------------------------------------------

-- ------------------------------------------------------
-- (1) 그룹 (처리)함수 - SUM
-- ------------------------------------------------------
-- 해당 열의 총합계를 구한다 (** NULL 값 제외하고 **)
-- ------------------------------------------------------
-- 문법) SUM( [ DISTINCT | ALL ] column )
--          DISTINCT : excluding duplicated values. --> DISTINCT는 중복된 값을 제외하고 더해라 !!
--          ALL : including duplicated values.      --> ALL은 앞에 다 생략하면 기본 디폴트값이 ALL 
--                (if abbreviated, default)
-- ------------------------------------------------------
SELECT
    sum(DISTINCT salary), --> salary가 갖는 값중에 중복 값을 제외하고,, 합해라
    sum(ALL salary),      --> 모두 합해라
    sum(salary)           --> 윗 문장과 같음 디폴트 값.
FROM
    employees;


-- ------------------------------------------------------
-- (2) 그룹 (처리)함수 - AVG
-- ------------------------------------------------------
-- 해당 열의 평균을 구한다 (** NULL 값 제외하고 **)
-- ------------------------------------------------------
-- 문법) AVG( [ DISTINCT | ALL ] column )     -                 --> 중복 제거..
--          DISTINCT : excluding duplicated values.
--          ALL : including duplicated values.                  --> 디폴트는 ALL
--                (if abbreviated, default)
-- ------------------------------------------------------
SELECT 
    sum(salary),
    avg(DISTINCT salary),
    avg(ALL salary),
    avg(salary)
FROM
    employees;

-- ------------------------------------------------------
-- (3) 그룹 (처리)함수 - (** NULL 값 제외하고 **)
--      MAX : 해당 열의 총 행중에 최대값을 구한다
--      MIN : 해당 열의 총 행중에 최소값을 구한다
-- ------------------------------------------------------
-- 문법) MAX( [ DISTINCT | ALL ] column )
--      MIN( [ DISTINCT | ALL ] column )
--          DISTINCT : excluding duplicated values.
--          ALL : including duplicated values.
--                (if abbreviated, default)
-- ------------------------------------------------------
SELECT
    max(salary),
    min(salary)
FROM
    employees;

SELECT
    min( hire_date ),
    max( hire_date )
FROM
    employees;

-- ------------------------------------------------------
-- (4) 그룹 (처리)함수 - COUNT
-- ------------------------------------------------------
-- 행의 개수를 카운트한다(* 컬럼명 지정하는 경우, NULL값 제외 *)
-- ------------------------------------------------------
-- 문법) COUNT( { [[ DISTINCT | ALL ] column] | * } )   ----->> * 쓸때랑 ALL 쓸때랑 결과 값 다르게 나올 수 있음.. NULL값 때문에 ?
--          DISTINCT : excluding duplicated values.
--          ALL : including duplicated values.
--                (if abbreviated, default)
-- ------------------------------------------------------
SELECT
    count(*),               ------------>> 레코드의 갯수를 세니까 *가 편할 때 있음. 가능하면 쓰지말아라. 메모리 부담 크다 왜 ??
    count(last_name), ----------->> last_name에는 NOT NULL
    count(commission_pct) -------------->> commission은 NULL 포함되어 있음.  따라서 count 함수에 따라 commission 받는 사람은 다 포함 안되어서 사람 수 적음.
    
FROM
    employees;


SELECT  
    count(job_id),
    count(DISTINCT job_id) -----------> 직책 갯수.
FROM
    employees;

-- 해당 테이블의 전체 레코드 개수 구하기 (*주의필요*)
SELECT
    count(*),               -- Decommended
    count(commission_pct),  -- *Causion (removed all NULLs)
    count(employee_id)      -- *Recommended (Primary Key = Unique + Not NULL) -----> PK역할을 하고 있는 컬럼이 있다면, 그 컬럼으로 카운트
    ------------------------------------------------------->하는게 가장 빠르다는 뜻임. 여기선 employee_id임!!
FROM
    employees; 