
select distinct email as Email from (select id, email, count(email) over(partition  by email) as ct from person)d1 where d1.ct>1;