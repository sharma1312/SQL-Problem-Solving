with d1 as(select account_id, case when income<20000 then "Low Salary" when income between 20000 and 50000 then "Average Salary" when income>50000 then "High Salary" end as category from accounts)


, d2 as (select d1.account_id, d.category from d1 right join (SELECT 'Low Salary' AS category
UNION ALL
SELECT 'Average Salary'
UNION ALL
SELECT 'High Salary')d on d1.category=d.category)

select d2.category, count(account_id) accounts_count from d2 group by d2.category;



