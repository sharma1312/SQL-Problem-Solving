with v as (select t.id as tid, t.client_id as tcid, t.driver_id as tdid, t.status as tstat, t.request_at as tdate, c.banned as cbanned, d.banned as dbanned from trips t join users c on t.client_id=c.users_id join users d on t.driver_id=d.users_id where c.banned='No'and d.banned='No' and t.request_at between '2013-10-01' and '2013-10-03' )

,v1 as (select v.tdate, count(*) as validtrips from v group by v.tdate)

,v2 as (select v.tdate, count(*) as cancelledtrips from v where v.tstat!='completed' group by v.tdate order by v.tdate)


, v3 as (select v1.tdate, v1.validtrips, ifnull(v2.cancelledtrips, 0), ((ifnull(v2.cancelledtrips, 0))/(validtrips)) as rate from v1 left join v2 on v1.tdate=v2.tdate)

select v3.tdate as 'Day', round((v3.rate), 2) as 'Cancellation Rate' from v3;

