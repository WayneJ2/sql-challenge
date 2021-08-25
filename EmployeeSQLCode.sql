-- CREATE DEPARTMENT REFERENCE TABLE
CREATE TABLE departments (
    dept_no VARCHAR PRIMARY KEY NOT NULL,
    dept_name VARCHAR NOT NULL
    );

-- CREATE TITLES REFERENCE TABLE
CREATE TABLE titles (
    title_id VARCHAR PRIMARY KEY NOT NULL,
    title VARCHAR NOT NULL
    );

-- CREATE EMPLOYEES TABLE
CREATE TABLE employees (
    emp_no VARCHAR PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birthdate DATE,
    first_name VARCHAR,
    last_name VARCHAR NOT NULL,
    sex VARCHAR,
    hire_date DATE,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
    );

-- CREATE SALARIES TABLE
CREATE TABLE salaries (
    emp_no VARCHAR PRIMARY KEY NOT NULL,
    salary INT,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
    );

-- CREATE DEPT EMPLOYEE TABLE
CREATE TABLE dept_emp(
    emp_no VARCHAR NOT NULL,
    dept_no VARCHAR NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
    PRIMARY KEY (emp_no, dept_no)
    );

-- CREATE MANAGER TABLE
CREATE TABLE dept_manager(
    dept_no VARCHAR NOT NULL,
    emp_no VARCHAR NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
    PRIMARY KEY (dept_no, emp_no)
    );


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

--BONUS QUESTION
