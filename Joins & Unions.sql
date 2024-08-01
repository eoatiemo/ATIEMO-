-- INNER JOINS
SELECT DEM.first_name
,DEM.gender
,SAL.salary
FROM employee_demographics AS DEM
INNER JOIN employee_salary AS SAL
ON DEM.employee_id=SAL.employee_id;

-- LEFT OUTER JOIN
SELECT *
FROM employee_demographics AS DEM
LEFT JOIN employee_salary AS SAL
ON DEM.employee_id=SAL.employee_id;

-- RIGHT OUTER JOIN
SELECT *
FROM employee_demographics AS DEM
RIGHT JOIN employee_salary AS SAL
ON DEM.employee_id=SAL.employee_id;

-- JOINING MULTIPLE TABLES
SELECT *
FROM employee_demographics AS DEM
JOIN employee_salary AS SAL
ON DEM.employee_id=SAL.employee_id
JOIN parks_departments AS PD
ON SAL.dept_id=PD.department_id;

-- UNION
SELECT first_name, last_name
FROM employee_demographics
UNION 
SELECT first_name, last_name
FROM employee_salary;

-- UNION WITH USE CASES
SELECT first_name, last_name, 'Redudant' AS status
FROM employee_demographics
WHERE age > 55
UNION 
SELECT first_name, last_name, 'High Earner' AS status
FROM employee_salary
WHERE salary > 65000 
