with d1 as (select customer_id , count(distinct product_key) bcount, (select count(*) from product) tcount from customer group by customer_id)

select customer_id from d1 where bcount=tcount;