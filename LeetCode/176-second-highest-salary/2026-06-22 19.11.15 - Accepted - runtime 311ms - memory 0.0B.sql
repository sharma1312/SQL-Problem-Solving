with d1 as (select salary, dense_rank() over(order by salary desc) as drk from employee)
select max(salary) as SecondHighestSalary from d1 where drk=2;
