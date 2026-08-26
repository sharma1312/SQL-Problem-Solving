with d1 as (select id, visit_date, people, row_number() over(order by id) as rn  from stadium where people>=100)

,d2 as ((select d1.id, d1.visit_date, d1.people, d1.rn, ((d1.id)-(d1.rn)) as diff from d1))

,d3 as (select d2.id, d2.visit_date, d2.people, d2.rn, d2.diff, count(*) over(partition by diff) as ct from d2)


select d3.id, d3.visit_date, d3.people from d3 where ct>=3 order by id asc;
