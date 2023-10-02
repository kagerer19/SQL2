USE emp_db;

CREATE TABLE DEPT
(
    DEPTNO INT(2) PRIMARY KEY AUTO_INCREMENT,
    DNAME  VARCHAR(14),
    LOC    VARCHAR(13)
);


CREATE TABLE EMP
(
    EMPNO    INT(2) PRIMARY KEY AUTO_INCREMENT,
    ENAME    VARCHAR(14),
    JOB      VARCHAR(9),
    MGR      INT,
    CONSTRAINT EMP_SELF_KEY FOREIGN KEY (MGR) REFERENCES EMP (EMPNO),
    HIREDATE DATE,
    SAL      DECIMAL(7, 2),
    COMM     DECIMAL(7, 2),
    DEPTNO   INT NOT NULL,
    CONSTRAINT EMP_FOREIGN_KEY FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO)
);


