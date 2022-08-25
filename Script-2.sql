SELECT e.ENAME , d.DNAME , e.DEPTNO, d.DEPTNO  
	FROM EMP e, DEPT d
	WHERE e.DEPTNO  = d.DEPTNO
	AND e.DEPTNO = 20; 

SELECT e.ENAME , d.DNAME , e.DEPTNO, d.DEPTNO  
	FROM EMP e INNER JOIN DEPT d
	on e.DEPTNO  = d.DEPTNO 
	WHERE e.DEPTNO = 30; 
	
SELECT e.ENAME , d.DNAME , e.DEPTNO, d.DEPTNO  
	FROM EMP e NATURAL JOIN DEPT d 
	WHERE e.DEPTNO = 30; 
	
SELECT e.ename, s.grade
FROM EMP e, SALGRADE s 
WHERE e.sal between s.losal and s.hisal
and e.deptno=10;

SELECT e.ename, s.grade
FROM EMP e INNER JOIN  SALGRADE s 
on e.sal between s.losal and s.hisal
where e.deptno=30;

SELECT e.ename, d.dname, d.deptno
FROM EMP e RIGHT JOIN DEPT d 
ON e.deptno=d.deptno;

CREATE TABLE emp2 SELECT * FROM EMP e ;
INSERT INTO emp2 VALUES (1000, 'Hans', 'Clerk', NULL, '2022-08-24', 1000, NULL, NULL );

SELECT e.ename, d.dname, d.deptno
FROM emp2 e RIGHT JOIN DEPT d 
ON e.deptno=d.deptno
UNION 
SELECT e.ename, d.dname, d.deptno
FROM emp2 e LEFT JOIN DEPT d 
ON e.deptno=d.deptno;


SELECT e.ename Angestellter, m.ename Manager
	FROM EMP e, EMP m
	WHERE e.mgr = m.EMPNO ;

SELECT e.ename Angestellter, m.ename Manager
	FROM EMP e INNER JOIN EMP m
	ON e.mgr = m.EMPNO ;
	

SELECT e.ename, d.loc, s.grade
FROM EMP e, DEPT d , SALGRADE s 
WHERE e.deptno=d.deptno
AND e.sal BETWEEN s.losal AND s.hisal
AND e.ename ='KING';

SELECT e.ename, d.loc, s.grade
FROM EMP e INNER JOIN  DEPT d 
	ON e.deptno=d.deptno
	INNER JOIN SALGRADE s 
	on e.sal BETWEEN s.losal AND s.hisal
where e.ename ='KING';

/* Kapitel 17 */

SELECT DISTINCT e.job, d.loc
FROM EMP e, DEPT d
WHERE e.DEPTno= d.DEPTno
AND e.DEPTno=30;

/*oder: */

SELECT DISTINCT e.job, d.loc
FROM EMP e inner join DEPT d
ON e.DEPTno = d.DEPTno
WHERE e.DEPTno = 30;


SELECT e.ename, e.job, d.DEPTno, d.dname
FROM EMP e, DEPT d
WHERE e.DEPTno=d.DEPTno
AND d.loc ='DALLAS';

/*oder: */

SELECT e.ename, e.job, d.DEPTno, d.dname
FROM EMP e INNER JOIN DEPT d
ON e.DEPTno=d.DEPTno
WHERE d.loc ='DALLAS';

SELECT e.ename, e.EMPno, m.ename, m.EMPno
FROM EMP e, EMP m
WHERE e.mgr= m.EMPno;

/*oder: */

SELECT e.ename, e.EMPno, m.ename, m.EMPno
FROM EMP e INNER JOIN EMP m
ON e.mgr= m.EMPno;

SELECT e.DEPTno , e.ename Mitarbeiter,c.ename Kollege
FROM EMP e, EMP c
WHERE e.DEPTno = c.DEPTno
AND e.EMPno > c.EMPno
ORDER BY e.DEPTno, e.ename, c.ename;

/*oder: */

SELECT e.DEPTno , e.ename Mitarbeiter,c.ename Kollege
FROM EMP e INNER JOIN EMP c
ON e.DEPTno = c.DEPTno
WHERE e.EMPno > c.EMPno
ORDER BY e.DEPTno, e.ename, c.ename;


SELECT e.ename, e.EMPno, m.ename, m.EMPno
FROM EMP e LEFT OUTER JOIN EMP m
ON e.mgr= m.EMPno;

SELECT EMP.ename, EMP.hiredate
FROM EMP, EMP blake
WHERE blake.ename = 'BLAKE'
AND blake.hiredate < EMP.hiredate;

/*oder: */

SELECT EMP.ename, EMP.hiredate
FROM EMP INNER JOIN  EMP blake
ON blake.hiredate < EMP.hiredate
WHERE blake.ename = 'BLAKE';
