CREATE TABLE employees (
	EmployeeID INT NOT NULL PRIMARY KEY,
	DepID VARCHAR(30),
	birthday VARCHAR(30),
	firstname VARCHAR(20),
	lastname VARCHAR(30),
	sex VARCHAR(2),
	hire_date VARCHAR(30)
	)

CREATE TABLE departments (
	depid VARCHAR(30) PRIMARY KEY,
	depname VARCHAR(30))
	
CREATE TABLE dep_employee (
	EmployeeID INT NOT NULL,
	depid VARCHAR(30),
	FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
	FOREIGN KEY (depid) REFERENCES departments(depid))
	
CREATE TABLE dep_manager (
	depid VARCHAR(30),
	EmployeeID INT,
	FOREIGN KEY (depid) REFERENCES departments(depid),
	FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID))
	
CREATE TABLE salaries (
	EmployeeID INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID))

	
CREATE TABLE titles (
	titleid VARCHAR(10) PRIMARY KEY,
	title VARCHAR(30))

-- List the following details of each employee: employee number, last name, first name, sex, and salary:
SELECT employees.employeeid, employees.lastname, employees.firstname, employees.sex, salaries.salary FROM employees
JOIN salaries ON employees.employeeid=salaries.employeeid

--List first name, last name, and hire date for employees who were hired in 1986.
ALTER TABLE employees ALTER COLUMN hire_date TYPE DATE 
using to_date(hire_date, 'DMY');
SELECT firstname, lastname, hire_date FROM employees 
WHERE (hire_date >= '01-01-1986' AND hire_date <= '12-31-1986');

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT departments.depname, dep_manager.depid, dep_manager.employeeid, employees.firstname, employees.lastname FROM dep_manager
JOIN employees ON dep_manager.employeeid=employees.employeeid
JOIN departments ON dep_manager.depid=departments.depid
		
--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.employeeid, employees.lastname, employees.firstname, departments.depname FROM employees
JOIN dep_employee ON employees.employeeid=dep_employee.employeeid
JOIN departments ON departments.depid=dep_employee.depid

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT firstname, lastname, sex FROM employees
WHERE firstname = 'Hercules' AND lastname LIKE 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.employeeid, employees.lastname, employees.firstname, departments.depname FROM employees
JOIN dep_employee ON employees.employeeid=dep_employee.employeeid
JOIN departments ON departments.depid=dep_employee.depid
WHERE departments.depname = 'Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.employeeid, employees.lastname, employees.firstname, departments.depname FROM employees
JOIN dep_employee ON employees.employeeid=dep_employee.employeeid
JOIN departments ON departments.depid=dep_employee.depid
WHERE departments.depname = 'Sales' OR
departments.depname = 'Development'

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT DISTINCT COUNT(lastname), lastname FROM employees
GROUP BY lastname 
ORDER BY lastname DESC



