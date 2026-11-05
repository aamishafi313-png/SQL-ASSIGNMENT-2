create database EMPLOYEE;
use EMPLOYEE;
CREATE TABLE  department_info(
department_id INT PRIMARY KEY,
department_name VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE locations(
location_id INT AUTO_INCREMENT PRIMARY KEY,
location VARCHAR(30) NOT NULL UNIQUE
);

INSERT INTO locations (location) VALUES ('Kerala');
INSERT INTO locations (location) VALUES ('Chennai');
INSERT INTO locations (location) VALUES ('Bangalore');
INSERT INTO locations (location) VALUES 
('Kollam'),
('Trivandrum'),
('Kochi'),
('Delhi');
INSERT INTO locations (location) VALUES ('USA'),('Idukki');

SELECT * FROM locations;

CREATE TABLE employees(
employee_id INT PRIMARY KEY ,
employee_name VARCHAR(50) NOT NULL,
gender ENUM('M','F'),
age INT CHECK(age >= 18),
hire_date DATE DEFAULT (current_date),
designation VARCHAR(250),
department_id INT,
FOREIGN KEY (department_id) REFERENCES department_info(department_id),
location_id int ,
FOREIGN KEY (location_id) REFERENCES locations(location_id),
salary DECIMAL(10,2)
);
SHOW TABLES;
DESC department_info;
DESC employees;
DESC locations;

INSERT INTO Department_info (department_id, department_name)
VALUES
(1, 'Finance'),
(2, 'HR'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'Sales');
SELECT * FROM department_info;

INSERT INTO Employees
(employee_id, employee_name, gender, age, hire_date,
 designation, department_id, location_id, salary)
VALUES
(1, 'Arun', 'M', 25, '2015-05-10', 'Data Analyst', 1, 1, 60000),
(2, 'Anu', 'F', 24, '2018-03-15', 'Business Analyst', 2, 2, 45000),
(3, 'Aami', 'F', 24, '2014-07-20', 'Software Developer', 3, 3, 75000),
(4, 'Meera', 'F', 26, '2018-06-12', 'Data Analyst', 1, 1, 55000),
(5, 'Shafi', 'M', 31, '2016-02-18', 'HR Manager', 2, 2, 65000),
(6, 'Diya', 'F', 23, '2019-01-25', 'Business Analyst', 3, 3, 40000),
(7, 'Vishnu', 'M', 28, '2015-09-14', NULL, 1, 1, 80000),
(8, 'Kavya', 'F', 27, '2018-08-22', 'Data Analyst', 2, 2, 50000),
(9, 'Amina', 'F', 20, '2013-04-11', 'Finance Manager', 1, 1, 90000),
(10, 'Sneha', 'F', 22, '2020-11-05', NULL, 3, 3, 35000),
(11, 'Ajay', 'M', 30, '2018-12-10', 'Business Analyst', 2, 2, 58000),
(12, 'Mehfi', 'F', 18, '2017-05-19', 'Accountant', 1, 1, 48000),
(13, 'Shamnad', 'M', 27, '2015-10-30', 'Data Analyst', 3, 3, 62000),
(14, 'Priya', 'F', 29, '2018-04-16', 'HR Executive', 2, 2, 52000),
(15, 'Manu', 'M', 24, '2019-07-21', 'Software Developer', 1, 1, 70000);

SELECT DISTINCT salary FROM employees;

SELECT age AS Employee_Age,salary AS Employee_Salary FROM Employees;

SELECT * FROM Employees WHERE salary > 50000 AND hire_date < '2016-01-01';

SELECT * FROM Employees WHERE designation IS NULL;

UPDATE Employees SET designation = 'Data Scientist' WHERE designation IS NULL;
SET SQL_SAFE_UPDATES=0;

SELECT employee_id, employee_name, designation
FROM Employees;

SELECT * FROM Employees ORDER BY department_id ASC, salary DESC;

SELECT * FROM Employees WHERE hire_date >= '2018-01-01' AND hire_date < '2019-01-01'
ORDER BY hire_date ASC LIMIT 5;

SELECT SUM(salary) AS Total_Finance_Salary
FROM Employees
WHERE department_id = 1;

SELECT MIN(age) AS Minimum_Age
FROM Employees;


SELECT location_id, MAX(salary) AS Maximum_Salary FROM Employees GROUP BY location_id;


SELECT designation,
	AVG(salary) AS Average_Salary 
    FROM Employees WHERE designation LIKE '%Analyst%' 
    GROUP BY designation;
 
 
SELECT department_id, COUNT(*) AS Total_Employees
FROM Employees 
GROUP BY department_id HAVING COUNT(*) < 3; -- it have more than 3 employees

SELECT location_id,AVG(age) AS Average_Age FROM Employees
WHERE gender = 'F' GROUP BY location_id HAVING AVG(age) < 30;


SELECT e.employee_name,e.designation,d.department_name
FROM employees e
INNER JOIN department_info d ON e.department_id = d.department_id;


SELECT d.department_name,COUNT(e.employee_id) AS Total_Employees
FROM department_info d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;


SELECT l.location,e.employee_name
FROM employees e
RIGHT JOIN locations l
ON e.location_id = l.location_id;

