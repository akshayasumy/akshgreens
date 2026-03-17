Create database company_db;
Use company_db;
CREATE TABLE skills (
    skill_id INT Auto_Increment PRIMARY KEY,
    skill_name VARCHAR(50) NOT NULL,
    category VARCHAR(50)
);

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

show databases;

show tables;

CREATE TABLE employee (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    hire_date DATE,
    salary DECIMAL(10, 2),
    dept_id INT,
    gender VARCHAR(10)
);

ALTER TABLE employee RENAME TO staff;

INSERT INTO staff(emp_name, email, hire_date, salary, dept_id, gender)
VALUES ('Alice Green', 'alice.green@company.com', '2024-01-10', 62000.00, 4, 'Female');

CREATE TABLE department (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);

CREATE TABLE project (
    project_id INT AUTO_INCREMENT PRIMARY KEY, 
    project_name VARCHAR(100) NOT NULL,
    budget DECIMAL(12, 2), 
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id) 
);
INSERT INTO department (dept_name, location)
VALUES ('Sales', 'Boston');

INSERT INTO project (project_name, budget) 
VALUES 
('Mobile App', 60000.00),
('Training Program', 25000.00);

INSERT INTO staff (emp_name, email)
VALUES ('Tom', 'tom@company.com');

INSERT INTO staff (emp_name, email,salary)
VALUES ('john doee', 'johndoee@company.com',60000.00);

select*from staff;

select emp_id,emp_name,salary from staff;

SELECT * 
FROM staff
WHERE hire_date > '2023-01-01';

SELECT * 
FROM project 
WHERE budget > 40000.00
ORDER BY budget DESC;

SELECT DISTINCT location 
FROM department;

SELECT location FROM department
UNION
SELECT location FROM department;

alter table staff add column phone_no varchar(15);

update staff set salary=65.000 where emp_name='john doe';

update staff set gender='other' where dept_id=2;

alter table staff drop column phone_no ;

select*from staff where salary>60000 and salary<85000;

select*from staff where emp_name like 'j%';

select*from project where dept_id=1 or dept_id=2;

select*from staff where email is not null;

select*from department where location not in ('New York','Chicago');

SELECT * 
FROM staff 
WHERE YEAR(hire_date) = 2023;

select sum(salary) as totalamount from staff;

select avg(budget) as avg from project;

select max(salary) as highestsalary from staff;
 
select count(dept_id) as total from department where dept_id=2;

SELECT s.emp_name, d.dept_name
FROM staff s
JOIN department d ON s.dept_id = d.dept_id;

SELECT d.dept_name, COUNT(s.emp_id) AS employee_count
FROM department d
LEFT JOIN staff s ON d.dept_id = s.dept_id
GROUP BY d.dept_id, d.dept_name;

SELECT d.dept_name, COUNT(s.emp_id) AS employee_count
FROM department d
LEFT JOIN staff s ON d.dept_id = s.dept_id
GROUP BY d.dept_id, d.dept_name;

SELECT p.project_name, d.dept_name
FROM project p
JOIN department d ON p.dept_id = d.dept_id;

SELECT s.emp_name
FROM staff s
JOIN department d ON s.dept_id = d.dept_id
WHERE d.location = 'San Francisco';

SELECT d.dept_name
FROM department d
LEFT JOIN project p ON d.dept_id = p.dept_id
WHERE p.project_id IS NULL;


SELECT CONCAT(emp_name, ' ', last_name) AS "Full Name" 
FROM staff;

SELECT UPPER(dept_name) AS "Department Name" 
FROM department;

SELECT LEFT(email, 3) AS "Email Prefix" 
FROM staff;

SELECT ABS(-50000) AS "Absolute Value";

SELECT ROUND(AVG(salary), 2) AS "Average Salary" 
FROM staff;

SELECT * FROM staff 
ORDER BY hire_date DESC 
LIMIT 3;

SELECT * FROM staff 
ORDER BY emp_id 
LIMIT 3 OFFSET 3;

SELECT emp_name, salary, 
       IF(salary >= 70000, 'High', 'Low') AS salary_bracket
FROM staff;

SELECT project_name, budget,
    CASE 
        WHEN budget >= 60000 THEN 'Large'
        WHEN budget >= 40000 THEN 'Medium'
        ELSE 'Small'
    END AS budget_category
FROM project;

SELECT dept_id, SUM(budget) AS total_department_budget
FROM project
GROUP BY dept_id;

SELECT emp_name, LENGTH(emp_name) as name_length
FROM staff
ORDER BY LENGTH(emp_name) DESC
LIMIT 1;

SELECT * FROM staff 
WHERE hire_date BETWEEN DATE_SUB('2025-03-22', INTERVAL 90 DAY) AND '2025-03-22';

DELETE FROM staff 
WHERE salary < 60000;

drop table project;