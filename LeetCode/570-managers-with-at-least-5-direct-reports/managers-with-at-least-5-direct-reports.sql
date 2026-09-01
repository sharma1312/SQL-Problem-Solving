with d1 as (select id, name, managerid, count(*) over(partition by managerid) as ct from employee)

select name from d1 where id in (select managerid from d1 where d1.ct>=5);

