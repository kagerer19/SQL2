USE emp_db;
/* 2. Select all departments */
SELECT DNAME FROM DEPT;

/* 3. Output of EMPNO, ENAME and HIREDATE (format DD. Month YYYY) for each employee. */
SELECT EMPNO, ENAME, HIREDATE FROM EMP;

/* 4. Output of ENAME and the number of days since joining the company (column heading DAYS) for each employee.*/
SELECT ENAME, DATEDIFF(CURDATE(), HIREDATE) AS DAYS
FROM EMP;

/* 5. Output of jobs (only 1 output per job).*/
SELECT DISTINCT JOB FROM EMP;

/* 6. Output of the minimum, maximum and average salary */
SELECT min(SAL), max(SAL), ROUND(avg(SAL), 2) FROM EMP;

/* 7. Statement to determine "How many employees are there?" */
SELECT COUNT(SAL) AS TotalEmployees FROM EMP;

/* 8. Statement to determine "How many employees are there?" */
SELECT COUNT(DISTINCT JOB) AS TotalJobs FROM EMP;