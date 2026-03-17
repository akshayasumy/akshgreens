Create database company_db;
go;
Use company_db;
go;
CREATE TABLE skills (
    skill_id INT Auto_Increment PRIMARY KEY,
    skill_name VARCHAR(50) NOT NULL,
    category VARCHAR(50)
);
go;
INSERT INTO skills (skill_name, category) VALUES
( 'Python', 'Programming'),
( 'Project Management', 'Business'),
( 'SQL', 'Data Science'),
( 'Graphic Design', 'Creative'),
( 'Communication', 'Soft Skills'),
( 'React', 'Web Development'),
( 'Machine Learning', 'Data Science'),
( 'Spanish', 'Languages'),
( 'Public Speaking', 'Soft Skills'),
( 'Cloud Computing', 'IT Infrastructure');
go;
show databases;
go;
show tables;
go;
CREATE TABLE employee (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    hire_date DATE,
    salary DECIMAL(10, 2),
    dept_id INT,
    gender VARCHAR(10)
);
go;
ALTER TABLE employee RENAME TO staff;
go;
INSERT INTO staff(emp_name, email, hire_date, salary, dept_id, gender)
VALUES ('Alice Green', 'alice.green@company.com', '2024-01-10', 62000.00, 4, 'Female');
go;
CREATE TABLE department (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);
go;
CREATE TABLE project (
    project_id INT AUTO_INCREMENT PRIMARY KEY, 
    project_name VARCHAR(100) NOT NULL,
    budget DECIMAL(12, 2), 
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id) 
);
go;
INSERT INTO department (dept_name, location)
VALUES ('Sales', 'Boston');
go;
INSERT INTO project (project_name, budget) 
VALUES 
('Mobile App', 60000.00),
('Training Program', 25000.00);
go;
INSERT INTO staff (emp_name, email)
VALUES ('Tom', 'tom@company.com');
go;
INSERT INTO staff (emp_name, email,salary)
VALUES ('john doee', 'johndoee@company.com',60000.00);
go;
select*from staff;
go;
select emp_id,emp_name,salary from staff;
go;
SELECT * 
FROM staff
WHERE hire_date > '2023-01-01';
go;
SELECT * 
FROM project 
WHERE budget > 40000.00
ORDER BY budget DESC;
go;
SELECT DISTINCT location 
FROM department;
go;
SELECT location FROM department
UNION
SELECT location FROM department;
go;
alter table staff add column phone_no varchar(15);
go;
update staff set salary=65.000 where emp_name='john doe';
go;
update staff set gender='other' where dept_id=2;
go;
alter table staff drop column phone_no ;
go;
select*from staff where salary>60000 and salary<85000;
go;
select*from staff where emp_name like 'j%';
go;
select*from project where dept_id=1 or dept_id=2;
go;
select*from staff where email is not null;
go;
select*from department where location not in ('New York','Chicago');
go;
SELECT * 
FROM staff 
WHERE YEAR(hire_date) = 2023;
go;
select sum(salary) as totalamount from staff;
go;
select avg(budget) as avg from project;
go;
select max(salary) as highestsalary from staff;
go;
select count(dept_id) as total from department where dept_id=2;
go;
SELECT s.emp_name, d.dept_name
FROM staff s
JOIN department d ON s.dept_id = d.dept_id;
go;
SELECT d.dept_name, COUNT(s.emp_id) AS employee_count
FROM department d
LEFT JOIN staff s ON d.dept_id = s.dept_id
GROUP BY d.dept_id, d.dept_name;
go;
SELECT d.dept_name, COUNT(s.emp_id) AS employee_count
FROM department d
LEFT JOIN staff s ON d.dept_id = s.dept_id
GROUP BY d.dept_id, d.dept_name;
go;
SELECT p.project_name, d.dept_name
FROM project p
JOIN department d ON p.dept_id = d.dept_id;
go;
SELECT s.emp_name
FROM staff s
JOIN department d ON s.dept_id = d.dept_id
WHERE d.location = 'San Francisco';
go;
SELECT d.dept_name
FROM department d
LEFT JOIN project p ON d.dept_id = p.dept_id
WHERE p.project_id IS NULL;
go;

SELECT CONCAT(emp_name, ' ', last_name) AS "Full Name" 
FROM staff;
go;
SELECT UPPER(dept_name) AS "Department Name" 
FROM department;
go;
SELECT LEFT(email, 3) AS "Email Prefix" 
FROM staff;
go;
SELECT ABS(-50000) AS "Absolute Value";
go;
SELECT ROUND(AVG(salary), 2) AS "Average Salary" 
FROM staff;
go;
SELECT * FROM staff 
ORDER BY hire_date DESC 
LIMIT 3;
go;
SELECT * FROM staff 
ORDER BY emp_id 
LIMIT 3 OFFSET 3;
go;
SELECT emp_name, salary, 
       IF(salary >= 70000, 'High', 'Low') AS salary_bracket
FROM staff;
go;
SELECT project_name, budget,
    CASE 
        WHEN budget >= 60000 THEN 'Large'
        WHEN budget >= 40000 THEN 'Medium'
        ELSE 'Small'
    END AS budget_category
FROM project;
go;
SELECT dept_id, SUM(budget) AS total_department_budget
FROM project
GROUP BY dept_id;
go;
SELECT emp_name, LENGTH(emp_name) as name_length
FROM staff
ORDER BY LENGTH(emp_name) DESC
LIMIT 1;
go;
SELECT * FROM staff 
WHERE hire_date BETWEEN DATE_SUB('2025-03-22', INTERVAL 90 DAY) AND '2025-03-22';
go;
DELETE FROM staff 
WHERE salary < 60000;
go;
drop table project;
go;