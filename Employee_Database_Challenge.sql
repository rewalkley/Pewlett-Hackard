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
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
ORDER BY _____, _____ DESC;
