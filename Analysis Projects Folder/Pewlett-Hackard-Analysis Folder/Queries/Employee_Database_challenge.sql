
--Deliverable 1
--Retrieve the emp_no, first_name, and last_name columns from the Employees table.

SELECT title, from_date, to_date
FROM titles

-- Retrieve the title, from_date, and to_date columns from the Titles table.

SELECT emp_no, first_name, last_name
FROM employees



--Create a new table using the INTO clause.
--Join both tables on the primary key.
--Filter the data on the birth_date column to retrieve the 
--employees who were born between 1952 and 1955. Then, order by the employee number.


SELECT em.emp_no, first_name, last_name, title, from_date, to_date
INTO retirement_titles
FROM employees as em
INNER JOIN titles as ti
ON em.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;
--AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--to test if it worked
SELECT * FROM retirement_titles;



--Export the Retirement Titles table from the previous step as retirement_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
--Before you export your table, confirm that it looks like this image:
-- DONE



---Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
--These columns will be in the new table that will hold the most recent title of each employee.
--Use the DISTINCT ON statement to retrieve the first occurrence of the
-- Use Dictinct with Orderby to remove duplicate rows
--Create a Unique Titles table using the INTO clause.
--Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e. to_date) of the most recent title.

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--to test if it worked
SELECT * FROM unique_titles;


--Export the Unique Titles table as unique_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- DONE

--retrieve the number of employees by their most recent job title who are about to retire.
--First, retrieve the number of titles from the Unique Titles table.

SELECT COUNT(title), 
FROM unique_titles;


--Then, create a Retiring Titles table to hold the required information.
--Group the table by title, then sort the count column in descending order.

SELECT COUNT(title), title
INTO TABLE retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles

--Deliverable 2
--Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.


SELECT emp_no, first_name, birth_date
FROM employees

--Retrieve the from_date and to_date columns from the Department Employee table.

SELECT from_date, to_date
FROM dept_employees

--Retrieve the title column from the Titles table.

SELECT title
FROM titles

--Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.

SELECT DISTINCT ON (emp_no) emp_no
FROM retirement_titles




SELECT em.emp_no, first_name, last_name, title, from_date, to_date
INTO retirement_titles
FROM employees as em
INNER JOIN titles as ti
ON em.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;


Create a new table using the INTO clause.
--Join the Employees and the Department Employee tables on the primary key.
--Join the Employees and the Titles tables on the primary key.
--Filter the data on the to_date column to all the current employees, 
--then filter the data on the birth_date columns to get all the employees
 whose birth dates are between January 1, 1965 and December 31, 1965.
--Order the table by the employee number
Export the Mentorship Eligibility table as mentorship_eligibilty.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
Before you export your table, confirm that it looks like this image:



SELECT e.emp_no, e.first_name, e.birth_date,
    d.from_date, d.to_date
    t.title
INTO entorship_eligibilty
FROM employees as e
INNER JOIN dept_employees as d
ON (e.emp_no = d.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (d.to_date = '9999-01-01')
     AND 
     (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;