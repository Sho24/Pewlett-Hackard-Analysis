--Retrieve the emp_no, first_name, and last_name columns from the Employees table.
Select 	emp_no,
		first_name,
		last_name
from employees;

--Retrieve the title, from_date, and to_date columns from the Titles table.
Select 	title,
		from_date,
		to_date
from titles;

Select 
	emp.emp_no,
	emp.first_name,
	emp.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
From Employees emp
Inner Join titles ti
on emp.emp_no = ti.emp_no
Where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by emp.emp_no;

-----Export the Retirement Titles table from below query joinin Titles & Employee table
Select DISTINCT ON (emp.emp_no)
	emp.emp_no,
	emp.first_name,
	emp.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
From Employees emp
Inner Join titles ti
on emp.emp_no = ti.emp_no
Where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by emp.emp_no;

-- Retrieve the employee number, first and last name, and title columns from the Retirement Titles table
Select 
	emp_no,
	first_name,
	last_name,
	title
from retirement_titles;

---Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause
Select DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
from retirement_titles
order by emp_no,to_date desc;

Select * from Unique_titles;

---Use the DISTINCT ON statement to create Unique_titles table
Select Count(title) as "Count",title
into retiring_titles
from unique_titles
group by title
order by "Count" Desc;

-------------------------------------------------------------------------------- Deliverable 1 End Here ----------------------------------------------------------------------

---Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table

Select 	emp_no,
		first_name,
		last_name,
		birth_date
From Employees;


---Retrieve the from_date and to_date columns from the Department Employee table.
Select 	from_date,
		to_date
From dept_emp;

---Retrieve the title column from the Titles table.
Select 	title		
From titles;

---Export the Mentorship Eligibility table using Distinct ON clause
Select distinct on (emp.emp_no)
		emp.emp_no,
		emp.first_name,
		emp.last_name,
		emp.birth_date,
		demp.from_date,
		demp.to_date,
		ti.title
INTO mentorship_eligibilty
From Employees emp
Inner Join dept_emp demp
ON emp.emp_no= demp.emp_no
Inner Join titles ti
ON emp.emp_no=ti.emp_no
Where (birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
AND demp.to_date='9999-01-01'
Order by emp.emp_no;
-------------------------------------------------------------------------------- Deliverable 2 End Here ----------------------------------------------------------------------


