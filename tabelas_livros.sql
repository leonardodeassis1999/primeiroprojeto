-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/06/2026 às 01:50
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `tabelas_livros`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `emprestimos`
--

CREATE TABLE `emprestimos` (
  `cod_emprestimo` int(11) NOT NULL,
  `nome_aluno` varchar(50) NOT NULL,
  `data_emprestimo` date NOT NULL,
  `id_livros` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `emprestimos`
--

INSERT INTO `emprestimos` (`cod_emprestimo`, `nome_aluno`, `data_emprestimo`, `id_livros`) VALUES
(7, 'Leonardo de Melo', '2026-03-25', 11),
(8, 'Luan Matheus', '2026-03-24', 12),
(9, 'Leonardo de Melo', '2026-03-25', 11),
(10, 'Luan Matheus', '2026-03-24', 12),
(11, 'Leonardo de Melo', '2026-03-25', 11),
(12, 'Luan Matheus', '2026-03-24', 12);

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id_funcionarios` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cargo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id_funcionarios`, `nome`, `cargo`) VALUES
(1, 'Leonardo de Oliveira', 'Operar'),
(2, 'Luan Alex', 'Assistente'),
(3, 'Otávio', 'Programador'),
(4, 'Lucas', 'Auxiliar'),
(5, 'Leandro', 'Recepcionista');

-- --------------------------------------------------------

--
-- Estrutura para tabela `livros`
--

CREATE TABLE `livros` (
  `id_livros` int(11) NOT NULL,
  `título` varchar(50) NOT NULL,
  `autor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `livros`
--

INSERT INTO `livros` (`id_livros`, `título`, `autor`) VALUES
(9, 'um belo dia', 'Leonardo de Assis'),
(10, 'O amanhã melhor', 'Lucas Melo'),
(11, 'Cedo ou Tarde?', 'João Pedrinho'),
(12, 'Hj vivemos', 'Marcos Joaquin'),
(13, 'um belo dia', 'Leonardo de Assis'),
(14, 'O amanhã melhor', 'Lucas Melo'),
(15, 'Cedo ou Tarde?', 'João Pedrinho'),
(16, 'Hj vivemos', 'Marcos Joaquin'),
(17, 'um belo dia', 'Leonardo de Assis'),
(18, 'O amanhã melhor', 'Lucas Melo'),
(19, 'Cedo ou Tarde?', 'João Pedrinho'),
(20, 'Hj vivemos', 'Marcos Joaquin');

-- --------------------------------------------------------

--
-- Estrutura para tabela `setores`
--

CREATE TABLE `setores` (
  `cod_setor` int(11) NOT NULL,
  `nome_setor` varchar(50) NOT NULL,
  `andar` int(50) NOT NULL,
  `id_funcionarios` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `setores`
--

INSERT INTO `setores` (`cod_setor`, `nome_setor`, `andar`, `id_funcionarios`) VALUES
(1, 'setor 1', 1, 1),
(2, 'setor 2', 2, 2),
(3, 'setor 3', 3, 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD PRIMARY KEY (`cod_emprestimo`),
  ADD KEY `id_livros` (`id_livros`);

--
-- Índices de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id_funcionarios`);

--
-- Índices de tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`id_livros`);

--
-- Índices de tabela `setores`
--
ALTER TABLE `setores`
  ADD PRIMARY KEY (`cod_setor`),
  ADD KEY `id_funcionarios` (`id_funcionarios`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  MODIFY `cod_emprestimo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id_funcionarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `id_livros` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `setores`
--
ALTER TABLE `setores`
  MODIFY `cod_setor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD CONSTRAINT `emprestimos_ibfk_1` FOREIGN KEY (`id_livros`) REFERENCES `livros` (`id_livros`);

--
-- Restrições para tabelas `setores`
--
ALTER TABLE `setores`
  ADD CONSTRAINT `setores_ibfk_1` FOREIGN KEY (`id_funcionarios`) REFERENCES `funcionarios` (`id_funcionarios`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
