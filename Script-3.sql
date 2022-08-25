SELECT avg(sal) Durchschnittsgehalt, sum(sal) Summe, max(sal) "max. Gehalt" , min(sal) "min. Gehalt", count(sal) 
FROM EMP e ;

SELECT max(comm), min(comm), sum(comm), AVG(comm), count(COMM) FROM EMP e ;

SELECT DEPTNO, job, avg(sal) 
	FROM EMP e
	WHERE DEPTNO IN (10, 30)
	GROUP BY job, DEPTNO
	HAVING  avg(sal) > 2000;
	

/* Kapitel 18 */

SELECT job, COUNT(*)
FROM EMP
GROUP BY job;

SELECT MAX(sal) - MIN(sal)
from EMP;

SELECT mgr, MIN(sal)
FROM EMP
WHERE mgr IS NOT NULL
GROUP BY mgr
HAVING MIN(sal) > 1000;

SELECT mgr, MIN(sal)
FROM EMP
WHERE mgr IS NOT NULL
GROUP BY mgr
HAVING MIN(sal) > 1000;


SELECT mgr, ename, sal, deptno
FROM EMP o 
WHERE sal IN  ( SELECT min (sal) 
					FROM EMP i
					WHERE mgr IS NOT NULL 
					GROUP BY i.mgr
					HAVING min(sal) > 1000
			  )
ORDER BY mgr;

SELECT min (sal) 
					FROM EMP i
					WHERE mgr IS NOT NULL 
					GROUP BY i.mgr
					HAVING min(sal) > 1000;
				
SELECT deptno, min (sal)
FROM EMP i
WHERE mgr IS NOT NULL 
GROUP BY mgr
HAVING min(sal) > 1000;

SELECT DISTINCT extract(YEAR FROM hiredate) FROM EMP e ;

SELECT COUNT(*) TOTAL,  
SUM(case Extract(YEAR  FROM hiredate) when '1980' then 1 else 0 end) "1980",
SUM(case Extract(YEAR FROM  hiredate) when '1981' then 1 else 0 end) "1981",
SUM(case Extract(YEAR  FROM hiredate) when '1982' then 1 else 0 end) "1982",
SUM(case Extract(YEAR  FROM hiredate) when '1983' then 1 else 0 end) "1983"
FROM EMP;


SELECT  ROUND(MAX(sal),0) "Maximum", ROUND(MIN(sal),0) "Minimum",
ROUND(SUM(sal),0) "Sum",
ROUND(AVG(sal),0) "Average"
FROM EMP;

SELECT JOB, ROUND(MAX(sal),0) "Maximum",
ROUND(MIN(sal),0) "Minimum",
ROUND(SUM(sal),0) "Sum",
ROUND(AVG(sal),0) "Average"
FROM EMP
GROUP BY JOB;

SELECT d.dname, d.loc, COUNT(*) "Number of People",
ROUND(AVG(sal),2) "Salary"
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
GROUP BY d.dname, d.loc;

SELECT d.dname, d.loc, COUNT(*) "Number of People",
ROUND(AVG(sal),2) "Salary"
FROM EMP e INNER JOIN  DEPT d
on e.deptno = d.deptno
GROUP BY d.dname, d.loc;
