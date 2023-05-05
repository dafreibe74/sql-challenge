--ANALYSIS

--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
INTO emp_details
FROM employees as e
	LEFT JOIN salaries as s 
	ON s.emp_no = e.emp_no
ORDER BY e.emp_no
;
select * from emp_details;

--List the first name, last name, and hire date for the employees who were hired in 1986 
SELECT last_name, first_name, hire_date
INTO emp_1986
FROM employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'
Order by hire_date
;
select * from emp_1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
into mgr_details
FROM departments as d
	JOIN dept_manager as m  
	ON d.dept_no = m.dept_no
	JOIN employees as e
	ON m.emp_no = e.emp_no
;
select * from mgr_details;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
into emp_bynum
FROM dept_manager as dm
	JOIN departments as d
	ON d.dept_no = dm.dept_no
	JOIN employees as e 
	ON e.emp_no = dm.emp_no
;
select * from emp_bynum;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT e.first_name, e.last_name, e.sex
INTO emp_herc
FROM employees as e
WHERE first_name = 'Hercules'
AND last_name Like 'B%'
;

select * from emp_herc;

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT d.dept_name, e.last_name, e.first_name
INTO emp_sales
FROM dept_emp as de
	JOIN employees as e
	ON de.emp_no = e.emp_no
	JOIN departments as d
	ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

select * from emp_sales;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
INTO emp_s_d
FROM dept_emp as de
	JOIN employees as e
	ON de.emp_no = e.emp_no
	JOIN departments as d
	ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' 
OR d.dept_name = 'Development';

select * from emp_s_d;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT e.last_name,
COUNT(e.last_name) AS "frequency"
INTO emp_last_sim
FROM employees as e
GROUP BY e.last_name
ORDER BY
COUNT(e.last_name) DESC;

select * from emp_last_sim;