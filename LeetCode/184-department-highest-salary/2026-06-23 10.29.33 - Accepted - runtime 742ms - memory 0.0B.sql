
with d1 as (select e.id as eid, e.name as ename, e.salary as esal, e.departmentid as deptid, d.id as did, d.name as dname, dense_rank() over(partition by d.name order by e.salary desc) drk from employee e join department d on e.departmentid=d.id)

select d1.dname as Department, d1.ename as Employee, d1.esal as Salary from d1 where drk=1;