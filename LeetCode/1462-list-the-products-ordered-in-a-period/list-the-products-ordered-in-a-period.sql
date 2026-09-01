with d1 as (select p.product_id, product_name, product_category, order_date, unit from products p join orders o on  p.product_id=o.product_id where date_format(order_date, "%Y-%m")="2020-02")

select product_name, sum(unit) unit from d1 group by product_name having sum(unit)>=100;