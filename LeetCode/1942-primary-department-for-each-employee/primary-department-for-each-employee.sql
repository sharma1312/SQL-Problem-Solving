with d1 as(select employee_id, department_id, primary_flag, count(department_id) over(partition by employee_id) ct from employee)

select employee_id, department_id from d1 where (ct=1) or (ct>1 and primary_flag="Y");