-- sample1mine.sql

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
-- 0. The relationship between 
--    parent(=master) table and child(=slave) table
-- ------------------------------------------------------
-- * Please refer to Chapter05 page 2.
-- ------------------------------------------------------

-- Child(= Slave) table to refer to others.
DESC employees;

SELECT last_name, department_id --> 부서번호와 이름을 보여주려는게 목적이었음.
FROM employees
ORDER BY 2 ASC;

-- Parent(= Master) table to be referred.
DESC departments;

SELECT department_id, department_name
FROM departments
ORDER BY 1 ASC;

--1. 특정 직원의 부서번호 찾아내기
SELECT last_name, department_id
FROM employees
WHERE last_name = 'Whalen';

--2. 찾아낸 부서번호를 이용한 부서명 조회
SELECT department_name
FROM departments
WHERE department_id = 10 ;