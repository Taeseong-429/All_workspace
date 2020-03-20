-- exercise: sample2.sql

-- 관계형 데이터베이스의 테이블 == 수학의 집합
-- 따라서, 집합의 성질을 갖는다...를 확인해 봅시다!!!

SELECT 
    -- 아래의 ROWID, ROWNUM 을 소위, '의사컬럼(Pseudo Column)'
    -- 이라고 합니다. 즉, 실제 테이블에 존재하지 않지만,
    -- 모든 테이블에서 사용가능한 컬럼이기 때문입니다.
    ROWID,              -- ?? : 행의 번호를 출력
    ROWNUM,             -- ?? : 행의 물리적인 주소를 논리주소로 바꾼다.
    last_name,
    salary
FROM 
    employees
ORDER BY
    salary;

-- Oracle Partioning
-- 년/월/일 별로, 1억개의 행을 나누어서, 
-- 각 일자별로, 다른 *.dbf 파일에 쪼개서 저장하자!!!!
-- ROWID라고 하는 주소는 매번 변한다~~! 이거 덕에 각 행은 유니크하게 구별됨.
-- E.F Codd 박사의 논문 ---> 관계형 데이터베이스