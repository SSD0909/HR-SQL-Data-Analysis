-- find all employees who are located at the location with the ID 1700.

SELECT employee_id, first_name,last_name,department_id FROM employees
where department_id IN ( SELECT department_id FROM departments WHERE location_id =1700)
ORDER BY 2,3;

-- find all employees' information who do not locate at location 1700.
SELECT employee_id, first_name,last_name,department_id FROM employees
where department_id NOT IN( SELECT department_id FROM departments WHERE location_id =1700)
ORDER BY 2,3;

-- find the employees who have the highest salary

SELECT * FROM employees;
SELECT employee_id, first_name,last_name, salary FROM employees
WHERE salary =(SELECT max(salary) FROM employees);

-- find the employee number, name, and salary for the employees whose salary is higher than the average salary throughout the company

SELECT employee_id, first_name,last_name, ROUND(AVG(salary),2) AS 'SALARY' FROM employees
WHERE salary >(SELECT AVG(salary) FROM employees);

-- find that all departments have at least one employee with a salary greater than 10,000. 

SELECT d.department_id,d.department_name FROM departments d
where EXISTS ( SELECT * FROM employees e where salary >10000 AND e.department_id=d.department_id) ORDER BY 1;

-- find all departments that do not have an employee with a salary greater than 10,000
SELECT d.department_id,d.department_name FROM departments d
where  NOT EXISTS ( SELECT * FROM employees e where salary >10000 AND e.department_id=d.department_id) ORDER BY 1;








