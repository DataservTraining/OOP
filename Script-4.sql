SELECT ename FROM EMP e 
	WHERE sal > (SELECT sal FROM EMP e2 WHERE lower(ename) = 'jones');
	
SELECT ename, sal, job FROM EMP e 
WHERE sal < ANY (SELECT sal FROM EMP e2 WHERE job = 'Clerk')
AND job != 'Clerk';

SELECT ename, sal FROM EMP e 
WHERE sal > ALL (SELECT avg(sal) FROM EMP e2 GROUP BY DEPTNO);

SELECT dname FROM DEPT d 
	WHERE EXISTS (SELECT * FROM EMP e WHERE e.DEPTNO = d.DEPTNO AND comm IS NOT NULL);
	
SELECT ename, sal, deptno
	FROM EMP e 
	WHERE sal > (SELECT avg(sal) FROM EMP e2 WHERE e2.deptno = e.DEPTNO);
	
SELECT deptno, avg(sal) FROM EMP e2 group BY DEPTNO ;

SELECT ename, sal, deptno
	FROM EMP e 
	WHERE (sal, deptno) IN (SELECT sal, deptno FROM EMP e2 WHERE lower(ename = 'martin'))
	AND  lower(ename) != 'martin';
	
select ename from EMP e 
where empno not in (select COALESCE(mgr, 0) from EMP e2);

SELECT a.ename, a.sal, a.deptno, b.salavg
FROM EMP a, ( SELECT deptno, avg(sal) salavg
FROM EMP e 
GROUP BY deptno) b
WHERE a.deptno = b.deptno
AND a.sal > b.salavg;