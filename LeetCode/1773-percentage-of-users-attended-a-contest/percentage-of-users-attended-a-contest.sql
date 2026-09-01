with d1 as(
select contest_id, count(r.user_id) as regcount, (select count(user_id) from users) totalcount from users u join register r on u.user_id=r.user_id group by contest_id)

select d1.contest_id, round(((d1.regcount*100.0)/d1.totalcount), 2) percentage from d1 order by (d1.regcount/d1.totalcount) desc, contest_id;

