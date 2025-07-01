-- Create departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'HR', 'Mumbai'),
(2, 'IT', 'Delhi'),
(3, 'Finance', 'Mumbai'),
(4, 'Marketing', 'Bangalore');

-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    salary INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO employees VALUES
(101, 'Amit', 1, 50000),
(102, 'Riya', 2, 70000),
(103, 'Kabir', 2, 60000),
(104, 'Sana', 3, 65000),
(105, 'Neha', 4, 48000),
(106, 'Raj', 1, 52000);

-- 1. Subquery in SELECT clause (Scalar Subquery)
SELECT 
    employee_id, 
    name, 
    (SELECT department_name 
     FROM departments 
     WHERE departments.department_id = employees.department_id) AS dept_name
FROM employees;

-- 2. Subquery in WHERE clause (IN)
SELECT * 
FROM employees 
WHERE department_id IN 
    (SELECT department_id FROM departments WHERE location = 'Mumbai');

-- 3. Correlated Subquery in WHERE clause
SELECT name, salary 
FROM employees e 
WHERE salary > 
    (SELECT AVG(salary) 
     FROM employees 
     WHERE department_id = e.department_id);

-- 4. EXISTS Clause
SELECT * 
FROM departments d 
WHERE EXISTS 
    (SELECT 1 
     FROM employees e 
     WHERE e.department_id = d.department_id);

-- 5. Subquery in FROM clause (Derived Table)
SELECT department_id, avg_salary 
FROM 
    (SELECT department_id, AVG(salary) AS avg_salary 
     FROM employees 
     GROUP BY department_id) AS dept_avg
WHERE avg_salary > 50000;
