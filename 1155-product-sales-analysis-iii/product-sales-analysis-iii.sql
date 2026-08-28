with d1 as(select sale_id, product_id, year, quantity, price, min(year) over(partition by product_id) as first_year, case when year=(min(year) over(partition by product_id)) then "match" else "no match" end as mat from sales)

select product_id, first_year, quantity, price from d1 where mat="match";