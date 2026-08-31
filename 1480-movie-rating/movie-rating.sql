with d1 as(select m.movie_id, m.title, u.user_id, u.name, mr.rating, mr.created_at from movies m join movierating mr join users u on mr.movie_id=m.movie_id and mr.user_id=u.user_id)


, d2 as(select user_id, name, count(rating) as cnt from d1 group by user_id, name)


, d3 as(select movie_id, title, avg(rating) as avgr from d1 where date_format(created_at, "%Y-%m")="2020-02" group by movie_id, title)


(select name as results from d2 where cnt=(select max(cnt) from d2) order by name limit 1 )
union all
(select title from d3 where avgr=(select max(avgr) from d3) order by title limit 1);


