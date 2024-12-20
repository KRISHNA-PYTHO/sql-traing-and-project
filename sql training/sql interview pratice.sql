use shield;
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    job_title VARCHAR(50),
    department VARCHAR(50),
    hire_date DATE,
    salary DECIMAL(10, 2)
);

INSERT INTO Employees (employee_id, name, email, phone_number, job_title, department, hire_date, salary) 
VALUES(1, 'Priya Mehta', 'priya.mehta@example.com', '9876543210', 'Sales Manager', 'Sales', '2020-03-15', 75000.00),
(2, 'Arjun Verma', 'arjun.verma@example.com', '9123456789', 'Marketing Executive', 'Marketing', '2021-06-20', 55000.00),
(3, 'Sneha Roy', 'sneha.roy@example.com', '9988776655', 'Product Manager', 'Product Development', '2019-10-05', 95000.00),
(4, 'Rahul Sharma', 'rahul.sharma@example.com', '9876123456', 'Regional Sales Executive', 'Sales', '2022-02-10', 45000.00),
(5, 'Meera Iyer', 'meera.iyer@example.com', '9123456788', 'HR Manager', 'Human Resources', '2018-12-01', 80000.00),
(6, 'Anil Kapoor', 'anil.kapoor@example.com', '9998877665', 'Finance Analyst', 'Finance', '2021-04-15', 60000.00),
(7, 'Kavita Jain', 'kavita.jain@example.com', '9823456710', 'Digital Marketing Specialist', 'Marketing', '2023-01-05', 50000.00),
(8, 'Amit Mishra', 'amit.mishra@example.com', '9876549999', 'Logistics Manager', 'Operations', '2017-07-23', 70000.00),
(9, 'Sunita Gupta', 'sunita.gupta@example.com', '8765432190', 'Product Designer', 'Product Development', '2019-11-30', 85000.00),
(10, 'Rohan Das', 'rohan.das@example.com', '9123345678', 'Customer Service Manager', 'Customer Support', '2020-08-17', 65000.00);

select * from employees;

SELECT MAX(salary) FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);

SELECT TOP 1 salary FROM (SELECT DISTINCT TOP 2 SALARY FROM employees
ORDER BY salary DESC)
RESULT 
ORDER BY salary;

SELECT salary , DENSE_RANK () OVER  (ORDER BY salary DESC) AS denserank
FROM employees;

WITH RESULT AS(
SELECT salary,DENSE_RANK() OVER(ORDER BY salary DESC) AS denserank
FROM employees)
SELECT SALARY FROM RESULT WHERE RESULT.denserank = 10;