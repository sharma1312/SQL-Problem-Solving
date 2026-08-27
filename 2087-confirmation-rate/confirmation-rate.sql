with d1 as (select s.user_id, count(c.action) confcount from signups s join confirmations c on s.user_id=c.user_id where c.action="confirmed" group by s.user_id)

, d2 as (select s.user_id, count(c.action) timeoutcount from signups s join confirmations c on s.user_id=c.user_id where c.action="timeout" group by s.user_id)

, d3 as(select user_id, count(*) as totalcount from confirmations c group by user_id)

select s.user_id, case when (confcount/totalcount) is null then 0 else round(((confcount/totalcount)), 2) end as confirmation_rate from signups s left join d1 on s.user_id=d1.user_id left join d3 on s.user_id=d3.user_id ;




