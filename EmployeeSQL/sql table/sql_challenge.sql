SELECT * FROM employees;
--1 below
SELECT a.emp_no, a.last_name, a.first_name, a.sex , b.salary
FROM employees a
JOIN salaries b 
ON a.emp_no= b.emp_no;
-- above i used the join keyword to join th salaries table 
--with the employees table , i used on to explain the reason
--of joining both tables

--2 below
SELECT first_name, last_name hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


--number 3 below
SELECT a.dept_no, a.dept_name, b.emp_no, c.last_name, c.first_name
--above specify columns 
FROM departments a
--above i selct from the departments table but i give it alias as 'a'
JOIN dept_manager b
--join is  used to join the tables 
ON a.dept_no = b.dept_no
--on is used to explain the reasoning for the join
JOIN employees c
--used another join
ON b.emp_no = c.emp_no;
-- used on the explain the reasoning for join on the above line of code 


--number 4 below
SELECT a.dept_no, c.emp_no, c.last_name, c.first_name,b.dept_name
FROM dept_manager a  

INNER JOIN departments b

ON a.dept_no =b.dept_no

INNER JOIN employees c
ON a.emp_no = c.emp_no
ORDER BY c.emp_no;

--order by is  used to sort something ex. aplha order 

--Number 5 below
--List first name, a.last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
--in the above line '%' is used for pattern matching for example '%B' would return anything that ends in a B 
--LIKE is used for  matching it has to contain an arguement after it


--number 6 below
---List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN (
	-- the IN function is used within a WHERE clause  to select a list of values being compared with a given expression 
  SELECT emp_no
  FROM departments
  WHERE dept_name = 'Sales'
);


--number 7 below 
-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
-- above we are joining the employees and dept_emp tables on the emp_no column 
INNER JOIN departments d ON de.dept_no = d.dept_no
--above we join the departments and dept_emp table on the emp_no column 
WHERE d.dept_name IN ('Sales', 'Development');
--we have touse  the dept_emp table to use the emp_no tolink the employees to their correct  departments

SELECT last_name, COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;


