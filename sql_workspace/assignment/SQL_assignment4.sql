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

VAR result VARCHAR2;
EXEC :result := escape_cave(100, 12, 7);
PRINT result;

-- 4) 계좌이체 함수 구현
--    (1) 계좌 테이블 생성
--    (2) 계좌 이체 로직 구현
--    (3) 반환값: 성공여부 또는 성공이체금액

drop table account;

CREATE TABLE account(
    user_name VARCHAR2(10) CONSTRAINT account_user_name_nn NOT NULL,
    account_number VARCHAR2(10) CONSTRAINT account_account_number_pk PRIMARY KEY,
    amount_of_money NUMBER CONSTRAINT account_account_number_nn NOT NULL,
    status VARCHAR2(6) CONSTRAINT account_status_fk REFERENCES account_status(status)
);


CREATE TABLE account_status(
    status VARCHAR2(6)
);

ALTER TABLE account_status
ADD PRIMARY KEY(status);

desc account_status;

INSERT INTO account_status( status ) VALUES ('LOCK');
INSERT INTO account_status(status) VALUES ('UNLOCK');

INSERT INTO account VALUES ('A', '0000000000', 10000, 'UNLOCK');
INSERT INTO account VALUES ('B', '0000000001', 500, 'UNLOCK');
INSERT INTO account VALUES ('C', '0000000002', 1500, 'UNLOCK');
INSERT INTO account VALUES ('D', '0000000003', 105000, 'UNLOCK');
INSERT INTO account VALUES ('E', '0000000004', 21000, 'UNLOCK');
INSERT INTO account VALUES ('F', '0000000005', 1000, 'UNLOCK');
INSERT INTO account VALUES ('G', '0000000006', 15000, 'LOCK');



CREATE OR REPLACE FUNCTION transfer(
    from_account_number VARCHAR2,
    to_account_number VARCHAR2,
    money IN account.amount_of_money%TYPE
)
RETURN VARCHAR2
IS
    from_account NUMBER(10);
    to_account NUMBER(10);
    balance NUMBER;
    result_transfer VARCHAR2(40);
    from_account_status account.status%TYPE;
    to_account_status account.status%TYPE;
    
    PRAGMA AUTONOMOUS_TRANSACTION;

BEGIN

    SELECT count(account_number) INTO from_account
    FROM account WHERE account_number = from_account_number;
    
    DBMS_OUTPUT.put_line('1. from_account: '||from_account);
    -----------------------------------------------------

    SELECT count(account_number) INTO to_account
    FROM account WHERE account_number = to_account_number;
    
    DBMS_OUTPUT.put_line('2. to_account: '||to_account);
    -----------------------------------------------------

    BEGIN
        SELECT status INTO from_account_status FROM account
        WHERE account_number = from_account_number;
        
        EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
    END from_account_status;
    
    DBMS_OUTPUT.put_line('3. from_account_status: '||from_account_status);
    -----------------------------------------------------
    BEGIN
        SELECT status INTO to_account_status
        FROM account WHERE account_number = to_account_number;
        
        EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
    END to_account_status;
    
    DBMS_OUTPUT.put_line('4. to_account_status: '||to_account_status);
    -----------------------------------------------------

    BEGIN
        SELECT amount_of_money INTO balance
        FROM account WHERE account_number = from_account_number;
        
        EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
    END balance;
    
    DBMS_OUTPUT.put_line('5. balance: '||balance);    
    -----------------------------------------------------

    IF from_account != 1 THEN 
        result_transfer := '출금 계좌 오류';
    ELSIF to_account != 1 THEN 
        result_transfer := '입금 계좌 오류';
    ELSIF from_account_status = 'LOCK' THEN
        result_transfer := '출금 계좌 잠김';
    ELSIF to_account_status = 'LOCK' THEN
        result_transfer := '입금 계좌 잠김';
    ELSIF balance < money THEN 
        result_transfer := '잔액 부족';
    ELSE
        result_transfer := '이체 성공';
    END IF;

    IF result_transfer = '이체 성공'
    THEN
        UPDATE account
        SET amount_of_money = amount_of_money - money
        WHERE account_number = from_account_number; 

        commit;

        UPDATE account
        SET amount_of_money = amount_of_money + money
        WHERE account_number = to_account_number;

        commit;

    END IF;

    RETURN result_transfer;

END;
---------------------------------------------------------
VAR result VARCHAR2;
EXEC :result := transfer('00000000', '0000000000', 100000);
PRINT result;
---------------------------------------------------------

select * from account;

select transfer('0000000000', '0000000001', 100)
from dual;



------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION transfer(
    from_account_number account.account_number%TYPE,
    to_account_number account.account_number%TYPE,
    money account.amount_of_money%TYPE
)
RETURN VARCHAR2
IS
    from_account account%ROWTYPE;
    to_account account%ROWTYPE;
    result_transfer VARCHAR2(20);

    account_locked EXCEPTION;

    PRAGMA AUTONOMOUS_TRANSACTION;

BEGIN
    
    BEGIN

        SELECT *
            INTO from_account
        FROM account
        WHERE account_number = from_account_number;

        IF from_account.status = 'LOCK' THEN
            RAISE account_locked;
        END IF;

        EXCEPTION 
            
            WHEN NO_DATA_FOUND THEN 
            result_transfer := '출금 계좌 오류'; 
            RETURN result_transfer;
            
            WHEN account_locked THEN
            result_transfer := '출금 계좌 잠김';
            RETURN result_transfer;

    END;    -- 출금 계좌 확인

    BEGIN

        SELECT *
            INTO to_account
        FROM account
        WHERE account_number = to_account_number;

        IF to_account.status = 'LOCK' THEN
            RAISE account_locked;
        END IF;
        
        EXCEPTION 
            
            WHEN NO_DATA_FOUND THEN 
            result_transfer := '입금 계좌 오류'; 
            RETURN result_transfer;
            
            WHEN account_locked THEN
            result_transfer := '입금 계좌 잠김';
            RETURN result_transfer;

    END;    -- 입금 계좌 확인

    IF from_account.amount_of_money < money THEN 
        result_transfer := '잔액 부족';
        RETURN result_transfer;
    ELSE 
        result_transfer := '이체 성공';
    
        UPDATE account
        SET amount_of_money = amount_of_money - money
        WHERE account_number = from_account_number;  

        commit;

        UPDATE account
        SET amount_of_money = amount_of_money + money
        WHERE account_number = to_account_number;

        commit;

    END IF;

    RETURN result_transfer;

END;



VAR result VARCHAR2;

EXEC :result := transfer('0000000000', '0000000001', 1000);
PRINT result;   -- 이체 성공
EXEC :result := transfer('0000000021', '0000000000', 10000);
PRINT result;   -- 출금 계좌 오류
EXEC :result := transfer('0000000000', '0000000023', 10000);
PRINT result;   -- 입금 계좌 오류
EXEC :result := transfer('0000000006', '0000000001', 100000);
PRINT result;   -- 출금 계좌 잠김
EXEC :result := transfer('0000000000', '0000000006', 100000);
PRINT result;   -- 입금 계좌 잠김
EXEC :result := transfer('0000000000', '0000000003', 100000);
PRINT result;   -- 잔액 부족
