-- sample1mine.sql


-- ------------------------------------------------------
-- 1. PL/SQL 개념 
-- ------------------------------------------------------
--  가. Oracle 에서는 실행가능한 문장은 크게 아래 두가지임:
--      (1) SQL 문장
--          a. 비절차적 언어 --> 순서대로 진행되는게 아니고 실행시키고 싶은 것만 실행시킴.
--          b. 특정조건과 일치하는 데이터를 한꺼번에 처리하는 특징
--      (2) PL/SQL 문장 --> 오라클 고유의 특징
--          a. SQL 문의 집합적 언어의 특징도 가짐
--          b. 절차적 처리도 가능한 프로그래밍 언어!!!(***) --> 파이썬처럼 일련의 실행과정을 갖도록 절차를 넣어줄 수 있음.
--  나. 한개 이상의 SQL 문장을, 하나의 블록으로 그룹화하여,
--      한번의 호출로, 블록전체를 DBMS에 전송 -> 성능향상 기대
--  다. 자바 같은 일반적인 프로그램 언어가 가진,
--      a. 변수 선언 및 사용
--      b. 조건에 따른 처리(조건문)
--      c. 조건에 따른 반복실행(반복문)
--      d. 실행 중 발생된 에러처리 --> ex) try, exception ...
--      e. 특정 기능을 수행하는 함수(Function) / 프로시저(Procedure) --> PL/SQL에 이름을 부여..
--         정의(모듈화)
--      f. 함수와 프로시저의 모음인 패키지(Package) 정의(= 라이브러리) --> 재사용 가능..
--      등의 특징을 가짐(일반적인 프로그램 언어와 비슷)
--  라. 일반 프로그램 언어와 다른점:
--      모든 PL/SQL 코드가 DB 내부에서 만들어져, 처리되기 때문에,
--      수행속도와 성능면에서 매우 탁월함(******) --> 프로그래밍 언어의 기능과 데이터를 가짐.
-- ------------------------------------------------------