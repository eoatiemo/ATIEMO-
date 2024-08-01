-- Common Table Expression (CTE)
WITH CTE_EXAMPLE AS
(SELECT  gender, AVG(salary), MAX(salary), MIN(salary)
FROM employee_demographics dem
	JOIN employee_salary sal
    ON dem.employee_id=sal.employee_id
    GROUP BY gender
)
SELECT *
FROM CTE_EXAMPLE;