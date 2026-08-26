with d1 as (select id, recorddate as rd, temperature as temp, lag(temperature) over(order by recorddate)as prevtemp, lag(recorddate) over(order by recorddate) as prevdate from weather)

,d2 as (select d1.id, d1.rd, d1.temp, d1.prevtemp, d1.prevdate, datediff(d1.rd, d1.prevdate)as diff from d1)

select d2.id as Id from d2 where prevtemp is not null and temp>prevtemp and d2.diff=1;

