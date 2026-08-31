with d1 as ((select r.requester_id as ids from requestaccepted r) union all (select r.accepter_id as aid1 from requestaccepted r))

select d1.ids as id, count(ids) as num from d1 group by ids order by count(ids) desc limit 1;
