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




/* Kapitel 19 */

SELECT ename, hiredate
  FROM EMP
  WHERE deptno IN (SELECT deptno
                    FROM EMP
                    WHERE ename = 'BLAKE')
  AND ename != 'BLAKE';

SELECT empno, ename
  FROM EMP
  WHERE sal > (SELECT AVG(sal)
                FROM EMP)
  ORDER BY sal DESC;

SELECT deptno, ename, job
  FROM EMP
  WHERE deptno IN  (SELECT deptno
                      FROM DEPT
                      WHERE dname = 'SALES');

SELECT ename, deptno, sal
  FROM EMP
  WHERE (sal, deptno) IN (SELECT sal, deptno
                            FROM EMP
                            WHERE comm IS NOT NULL);


SELECT ename, job, sal
  FROM EMP
  WHERE sal > ALL (SELECT sal
                      FROM EMP
                      WHERE job = 'CLERK')
  ORDER BY sal DESC;

select a.ename, a.sal, a.deptno
  from EMP a, 
      (select deptno, max(sal) maximal 
      from EMP 
      group by deptno)  b
  where a.deptno = b.deptno
  and a.sal = b.maximal;

/*oder: */

select a.ename, a.sal, a.deptno
  from EMP a inner join (select deptno, max(sal) maximal from EMP group by deptno)  b
  on a.deptno = b.deptno
  where a.sal = b.maximal;

/*oder: */

select o.ename, o.sal, o.deptno
  from EMP o
  where o.sal = (select max(sal) 
                    from EMP i 
                    where o.deptno  = i.deptno);
