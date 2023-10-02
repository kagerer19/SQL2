USE emp_db;
/* 2. Select all departments */
SELECT DNAME
FROM DEPT;

/* 3. Output of EMPNO, ENAME and HIREDATE (format DD. Month YYYY) for each employee. */
SELECT EMPNO, ENAME, HIREDATE
FROM EMP;

/* 4. Output of ENAME and the number of days since joining the company (column heading DAYS) for each employee.*/
SELECT ENAME, DATEDIFF(CURDATE(), HIREDATE) AS DAYS
FROM EMP;

/* 5. Output of jobs (only 1 output per job).*/
SELECT DISTINCT JOB
FROM EMP;

/* 6. Output of the minimum, maximum and average salary */
SELECT min(SAL), max(SAL), ROUND(avg(SAL), 2)
FROM EMP;

/* 7. Statement to determine "How many employees are there?" */
SELECT COUNT(SAL) AS TotalEmployees
FROM EMP;

/* 8. Statement to determine "How many employees are there?" */
SELECT COUNT(DISTINCT JOB) AS TotalJobs
FROM EMP;


/*    TEST STATMENTS      */


/*   The entire salary that should be spent on each salesperson.   */
SELECT ENAME, SAL, COMM, SAL + COMM
FROM EMP
WHERE JOB = 'SALESMAN';

/*  Issue for all employees whose commission is over 25% of their salary.   */
SELECT ENAME, SAL, COMM
FROM EMP
WHERE COMM > 0.25 * SAL;


/*   Output of all salespeople in descending order in terms of commission-to-salary ratio.   */
SELECT ENAME, COMM / SAL, COMM, SAL
FROM EMP
WHERE JOB = 'SALESMAN'
ORDER BY COMM / SAL DESC;

/*   The daily salary (22 working days per month) of the employees from department 30 should be calculated. To do this, the calculated value should be output, the value rounded to dollars and the value rounded to cents.   */
SELECT ENAME, SAL, SAL / 22, ROUND(SAL / 22.0), ROUND(SAL / 22.2)
FROM EMP
WHERE DEPTNO = 30;

SELECT SUM(SAL), SUM(COMM)
FROM EMP
WHERE JOB = 'SALESMAN';

SELECT 12 * AVG(SAL + COMM)
FROM EMP
WHERE JOB = 'SALESMAN';

SELECT COUNT(COMM)
FROM EMP;

SELECT COUNT(DISTINCT JOB)
FROM EMP
WHERE DEPTNO = 30;

SELECT COUNT(*)
FROM EMP
WHERE DEPTNO = 30;

/*   Output the average salaries for each department   */
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO;

/*  Display the average annual salary for each department per job    */
SELECT DEPTNO, COUNT(*), 12 * AVG(SAL)
FROM EMP
WHERE JOB NOT IN ('MANAGER', 'PRESIDENT')
GROUP BY DEPTNO;

/*  Determine the number of employees and the annual average salary per department and per job   */
SELECT DEPTNO, JOB, COUNT(*), 12 * AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB;

/*  output the max average salary of the employees across all departments   */
SELECT MAX(AvgSalary) AS MaxAvgSalary
FROM (SELECT DEPTNO, AVG(SAL) AS AvgSalary
      FROM EMP
      GROUP BY DEPTNO) AS subquery;

/*   Average annual salaries for jobs performed by more than two employees.  */
SELECT JOB, COUNT(*), 12 * avg(SAL)
FROM EMP
GROUP BY JOB
HAVING COUNT(*) > 2;

/*  Output all departments with at least 2 office employees    */
SELECT DEPTNO
FROM EMP
WHERE JOB = 'CLERK'
GROUP BY DEPTNO
HAVING COUNT(*) >= 2;

