# Task 6 - Subqueries and Nested Queries

This task demonstrates the use of SQL subqueries and nested queries using sample `employees` and `departments` tables.

##  Objective
To use subqueries in:
- SELECT clause
- WHERE clause
- FROM clause

##  Concepts Covered
- Scalar Subquery
- Correlated Subquery
- Subquery in IN clause
- EXISTS Clause
- Derived Table (subquery in FROM)

##  Tools Used
- DB Browser for SQLite / MySQL Workbench

##  Tables Created
### `departments`
- department_id (Primary Key)
- department_name
- location

### `employees`
- employee_id (Primary Key)
- name
- department_id (Foreign Key)
- salary

##  Sample Queries
1. **Scalar Subquery in SELECT** - to get department name for each employee
2. **Subquery in WHERE with IN** - filter employees in departments located in Mumbai
3. **Correlated Subquery** - employees whose salary is above average in their department
4. **EXISTS Clause** - list departments that have employees
5. **Derived Table (FROM Subquery)** - average salary by department with condition

##  Files Included
- `task6.sql` - contains SQL table creation, data insertion, and subquery examples
