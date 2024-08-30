--Query all table
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM 
    employees AS e
INNER JOIN 
    salaries AS s
ON 
    e.emp_no = s.emp_no;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
    d.dept_no,
    d.dept_name,
    e.emp_no,
    e.last_name,
    e.first_name
FROM 
    dept_manager dm
INNER JOIN 
    departments d
ON 
    dm.dept_no = d.dept_no
INNER JOIN 
    employees e
ON 
    dm.emp_no = e.emp_no;
	
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
    de.dept_no,
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM 
    dept_emp de
INNER JOIN 
    departments d
ON 
    de.dept_no = d.dept_no
INNER JOIN 
    employees e
ON 
    de.emp_no = e.emp_no;
	
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT 
    first_name,
    last_name,
    sex
FROM 
    employees
WHERE 
    first_name = 'Hercules'
    AND last_name LIKE 'B%';
	
-- List each employee in the Sales department, including their employee number, last name, first name, and department name.
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name
FROM 
    employees e
INNER JOIN 
    dept_emp de
ON 
    e.emp_no = de.emp_no
INNER JOIN 
    departments d
ON 
    de.dept_no = d.dept_no
WHERE 
    d.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM 
    employees e
INNER JOIN 
    dept_emp de
ON 
    e.emp_no = de.emp_no
INNER JOIN 
    departments d
ON 
    de.dept_no = d.dept_no
WHERE 
    d.dept_name IN ('Sales', 'Development
	
-- List the frequency counts of all employee last names in descending order
SELECT 
    last_name,
    COUNT(*) AS frequency
FROM 
    employees
GROUP BY 
    last_name
ORDER BY 
    frequency DESC;

