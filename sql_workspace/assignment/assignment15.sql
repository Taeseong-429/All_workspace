-- 모든 사원(emp 테이블)의 평균급여를 구하는 함수 구현  및 사용
--  * 반환값: 모든 사원의 평균급여(소숫점 2자리에서, 반올림)

SELECT round(avg(sal),2)
FROM emp;

CREATE OR REPLACE FUNCTION avg_sal (
    p_value1 NUMBER,       
    p_value2 NUMBER         
)
RETURN NUMBER              

IS
    

BEGIN       

    RETURN p_value1 / p_value2

END;  

select sum(sal),count(empno))

-- 과제2. 원의 면적을 구하는 함수 구현 및 사용

--  * 공식(Formula) = 원주율(파이) * 반지름(radius)의 제곱

--  반환값 = 원의 면적(The Circle Area)
select acos(-1)
from dual;


CREATE OR REPLACE FUNCTION cir_spc (radius NUMBER)
RETURN NUMBER              

IS
    
BEGIN      

    RETURN round((acos(-1) * power(radius, 2)),3);
    -- (acos(-1) * power(radius, 2))

END;    

SELECT cir_spc(2)
FROM dual;


-- 과제3. 동굴에서 탈출하기 함수 구현

-- (1) 동굴의 깊이: 100 미터
-- (2) 하루에 올라갈 수 있는 높이: 12미터
-- (3) 잠자는 동안 미끄러지는 높이: 7미터
-- (4) 반환값: 과연 몇일만에 동굴을 탈출할 수 있는가

/* **************************************************** */
CREATE OR REPLACE FUNCTION escapeFromCave (
    height NUMBER, 
    up NUMBER,        
    down NUMBER
)
RETURN NUMBER              

IS
    cday number := 0;
    cheight NUMBER := 0;

BEGIN     
    LOOP
        DBMS_OUTPUT.PUT_LINE('---------------------------------------');
        DBMS_OUTPUT.PUT_LINE(cday || '일 째');
        
        cheight := cheight + up;
        DBMS_OUTPUT.PUT_LINE('현재 높이 : ' || cheight || 'm');

        EXIT WHEN cheight > height;
        
        cheight := cheight - down;
        DBMS_OUTPUT.PUT_LINE('최종 높이: '||cheight || 'm');
        
        cday := cday + 1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(cday || '일 째 탈출 성공');

    RETURN cday;
END;
/* **************************************************** */

SET SERVEROUTPUT ON

VAR elapsedDays NUMBER; 
EXECUTE :elapsedDays := escapeFromCave(100, 12, 7);
PRINT elapsedDays;

/* **************************************************** */

---------------------------------------------------------


DECLARE 
    height NUMBER := 100;
    up NUMBER := 12;        
    down NUMBER := 7;
           
    cday number := 0;
    cheight NUMBER := 0;
BEGIN     
    LOOP
        cheight := cheight + 5;
        
        DBMS_OUTPUT.PUT_LINE(cday || '일 째');
        DBMS_OUTPUT.PUT_LINE(up || 'm 만큼 올라가고 ' || down || 'm 만큼 내려갔습니다');
        DBMS_OUTPUT.PUT_LINE('현재 높이 : ' || (up + down) || 'm');
        cday := cday + 1;

        EXIT WHEN cheight > height;
    
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(cday || '일 째 탈출 성공');


END;

-----------------------------------------------------------

CREATE OR REPLACE PROCEDURE cave_2

IS
    height NUMBER := 100;  
    up NUMBER := 12;     
    down NUMBER := 5;
    cday number := 0;
    cheight NUMBER := 0;
BEGIN     
    LOOP
        cheight := cheight + 5;
        
        DBMS_OUTPUT.PUT_LINE(cday || '일 째');
        DBMS_OUTPUT.PUT_LINE(up || 'm 만큼 올라가고 ' || down || 'm 만큼 내려갔습니다');
        DBMS_OUTPUT.PUT_LINE('현재 높이 : ' || (up + down) || 'm');
        cday := cday + 1;

        EXIT WHEN cheight > height;
    
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(cday || '일 째 탈출 성공');

END;

SET SERVEROUTPUT ON;

EXEC cave_2;




-- 과제4. 계좌이체 함수 구현
-- (1) 계좌 테이블 생성
-- (2) 계좌 이체 로직 구현
-- (3) 반환값: 성공여부 또는 성공이체금액


-- 과제5. 소수 구하기



-- =================================================================================
-- SQL_assignment4.sql

--1) 모든 사원(emp 테이블)의 평균급여를 구하는 함수 구현  및 사용
-- * 반환값: 모든 사원의 평균급여(소숫점 2자리에서, 반올림)

CREATE OR REPLACE FUNCTION avg_sal
RETURN NUMBER
IS
a_sal emp.sal%type;
PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    -- DBMS_OUTPUT.put_line('avg_sal: ');
    SELECT avg(sal) INTO a_sal
    FROM emp;
    RETURN a_sal;
    
END;

SELECT avg_sal
FROM dual;


--2) 원의 면적을 구하는 함수 구현 및 사용

-- * 공식(Formula) = 원주율(파이) * 반지름(radius)의 제곱

-- 반환값 = 원의 면적(The Circle Area)

CREATE OR REPLACE FUNCTION circle_Area(p_radius NUMBER)
RETURN NUMBER
IS
PI CONSTANT NUMBER := 3.14159;
BEGIN
    RETURN PI * power(p_radius,2);
END;

select circle_Area(3)
from dual;

--3) 동굴에서 탈출하기 함수 구현

--    (1) 동굴의 깊이: 100 미터
--    (2) 하루에 올라갈 수 있는 높이: 12미터
--    (3) 잠자는 동안 미끄러지는 높이: 7미터
--    (4) 반환값: 과연 몇일만에 동굴을 탈출할 수 있을까? 

CREATE OR REPLACE FUNCTION escape_cave(height NUMBER,
                                       climb NUMBER,
                                       slide NUMBER)
RETURN NUMBER

IS
now_height NUMBER := 0;
count_day NUMBER := 0;

BEGIN 
    WHILE now_height < 100 LOOP
        now_height := now_height + climb;
        IF now_height > 100 THEN
            RETURN count_day;
        END IF;
        now_height := now_height -slide;
        count_day := count_day + 1;
        DBMS_OUTPUT.put_line('올라간 높이' || climb);
        DBMS_OUTPUT.put_line('미끄러진 높이 :' || slide);
        DBMS_OUTPUT.put_line('now_height :' || now_height);
        DBMS_OUTPUT.put_line('지나간 일 수' || count_day);
        
    END LOOP;
    DBMS_OUTPUT.put_line('now_height :' || now_height);
    DBMS_OUTPUT.put_line('지나간 일 수' || count_day);
    RETURN count_day;

END;

select escape_cave(100,12,7) FROM dual;