-- Querying all records in the demograohic table 
SELECT *
FROM employee_demographics;

-- SQL Query GROUP BY Clause
SELECT occupation, COUNT(occupation) AS Numb
FROM employee_salary
GROUP BY occupation;

-- SQL Queries with GROUP BY, WHERE and HAVING clause
SELECT occupation, avg(salary)
FROM employee_salary
WHERE occupation LIKE '%Manager%'
GROUP BY occupation
HAVING avg(salary) >56000;