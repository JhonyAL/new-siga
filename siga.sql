-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 18-Out-2023 às 11:23
-- Versão do servidor: 8.0.27
-- versão do PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `siga`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agenda`
--

DROP TABLE IF EXISTS `agenda`;
CREATE TABLE IF NOT EXISTS `agenda` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TITULO` varchar(255) DEFAULT NULL,
  `DESCRICAO` text,
  `DATA_HORA` datetime DEFAULT NULL,
  `TIPO` varchar(20) DEFAULT NULL,
  `ALUNO` int DEFAULT NULL,
  `PROFESSOR` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ALUNO` (`ALUNO`),
  KEY `PROFESSOR` (`PROFESSOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atividades`
--

DROP TABLE IF EXISTS `atividades`;
CREATE TABLE IF NOT EXISTS `atividades` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DESCRICAO` text,
  `DATA_ENTREGA` date DEFAULT NULL,
  `DATA_INICIO` date DEFAULT NULL,
  `DISCIPLINA` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `DISCIPLINA` (`DISCIPLINA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atividade_aluno`
--

DROP TABLE IF EXISTS `atividade_aluno`;
CREATE TABLE IF NOT EXISTS `atividade_aluno` (
  `ALUNO_ID` int DEFAULT NULL,
  `ATIVIDADE_ID` int DEFAULT NULL,
  `NOTA` varchar(2) DEFAULT NULL,
  KEY `ALUNO_ID` (`ALUNO_ID`),
  KEY `ATIVIDADE_ID` (`ATIVIDADE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

DROP TABLE IF EXISTS `curso`;
CREATE TABLE IF NOT EXISTS `curso` (
  `SIGLA` varchar(10) NOT NULL,
  `NOME` varchar(255) DEFAULT NULL,
  `CARGA_HORARIA` int DEFAULT NULL,
  `COORDENADOR` int DEFAULT NULL,
  PRIMARY KEY (`SIGLA`),
  KEY `COORDENADOR` (`COORDENADOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
CREATE TABLE IF NOT EXISTS `disciplina` (
  `CODIGO` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(255) DEFAULT NULL,
  `SIGLA` varchar(10) DEFAULT NULL,
  `PROFESSOR` int DEFAULT NULL,
  `CARGA_HORARIA` int DEFAULT NULL,
  `CURSO_SIGLA` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `PROFESSOR` (`PROFESSOR`),
  KEY `CURSO_SIGLA` (`CURSO_SIGLA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplinaaluno`
--

DROP TABLE IF EXISTS `disciplinaaluno`;
CREATE TABLE IF NOT EXISTS `disciplinaaluno` (
  `DISCIPLINA_CODIGO` int DEFAULT NULL,
  `ESTUDANTE_ID` int DEFAULT NULL,
  `FALTAS` int DEFAULT NULL,
  `BIMESTRE` int DEFAULT NULL,
  `MEDIA` varchar(2) DEFAULT NULL,
  KEY `ESTUDANTE_ID` (`ESTUDANTE_ID`),
  KEY `DISCIPLINA_CODIGO` (`DISCIPLINA_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

DROP TABLE IF EXISTS `endereco`;
CREATE TABLE IF NOT EXISTS `endereco` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RUA` varchar(255) DEFAULT NULL,
  `NUMERO` int DEFAULT NULL,
  `BAIRRO` varchar(255) DEFAULT NULL,
  `CIDADE` varchar(255) DEFAULT NULL,
  `ESTADO` varchar(255) DEFAULT NULL,
  `CEP` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estudante`
--

DROP TABLE IF EXISTS `estudante`;
CREATE TABLE IF NOT EXISTS `estudante` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ENDERECO_ID` int DEFAULT NULL,
  `CPF` varchar(11) DEFAULT NULL,
  `TELEFONES` varchar(255) DEFAULT NULL,
  `FOTO` varchar(300) DEFAULT NULL,
  `RA` varchar(50) DEFAULT NULL,
  `RM` varchar(50) DEFAULT NULL,
  `NOME` varchar(255) DEFAULT NULL,
  `DATANASCIMENTO` date DEFAULT NULL,
  `SENHA` varchar(255) DEFAULT NULL,
  `GENERO` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CPF` (`CPF`),
  KEY `ENDERECO_ID` (`ENDERECO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `estudante`
--

INSERT INTO `estudante` (`ID`, `ENDERECO_ID`, `CPF`, `TELEFONES`, `FOTO`, `RA`, `RM`, `NOME`, `DATANASCIMENTO`, `SENHA`, `GENERO`) VALUES
(1, NULL, '20202020232', '15998508650', 'https://i.pinimg.com/736x/b5/6e/08/b56e08c4d513524824f893c16e51931b.jpg', '202392132193', '20239213921', 'Daniel', '2006-09-23', 'danidani', 'M');

-- --------------------------------------------------------

--
-- Estrutura da tabela `matricula`
--

DROP TABLE IF EXISTS `matricula`;
CREATE TABLE IF NOT EXISTS `matricula` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ALUNO` int DEFAULT NULL,
  `CURSO_SIGLA` varchar(10) DEFAULT NULL,
  `FALTAS_TOTAIS` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ALUNO` (`ALUNO`),
  KEY `CURSO_SIGLA` (`CURSO_SIGLA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `noticias`
--

DROP TABLE IF EXISTS `noticias`;
CREATE TABLE IF NOT EXISTS `noticias` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TITULO` varchar(255) DEFAULT NULL,
  `CONTEUDO` text,
  `DATA_PUBLICACAO` datetime DEFAULT NULL,
  `AUTOR` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AUTOR` (`AUTOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `presenca`
--

DROP TABLE IF EXISTS `presenca`;
CREATE TABLE IF NOT EXISTS `presenca` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DATA_AULA` date DEFAULT NULL,
  `DISCIPLINA` int DEFAULT NULL,
  `ALUNO` int DEFAULT NULL,
  `PRESENTE` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `DISCIPLINA` (`DISCIPLINA`),
  KEY `ALUNO` (`ALUNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

DROP TABLE IF EXISTS `professor`;
CREATE TABLE IF NOT EXISTS `professor` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ENDERECO_ID` int DEFAULT NULL,
  `CPF` varchar(11) DEFAULT NULL,
  `TELEFONES` varchar(255) DEFAULT NULL,
  `FOTO` blob,
  `RA` varchar(10) DEFAULT NULL,
  `RM` varchar(10) DEFAULT NULL,
  `NOME` varchar(255) DEFAULT NULL,
  `GENERO` varchar(10) DEFAULT NULL,
  `DATANASCIMENTO` date DEFAULT NULL,
  `SENHA` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CPF` (`CPF`),
  KEY `ENDERECO_ID` (`ENDERECO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

DROP TABLE IF EXISTS `turma`;
CREATE TABLE IF NOT EXISTS `turma` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(255) DEFAULT NULL,
  `CURSO_SIGLA` varchar(10) DEFAULT NULL,
  `PROFESSOR` int DEFAULT NULL,
  `ALUNOS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CURSO_SIGLA` (`CURSO_SIGLA`),
  KEY `PROFESSOR` (`PROFESSOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`ALUNO`) REFERENCES `estudante` (`ID`),
  ADD CONSTRAINT `agenda_ibfk_2` FOREIGN KEY (`PROFESSOR`) REFERENCES `professor` (`ID`);

--
-- Limitadores para a tabela `atividades`
--
ALTER TABLE `atividades`
  ADD CONSTRAINT `atividades_ibfk_1` FOREIGN KEY (`DISCIPLINA`) REFERENCES `disciplina` (`CODIGO`);

--
-- Limitadores para a tabela `atividade_aluno`
--
ALTER TABLE `atividade_aluno`
  ADD CONSTRAINT `atividade_aluno_ibfk_1` FOREIGN KEY (`ALUNO_ID`) REFERENCES `estudante` (`ID`),
  ADD CONSTRAINT `atividade_aluno_ibfk_2` FOREIGN KEY (`ATIVIDADE_ID`) REFERENCES `atividades` (`ID`);

--
-- Limitadores para a tabela `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`COORDENADOR`) REFERENCES `professor` (`ID`);

--
-- Limitadores para a tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD CONSTRAINT `disciplina_ibfk_1` FOREIGN KEY (`PROFESSOR`) REFERENCES `professor` (`ID`),
  ADD CONSTRAINT `disciplina_ibfk_2` FOREIGN KEY (`CURSO_SIGLA`) REFERENCES `curso` (`SIGLA`);

--
-- Limitadores para a tabela `disciplinaaluno`
--
ALTER TABLE `disciplinaaluno`
  ADD CONSTRAINT `disciplinaaluno_ibfk_1` FOREIGN KEY (`ESTUDANTE_ID`) REFERENCES `estudante` (`ID`),
  ADD CONSTRAINT `disciplinaaluno_ibfk_2` FOREIGN KEY (`DISCIPLINA_CODIGO`) REFERENCES `disciplina` (`CODIGO`);

--
-- Limitadores para a tabela `estudante`
--
ALTER TABLE `estudante`
  ADD CONSTRAINT `estudante_ibfk_1` FOREIGN KEY (`ENDERECO_ID`) REFERENCES `endereco` (`ID`);

--
-- Limitadores para a tabela `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`ALUNO`) REFERENCES `estudante` (`ID`),
  ADD CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`CURSO_SIGLA`) REFERENCES `curso` (`SIGLA`);

--
-- Limitadores para a tabela `noticias`
--
ALTER TABLE `noticias`
  ADD CONSTRAINT `noticias_ibfk_1` FOREIGN KEY (`AUTOR`) REFERENCES `professor` (`ID`);

--
-- Limitadores para a tabela `presenca`
--
ALTER TABLE `presenca`
  ADD CONSTRAINT `presenca_ibfk_1` FOREIGN KEY (`DISCIPLINA`) REFERENCES `disciplina` (`CODIGO`),
  ADD CONSTRAINT `presenca_ibfk_2` FOREIGN KEY (`ALUNO`) REFERENCES `estudante` (`ID`);

--
-- Limitadores para a tabela `professor`
--
ALTER TABLE `professor`
  ADD CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`ENDERECO_ID`) REFERENCES `endereco` (`ID`);

--
-- Limitadores para a tabela `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`CURSO_SIGLA`) REFERENCES `curso` (`SIGLA`),
  ADD CONSTRAINT `turma_ibfk_2` FOREIGN KEY (`PROFESSOR`) REFERENCES `professor` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
