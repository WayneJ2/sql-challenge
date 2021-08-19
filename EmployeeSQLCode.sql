-- One to one





--One to Many





CREATE TABLE Employees (
    id SERIAL,
    emp_no VARCHAR,
    emp_title_id VARCHAR,
    birthdate ,
    first_name VARCHAR,
    last_name VARCHAR,
    sex VARCHAR,
    hire_date,
);

CREATE TABLE Departments(
    dept_no VARCHAR,
    dept_name VARCHAR
);

CREATE TABLE Salaries(
    emp_no VARCHAR,
    salary INT,
);

CREATE TABLE titles(
    title_id VARCHAR,
    title VARCHAR
);

CREATE TABLE dept_emp(
    emp_no VARCHAR,
    dept_no VARCHAR
);

CREATE TABLE dept_manager(
    dept_no VARCHAR,
    emp_no varchar
);


