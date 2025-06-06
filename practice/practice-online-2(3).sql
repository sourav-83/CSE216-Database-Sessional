-- 6.1


SELECT LAST_NAME 
FROM EMPLOYEES 
WHERE DEPARTMENT_ID =
(SELECT DEPARTMENT_ID FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Sales');


SELECT E.LAST_NAME, E.SALARY
FROM EMPLOYEES E
WHERE E.SALARY > 
(SELECT MIN(SALARY) FROM EMPLOYEES);


SELECT
  E.LAST_NAME,
  E.SALARY
FROM
  EMPLOYEES E
WHERE
  SALARY > ALL (SELECT SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Sales'));
  
  
SELECT
  LAST_NAME,
  SALARY
FROM
  EMPLOYEES
WHERE
  ABS(
    SALARY - (SELECT AVG(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Sales'))) = 5000;
