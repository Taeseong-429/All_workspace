-- TEST.sql

--1.
/etc/sysctl.sql

--2.


--3.

DESC employees;

CREATE SYNONYM emp_synonym FOR hr.employees;

--4.

CREATE SEQUENCE new_seq

START WITH 10
INCREMENT BY 2
MAXVALUE 10000
MINVALUE 100
CYCLE
NOCACHE;

--5.

CREATE OR REPLACE VIEW view_name
AS
    Subquery
    WITH READ ONLY;

--6.

DESC emp;
DESC dept;

CREATE OR REPLACE VIEW emp_view (col1,col2,col3,col4)
AS
SELECT 
    empno as eno,
    ename,
    d.deptno,
    d.dname
FROM emp e JOIN dept d
ON  e.deptno = d.deptno
WHERE d.deptno = 20
ORDER BY 1 DESC;

