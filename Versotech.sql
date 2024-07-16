-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Tempo de geração: 16/07/2024 às 18:19
-- Versão do servidor: 5.5.65-MariaDB
-- Versão do PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `Versotech`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `AUTOR`
--

CREATE TABLE IF NOT EXISTS `AUTOR` (
  `Ids` int(11) NOT NULL,
  `Nomes` varchar(255) DEFAULT NULL,
  `datas` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `AUTOR`
--

INSERT INTO `AUTOR` (`Ids`, `Nomes`, `datas`) VALUES
(1, 'joao', NULL),
(2, 'pedro', NULL),
(3, 'paulo', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `LIVRO`
--

CREATE TABLE IF NOT EXISTS `LIVRO` (
  `ID` int(11) NOT NULL,
  `NOME` varchar(255) DEFAULT NULL,
  `AUTOR_ID` int(11) DEFAULT NULL,
  `LANCAMENTO` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `LIVRO`
--

INSERT INTO `LIVRO` (`ID`, `NOME`, `AUTOR_ID`, `LANCAMENTO`) VALUES
(1, 'CÓDIGO LIMPO', 1, '2021-01-01'),
(2, 'TDD', 1, '2019-10-01'),
(3, 'ADS', 2, '2021-12-08'),
(4, 'SQL', 2, '2020-10-10');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `AUTOR`
--
ALTER TABLE `AUTOR`
  ADD PRIMARY KEY (`Ids`);

--
-- Índices de tabela `LIVRO`
--
ALTER TABLE `LIVRO`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `AUTOR_ID` (`AUTOR_ID`);

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `LIVRO`
--
ALTER TABLE `LIVRO`
  ADD CONSTRAINT `LIVRO_ibfk_1` FOREIGN KEY (`AUTOR_ID`) REFERENCES `AUTOR` (`Ids`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
