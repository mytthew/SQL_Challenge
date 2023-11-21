--QUESTION 1 
--List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
	"E"."Emp_No",
	"E"."Last_Name", 
	"E"."First_Name", 
	"E"."Sex", 
	"S"."Salary"
FROM "Employees" AS "E" 
JOIN "Salaries" AS "S" ON "E"."Emp_No" = "S"."Emp_No";

--QUESTION 2
--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
	"First_Name",
	"Last_Name",
	"Hire_Date"
FROM "Employees"
WHERE "Hire_Date" BETWEEN '1986-01-01' AND '1986-12-31';

--QUESTION 3
--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
	"D"."Dept_No", 
	"D"."Dept_Name", 
	"DE"."Emp_No", 
	"E"."Last_Name", 
	"E"."First_Name" 
FROM "Departments" AS "D"
JOIN "Dep_Emp" AS "DE" ON "D"."Dept_No" = "DE"."Dept_No"
JOIN "Employees" AS "E" ON "DE"."Emp_No" = "E"."Emp_No"

--QUESTION 4
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT
	"D"."Dept_No",
	"DE"."Emp_No",
	"E"."Last_Name",
	"E"."First_Name",
	"D"."Dept_Name"
FROM "Departments" AS "D"
JOIN "Dep_Emp" AS "DE" ON "D"."Dept_No" = "DE"."Dept_No" 
JOIN "Employees" AS "E" ON "DE"."Emp_No" = "E"."Emp_No"

--QUESTION 5
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
	"First_Name",
	"Last_Name",
	"Sex"
FROM "Employees"
WHERE "First_Name" = 'Hercules' AND "Last_Name" LIKE 'B%';

--QUESTION 6
--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
	"E"."Emp_No",
	"E"."Last_Name",
	"E"."First_Name"
FROM "Employees" as "E"
JOIN "Dep_Emp" as "DE" ON "E"."Emp_No" = "DE"."Emp_No"
JOIN "Departments" AS "D" on "DE"."Dept_No" = "D"."Dept_No"
WHERE "Dept_Name" = 'Sales';

--QUESTION 7
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	"E"."Emp_No",
	"E"."Last_Name",
	"E"."First_Name",
	"D"."Dept_Name"
FROM "Employees" as "E"
JOIN "Dep_Emp" as "DE" ON "E"."Emp_No" = "DE"."Emp_No"
JOIN "Departments" AS "D" on "DE"."Dept_No" = "D"."Dept_No"
WHERE "Dept_Name" IN ('Sales', 'Development');

--QUESTION 8
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
	"Last_Name",
	COUNT(*) AS "Last_Name_Count"
FROM "Employees"
GROUP BY "Last_Name"
ORDER BY "Last_Name_Count" DESC;
