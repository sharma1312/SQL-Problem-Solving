with d1 
as 
(select e.id as eid, e.name as ename , e.salary, e.departmentid, d.id as did, d.name, dense_rank() over(partition by d.name order by e.salary desc) as Sal from employee e join department d on e.departmentid=d.id)

select d1.name as Department, d1.ename as Employee, d1.salary as Salary from d1 where d1.Sal<=3;