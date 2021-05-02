-- Number of Retiring Employees by Title
DROP TABLE retirement_titles;

SELECT e.emp_no, 
e.first_name,
e.last_name,
tit.title, 
tit.from_date,
tit.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as tit
ON e.emp_no = tit.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles AS rt
ORDER BY emp_no, to_date DESC;
SELECT * FROM unique_titles;

DROP TABLE retireing_titles;
SELECT COUNT(ut.title), title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY count DESC;
SELECT * FROM retiring_titles;

DROP TABLE mentorship_eligibility;
-- Employees Eligible for Mentorship Program
SELECT DISTINCT ON (emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
tit.title
INTO mentorship_eligibility
FROM employees as e
LEFT JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
LEFT JOIN titles as tit
ON (e.emp_no = tit.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;
SELECT * FROM mentorship_eligibility;