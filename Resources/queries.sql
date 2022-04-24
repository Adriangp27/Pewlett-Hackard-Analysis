SELECT * FROM retirement_info;
SELECT * FROM dept_emp;
SELECT * FROM departments;



--List of Sales Team Retirees 
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.dept_no,
	d.dept_name
INTO sales_retirement_info
FROM retirement_info AS ri
INNER JOIN dept_emp AS de
ON (ri.emp_no = de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no)
WHERE dept_name = ('Sales');

--List of Mentor Program from sales and development departments
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	d.dept_name
INTO mentor_info
FROM retirement_info AS ri
INNER JOIN dept_emp AS de
ON (ri.emp_no = de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no)
WHERE dept_name IN ('Sales', 'Development');

-- 