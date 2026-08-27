with d1 as (select p.product_id, p.price, u.units, (p.price*u.units) as sales from prices p left join unitssold u on u.purchase_date between p.start_date and p.end_date and p.product_id=u.product_id)

select d1.product_id, coalesce((round((sum(d1.sales)/sum(d1.units)), 2)), 0) as average_price from d1 group by product_id;