-------Database Queries

-- Run this query for all employees employee number, last name, first name, sex, and salary.
SELECT tbl_employees.employee_no, tbl_employees.last_name, tbl_employees.first_name, tbl_employees.gender, tbl_salaries.salary
FROM tbl_employees JOIN tbl_salaries ON (tbl_salaries.employee_no = tbl_employees.employee_no)

-- This query can bs used to query the hire date for a given employee. Will list their first name and last name and their hire date.
-- For the purpose of showcasing this script, the year 1986 is used.
SELECT tbl_employees.employee_no, tbl_employees.last_name, tbl_employees.first_name, tbl_employees.hire_date
FROM tbl_employees WHERE tbl_employees.hire_date BETWEEN '1986-01-01' AND '1986-12-31'

-- This query shows manager information. The information shown is: department number, department name, the manager's employee number, last name, first name.
SELECT a.dept_no, a.dept_name, b.employee_no, c.first_name, c.last_name
FROM tbl_department AS a
	JOIN tbl_dept_manager AS b ON (b.dept_no = a.dept_no)
	JOIN tbl_employees AS c ON (b.employee_no = c.employee_no)
	
-- This query will show an employees: employee number, last name, first name, and department name.
SELECT a.dept_no, a.dept_name, b.employee_no, c.first_name, c.last_name
FROM tbl_department AS a
	JOIN tbl_dept_employee AS b ON (b.dept_no = a.dept_no)
	JOIN tbl_employees AS c ON (b.employee_no = c.employee_no)
	
-- This query can be used to filter an employees first name and last name initial and their gender. 
-- This query demonstrates this by displaying employees with the first name Hercules and last name initial B. 
SELECT a.first_name, a.last_name, a.gender
FROM tbl_employees AS a
WHERE a.first_name = 'Hercules' AND LEFT (a.last_name, 1) = 'B'

-- This query can give you the employee information based on department. The information returned is: employee number, last name, first name, and department name.
-- For query demonstration the Sales department is queried.
SELECT a.dept_name, b.employee_no, c.last_name, c.first_name
FROM tbl_department AS a
	JOIN tbl_dept_employee AS b ON (b.dept_no = a.dept_no)
	JOIN tbl_employees AS c ON (b.employee_no = c.employee_no)
WHERE a.dept_name = 'Sales'

-- This query returns employees from two different departments. The information returned is: employee number, last name, first name, and department name.
SELECT a.dept_name, b.employee_no, c.last_name, c.first_name
FROM tbl_department AS a
	JOIN tbl_dept_employee AS b ON (b.dept_no = a.dept_no)
	JOIN tbl_employees AS c ON (b.employee_no = c.employee_no)
WHERE a.dept_name = 'Sales' OR a.dept_name = 'Development'

-- This query returns the count of last names of the employee. For example, Baba has a count of 226, meaning 226 employees share the last name of Baba.
			-- Solution Assistance Found on StackOverflow from user Erwin Brandstetter
SELECT a.last_name, count(*) AS count 
FROM tbl_employees AS a GROUP BY 1
ORDER BY count DESC;


