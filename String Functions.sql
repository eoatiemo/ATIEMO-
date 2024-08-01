-- String Functions
SELECT last_name,LENGTH(first_name)
FROM employee_demographics
ORDER BY 2;

SELECT LOWER(first_name), UPPER(last_name)
FROM employee_demographics;

SELECT TRIM(last_name) AS last_name
FROM employee_demographics;

-- Substring
SELECT LEFT(first_name, 3), RIGHT(last_name, 4)
FROM employee_demographics;

SELECT birth_date,SUBSTRING(birth_date,1,4) AS birth_year, SUBSTRING(birth_date, 6, 2) AS birth_month, SUBSTRING(birth_date,9,2) AS birth_day
FROM employee_demographics
ORDER BY birth_day;

SELECT first_name, last_name, CONCAT(first_name,' ', last_name) AS full_name
FROM employee_demographics;

-- Case Statements
SELECT first_name, last_name,
CASE
	WHEN salary > 50000 THEN 'High Earner' ELSE 'Low Earner'
END AS earning_status
FROM employee_salary;