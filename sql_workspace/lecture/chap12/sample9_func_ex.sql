CREATE OR REPLACE FUNCTION update_sal(
    v_empno  IN    NUMBER
)
      -- 리턴되는 변수의 데이터타입을 꼭 정의해야 합니다
RETURN  NUMBER
IS
    -- %type 변수가 사용(스칼라 데이터 타입 참고)
    v_sal  emp.sal%type;
PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN

    UPDATE emp
    SET sal  = sal  * 1.1
    WHERE empno  = v_empno;

    COMMIT;
--    ROLLBACK;

    SELECT sal
    INTO v_sal
    FROM emp
    WHERE empno = v_empno;

    -- 리턴문이 꼭 존재해야 합니다
    RETURN v_sal;

END;   

VAR;
VAR salary NUMBER; 
EXECUTE :salary := update_sal(7900);
PRINT salary;
PRINT;

SELECT ename, update_sal(empno) 
FROM emp;

SELECT empno, sal
FROM emp;