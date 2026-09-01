with d1 as(select d.name department, e.name employee, e.salary, e.departmentid, d.name, dense_rank() over(partition by departmentid order by salary desc) as drk from employee e join department d on e.departmentid=d.id)

select department, employee, salary from d1 where drk<=3;