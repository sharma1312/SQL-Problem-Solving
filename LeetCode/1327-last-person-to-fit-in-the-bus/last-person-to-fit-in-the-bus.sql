with d1 as (select person_id, person_name, weight, turn, sum(weight) over(order by turn) weightsum from queue order by turn)

select person_name from d1 where weightsum<=1000 and turn=(select max(turn) from d1 where weightsum<=1000);