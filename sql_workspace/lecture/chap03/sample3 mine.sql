-- smaple3.sql

-- (3) 날짜 (처리)함수 : ~~~ 여기 필기 안함.

-- ------------------------------------------------------
-- (0) 현 Oracle 서버의 날짜표기형식(DATE FORMAT) 설정확인
-- ------------------------------------------------------ 
-- Oracle NLS: National Language Support
-- 오라클의 년도표기 방식 (page 41 ~ 42 참고)
-- ------------------------------------------------------
DESC nls_session_parameters;

-- 아래의 SQL 문장을 SQL*Develpoer 에서도 수행해 볼 것!

SELECT * 
FROM nls_session_parameters;
-- ------------------------------------------------------
ALTER SESSION SET NLS_DATE_FORMAT='RR/MM/DD'; -- > 세션 데이터의 포맷을 이렇게 바꿔줌.

SELECT sysdate --> sysdate는 현재의 시스템 날짜를 보여주는 함수!.. 키워드 아님..
FROM dual;  --> 여기 SQL 디벨로퍼랑 비쥬얼 스튜디오 반영 방식 다름 !! 이거 잘 기억 !

ALTER SESSION SET NLS_DATE_FORMAT='YYYY/MM/DD'; -- > 세션 데이터의 포맷을 이렇게 바꿔줌. 

SELECT sysdate --> sysdate는 현재의 시스템 날짜를 보여주는 함수!.. 키워드 아님..
FROM dual;
-- --------------------------------------------------------
-- 날짜(처리) 함수 - SYSDATE
-- --------------------------------------------------------
SELECT sysdate
FROM dual;

-- * 날짜 연산 (page 43 참고)
-- (1) 날짜 + 숫자 : 날짜에 일수를 더하여 반환
-- (2) 날짜 - 숫자 : 날짜에 일수를 빼고 반환
-- (3) 날짜 - 날짜 : 두 날짜의 차이
-- (4) 날짜 + 숫자/24 : 날짜에 시간을 더한다.
SELECT 
    sysdate AS 오늘,
    sysdate + 1 AS 내일,
    sysdate - 1 AS 어제
FROM 
    dual;

SELECT
    last_name,
    hire_date,
    sysdate - hire_date,                 -- 현재날짜 - 채용일자 = 기간(일수)
    (sysdate - hire_date),                -- 근속기간(일수) / 365 = 근속년수(소숫점)
    trunc( (sysdate - hire_date) / 365 ) AS 근속년수  --> 현재날짜에서 고용날짜를 빼면 소숫점의 다닌 일 수가 나옴. 그걸 365로 나누고 버림하면 근속년수 뜸!
FROM
    employees
ORDER BY
    3 DESC;
    
-- --------------------------------------------------------
-- (2) 날짜 (처리) 함수 - MONTH_BETWEEN
-- --------------------------------------------------------
-- 두 날짜 사이의 월수를 계산하여 반환
-- --------------------------------------------------------
SELECT 
    last_name,
    hire_date,
    months_between(sysdate, hire_date) AS "근속 월수(소수점포함)",
    trunc(months_between(~~~
-- --------------------------------------------------------
-- (3) 날짜 (처리) 함수 - ADD_MONTHS
-- --------------------------------------------------------
-- 특정 개월수를 더한 날짜를 계산하여 반환
-- 음수값을 지정하면 뺀 날짜를 반환
-- --------------------------------------------------------
SELECT
    sysdate AS 오늘,
    add_months(sysdate,1) AS "1개월후 오늘",        -- 현재날짜 + 1개월
    ADD_MONTHS(sysdate,-1) AS "1개월전 오늘"        -- 현재날짜 - 1개월
FROM
    dual;
-- --------------------------------------------------------
-- (4) 날짜 (처리) 함수 - NEXT_DAY
-- --------------------------------------------------------
-- 명시된 날짜로부터, 다음 요일에 대한 날짜 반환
-- 일요일(1), 월요일(2) ~ 토요일(7) -- > 
-- --------------------------------------------------------
-- NEXT_DAT(date1, {'string' | n})  --> 문자열 혹은 숫자값이 옴. (string에 금요일을 넣거나, 숫자 6을 넣으면)가장 가깝게 돌아오늘 금요일의 날짜가 몇일이냐!
-- --------------------------------------------------------
SELECT
    last_name,
    hire_date,

    -- 최초로 돌아오는 금요일에 해당하는 날짜 출력
    next_day(hire_date, 'FRI'),
    -- next_day(hire_date, '금') --> 비쥬얼 소스코드에선 '금'을 읽을 수 없음. 오류뜸.

    -- 최초로 돌아오는 금요일에 해당하는 날짜 출력
    next_day(hire_date, 6)

FROM
    employees
ORDER BY
3 DESC;
-- --------------------------------------------------------
-- (5) 날짜 (처리) 함수 - LAST_DAY
-- --------------------------------------------------------
-- 지정된 월의 마지막 날짜 반환
-- 윤년 및 평년 모두 자동으로 계산
-- --------------------------------------------------------
-- LAST_DAY(date1)
-- --------------------------------------------------------
SELECT
    last_name,
    hire_date,

    -- 채용일자가 속한 그 달의 마지막 날짜 반환
    last_day(hire_date)
FROM
    employees
ORDER BY
    2 desc;
-- --------------------------------------------------------
-- (6) 날짜 (처리) 함수 - LAST_DAY
-- --------------------------------------------------------
-- 지정된 월의 마지막 날짜 반환
-- 윤년 및 평년 모두 자동으로 계산
-- --------------------------------------------------------
-- LAST_DAY(date1)
-- --------------------------------------------------------
SELECT 
    last_name,
    hire_date,

    -- 입사일 기준, 5개월 후의 돌아오는 일요일의 날짜 반환
    next_day(add_months(hire_date, 5), 'SUN') --> 입사한지 5개월 지난 사람의 일요일을 찾아라! 
    -- next_day(add_months(hire_date, 5), '일') --> 오류남. 
    
FROM
    employees
ORDER BY
    2 desc;
-- --------------------------------------------------------
-- (6) 날짜 (처리) 함수 - ROUND
-- --------------------------------------------------------
-- 날짜를 가장 가까운 년도 또는 월로 반올림하여 반환
-- --------------------------------------------------------
-- ROUND(date1, 'YEAR') : 지정된 날짜의 년도를 반올림(to YYYY/01/01) -->현재 내가 있는 두 연도사이의 중간 어디에 속해있는지,, 반올림. 월과 일은 1.1로
-- ROUND(date1, 'MONTH') : 지정된 날짜의 월을 반올림 (to YYYY/MM/01) 
-- --------------------------------------------------------
SELECT 
    last_name,
    hire_date,

    -- 채용날짜의 년도를 반올림(to YYYY/01/01) --> 맨 위에 나오는 사람은 6월 17일이라서 반이 지나지 않아 2003년으로 나옴 !
    round(hire_date,'YEAR'),

    -- 채용날짜의 월을 반올림(to YYYY/MM/01)
    round(hire_date,'MONTH')
FROM
    employees;
-- --------------------------------------------------------
-- (7) 날짜 (처리) 함수 -- TRUNC
-- --------------------------------------------------------
-- 날짜를 가장 가까운 년도 또는 월로 반올림하여 반환
-- --------------------------------------------------------
-- TRUNC(date1, 'YEAR') : 지정된 날짜의 년도를 반올림(to YYYY/01/01) -->현재 내가 있는 두 연도사이의 중간 어디에 속해있는지,, 반올림. 월과 일은 1.1로
-- TRUNC(date1, 'MONTH') : 지정된 날짜의 월을 반올림 (to YYYY/MM/01) 
-- --------------------------------------------------------
SELECT 
    last_name,
    hire_date,

    -- 채용날짜의 년도를 반올림(to YYYY/01/01) --> 맨 위에 나오는 사람은 6월 17일이라서 반이 지나지 않아 2003년으로 나옴 !
    trunc(hire_date,'YEAR'),

    -- 채용날짜의 월을 반올림(to YYYY/MM/01)
    trunc(hire_date,'MONTH')
FROM
    employees;
