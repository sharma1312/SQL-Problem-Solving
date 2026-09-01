with d1 as(select id, num, lead(num) over( order by id ) next1, lead(num, 2) over(order by id ) next2 from logs)

select distinct num ConsecutiveNums from d1 where num=next1 and num=next2;