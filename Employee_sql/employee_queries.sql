-- Writing queries in employee_db

--1. List the following details of each employee: 
--   employee number, last name, first name, sex, and salary.
 
select e.emp_no, e.first_name, e.lasts_name, e.sex, s.salary
 from "Employee" as e
 left join "Salary" as s
 on e.emp_no = s.emp_no;
 
 --2. List first name, last name, and hire date for employees who 
 --    were hired in 1986.
 select * from "Employee"
 
 select e.first_name, e.lasts_name, e.hire_date
 from "Employee" as e
 where date_part('year', e.hire_date) = '1986';
 
 -- where date_trunc('year', e.hire_date)='19860101'
 
 --3. List the manager of each department with the following information: 
 --   department number, department name, the manager's employee number, 
--    last name, first name
 select d.dept_no, d.dept_name, m.emp_no, e.lasts_name,e.first_name
 from "Department" as d
 left join "Depart_manager" as m
 on d.dept_no = m.dept_no
 left join "Employee" as e
 on m.emp_no = e.emp_no;
 
 --4. department of each employee with the following information: 
 --   employee number, last name, first name, and department name.
 select e.emp_no, e.lasts_name, e.first_name, d.dept_name
 from "Employee" as e
 left join "Depart_employee" as de
 on e.emp_no = de.emp_no
 left join "Department" as d
 on de.dept_no = d.dept_no;
 
 --5. first name, last name, and sex for employees whose first name is
 --    "Hercules" and last names begin with "B."
 select e.lasts_name, e.first_name, e.sex
 from "Employee" as e
 where e.first_name = 'Hercules'
 and e.lasts_name like 'B%';
 
 --6. all employees in the Sales department, including their employee number, 
 --   last name, first name, and department name
 select e.emp_no, e.lasts_name, e.first_name, d.dept_name
 from "Employee" as e
 left join "Depart_employee" as de
 on e.emp_no = de.emp_no
 left join "Department" as d
 on de.dept_no = d.dept_no
 where d.dept_name = 'Sales';
 
 --7.all employees in the Sales and Development departments, including their 
 --  employee number, last name, first name, and department name
 select e.emp_no, e.lasts_name, e.first_name, d.dept_name
 from "Employee" as e
 left join "Depart_employee" as de
 on e.emp_no = de.emp_no
 left join "Department" as d
 on de.dept_no = d.dept_no
 where d.dept_name = 'Sales'
 or d.dept_name = 'Development';
 
 --8.frequency count of employee last names (i.e., how many employees share 
 --  each last name) in descending order
 select e.lasts_name, count(e.lasts_name) as "last_name_count"
 from "Employee" as e
 group by e.lasts_name
 order by "last_name_count" desc;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 