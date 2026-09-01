with d1 as(select employee_id, name, reports_to, age, count(reports_to) over(partition by reports_to) as reports_count from employees)

select d1.reports_to employee_id, e.name,  max(reports_count) reports_count, round((avg(d1.age)), 0) average_age from d1 join employees e on d1.reports_to=e.employee_id group by d1.reports_to having d1.reports_to is not null order by d1.reports_to;


