with d1 as (select query_name, round((avg(rating/position)), 2) as quality, count(rating) as totalcount from queries q group by query_name)
, d2 as (select query_name, count(rating) as poorcount from queries where rating<3 group by query_name)

select d1.query_name, d1.quality,coalesce((round(((d2.poorcount*100.0)/d1.totalcount), 2)), 0) as poor_query_percentage from d1 left join d2 on d1.query_name=d2.query_name;


