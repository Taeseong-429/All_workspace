-- sample7.sql


-- ------------------------------------------------------
-- 6-4. 함수(Function)
-- ------------------------------------------------------
--  가. SQL의 함수는, 일반적으로 Oracle 이 제공하는 함수 의미
--  나. PL/SQL에서는, 필요에 의해 생성한, 사용자정의 함수 의미
--  다. 프로시저(Procedure)와의 차이점:
--      a. 프로시저는, IN/OUT/IN OUT 모드에 따라, 동작방식 결정
--      b. 함수는 작업후에, 반드시 결과값 반환(return)
--      c. SQL문에서 표현식의 일부로, 함수 사용가능
-- ------------------------------------------------------
--  Basic syntax: Function_creation_syntax.JPG --> RETURN 데이터타입도 씀.
--
--  a. CREATE FUNCTION 문: 사용자 정의함수 생성
--  b. OR REPLACE 지정: 사용자 정의함수 변경
--                      기존 함수 삭제 후, 다시 생성
--  c. 프로시저와 동일하게, 호출환경에서 함수에 전달할 파라미터
--     사용가능
--  d. RETURN 키워드: 호출환경으로 반환할, 데이터 형 지정
--     PL/SQL block 에서는, 함수의 정해진 작업을 수행하고,
--     반드시 RETURN 키워드를 사용하여 반환값 지정해야 함
--  e. (*주의*) 생성한 함수는, SQL 문에서, 표현식의 일부로 사용
--     SELECT절, WHERE절, HAVING절, UPDATE문, INSERT문 등
-- ------------------------------------------------------

-- ------------------------------------------------------
-- 예제1: 전달된 파라미터를 모두 소문자로 출력하는 함수
-- ------------------------------------------------------

-- 1. 사용자 정의함수 생성
CREATE OR REPLACE FUNCTION mylower (
    p_value VARCHAR2
)
RETURN VARCHAR2 --> 리턴값의 타입을 지정.

IS 
    l_value VARCHAR2(32767) --> 지역변수는 이렇게도 사용할 수 있다 그냥 쓴거.

BEGIN
    l_value := lower(p_value);

    RETURN lower(p_value);

END;

-- 2. 사용자 정의함수 호출
SELECT ename, mylower(ename)
FROM emp;

-- ------------------------------------------------------
-- 예제2: 두 정수의 합을 출력하는 함수
-- ------------------------------------------------------
SET SERVEROUTPUT ON

-- 1. 사용자 정의함수 생성
CREATE OR REPLACE FUNCTION mysum (
    p_value1 NUMBER,
    p_value2 NUMBER
)
RETURN NUMBER

IS
    -- l_AGE NUMBER := 0; -->지역변수 안넣어도 됨

BEGIN
    DBMS_OUTPUT.put_line('- l_AGE: ' || l_AGE);

    RETURN p_value1 + p_value2;
END;

-- 2. 사용자 정의함수 호출
SELECT mysum(10, 20)
FROM dual;

-- ------------------------------------------------------
-- 예제3: 다양한 상수를 함수로 구현
-- ------------------------------------------------------

-- 1. 사용자 정의함수 생성
-- 함수에 매개변수가 하나도 없는 경우, 함수선언과 함수사용 할 때에도, 소괄호() 생략 가능
CREATE OR REPLACE FUNCTION UNDEFINED_INT RETURN NUMBER AS BEGIN RETURN 2147483646; END; 
--> 함수가 상수처럼 쓰일수도있다는 의미!!
CREATE OR REPLACE FUNCTION UNDEFINED_SHORT RETURN NUMBER AS BEGIN RETURN 32766; END;
CREATE OR REPLACE FUNCTION UNDEFINED_LONG RETURN NUMBER AS BEGIN RETURN 223372036854775806; END;
CREATE OR REPLACE FUNCTION UNDEFINED_FLOAT RETURN FLOAT AS BEGIN RETURN .4028233E38; END;

CREATE OR REPLACE FUNCTION UNDEFINED_DOUBLE RETURN BINARY_DOUBLE
AS
BEGIN
    RETURN to_binary_double('1.7976931348623155E308');
END;

CREATE OR REPLACE FUNCTION UNDEFINED_STRING RETURN VARCHAR AS BEGIN RETURN '?'; END;

-- 2. 사용자 정의함수 호출
SELECT
    UNDEFINED_INT,
    UNDEFINED_INT()
FROM dual;  --> 이렇게 할 수 있음.

