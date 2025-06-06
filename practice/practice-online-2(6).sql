-- 11

SELECT DEPARTMENT_ID,
SUM(CASE WHEN SALARY > 15000 THEN 1 ELSE 0 END) "A+",
SUM(CASE WHEN SALARY >= 10000 AND SALARY <15000 THEN 1 ELSE 0 END) "A",
SUM(CASE WHEN SALARY >= 5000 AND SALARY <10000 THEN 1 ELSE 0 END) "B",
SUM(CASE WHEN SALARY < 5000 THEN 1 ELSE 0 END) "C"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;


SELECT DEPARTMENT_ID,
COUNT(CASE WHEN SALARY > 15000 THEN 1 END) "A+",
COUNT(CASE WHEN SALARY >= 10000 AND SALARY <15000 THEN 1 END) "A",
COUNT(CASE WHEN SALARY >= 5000 AND SALARY <10000 THEN 1 END) "B",
COUNT(CASE WHEN SALARY < 5000 THEN 1 END) "C"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;


SELECT
  E.EMPLOYEE_ID,
  (SELECT COUNT(EMPLOYEE_ID) FROM EMPLOYEES WHERE DEPARTMENT_ID = E.DEPARTMENT_ID) OWN,
  (SELECT COUNT(EMPLOYEE_ID) FROM EMPLOYEES WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE EMPLOYEE_ID = E.MANAGER_ID)) "MANGER'S"
FROM
  EMPLOYEES E;
  
  
  



