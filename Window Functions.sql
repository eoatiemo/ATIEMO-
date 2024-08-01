-- Window Functions
SELECT gender, AVG(salary) AS average_salary
FROM employee_demographics dem
	JOIN employee_salary sal
    ON dem.employee_id=sal.employee_id
GROUP BY gender;

SELECT dem.first_name,sal.salary,gender, AVG(salary) OVER (PARTITION BY gender)
FROM employee_demographics dem
	JOIN employee_salary sal
    ON dem.employee_id=sal.employee_id;
    
    SELECT dem.first_name,sal.salary,gender, SUM(salary) OVER (PARTITION BY gender ORDER BY dem.employee_id) AS rolling_total
FROM employee_demographics dem
	JOIN employee_salary sal
    ON dem.employee_id=sal.employee_id;
    
SELECT dem.employee_id,dem.first_name,sal.salary,gender,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_mum,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_rank_mum
FROM employee_demographics dem
	JOIN employee_salary sal
    ON dem.employee_id=sal.employee_id