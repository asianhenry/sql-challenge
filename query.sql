--List employee number,last name, first name, gender, and salary
SELECT
	employees.emp_no as employee_number,
	last_name,
	first_name,
	gender,
	salaries.salary
FROM employees
JOIN salaries on employees.emp_no = salaries.emp_no;

--List employees who were hired in 1986
SELECT
	emp_no,
	first_name,
	last_name,
	hire_date
FROM employees
WHERE EXTRACT(year from hire_date)=1986;

--List the manager of each department with following:
--department number, department name, employee number, 
--last name, first name, and start and end employment dates

SELECT
	dept_manager.dept_no as department_number,
	departments.dept_name as department_name,
	employees.emp_no as employee_number,
	employees.last_name,
	employees.first_name,
	dept_manager.from_date as start_date,
	dept_manager.to_date as end_date
FROM employees
JOIN dept_manager on employees.emp_no=dept_manager.emp_no
JOIN departments on dept_manager.dept_no=departments.dept_no;

--List the department of each employee with following: 
--employee number, last name, first name, and department name

--Both of these work
SELECT
	dept_emp.emp_no as employee_number,
	employees.last_name,
	employees.first_name,
	departments.dept_name as department_name
FROM dept_emp
JOIN employees on dept_emp.emp_no = employees.emp_no
JOIN departments on dept_emp.dept_no = departments.dept_no;

SELECT
	dept_emp.emp_no as employee_number,
	employees.last_name,
	employees.first_name,
	departments.dept_name as department_name
FROM employees
JOIN dept_emp on employees.emp_no =dept_emp.emp_no
JOIN departments on dept_emp.dept_no = departments.dept_no;

--List all employees whose first name is "Hercules" and 
--last names begin with "B."

SELECT * FROM employees
WHERE 
	first_name = 'Hercules' AND
	last_name LIKE 'B%';
	
--List employees in Sales department
--emp_no, last name, first name, dept name
SELECT
	employees.emp_no as employee_number,
	employees.last_name,
	employees.first_name,
	departments.dept_name as department_name
FROM employees
JOIN dept_emp on employees.emp_no =dept_emp.emp_no
JOIN departments on dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales';

--List employees in Sales and Development
--emp_no, last name, first name, department name
SELECT
	employees.emp_no as employee_number,
	employees.last_name,
	employees.first_name,
	departments.dept_name as department_name
FROM employees
JOIN dept_emp on employees.emp_no = dept_emp.emp_no
JOIN departments on dept_emp.dept_no = departments.dept_no
	WHERE dept_name = 'Sales' OR dept_name = 'Development';
	
--In descending order, list the frequency count of employee last names
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT DESC;