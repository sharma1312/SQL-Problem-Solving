with d1 as (select player_id as pid, device_id as did, event_date as edate, games_played as gplayed, min(event_date) over(partition by player_id) inilogin, lead(event_date) over(partition by player_id order by event_date) nextlogin from activity)

, d2 as (select pid, did, edate, gplayed, inilogin, nextlogin, case when datediff(nextlogin, inilogin)=1 then "yes" else "no" end as logstatus from d1)


, d3 as(select pid, max(case when logstatus="yes" then 1 else 0 end) as ct, (select count(distinct pid) from d1) as totalcount from d2 group by pid)


select round((select sum(ct) from d3)/(select count(distinct pid) from d1), 2) as fraction;




