-- FILTER FOR RETIREMENT TITLES BY AGE
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;


-- REMOVE DUPLICATES FROM RETIREMENT TITLES
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_retirement_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;


--COUNT THE NUMBER OF EMPLOYEES ABOUT TO RETIRE
SELECT COUNT(title), 
	title 
INTO retiring_titles
FROM unique_retirement_titles
GROUP BY title
ORDER BY COUNT(title) DESC;


--ELIGIBLE EMPLOYEES FOR MENTORSHIP PROGRAM
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no) 
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND de.to_date = ('9999-01-01')
ORDER BY emp_no;
