SELECT E.EMPLOYEE_ID, E.FIRST_NAME || ' ' || E.LAST_NAME FULL_NAME, D.DEPARTMENT_NAME, E.SALARY FROM EMPLOYEES E
JOIN DEPARTMENTS D ON (
E.DEPARTMENT_ID = D.DEPARTMENT_ID

)
JOIN LOCATIONS L ON 
(
D.LOCATION_ID = L.LOCATION_ID
)
WHERE 4<
(
SELECT COUNT(DISTINCT E2.EMPLOYEE_ID) 
FROM EMPLOYEES E2 JOIN DEPARTMENTS D2 ON (E2.DEPARTMENT_ID=D2.DEPARTMENT_ID)
JOIN LOCATIONS L2 ON (D2.LOCATION_ID=L2.LOCATION_ID) 
WHERE E2.DEPARTMENT_ID <> E.DEPARTMENT_ID
AND L.LOCATION_ID = L2.LOCATION_ID 
AND E2.SALARY < E.SALARY


)
ORDER BY D.DEPARTMENT_NAME DESC, E.SALARY DESC, E.EMPLOYEE_ID ASC;
 


---------


SELECT 
D.DEPARTMENT_NAME, E.FIRST_NAME || ' ' || E.LAST_NAME MANAGER_FULL_NAME,
E.SALARY MANAGER_SALARY
FROM DEPARTMENTS D JOIN LOCATIONS L ON (D.LOCATION_ID = L.LOCATION_ID)
JOIN COUNTRIES C ON (L.COUNTRY_ID = C.COUNTRY_ID)
JOIN REGIONS R ON (C.REGION_ID = R.REGION_ID)
JOIN EMPLOYEES E ON (D.MANAGER_ID = E.EMPLOYEE_ID)
WHERE 1< 
(SELECT COUNT(EMPLOYEE_ID) FROM EMPLOYEES E2 WHERE D.MANAGER_ID=E2.MANAGER_ID)
AND E.SALARY <= 15000 AND E.SALARY >=10000;



---------
SELECT D.DEPARTMENT_NAME, CASE 
WHEN (SELECT(AVG(SALARY) FROM EMPLOYEES)<(SELECT(AVG(SALARY) FROM EMPLOYEES WHERE D.DEPARTMENT_ID=DEPARTMENT_ID)))   THEN 'ABOVE'
WHEN  (SELECT(AVG(SALARY) FROM EMPLOYEES)>(SELECT(AVG(SALARY) FROM EMPLOYEES WHERE D.DEPARTMENT_ID=DEPARTMENT_ID)))   THEN 'BELOW'
ELSE 'EQUAL' END

---------

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME FROM EMPLOYEES E
CASE 
WHEN (1<
(
SELECT COUNT(DEPARTMENT_ID)
FROM DEPARTMENTS
WHERE E.EMPLOYEE_ID=MANAGER_ID GROUP BY DEPARTMENT_ID
)
) THEN 'MULTI-DEPT MANAGER'
WHEN  (

E.SALARY >
(SELECT AVG(SALARY) FROM EMPLOYEES E2) ) THEN 'ABOVE AVG SALARY'
END
WHERE E.DEPARTMENT_ID <> (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Seattle') 


----------
SELECT D.DEPARTMENT_NAME,E.EMPLOYEE_ID, E.SALARY
FROM EMPLOYEES E JOIN DEPARTMENTS D ON
( SELECT E2.DEPARTMENT_ID, MAX(E.SALARY) 
FROM EMPLOYEES E2 
GROUP BY E2.DEPARTMENT_ID ON (E.DEPARTMENT_ID = E2.DEPARTMENT_ID

)

)











































































































