/*CRIAR UMA TABELA DE NOME CLIENTE/*

/*UPDATE SALVAR DOIS CAMPOS EM UMA NOVA TABELA CHAMADA LOG_CLIENTE*/

delete from cliente01 where cpf = 2;
select * from cliente01;
UPDATE cliente01 set nome = "Marcos" where cpf = 1;
select * from log_autoria_clientes01;
drop table cliente01;
drop table log_autoria_clientes01;

create table cliente01(
cpf int auto_increment primary key,
nome varchar (50),
idade int(50),
data_de_nascimento date);

create table log_autoria_clientes01 (
cpf int auto_increment primary key,
cliente_cpf int,
acao varchar (50),
nome_antigo varchar (50),
nome_novo varchar (50),
data_hora timestamp default current_timestamp,
usuario varchar (50));

DELIMITER $$
create trigger trg_after_update_clientes01
after update ON cliente01
for each row
begin
if OLD.nome <> NEW.nome THEN
INSERT INTO log_autoria_clientes01 (cliente_cpf, acao, nome_antigo, nome_novo, usuario)
VALUES (OLD.cpf, 'UPDATE_NOME', OLD.nome, NEW.nome, USER());
END IF;

IF OLD.idade <> new.idade THEN
INSERT INTO log_autoria_clientes01 (cliente_cpf, acao, nome_antigo, nome_novo, usuario)
VALUES (OLD.cpf, 'UPDATE_IDADE', OLD.idade, NEW.idade, USER());
END IF;
END$$

INSERT INTO cliente01 (nome, idade, data_de_nascimento)
VALUES ("Leonardo", 27, '1999-02-17'),
       ("Luan", '25', '1998-03-15');