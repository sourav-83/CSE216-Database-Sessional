-- 7.1

SELECT EMPLOYEE_ID FROM EMPLOYEES 
MINUS SELECT MANAGER_ID FROM EMPLOYEES;



SELECT
  LAST_NAME
FROM
  EMPLOYEES
MINUS
  (SELECT E.LAST_NAME FROM EMPLOYEES E WHERE EXISTS (SELECT 1 FROM EMPLOYEES WHERE E.EMPLOYEE_ID = MANAGER_ID));
  
  
SELECT
  LOCATION_ID
FROM
  LOCATIONS
MINUS
  (SELECT L.LOCATION_ID FROM LOCATIONS L WHERE EXISTS (SELECT 1 FROM DEPARTMENTS WHERE LOCATION_ID = L.LOCATION_ID));