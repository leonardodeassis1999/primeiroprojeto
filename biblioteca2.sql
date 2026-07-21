create table autores(
id_autor int auto_increment primary key,
nome varchar (100) not null,
nacionalidade varchar(60) not null,
data_nascimento date not null,
email varchar(150) unique not null,
telefone varchar (15),
biografia text
);

create table editoras (
id_editora int auto_increment primary key,
nome varchar (100) not null,
cnpj varchar(20) unique,
endereco varchar(200),
cidade varchar (70),
estado varchar (70),
telefone varchar(20)
);

create table categorias (
id_categoria int auto_increment primary key,
nome varchar (100) not null,
descricao text,
codigo varchar (20) unique,
setor varchar (100),
ativo boolean default true,
data_criacao timestamp default current_timestamp
);

create table livros (
id_livro int auto_increment primary key,
titulo varchar(200) not null,
isbn varchar(20) unique,
ano_publicacao year,
quantidade int,
idioma varchar (50),
numero_paginas int,
id_editora int,
id_categoria int,
foreign key (id_editora) references editoras (id_editora),
foreign key (id_categoria) references categorias (id_categoria)
);

create table livro_autores (
id_livro_autor int auto_increment primary key,
id_livro int,
id_autor int,
funcao_autor varchar (100),
data_vinculo date,
observacao text,
ativo boolean default true,
foreign key (id_livro) references livros (id_livro),
foreign key (id_autor) references autores (id_autor)
);

create table funcionarios (
id_funcionario int auto_increment primary key,
nome varchar(100) not null,
cpf varchar(20) unique,
cargo varchar(100),
salario decimal(10,2),
telefone varchar(20),
email varchar(150),
data_admissao date
);

create table clientes (
id_cliente int auto_increment primary key,
nome varchar(150) not null,
cpf varchar(20) unique,
data_nascimento date,
endereco varchar(250),
telefone varchar(20),
email varchar(150),
data_cadastro timestamp default current_timestamp
);

create table emprestimos(
id_emprestimo int auto_increment primary key,
id_cliente int,
id_funcionario int,
data_emprestimo date not null,
data_devolucao_prevista date,
data_devolucao_real date,
status_emprestimo varchar(50),
valor_multa decimal(10,2),
foreign key (id_cliente) references clientes (id_cliente),
foreign key (id_funcionario) references funcionarios (id_funcionario)
);

create table itens_emprestimo (
id_item int auto_increment primary key,
id_emprestimo int,
id_livro int,
quantidade int,
valor_unitario decimal(10,2),
observacao text,
status_item varchar(50),
foreign key (id_emprestimo) references emprestimos (id_emprestimo),
foreign key (id_livro) references livros (id_livro)
);

create table multas (
id_multa int auto_increment primary key,
id_emprestimo int,
valor decimal(10,2),
motivo varchar(250),
data_multa date,
status_pagamento varchar(50),
data_pagamento date,
observacoes text,
foreign key (id_emprestimo) references emprestimos (id_emprestimo)
);

CREATE TABLE estoque (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    id_livro INT NOT NULL,
    quantidade_disponivel INT DEFAULT 0,
    quantidade_reservada INT DEFAULT 0,
    quantidade_total INT DEFAULT 0,
    localizacao VARCHAR(100),
    data_entrada DATE,
    ultima_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    foreign key (id_livro) references livros (id_livro)
    );


































alter table autores change `nome` nome varchar (100) not null;