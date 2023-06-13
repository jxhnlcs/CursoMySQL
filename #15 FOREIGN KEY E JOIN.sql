show databases;
desc beja_novonuma;
use cadastro;
show tables;

alter table gafanhotos
add column cursopreferido int;

desc gafanhotos;

alter table gafanhotos
add foreign key (cursopreferido)
references cursos(idcurso);

select * from gafanhotos;
select * from cursos;

update gafanhotos
set cursopreferido = '6'
where id = '1';

delete from cursos
where idcurso = '6';
delete from cursos
where idcurso = '28';

select nome, cursopreferido from gafanhotos;
select nome, ano from cursos;

select gafanhotos.nome, gafanhotos.cursopreferido, cursos.nome, cursos.ano from gafanhotos join cursos;

select g.nome,
c.nome, c.ano
from gafanhotos as g
join cursos as c -- o mesmo que 'inner join' (padrão)
on c.idcurso = g.cursopreferido
order by g.nome;

select g.nome,
c.nome, c.ano
from gafanhotos as g
left outer join cursos as c -- ou somente 'left join'
-- 'right outer join' ou somente 'right join'
on c.idcurso = g.cursopreferido;