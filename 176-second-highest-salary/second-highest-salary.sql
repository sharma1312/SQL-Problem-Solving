with d1 as(select id, salary, dense_rank() over(order by salary desc) as drk from employee)

select max(salary) SecondHighestSalary from d1 where drk=2;