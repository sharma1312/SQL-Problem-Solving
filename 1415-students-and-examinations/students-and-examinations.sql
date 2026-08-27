with d1 as (select  s.student_id, s.student_name, su.subject_name, e.student_id as mainid from students s cross join subjects su left join examinations e on s.student_id=e.student_id and su.subject_name=e.subject_name)

select d1.student_id, d1.student_name, d1.subject_name, count(d1.mainid) attended_exams from d1 group by d1.student_id, d1.student_name, d1.subject_name order by d1.student_id, d1.subject_name;
