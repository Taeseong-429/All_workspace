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
-- 1. Oracle Join  
-- ------------------------------------------------------
--  가. Oracle에서만 사용되는 조인
--  나. 특징: 여러 테이블을 연결하는 조인조건을 WHERE절에 명시 --> WHERE 절에 나열..
-- ------------------------------------------------------
--  a. Catesian Product (카테시안 프로덕트)
--  b. Equal(= Equi) Join (동등 조인)
--  c. Non-equal(= Non-equi) Join (비동등 조인)
--  d. Self Join (셀프 조인)
--  e. Outer Join (외부 조인)
-- ------------------------------------------------------
-- * Please refer to page 4.
-- ------------------------------------------------------

-- ------------------------------------------------------
-- A. Catesian Product (카테시안 프로덕트) --> 그냥 연결시키는 것이기 때문에 그렇게 큰 의미는 없음.
-- ------------------------------------------------------
-- 두 개 이상의 테이블을 공통컬럼없이 연결하는 조인으로,
-- 모든 조인에서 가장 먼저 발생하는 조인이자 기본이 됨.
--  가. 유효한 데이터로 사용되지 못함.
--  나. 조인조건이 생략된 경우에 발생.
--
-- * 조인결과: 테이블1 x ... x 테이블n 개의 레코드 생성
-- ------------------------------------------------------
-- Basic Syntax)
--  SELECT 테이블1.컬럼 , 테이블2.컬럼
--  FROM 테이블1, 테이블2 --> FROM절을 먼저 보는게 좋음.
-- ------------------------------------------------------
SELECT count(*) FROM employees;      -- (*)은 집계함수. --> 행의 갯수를 세라.
SELECT count(*) FROM departments;

SELECT
    count(*)
FROM    
    employees,
    departments;  --- 107 X 27 = 2889 --> 잠시 생겼다가 쓰지 않으면 사라짐.

SELECT
    last_name,
    department_name
FROM
    employees,
    departments;

-- ------------------------------------------------------
-- B. Equal(= Equi) Join (동등 조인)
-- ------------------------------------------------------
-- 가. 가장 많이 사용하는 조인
-- 나. 두 테이블에서, 공통으로 존재하는 컬럼의 값이 일치하는 행들을
--     연결하여 데이터를 반환.
--     일치하지 않는 데이터는 제외됨.
-- 다. 대부분, 기본키(PK)를 가진 테이블(Parent, Master)과
--     참조키(FK)를 가진 테이블(Child, Slave)을 조인할 때 사용
-- ------------------------------------------------------
-- Basic Syntax)
--  SELECT 테이블1.컬럼 , 테이블2.컬럼
--  FROM 테이블1, 테이블2
--  WHERE 테이블1.공통컬럼 = 테이블2.공통컬럼; --> 테이블1의 A라는 컬럼, 테이블2 의 A 컬럼이 있다면, 이게 연결시킬 조건이 됨. 동등비교 사용.
-- > 사원테이블에 있는 부서번호와, 부서 테이블에 있는 부서번호가 일치하면~ 사용하겠다.
-- ------------------------------------------------------
DESC employees;
DESC departments;

SELECT 
    last_name,
    department_name

FROM
    employees,
    departments
WHERE
    employees.department_id = departments.department_id;

-- ------------------------------------------------------
-- 공통컬럼 사용시, 모호성 제거
-- ------------------------------------------------------
-- ORA-00918: column ambiguously defined
SELECT 
    last_name,
    department_name,
    department_id --> 두 테이블에 공통으로 존재하는 컬럼임. 어느쪽에 있는걸 출력하라는지 모호하다는 오류 뜸.
FROM
    employees,
    departments
WHERE
    employees.department_id = departments.department_id;

SELECT 
    last_name,
    department_name,
    employees.department_id --> 모호하게 정의X. 테이블.컬럼명 이렇게 작성하면 됨.
FROM
    employees,
    departments
WHERE
    employees.department_id = departments.department_id;

SELECT 
    last_name,
    department_name,
    employees.department_id, --> 모호하게 정의X. 테이블.컬럼명 이렇게 작성하면 됨.
    departments.department_id --> 비쥬얼 말고 오라클 developer에서 하면 잘 나옴.
FROM
    employees,
    departments
WHERE
    employees.department_id = departments.department_id;   

-- ------------------------------------------------------
-- 테이블에 별칭 사용
-- ------------------------------------------------------
-- 가. SELECT 절에서, 컬럼 별칭(Column Alias)을 사용했듯이,
--     FROM 절에서도, 테이블 별칭(Table Alias)을 사용가능하다.
-- 나. 테이블명이 길거나, 식별이 힘든 경우에 유용하다.
-- 다. (*주의*) 테이블 별칭을 지정한 경우에는, 반드시 이 별칭을
--     사용하여, 컬럼을 참조해야 한다.
--     만일, 테이블 별칭을 사용하지 않고, 테이블명으로 컬럼을
--     참조하면, 테이블명을 별칭(Alias)으로 인식하기 때문에,
--     오류 발생.
-- ------------------------------------------------------
-- Basic Syntax)
--      SELECT alias1.컬럼 , alias2.컬럼
--      FROM 테이블1 alias1, 테이블2 alias2 --> 컬럼 지정할 때 AS 키워드 사용하지말자.
--      WHERE alias1.공통컬럼 = alias2.공통컬럼;
-- ------------------------------------------------------

-- 테이블 별칭(alias) 사용 
SELECT
    emp.last_name, --> 별칭 사용 . 이것도 소속이 명확한 컬럼이지만, 소속 테이블 이름 붙여줘도 됨.
    department_name,  --> 이 컬럼은 departments 테이블에 있는게 명확하기 때문에 별칭을 붙여줄 필요 없음.
    emp.department_id --> 별칭 사용
FROM
    employees emp, --> emp로 별칭.
    departments dept --> deps로 별칭.
WHERE   
    emp.department_id = dept.department_id; --> 별칭 사용.

-- 테이블 별칭(alias) 사용시 주의할 점
-- ORA-00904: "EMPLOYEES"."DEPARTMENT_ID": invalid identifier
SELECT
    emp.last_name,
    department_name,
    emp.department_id
FROM
    employees emp,
    departments dept
WHERE
    employees.department_id = dept.department_id; --> 별칭을 지정해놓고 사용하지 않았기 때문에 오류 뜸.(employees)

-- ------------------------------------------------------
-- 검색조건 추가
-- ------------------------------------------------------
-- 가. Oracle 조인에서는, WHERE절에 AND / OR 연산자를 사용하여
--     조인조건에 검색조건을 추가할 수 있다.
-- 나. 이로인해, WHERE의 어떤 조건이 조인조건이고, 어떤 조건이
--     검색조건인지, 쉽게 파악이 안되어, 가독성이 떨어짐
-- 다. (*주의*) 따라서, 조인조건을 우선 명시하고, 나중에 검색조건
--     을 명시하는 방법으로, 가독성을 향상 시켜야 한다.
-- 라. 결과: 조인조건의 결과 중에서, 검색조건으로 필터링 된 결과
--          를 반환
-- ------------------------------------------------------
SELECT 
    emp.last_name,
    salary,
    department_name
FROM
    employees emp,
    departments dept
WHERE
    emp.department_id = dept.department_id                  -- 조인조건
    AND last_name = 'Whalen';                               -- 검색조건
    ---> 이렇게 실무에서는 관례상 조인조건을 먼저 써주는 듯 ! , 조건 순서 바꿔도 결과값은 바꾸지 않음.. 비쥬얼소스코드에서는 잘못나옴.

SELECT
    t2.department_name AS 부서명,
    count(t1.employee_id) AS 인원수  --> 2005년을 포함한 이전 연도에 입사한 부서별 인원수 !
FROM
    employees t1, --> 실무에선 t1, t2 이런식으로 별칭 지정
    departments t2
WHERE
    t1.department_id = t2.department_id                       -- 조인조건
    AND to_char( hire_date, 'YYYY')  <= 2005  --> 채용연도가 2005년 이하인 사람들. -- 검색조건
GROUP BY
    t2.department_name; --> 부서 번호가 아닌 부서명으로 검색하기 때문에 조인 사용했음. 

-- ------------------------------------------------------
-- C. Non-equal(= Non-equi) Join (비동등 조인)
-- ------------------------------------------------------
-- 가. WHERE절에 조인조건을 지정할 때, 동등연산자(=) 이외의,
--     비교 연산자(>,<,>=,<=,!=)를 사용하는 조인
-- ------------------------------------------------------
-- * Please refer to the chapter 05, page 13.
-- ------------------------------------------------------
CREATE TABLE job_grades (
    grade_level VARCHAR2(3) -- 월급여등급
        CONSTRAINT job_gra_level_pk PRIMARY KEY,
    lowest_sal NUMBER,      -- 최소 월급여
    highest_sal NUMBER      -- 최대 월급여
);

INSERT INTO job_grades VALUES('A', 1000, 2999); ---> 이 범위는 등급을 A라 하자.
INSERT INTO job_grades VALUES('B', 3000, 5999);
INSERT INTO job_grades VALUES('C', 6000, 9999);
INSERT INTO job_grades VALUES('D', 10000, 14999);
INSERT INTO job_grades VALUES('E', 15000, 24999);
INSERT INTO job_grades VALUES('F', 25000, 40000);

COMMIT;

DESC job_grades;

SELECT FROM job_grades,

-- 2개의 테이블 조인
SELECT
    last_name,
    salary,
    grade_level
FROM
    employees e, --> 사원의 월급이 grade 테이블의 최대 월급과 최소 월급사이에 있으면 출력.
    job_grades g
WHERE
    e.salary BETWEEN g.lowest_sal AND g.highest_sal ;

-- 3개의 테이블 조인
SELECT
    last_name,
    salary,
    department_name,
    grade_level
FROM
    employees e, --> 자식테이블
    departments d, --> 부모테이블  --> emp와 dep는 공통 컬럼으로 이어줄 수있음. department_id,, 근데 job는 공통컬럼있는거 없음.
                                  --> 공통컬럼 없다고 조인할 수 없는건 아님. 아래처럼 Non-equal 조인 사용하면 됨.
    job_grades g --> 부모테이블 
WHERE
    e.department_id = d.department_id                       -- Equal Join
    AND e.salary BETWEEN g.lowest_sal AND g.highest_sal;    -- Non-equal Join


-- ------------------------------------------------------
-- D. Self Join (셀프 조인)
-- ------------------------------------------------------
-- 하나의 테이블만 사용하여, 자기자신을 조인할 수도 있는데, 이를
-- Self Join 이라고 한다.
--  가. FROM 절에 같은 테이블을 사용해야 함
--  나. 따라서, 반드시 테이블 별칭을 사용해야 함
--  다. 테이블 하나를, 두 개 이상으로 Self 조인가능
--  라. 하나의 테이블을, 마치 여러 테이블을 사용하는 것처럼,
--      테이블 별칭을 사용하여, 조인하는 방법을 의미
-- ------------------------------------------------------

-- 1) 사원이름과 담당관리자 사원번호를 필요로 하는 경우 --> 각 사원의 관리자 역할을 하는 사원.
SELECT last_name, manager_id
FROM employees;

-- 2) 사원이름과 담당관리자 이름을 필요로 하는 경우
--    불가능
-- 
--    But, 사원테이블과 사원테이블과 동일한 구조의 담당관리자
--    테이블이 있다고 가정한다면? 
--    : 두 테이블 조인을 통해, 원하는 데이터의 조회가능
--      실제 존재하지 않는 관리자 테이블 생성은, 테이블 별칭(alias)
--      을 사용하여, 가상의 관리자 테이블을 생성하면 됨. (***)
SELECT 
    employee_id, 
    last_name, 
    manager_id
FROM employees e
WHERE last_name = 'Whalen' --> 웰런 직원의 사원번호 추출. 관리자 사원번호 추출.
-- ORDER BY 2 ASC;

SELECT employee_id, last_name
FROM employees e
WHERE employee_id = 101 --> 첫번째 쿼리를 통해 웰런 직원의 사원번호 추출. 여기서 이름 추출
-- ORDER BY 1 ASC;

-- self 조인을 위한 가상 테이블 생성
SELECT
    e.employee_id AS 사원번호,
    e.manager_id AS 관리자번호,
    e.last_name AS 사원명,
    m.last_name AS 관리자명
FROM
    employees e,        -- 사원 정보
    employees m         -- 관리자 정보(가상)
WHERE
    -- Mentee 테이블은, Mentor 테이블의 PK와
    -- Mentor 테이블은, 자신의 PK 컬럼을 지정
    e.manager_id = m.employee_id;
    -- e.employee_id = m.employee_id; --> 이름만 같다고 공통이 아니다.

-- ------------------------------------------------------
-- E. Outer Join (외부 조인) == Inner Join + alpha
--   * alpha : 조인조건을 만족하지 못해서, 탈락시켰던 행들도 
--             함께 추출하겠다.
-- ------------------------------------------------------
-- Join 조건에 부합하지 않아도, 결과값에 누락된 데이터를 포함시키
-- 는 방법:
--  가. Inner Join (Equal, Non-Equal, Self Join):
--      조인결과는 반드시, 조인조건을 만족하는 데이터만 포함하는 조인
--  나. (+) 연산자를 사용한다.
--  다. (+) 연산자는, 조인대상 테이블들 중에서, 한번만 사용가능
--  라. (+) 연산자는, 일치하는 데이터가 없는 쪽에 지정
--  마. (+) 연산자의 지정:
--      내부적으로, 한 개 이상의 NULL 가진 행이 생성되고,
--      이렇게 생성된 NULL 행들과 데이터를 가진 테이블들의 행들
--      이 조인하게 되어, 조건이 부합하지 않아도, 결과값에 포함됨
-- ------------------------------------------------------
-- Basic Syntax)
--
--  SELECT 테이블1.컬럼 , 테이블2.컬럼
--  FROM 테이블1 , 테이블2
--  WHERE 테이블1.공통컬럼 = 테이블2.공통컬럼 (+);
-- ------------------------------------------------------
-- * Please refer to the chapter 05, page 19.
-- ------------------------------------------------------
SELECT
    e.employee_id AS 사원번호,
    e.last_name AS 사원명,
    e.manager_id AS 관리자번호,
    m.last_name AS 관리자명
FROM
    employees e,        -- 사원 정보
    employees m         -- 관리자 정보(가상)
WHERE
    e.manager_id = m.employee_id;

SELECT
    e.last_name AS 사원명,
    m.last_name AS 관리자명
FROM
    employees e,        -- 사원 정보
    employees m         -- 관리자 정보(가상)
WHERE
    e.manager_id = m.employee_id (+)
    AND e.last_name = 'King';

-- ------------------------------------------------------ 여긴 나중에!

SELECT
    e.last_name AS 사원명,
    m.last_name AS 관리자명,
    mm.last_name AS "관리자의 관리자명"
FROM
    employees e,
    employees m,
    employees mm
WHERE
    e.manager_id = m.employee_id
    AND m.manager_id = mm.employee_id;


SELECT
    e.last_name AS 사원명,
    m.last_name AS 관리자명,
    mm.last_name AS "관리자의 관리자명"
FROM
    employees e,
    employees m,
    employees mm
WHERE
    -- 사원 중에서, 관리자가 없는 사원까지 포함
    e.manager_id = m.employee_id (+)
    -- 관리자 중에서, 관리자가 없는 관리자까지 포함
    AND m.manager_id = mm.employee_id (+);
