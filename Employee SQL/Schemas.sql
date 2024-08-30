-- Drop foreign key constraints first
ALTER TABLE dept_emp DROP CONSTRAINT IF EXISTS fk_dept_emp_dept_no;
ALTER TABLE dept_emp DROP CONSTRAINT IF EXISTS fk_dept_emp_emp_no;
ALTER TABLE dept_manager DROP CONSTRAINT IF EXISTS fk_dept_manager_dept_no;
ALTER TABLE dept_manager DROP CONSTRAINT IF EXISTS fk_dept_manager_emp_no;
ALTER TABLE employees DROP CONSTRAINT IF EXISTS fk_employees_emp_title;
ALTER TABLE salaries DROP CONSTRAINT IF EXISTS fk_salaries_emp_no;

-- Drop tables in the correct order
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- Create departments table
CREATE TABLE "departments" (
    "dept_no" VARCHAR(100) NOT NULL,
    "dept_name" VARCHAR(100) NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY ("dept_no")
);

-- Create dept_emp table
CREATE TABLE "dept_emp" (
    "emp_no" INTEGER NOT NULL,
    "dept_no" VARCHAR(100) NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY ("emp_no", "dept_no"),
    CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no"),
    CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no")
);

-- Create dept_manager table
CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(100) NOT NULL,
    "emp_no" INTEGER NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY ("dept_no", "emp_no"),
    CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no"),
    CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
);

-- Create employees table
CREATE TABLE "employees" (
    "emp_no" INTEGER NOT NULL,
    "emp_title" VARCHAR(100) NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "sex" CHAR(1) NOT NULL,
    "hire_date" DATE NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no"),
    CONSTRAINT "fk_employees_emp_title" FOREIGN KEY ("emp_title") REFERENCES "titles" ("title_id")
);

-- Create salaries table
CREATE TABLE "salaries" (
    "emp_no" INTEGER NOT NULL,
    "salary" INTEGER NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY ("emp_no"),
    CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
);

-- Create titles table
CREATE TABLE "titles" (
    "title_id" VARCHAR(100) NOT NULL,
    "title" VARCHAR(100) NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY ("title_id")
);

-- Query all tables
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;




