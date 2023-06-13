CREATE TABLE gafanhoto_assiste_curso (
    id INT NOT NULL AUTO_INCREMENT,
    data DATE,
    idgafanhoto INT,
    idcurso INT,
    PRIMARY KEY (id),
    FOREIGN KEY (idgafanhoto)
        REFERENCES gafanhotos (id),
    FOREIGN KEY (idcurso)
        REFERENCES cursos (idcurso)
)  DEFAULT CHARSET=UTF8;

insert into gafanhoto_assiste_curso values
(default, '2014-03-01', '1', '2'),
(default, '2015-12-22', '3', '6'),
(default, '2014-01-01', '22', '12'),
(default, '2016-05-12', '1', '19');

select * from gafanhoto_assiste_curso;

-- junções
select g.nome, a.idcurso, c.nome from gafanhotos g
join gafanhoto_assiste_curso a
on g.id = a.idgafanhoto
join cursos c
on a.idcurso = c.idcurso
order by g.nome;