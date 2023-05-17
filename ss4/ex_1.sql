select *
from subject
order by credit desc
limit 1;

select *
from mark
where mark = (
select max(mark)
from mark
);

select avg(mark.mark),student.*
from student 
join mark
on student.student_id = mark.student_id
group by student.student_id