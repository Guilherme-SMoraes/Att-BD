# Questão 1
select i.ID,i.name as Nome, count(sec_id) as Numero_de_sections
from instructor i 
    natural left outer join teaches t
    group by(i.ID,i.name);
    
# Questão 2
select ID, name,
(select count(*) as "Number of sections"
from teaches T 
    where T.id = I.id) as a
from instructor I;
    
# Questão 3
select s.sec_id,if(i.name=null,'-',i.name) as Nome
from section s
        natural left outer join teaches t
        natural left outer join instructor i
    where
s.year = "2010" and
        s.semester = "Spring";
        
# Questão 4
/*create table grade_points(
	grade varchar(2),
    points decimal(2,1),
    primary key(grade)
);
insert into grade_points values
('A+',4),
('A',3.7),
('A-',3.4),
('B+',3.1),
('B',2.8),
('B-',2.5),
('C+',2.2),
('C',1.9),
('C-',1.6),
('D+',1.3),
('D',1),
('D-',0.7),
('E+',0.4),
('E',0.1);

alter table takes
add constraint grades_takes
foreign key (grade) references grade_points(grade)*/

SELECT name, course.title, format(sum(points * credits),1) from
(((takes natural join section) natural join course) natural join grade_points) natural join student
group by id,name,title;

# Questão 5
create view notas_aluno as 
SELECT ID, format(sum(points * credits),1) as CR from
(((takes natural join section) natural join course) natural join grade_points) natural join student
group by id,name,title;

select * from notas_aluno

