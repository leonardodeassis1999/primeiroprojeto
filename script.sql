DELIMITER $$
create trigger trg_emprestimo
after insert on emprestimos
for each row
begin

if new.status_livro  = 'emprestado' then 
update livros set quantidade = quantidade -1
where id = NEW.livro_id;
end if;
end$$

INSERT INTO livros (titulo, autor, quantidade)
VALUES ("senhor dos aneis", "Leonardo", '25');

INSERT INTO emprestimos (livro_id, aluno, status_livro)
VALUES ('1', "Luan", 'empretado');
      
