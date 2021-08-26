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

