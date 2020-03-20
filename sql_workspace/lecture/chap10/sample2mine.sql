-- sample2mine.sql


-- ------------------------------------------------------
-- 1. Index 생성
-- ------------------------------------------------------
--  가. 빠른 데이터 검색을 위해 존재하는 오라클 객체
--  나. 명시적으로 생성하지 않아도, 자동 생성되기도 함
--      (PK/UK 제약조건 생성시, Unique Index 자동생성)
--  다. PK/UK 제약조건에 따른, 자동생성 Unique Index:
--      a. 데이터 무결성을 확인하기 위해, 수시로 데이터 검색 필요
--      b. 따라서, 빠른 검색이 요구됨
--  라. 명시적인 인덱스 생성이 우리가 할 일!!!
-- ------------------------------------------------------
-- Basic syntax:
--
--  CREATE [UNIQUE] INDEX 인덱스명
--  ON 테이블(컬럼1[, 컬럼2, ...]);
--
--
--  (1) Unique Index
--      a. CREATE UNIQUE INDEX 문으로 생성한 인덱스
--      b. Index 내의 Key Columns에 중복값 허용하지 않음
--      c. 성능이 가장 좋은 인덱스
--      d. (*주의*) 중복값이 허용되는 테이블 컬럼에는 절대로 사용불가!!
--
--  (2) Non-unique Index
--      a. CREATE INDEX 문으로 생성한 인덱스
--      b. 중복값이 허용되는 테이블 컬럼에 대해,
--         일반적으로 생성하는 인덱스
-- ------------------------------------------------------

-- Index 없이, Table Full Scan 방식을 통한, 데이터 조회 
--> 순차접근..테이블이 클수록 DISK I/O 늘어남. 부하커짐.
--> 해결책 : 1. ?? 못적음. 2. 찾아낸 행의 주소..(ROWID) : 해당 행의 모든 값을 가지고 있는 ROWID
--> Index Scan 이라 함.
SELECT *
FROM emp
WHERE ename = 'WARD';

-- 특정 쿼리의 실행계획(Execute Plan) 보기 
-- (반드시, Oracle SQL*Developer에서 수행)

-- DQL 문장에 대해, 실행계획 생성
EXPLAIN PLAN
    SET statement_id = 'ex_plan2' --> 아무 이름이나 상관없음. 임의적으로 지정하는 것임~
    INTO plan_table
FOR --> 우리가 실행시킬 문장 나열. 이 실행된 문장을 바로 윗줄 INTO 다음에 나오는 테이블에 넣어라.(실행계획)
    SELECT * 
    FROM emp
    WHERE ename = 'WARD'; --> Oracle Developer에서 실행.


-- Index 생성하여, Index Scan 방식을 통한 데이터 조회
DROP INDEX emp_ename_idx;

CREATE INDEX emp_ename_idx --> 이 컬럼값도 생성?
ON emp(ename); --emp 테이블의 단일컬럼인 ename에서 생성.

-- DESC emp_ename_idx; -- XX --> 테이블과 뷰만 DESC 가능

-- 생성된 실행계획 정보 출력
DESC plan_table;            -- 실행계획 저장 테이블 스키마 보기

SELECT *
FROM plan_table;            -- 실행계획 테이블 모두 조회

-- 실행계획보기 방법#1
SELECT * 
FROM table( DBMS_XPLAN.display() );

-- 실행계획보기 방법#2
SELECT plan_table_output
FROM table( DBMS_XPLAN.display() );

-- 실행계획보기 방법#3 --> 이게 가장 좋다고 했는데 이유는? 보고싶어 하는 문장에 대한 실행 Plan을 볼 수 있어서.
SELECT plan_table_output
  FROM table( DBMS_XPLAN.display(NULL,'ex_plan2', 'BASIC') );

-- 실행계획보기 방법#4 --> 그냥 외운채로 복사해서 쓰면 됨.
SELECT cardinality "Rows",
   lpad(' ', level-1)||operation||' '||options||' '||object_name "Plan"
FROM plan_table
CONNECT BY
    prior id = parent_id
    AND prior statement_id = statement_id
START WITH id = 0
    AND statement_id = 'ex_plan2' --> 내가 지정한 실행문장에 대한 이름만 지정해주면 됨. SQL Developer에서 하도록.
ORDER BY
    id;