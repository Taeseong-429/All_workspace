-- sample3mine.sql

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
-- * ANSI Join 특징 *
-- ------------------------------------------------------
-- 가. Oracle 이외의 관계형 데이터베이스에서도 사용가능한 표준
-- 나. 여러 테이블의 조인 조건을, WHERE 절에 명시하지 않고,
--     다른 방법을 통해(주로, FROM절에 기재) 기술
-- 다. 검색조건을 WHERE 절에 기재(조인조건과 검색조건을 분리)
-- 라. 가독성 향상
-- ------------------------------------------------------

-- ------------------------------------------------------
-- 2. ANSI Join
-- ------------------------------------------------------
--  a. Cross Join
--      == The same as Oracle Cartesian Product. 
--  b. Natural Join    
--      == The same as Oracle Equal Join
--         with implicit columns automatically searched. --> 작성자 모르게 공동 컬럼을 자동으로 이어줌. 자연스러운 조인 !
--  c. USING(Common Columns) or ON <Join Condition>
--      == The same as Oracle Equal Join              
--         with explicit columns manually determined. --> Join 조건을 ON 뒤에 명시 가능.
--  d. JOIN ~ ON
--      == The same as Oracle Non-equal Join.           --> 오라클의 비동등 조인과 같음.
--  e. { LEFT | RIGHT | FULL } OUTER JOIN
--      == The same as Oracle Outer Join.               --> 양쪽에 다 붙일 수 있는 FULL 조인이 추가됨. LEFT 와 RIGHT는 오라클 조인 아우터 조인과 같음.
--  f. Self Join
--      == The same as Oracle Self Join.                --> 오라클의 셀프 조인과 같음.
-- ------------------------------------------------------
-- * Please refer to page 22.
-- ------------------------------------------------------


-- ------------------------------------------------------
-- A. Cross Join
-- ------------------------------------------------------
-- The same as Oracle Cartesian Product.
-- 조인에 참여한 각 테이블의 레코드의 갯수를 모두 곱한 결과 반환
--
-- * 조인결과: 테이블1 x ... x 테이블n 개의 레코드 생성
-- ------------------------------------------------------
-- Basic Syntax)
--  SELECT 테이블1.컬럼 , 테이블2.컬럼
--  FROM 테이블1 CROSS JOIN 테이블2
-- ------------------------------------------------------
SELECT count(*) FROM employees;      -- 행의 갯수를 파악~~
SELECT count(*) FROM employees;

SELECT
    count(*)
FROM
    -- employees CROSS JOIN departments;
    departments CROSS JOIN employees;

SELECT 
    t1.last_name,
    t2.department_name
FROM
    employees t1 CROSS JOIN departments t2; --> 여기서만 오류나고 디벨로퍼에선 잘 됨.

SELECT
    -- employees(t1) 에 있는 컬럼
    last_name, -- 테이블 alias 쓰지 않은 경우
    -- t1.last_name, -- alias 쓴 경우. -------------->> ANSI에선 alias를 쓰던, 쓰지 않던 상관없다.

    -- departments(t2) 에 있는 컬럼
    department_name,
    -- t2.department_name,
    
    -- employees(t1), departments(t2) 모두에 있는 공통컬럼
    -- manager_id,         -- X: ORA-00918: 열의 정의가 애매합니다
    t1.manager_id,      -- OK

    -- employees(t1), departments(t2) 모두에 있는 공통컬럼
    -- department_id       -- X: ORA-00918: 열의 정의가 애매합니다. ---> 애매해서 오류난다.
    t2.department_id    -- OK
FROM
    employees t1 CROSS JOIN departments t2; --> 디벨로퍼에선 됨.

-- ------------------------------------------------------
-- B. Natural Join
-- ------------------------------------------------------
-- The same as Oracle Equal(= Equi) Join
-- with implicit columns automatically searched.
-- ------------------------------------------------------
-- 가. 두 테이블의 같은 이름을 가진 컬럼에 기반하여 동작.
-- 나. 두 테이블에 반드시 하나의 공통컬럼이 있어야 함.
-- 다. (*주의*) 만일, 두 개 이상의 공통컬럼이 존재하는 경우,
--     엉뚱한 결과를 생성할 수 도 있음.
--     즉, 두 개 이상의 공통컬럼 값이 동일한 레코드만 조회.
-- 라. 테이블 별칭(Table Alias)도 사용가능.
-- 마. (*주의*) SELECT절에 컬럼 나열시, 두 테이블의 공통컬럼을
--     나열할 때, 테이블명을 사용하는 경우 오류발생
-- ------------------------------------------------------
-- Basic Syntax) FROM절에, NATURAL JOIN 키워드 사용
--
--  SELECT 테이블1.컬럼 , 테이블2.컬럼
--  FROM 테이블1 NATURAL JOIN 테이블2
--  [WHERE 검색조건];
-- ------------------------------------------------------

-- ------------------------------------------------------
-- (**주의**) Oracle Extension 을 통해, ANSI Natural Join을
-- 사용하는 경우, FROM절과 SELECT절에 테이블 별칭(Table Alias)을
-- 사용하지 않으면, 무조건 아래의 오류발생:
--
--  ORA-00942: table or view does not exist
--
-- 따라서, VSC에서 ANSI Natural JOIN 구문 사용시, 
-- 테이블 별칭을 부여해서 수행해야 됨. 
--
-- ANSI Natural JOIN은 Oracle SQL*Developer 에서 수행할 것을 추천함.
-- ------------------------------------------------------

-- ------------------------------------------------------
-- 1. Oracle Equal Join
-- ------------------------------------------------------
SELECT
    last_name,
    department_name
FROM
    employees,
    departments
WHERE
    employees.department_id = departments.department_id;
    -- employees.department_id = departments.department_id
    -- AND employees.manager_id = departments.manager_id;

-- ------------------------------------------------------
-- 2. ANSI Natural Join in the Visual Source Code with Oracle Extension
-- ------------------------------------------------------
DESC employees;
DESC departments;

-- ANSI JOIN 수행시, 
-- FROM절과 SELECT절에 테이블 별칭(Table Alis)를 사용하지 않는 경우:
-- ORA-00942: table or view does not exist (Oracle Extension Bugs)
SELECT
    last_name,
    department_name
FROM 
    employees NATURAL JOIN departments;

    
-- ANSI JOIN 수행시, 
-- SELECT절에 테이블 별칭(Table Alis)를 사용하지 않는 경우:
-- ORA-00942: table or view does not exist (Oracle Extension Bugs)
SELECT
    last_name,
    department_name
FROM
    employees t1 NATURAL JOIN departments t2;


-- SELECT 절에, 두 테이블의 공통컬럼 나열시, 테이블명.공통컬럼 형식으로
-- 나열하면, 아래와 같은 오류발생:
--
-- ORA-00904: "EMPLOYEES"."LASTNAME": 부적합한 식별자
SELECT
    employees.last_name,
    department_name
FROM
    employees t1 NATURAL JOIN departments t2;


-- ANSI JOIN 수행시, 
-- FROM절과 SELECT절에 테이블 별칭(Table Alis)를 사용하는 경우
SELECT
    t1.last_name,
    t2.department_name
FROM
    -- Common Columns: manager_id, department_id    -> 엉뚱한 결과 도출
    employees t1 NATURAL JOIN departments t2;


-- ANSI JOIN 수행시, 
-- FROM절과 SELECT절에 테이블 별칭(Table Alis)를 사용하는 경우
SELECT
    t1.last_name,
    t2.department_name,

    -- ORA-00942: table or view does not exist
    manager_id              -- 두 테이블의 공통컬럼 기재

    -- ORA-25155: column used in NATURAL join cannot have qualifier
    -- t2.manager_id              -- 두 테이블의 공통컬럼 기재
FROM
    -- Common Columns: manager_id, department_id    -> 엉뚱한 결과 도출
    employees t1 NATURAL JOIN departments t2;
-- ------------------------------------------------------

-- ------------------------------------------------------
-- 3. ANSI Natural Join in the Oracle SQL*Developer
-- ------------------------------------------------------
SELECT
    last_name,
    department_name,
    department_id,      -- Common column1
    manager_id          -- Common column2
FROM
    -- Common Columns: manager_id, department_id    -> 엉뚱한 결과 도출
    employees NATURAL JOIN departments;


SELECT
    last_name,
    department_name,
    department_id,      -- Common column1
    manager_id          -- Common column2
FROM
    -- Common Columns: manager_id, department_id    -> 엉뚱한 결과 도출
    employees t1 NATURAL JOIN departments t2;


SELECT
    t1.last_name,
    t2.department_name,
    department_id,      -- Common column1
    manager_id          -- Common column2
FROM
    -- Common Columns: manager_id, department_id    -> 엉뚱한 결과 도출
    employees t1 NATURAL JOIN departments t2;


-- ORA-25155: NATURAL 조인에 사용된 열은 식별자를 가질 수 없음
SELECT
    t1.last_name,
    t2.department_name,
    t1.department_id,      -- Common column1
    t2.manager_id          -- Common column2
FROM
    employees t1 NATURAL JOIN departments t2;


SELECT
    last_name,
    department_name,
    department_id
FROM
    employees t1 NATURAL JOIN departments t2    -- 조인조건
WHERE
    department_id = 90;                         -- 검색조건

-- ------------------------------------------------------
-- C. USING(column) or ON <Join Condition>
-- ------------------------------------------------------
-- The same as Oracle Equal Join
-- with explicit columns manually determined.
-- ------------------------------------------------------
-- 가. Natural Join 에서 발생했엇던, 두 개 이상의 공통컬럼에 의해
--    발생가능한 엉뚱한 결과를 예방하기 위해, 명시적으로 조인할 컬럼
--    을 지정하는 방식의 조인
-- 나. Natural Join 과 마찬가지로, 두 테이블의 공통컬럼을 SELECT
--    절에 나열시, 테이블 별칭(Table Alis)이나 테이블명을 앞에
--    붙이는 경우, 오류발생
-- 다. USING(Common Columns):
--    반드시 공통컬럼 값이 일치하는 동등조인(Equal Join) 형식으로
--    실행된다.
-- 라. ON <Join condition>:
--    Non-equal Join 이나, 임의의 조건으로 Join 할 경우에 사용  --> 조건을 쓸 때 사용 !!
-- ------------------------------------------------------
-- Basic Syntax1) USING(Common Columns): ---> USING 사용!!
--  FROM절에, [INNER] JOIN / USING 키워드 사용
--
--  SELECT 테이블1.컬럼 , 테이블2.컬럼
--  FROM 테이블1 [INNER] JOIN 테이블2 USING(공통컬럼)
--  [WHERE 검색조건]; 
-- ------------------------------------------------------
-- Basic Syntax2) ON <Join condition>: ---> ON 절 사용 !!
--  FROM절에, [INNER] JOIN / ON 키워드 사용
--
--  SELECT 테이블1.컬럼 , 테이블2.컬럼
--  FROM 테이블1 [INNER] JOIN 테이블2 ON 조인조건
--  [WHERE 검색조건];
-- ------------------------------------------------------

-- ------------------------------------------------------
-- 1. USING(Common Column1, Common Column1, ..)
-- ------------------------------------------------------
-- 반드시 공통컬럼값이 일치하는 동등조인(Equal Join) 형식으로 실행
-- ------------------------------------------------------
SELECT
    last_name,
    -- t1.last_name,

    department_name,
    -- t2.department_name,
    
    department_id           -- OK: 공통컬럼

    -- ORA-00904: "DEPARTMENTS"."DEPARTMENT_ID": invalid identifier
    -- departments.department_id           -- X: 공통컬럼

    -- ORA-25154: column part of USING clause cannot have qualifier
    -- t2.department_id           -- X: 공통컬럼
FROM
    employees t1 JOIN departments t2
    -- employees t1 INNER JOIN departments t2
    USING(department_id);


SELECT
    last_name,
    department_name,
    department_id,          -- 공통컬럼
    manager_id              -- 공통컬럼
FROM
    employees t1 JOIN departments t2
    -- employees t1 INNER JOIN departments t2
    USING(department_id, manager_id) --> 
WHERE
    department_id = 90;  -- 검색조건

    -- ORA-25154: column part of USING clause cannot have qualifier
    -- t2.department_id = 90;  -- 검색조건

-- ------------------------------------------------------
-- 2. ON <Join Condition> ------------------->>USING 절보다는 ON 절 사용 !
-- ------------------------------------------------------
-- Non-equal Join 이나, 임의의 조건으로 Join 할 경우에 사용 
-- ------------------------------------------------------
SELECT
    last_name,
    department_name,
    t1.department_id            -- OK : 공동컬럼
FROM
    employees t1 JOIN departments t2
    -- 명시적으로 조인조건 지정
    ON t1.department_id = t2.department_id;
    
-- WHERE 절을 이용한 검색조건 추가
SELECT 
    last_name,
    department_name,
    t1.department_id
FROM
    employees t1 INNER JOIN departments t2
    ON t1.department_id = t2.department_id                   -- 조인조건
WHERE
    t1.department_id = 90;                                   -- 검색조건

-- ON 절에 검색조건 추가  -------------> 조인, 검색 조건을 분리하는 ANSI 조건을 무시하고 이렇게 합쳐버린거.. 가독성 저하 쓰지말길!
SELECT 
    last_name,
    department_name,
    t1.department_id
FROM
    employees t1 INNER JOIN departments t2
    ON t1.department_id = t2.department_id              -- 조인조건
    AND t.department_id = 90;                           -- 검색조건 (가독성저하)           

-- ON절을 이용한, Self Join
SELECT
    e.last_name AS 사원명,
    m.last_name AS 관리자
FROM 
    employees e INNER JOIN employees m
    ON e.manager_id = m.employee_id;

-- ANSI Join 에서도, 2개 이상의 테이블 조인 가능.
-- ON 절을 추가로 사용하여, 여러 테이블 조인 수행
-- 3개의 테이블 조인
SELECT
    e.last_name AS 사원명,
    d.department_name AS 부서명,
    g.grade_level AS 등급
FROM
    employees e INNER JOIN departments d
        ON e.department_id = d.department_id
    INNER JOIN job_grades g ------------> INNER JOIN 하나 더 추가.
        ON e.salary BETWEEN g.lowest_sal AND g.highest_sal; --> 이건 Non equal 조건 사용중..

-- ------------------------------------------------------
-- E. { LEFT | RIGHT | FULL } OUTER JOIN
-- ------------------------------------------------------
-- The same as Oracle Outer Join.
--
-- 가. Oracle Outer Join에서는, (+) 연산자 사용
--     반드시, 한 쪽 테이블에서만 사용가능
-- 나. ANSI Outer Join에서는, LEFT / RIGHT / FULL 키워드 사용
--     어느 한 쪽 테이블 또는 양 쪽 테이블에서 모두 사용가능
-- 다. LEFT OUTER JOIN :
--      LEFT로 지정된 테이블1의 데이터를, 테이블2의 조인조건의
--      일치여부와 상관없이 모두 출력
-- 라. RIGHT OUTER JOIN :  ----------------------------> 왼쪽에 매칭되는 사원정보가 없어도 오른쪽 관리자 정보를 살리겠다.
--      RIGHT로 지정된 테이블2의 데이터를, 테이블1의 조인조건의
--      일치여부와 상관없이 모두 출력
-- 마. FULL OUTER JOIN :  -----------------------------> 양쪽 다 살리겠다.
--      LEFT OUTER JOIN + RIGHT OUTER JOIN
--      양쪽 테이블의 데이터를, 조인조건 일치여부와 상관없이 모두 출력 
-- 바. Oracle Outer Join 보다 향상
-- 사. 조인조건 명시할 때, ON절 또는 USING절 사용가능
-- ------------------------------------------------------
-- Basic Syntax)
--
--  SELECT 테이블1.컬럼 , 테이블2.컬럼
--  FROM 테이블1 { LEFT|RIGHT|FULL } OUTER JOIN 테이블2
--  ON 조인조건 | USING(컬럼)
--  [WHERE 검색조건];
-- ------------------------------------------------------
SELECT 
    e.last_name AS 사원명,
    m.last_name AS 관리자명
FROM
    -- employees e LEFT OUTER JOIN employees m
    employees e RIGHT OUTER JOIN employees m --> 오른쪽을 살리기로 했으니까, 왼쪽이 NULL 값 이어도 나타남 ??
    -- employees e FULL OUTER JOIN employees m
    ON e.manager_id = m.employee_id;