
-- Question 1
SELECT 
	e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM 
	employees e
INNER JOIN
	salaries s ON
	e.emp_no=s.emp_no;

-- QUESTION 2
SELECT 
	first_name, last_name, hire_date
FROM
	employees
WHERE
	EXTRACT(YEAR FROM hire_date) = 1986;

-- QUESTION 3
SELECT 
	dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM 
	employees e
LEFT JOIN
    dept_manager dm ON
	dm.emp_no=e.emp_no
LEFT JOIN
	departments d ON
	dm.dept_no=d.dept_no
ORDER BY
	dm.dept_no;

-- QUESTION 4
SELECT 
	e.last_name, e.first_name, d.dept_name
FROM 
	employees e
LEFT JOIN
	dept_emp de ON
	de.emp_no=e.emp_no
LEFT JOIN
	departments d ON
	de.dept_no=d.dept_no
ORDER BY
	de.emp_no;

-- QUESTION 5
SELECT 
	first_name, last_name, sex
FROM 
	employees
WHERE 
	first_name = 'Hercules' AND last_name LIKE 'B%';


-- QUESTION 6
SELECT 
	de.emp_no, e.last_name, e.first_name, d.dept_name
FROM 
	employees e
LEFT JOIN
	dept_emp de ON
	de.emp_no=e.emp_no
LEFT JOIN
	departments d ON
	de.dept_no=d.dept_no
WHERE
	d.dept_name = 'Sales'
ORDER BY
	emp_no;


-- QUESTION 7
SELECT 
	de.emp_no, e.last_name, e.first_name, d.dept_name
FROM 
	employees e
LEFT JOIN
	dept_emp de ON
	de.emp_no=e.emp_no
LEFT JOIN
	departments d ON
	de.dept_no=d.dept_no
WHERE
	d.dept_name = 'Sales' OR
	d.dept_name = 'Development';


-- QUESTION 8
SELECT
	last_name, count(last_name)
FROM
	employees
GROUP BY
	last_name
ORDER BY
	last_name DESC;
