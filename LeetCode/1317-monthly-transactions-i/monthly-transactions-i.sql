with d1 as (select date_format(trans_date, '%Y-%m') month, country,count(state) trans_count , sum(amount)trans_total_amount from transactions group by date_format(trans_date, '%Y-%m'), country)


, d2 as(select date_format(trans_date, '%Y-%m') month, country, count(trans_date) as approved_count, sum(amount) approved_total_amount from transactions where state="approved" group by date_format(trans_date, '%Y-%m'), country)

select d1.month, d1.country, d1.trans_count, coalesce((d2.approved_count), 0) approved_count, d1.trans_total_amount, coalesce((d2.approved_total_amount), 0) approved_total_amount from d1 left join d2 on d1.month=d2.month and d1.country<=>d2.country group by d1.month, d1.country;
