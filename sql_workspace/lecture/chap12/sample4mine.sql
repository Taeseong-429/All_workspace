-- sample4mine.sql


-- ------------------------------------------------------
-- 4. Oracle CURSOR
-- ------------------------------------------------------
--  가. Oracle 데이터베이스는, SQL 문장을 실행할 때마다,
--      해당 SQL문장을 분석/실행/결과보관 위한, 
--      특별한 메모리 영역 사용
--  나. 이 메모리 영역을 참조(접근/사용)하는 것이, "커서(Cursor)"
--  다. 커서의 종류 (2가지):
--      (1) 묵시적 커서(Implicit Cursor)
--          하나의 행(1 row)만 반환하는, 단일 행 SELECT 및
--          모든 DML문장에 대해, PL/SQL이 자동으로 선언
--
--      (2) 명시적 커서(Explicit Cursor) - 이게 중요 ?
--          2 개 이상의 행(rows)을 반환하는, 다중 행 SELECT에 
--          대해서, 사용자가 명시적으로 선언
-- ------------------------------------------------------


-- ------------------------------------------------------
-- 4-1. Oracle CURSOR : 묵시적 커서(= SQL커서)
-- ------------------------------------------------------
--  가. 기본으로, PL/SQL에서, 단일행 SELECT문장과 
--      모든 DML 문장이 실행될 때마다, 묵시적 커서가 사용됨
--  나. (*주의*) 여러 행을 반환하는 다중 행 SELECT문장의 경우,
--      묵시적 커서를 사용할 수 없고, 반드시 명시적 커서를
--      사용해야 함
--  다. 사용자는 묵시적 커서 내의 실행결과를 *커서속성*을 통해
--      확인가능
--  라. 묵시적 커서의 속성은 다음과 같다:
--      Implicit_cursor_attrs.JPG
--  마. 묵시적 커서의 정보를 참조할 때는, 항상 SQL로 시작하는
--      속성명을 사용해서 참조하기 때문에, "SQL커서"라고도 한다.
-- ------------------------------------------------------

-- ------------------------------------------------------
-- 예1: DML 문장을 실행시킬 때, 항상 몇건의 데이터가 영향을
--     받았는지를 알려준다.
--     이때, DML 문장의 실행결과에 대한 특별한 값들을,
--     *커서속성*을 통해, 참조가 가능하다.
-- ------------------------------------------------------
CREATE TABLE copy_emp
AS
SELECT *
FROM emp;

SELECT *
FROM copy_emp;

-- copy_emp테이블의 데이터 삭제
-- 6 row(s) affected
DELETE FROM copy_emp; --> 아무리 DML문장이 복잡해도, 돌려주는 문장 1개임.

-- ------------------------------------------------------
-- 예2: 사원번호가 7369인 사원을 검색.
--      검색결과를 SQL%ROWCOUNT 커서속성을 사용하여 출력
-- ------------------------------------------------------
DECLARE
    v_emp emp%ROWTYPE;
BEGIN
    SELECT *
        INTO v_emp
    FROM emp
    WHERE empno = 7499; --> 이렇게 끝난 다음에 커서를 이용한다.
    
    DBMS_OUTPUT.put_line( 
        '** 검색결과(SQL%ROWCOUNT):' || SQL%ROWCOUNT
    );
END;

-- ------------------------------------------------------
-- 예3: copy_emp 테이블 삭제로, 몇개의 행이 삭제되었는지를
--      SQL%ROWCOUNT 커서속성을 통해 출력
-- ------------------------------------------------------
DROP TABLE copy_emp;

CREATE TABLE copy_emp
AS
SELECT *
FROM emp;

SELECT *
FROM copy_emp;

BEGIN
    DELETE FROM copy_emp;
    DBMS_OUTPUT.put_line(
        '** 삭제행수(SQL%ROWCOUNT):' || SQL%ROWCOUNT
    );
END;

-- ------------------------------------------------------
-- 4-2. Oracle CURSOR : 명시적 커서
-- ------------------------------------------------------
--  가. 사용자가 명시적으로 선언하여 사용하는 커서
--  나. 다중 행 SELECT 문에 의해 반환되는 각 행(row)을
--      개별적으로 처리가능
--  다. 다중 행 SELECT 문에 의해 반환되는 행집합(=결과셋)을
--      "활성집합" 이라 한다.(***)
--  라. 이때 커서는 "활성집합"의 현재 위치를 가리킨다.
--      참고: Explicit_cursor_position.JPG
--  마. 주요 특징:
--      a. 질의에 의해 반환된 행을, 첫번째부터 차례대로 처리가능
--      b. 현재 처리중인 행의 추적도 가능
--      c. 개발자가 PL/SQL block에서, 명시적으로 커서의 
--         수동제어가능
--      d. 묵시적 커서와 다르게, 명시적 커서를 여러개 선언가능
--  바. 명시적 커서를 사용하기 위해서는, 
--      아래의 4단계의 처리단계 필요: Explicit_cursor_processes.JPG --> CLOSE가 가장 중요 !!
--      
-- ------------------------------------------------------
--      (1) 커서의 선언(DECLARE)
--          a. 묵시적 커서와 달리, 명시적 커서는, 사용할 커서를 
--             반드시 선언부에 직접 정의해야 함
--          b. 이 단계는, 해당 커서를 사용하겠다는 의도를, PL/SQL에
--             알려주는 역할만 하고, 실제로 메모리 할당이 되지 않음
--          c. 커서 선언방법:
--             - 기본문법: Explicit_cursor_declaration.JPG
--             - CURSOR 키워드 뒤에, 커서명 지정
--             - IS 키워드 뒤에, 데이터 검색 SELECT 문장 기술
--             - 커서 선언에 기술된 SELECT 문장은 INTO 절을 
--               포함하지 않음
--             - 한번에 여러개의 커서를 선언가능: 
--               Explicit_multiple_cursor_declaration.JPG
--
-- ------------------------------------------------------
--      (2) 커서 열기(OPEN)
--          a. 커서 선언뒤, 해당 커서를 사용하기 위해서는, 
--             먼저 커서를 열어야 함
--          b. 커서 선언단계: 실제 커서가 사용할 메모리 크기를 
--             알 수 없음
--          c. 커서가 open 되면, 커서선언 시 기술한, 
--             SELECT문장이 실행되므로, 실행결과를 보고, 
--             실제 메모리가 할당됨
--          d. SELECT 문장의 실행결과집합인 "활성집합"의 
--             첫번째 행에, 커서 포인터(Cursor pointer) 설정됨
--          e. 이후 단계인, FETCH에서 데이터를 읽을 수 있게 됨
--          f. 기본문법: Explicit_cursor_open_syntax.JPG
--
-- ------------------------------------------------------
--      (3) 커서에서 데이터 읽기(FETCH)
--          a. 명시적 커서의 "활성집합"에서, 데이터를 한 행씩 읽어서
--             변수에 저장하기 위해, FETCH 문장 사용
--          b. 다중 행을 읽어야 하기 때문에, LOOP 문 같은, 
--             반복문 사용이 일반적임
--          c. 커서 FETCH 방법은 다음과 같음:
--             Explicit_cursor_fetch.JPG
--          d. (*주의*) 현재 행(row)의 값을 변수에 저장하고, 반드시
--             FETCH의 INTO절에는, SELECT문장과 동일한 개수의 변수가
--             존재해야 됨!!!
--          e. 반복적으로 FETCH 후에, 반복문을 빠져나오기 위해서,
--             "커서명%NOTFOUND" 커서속성을 사용
--          f. 묵시적 커서속성과 다르게, 명시적 커서속성은 
--             "SQL%" 대신에, "커서명%" 형태로 커서속성을 사용(**)
--          
-- ------------------------------------------------------
--      (4) 커서 닫기(CLOSE)
--          a. FETCH 작업이 모두 완료되어 반복문을 빠져나오게 되면,
--             커서사용이 모두 끝났기 때문에, 반드시 커서를
--             닫아주어야 함(*자원해제*)
--          b. open 된 커서를 close 하는 방법은 아래와 같음:
--             Explicit_cursor_close.JPG
--          c. 한번 CLOSE 된 커서에서 데이터 인출 불가능
--          d. 커서를 CLOSE 한다는 의미는, 작업이 끝난 메모리 공간을
--             정리하고 반환한다는 의미(자원관리측면에서 매우 중요)
--          e. 묵시적 커서와 같이, 명시적 커서에서도, 아래와 같은
--             커서속성을 사용가능('SQL%' 대신, "커서명%" 형식사용):
--             Explicit_cursor_attrs.JPG
-- ------------------------------------------------------

-- ------------------------------------------------------
-- 예1: 명시적 커서를 사용하여, DEPT 테이블의 모든 데이터 출력
-- ------------------------------------------------------
DECLARE
    v_deptno    dept.deptno%TYPE;
    v_dname     dept.dname%TYPE;
    v_loc       dept.loc%TYPE;

    CURSOR C1
    IS
        SELECT deptno, dname, loc
        FROM dept;

BEGIN
    OPEN C1;

    LOOP --> 한 개 이상의 행을 반환하는 다중 SELECT문이기 때문에. LOOP로 끝까지 반복.
        FETCH C1 --> 차례대로 반환된 한 행씩 읽어옴.
            INTO v_deptno, v_dname, v_loc;
        EXIT WHEN C1%NOTFOUND;

        DBMS_OUTPUT.put_line(
            C1%ROWCOUNT || '. ' || --> 몇 개의 행이 영향받았느냐? 즉, 반환된 행의 인덱스 처럼 보여짐.
            v_deptno || ', '||
            v_dname || ', ' ||
            v_loc
        );
    END LOOP;

    CLOSE C1;
END;

-- ------------------------------------------------------
-- 4-3. Oracle CURSOR : 커서 FOR LOOP 문
-- ------------------------------------------------------
--  가. 일반적으로, 명시적 커서는, 다중행 SELECT문에 의해,
--      여러 행의 데이터가 들어있기 때문에, 반복문(like LOOP)과
--      함께 사용
--  나. 따라서, 명시적 커서를 사용하기 위해서는, 위 4-2와 같이
--      4단계 절차(DECLARATION, OPEN, FETCH, CLOSE)와 반복문
--      코드가 결합되어 복잡해짐
--  다. 나 의 단점을 보완하기 위해, 
--      FOR 반복문 + 명시적 커서 = 커서 FOR LOOP 문이 제공!
--  라. 장점:
--      a. CURSOR의 4단계 절차가 묵시적으로 실행됨
--      b. 간결하게 명시적 커서의 사용가능
--  마. 기본문법: 
--      Explicit_cursor_for_loop_syntax.JPG
--
--      a. 레코드명
--          - 커서로부터 FETCH된 하나의 레코드(행) 저장
--          - 레코드 변수로서 자동선언됨
--      b. IN 다음에 기술된 커서명
--          - 반드시 선언부(DECLARE)에 선언되어 있어야 함
--      c. FOR 문이 실행되면, 명시적 커서가 자동으로 OPEO
--          - 한 건씩 FETCH 됨
--      d. 커서영역에 데이터가 모두 처리되면, LOOP 종료
--          - 이때, 자동으로 명시적 커서가 CLOSE 됨
-- ------------------------------------------------------

-- ------------------------------------------------------
-- 예1: 커서 FOR LOOP문 사용하여, DEPT 테이블의 모든 데이터 출력
-- ------------------------------------------------------
DECLARE
    CURSOR C1
    IS
        SELECT deptno, dname, loc
        FROM dept;
BEGIN
    FOR dept_record IN C1 LOOP

    -- EXIT WHEN C1%NOTFOUND;   -- 필요없음 --> 범위 끝나면 자동으로 빠져나가기 때문에 EXIT 필요없음.
    
    DBMS_OUTPUT.put_line( 
        dept_record.deptno ||' '||
        dept_record.dname ||''||
        dept_record.loc
    );
    END LOOP;
END;

-- ------------------------------------------------------
-- 예2: 커서 FOR LOOP 문 사용하여, 사원들의 급여총합 출력
-- ------------------------------------------------------
select SAL
from emp;

DECLARE
    tot_sum NUMBER := 0;

    CURSOR C2
    IS
        SELECT ename, sal
        FROM emp;
BEGIN
    DBMS_OUTPUT.put_line('이름 급여');
    DBMS_OUTPUT.put_line('--------------------------');
    
    FOR emp_record IN C2 LOOP
        tot_sum := tot_sum + nvl(emp_record.sal, 0);

        DBMS_OUTPUT.put_line(
            emp_record.ename || ',' ||
            emp_record.sal
        );

    END LOOP;

    DBMS_OUTPUT.put_line('------------------------------');
    DBMS_OUTPUT.put_line('총 급여:'|| ''|| tot_sum);
END;

-- ------------------------------------------------------
--  제곱의 평균 - 평균의 제곱
-- ------------------------------------------------------
DECLARE
    tot_sum NUMBER := 0;
    tot_sum_square NUMBER := 0;
    ccount NUMBER := 0;

    CURSOR C3
    IS
        SELECT ename, sal
        FROM emp
        where sal is not null;
BEGIN
    DBMS_OUTPUT.put_line('이름 급여');
    DBMS_OUTPUT.put_line('---------------------------');
    
    FOR emp_record IN C3 LOOP
        tot_sum_square := tot_sum_square + power(emp_record.sal,2);
        tot_sum := tot_sum + emp_record.sal;
        ccount := ccount +1 ;
        
        DBMS_OUTPUT.put_line(
            emp_record.ename || ',' ||
            emp_record.sal
        );
    END LOOP;

    DBMS_OUTPUT.put_line('var:' ||' '|| ((tot_sum_square/ccount) - power((tot_sum/ccount),2)));
END;

select variance(sal)
from emp
where sal is not null;


DECLARE

    tot_sum NUMBER := 0;

    CURSOR C1
    IS

        SELECT ename, sal
        FROM emp
        where sal is not null;

    tot_avg NUMBER := 0;
    tot_count NUMBER := 0;

BEGIN 

    SELECT avg(sal), count(*)
        INTO tot_avg, tot_count
    FROM emp
    where sal is not null;


    DBMS_OUTPUT.put_line('이름 급여');
    DBMS_OUTPUT.put_line('----------------------');

    FOR emp_record IN C1 LOOP

        tot_sum := tot_sum + power((emp_record.sal - tot_avg),2);

        DBMS_OUTPUT.put_line(emp_record.ename || ', ' || emp_record.sal);
        
    END LOOP;


    DBMS_OUTPUT.put_line('----------------------');
    DBMS_OUTPUT.put_line('분산:' || ' ' || round(tot_sum / tot_count));

END;