with d1 as (select id, recorddate rd, temperature temp,lag(temperature) over(order by recorddate) as prevtemp, lag(recorddate) over(order by recorddate) as prd from weather)

select d1.id from d1 where datediff(d1.rd, d1.prd)=1 and temp>prevtemp;

