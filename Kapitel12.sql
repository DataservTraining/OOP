/* L�sungen Kapitel 12*/

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');
INSERT INTO dept VALUES (50, 'HEAD_QUARTERS', 'DETROIT');

INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,'17.11.1981',5000,NULL,10);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,'01.05.1981',2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,'09.06.1981',2450,NULL,10);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,'02.04.1981',2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,'02.09.1981',1250,1400,30);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,'20.02.1981',1600,300,30);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,'08.09.1981',1500,0,30);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,'03.12.1981',950,NULL,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,'22.02.1981',1250,500,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,'03.12.1981',3000,NULL,20);
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,'17.12.1980',800,NULL,20);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,'09.12.1982',3000,NULL,20);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,'12.01.1983',1100,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,'23.01.1982',1300,NULL,10);

INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

CREATE TABLE MY_EMPLOYEE
(ID	NUMBER(4) NOT NULL,
LAST_NAME	VARCHAR2(25),
FIRST_NAME	VARCHAR2(25),
USERID	VARCHAR2(8),
SALARY	NUMBER(9,2));

INSERT INTO my_employee
VALUES (1, 'Patel', 'Ralph', 'rpatel', 795);

INSERT INTO my_employee (id, last_name, first_name, userid, salary)
VALUES (2, 'Dancs', 'Betty', 'bdancs', 860);

INSERT INTO my_employee (id, last_name, first_name, userid, salary)
VALUES (3, 'Biri', 'Ben', 'bbiri', 1100);

INSERT INTO my_employee (id, last_name, first_name, userid, salary)
VALUES (4, 'Newman', 'Chad', 'cnewman', 750);

INSERT INTO my_employee (id, last_name, first_name, userid, salary)
VALUES (5, 'Ropeburn', 'Audry', 'aropebur', 860);

UPDATE my_employee
SET last_name = 'Drexler'
WHERE id = 3;

UPDATE my_employee
SET salary = 1000
WHERE salary < 900;

DELETE FROM my_employee
WHERE  id = 2;

Commit;

SAVEPOINT a;

DELETE FROM my_employee;

SELECT * FROM my_employee;

ROLLBACK to a;

COMMIT;