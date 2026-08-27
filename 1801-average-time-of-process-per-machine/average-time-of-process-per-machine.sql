with d1 as(select machine_id, timestamp sts from activity where activity_type='start'),
d2 as (select machine_id, timestamp ets from activity where activity_type='end')
select d1.machine_id, round((avg(d2.ets-d1.sts)), 3) as processing_time from d1 join d2 on d1.machine_id=d2.machine_id group by machine_id;