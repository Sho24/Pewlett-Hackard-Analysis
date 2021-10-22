# Pewlett-Hackard-Analysis

### Overview of Project
 The overview of the project is to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. Then, l write a report that summarizes the analysis and helps to prepare Bobby’s manager for the “silver tsunami” as many current employees reach retirement age.

    ## Results:

        ## Deliverable 1: The Number of Retiring Employees by Title

            # Create new table called "retirement_titles" by Joining Employees and Department data table base on their Primary Key iD (emp_no) and further flter down the query results on birthdate column to retieve the employees born between 1952 and 1955 using INTO caluse in SQL.

            # Using DISTINCT ON () caluse in SQL Select statement on newly created restirement_titles table generated another table called "unique_titles" to get uniq titles records. 

            # Base on the "unique_titles" table create summary table "retiring_titles" to determine the total number of retiring employees per title.

        ## Deliverable 2: The Employees Eligible for the Mentorship Program

            # Create "mentorship_eligibilty" table joining Dept_emp,Employee and Title table based on their primary key and to_date and birth_date filter, to identify employees who are eligible to participate in a mentorship program. 

    ## Summary:

        # Create unique_titles table using below sql query (using count and group by cluase) 

            Select Count(title) as "Count",title
            into retiring_titles
            from unique_titles
            group by title
            order by "Count" Desc;       

        # Create mentorship_eligibilty table using below sqL query (using Distinct ON () and order by caluse)
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

            