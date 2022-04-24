# Pewlett-Hackard-Analysis
## Project Overview
In the upcoming year Pewlett Hackard will conduct an internal audit to find out how many of their employees will retire. The audit will also identify which employees are eligible for mentorship programs to enable smooth transitions between roles. Following is a list of deliverables in accordance with thte company's specifications.

1. Determining the employees retirement based on their age.
2. Providing a count for retirements in each department.
3. Identifying the positions and titles that need to be filled due to retirements.
4. Name of the employees who qualify for the mentorship program, indicating their title,employee number, their birth date, and their date of employment.

# Resources
Data Source: departments.csv, dept_emp.csv, dept_manager.csv, employees.csv, salaries.csv, titles.csv
Software: pgAdmin 6.7, Visual Studio Code 1.66.2

# Results
The retirement analysis shows that:

A total of 90,398 employees are at risk of retiring this year. The Senior Engineer department is expected to lose the most employees due to retirement.

The mentorship eligibility analysis shows that:

The mentoring program is only accessible to 1,549 of all potential retirees. Since most positions are senior or upper level, most of the new mentors are advancing junior employees into those open positions.

# Summary
Without including those eligible for the mentorship program, the upcoming 'Silver Tsunami' could lose 90,398 employees. With the mentorship program, perhaps adding 1,549 more employees, there are still a considerable number of roles that need to be filled. Approximately 1 mentore for every 58 new employees would be the mentor-to-new employee ratio.


SELECT  title,
	COUNT(title)
INTO mentor_count
FROM mentorship_eligibility
GROUP BY title
ORDER BY COUNT(title) DESC;


You can use the query below to create a more detailed breakdown of how many potential mentors there are per role that could be filled compared to how many new roles must be filled per title.


SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO potential_promotion_engineer
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no) 
WHERE (birth_date BETWEEN '1956-01-01' AND '9999-01-01')
	AND de.to_date = ('9999-01-01')
	AND title = ('Engineer')
ORDER BY emp_no;


To conclude, an analysis can be conducted to determine how many promotions can be done versus how many new hires are needed to keep up with the changes. The query below could be used as a basis for the analysis. In this way, the human resources department of the company would have a clear idea of when each of the titles may be promoted.