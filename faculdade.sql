-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para faculdade
CREATE DATABASE IF NOT EXISTS `faculdade` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `faculdade`;

-- Copiando estrutura para tabela faculdade.aluno
CREATE TABLE IF NOT EXISTS `aluno` (
  `id_pessoa` int(11) DEFAULT NULL,
  `cre` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id_pessoa` (`id_pessoa`),
  CONSTRAINT `FK_aluno_pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela faculdade.aluno: ~4 rows (aproximadamente)
REPLACE INTO `aluno` (`id_pessoa`, `cre`) VALUES
	(3, '1009999993'),
	(5, '1009999995'),
	(4, '1009999994'),
	(8, '1009999998');

-- Copiando estrutura para tabela faculdade.aluno_curso
CREATE TABLE IF NOT EXISTS `aluno_curso` (
  `id_pessoa` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  PRIMARY KEY (`id_pessoa`,`id_curso`),
  KEY `FK_aluno_curso_curso` (`id_curso`),
  CONSTRAINT `FK_aluno_curso_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_aluno_curso_pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela faculdade.aluno_curso: ~5 rows (aproximadamente)
REPLACE INTO `aluno_curso` (`id_pessoa`, `id_curso`) VALUES
	(2, 3),
	(4, 2),
	(4, 3),
	(5, 2),
	(6, 5);

-- Copiando estrutura para tabela faculdade.aluno_disciplinas_realizadas
CREATE TABLE IF NOT EXISTS `aluno_disciplinas_realizadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pessoa` int(11) NOT NULL,
  `id_periodo` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL,
  `concluiu` bit(1) DEFAULT NULL,
  `em_andamento` bit(1) DEFAULT NULL,
  `monitor` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_aluno_disciplinas_realizadas_periodo` (`id_periodo`),
  KEY `FK_aluno_disciplinas_realizadas_disciplina` (`id_disciplina`),
  KEY `FK_aluno_disciplinas_realizadas_pessoa` (`id_pessoa`),
  CONSTRAINT `FK_aluno_disciplinas_realizadas_disciplina` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_aluno_disciplinas_realizadas_periodo` FOREIGN KEY (`id_periodo`) REFERENCES `periodo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_aluno_disciplinas_realizadas_pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela faculdade.aluno_disciplinas_realizadas: ~18 rows (aproximadamente)
REPLACE INTO `aluno_disciplinas_realizadas` (`id`, `id_pessoa`, `id_periodo`, `id_disciplina`, `concluiu`, `em_andamento`, `monitor`) VALUES
	(11, 1, 1, 1, b'1', b'0', b'0'),
	(12, 1, 1, 2, b'0', b'1', b'0'),
	(13, 2, 2, 3, b'1', b'0', b'1'),
	(14, 2, 2, 4, b'1', b'0', b'0'),
	(15, 3, 3, 5, b'0', b'1', b'0'),
	(16, 3, 3, 6, b'1', b'0', b'1'),
	(17, 4, 1, 7, b'1', b'0', b'0'),
	(18, 4, 1, 8, b'0', b'1', b'0'),
	(19, 5, 2, 9, b'1', b'0', b'1'),
	(20, 5, 2, 10, b'1', b'0', b'0'),
	(21, 6, 3, 11, b'0', b'1', b'0'),
	(22, 6, 3, 12, b'1', b'0', b'1'),
	(23, 7, 1, 13, b'1', b'0', b'0'),
	(24, 7, 1, 14, b'0', b'1', b'0'),
	(25, 8, 2, 15, b'1', b'0', b'1'),
	(26, 8, 2, 16, b'0', b'1', b'0'),
	(27, 9, 1, 1, b'0', b'1', b'0'),
	(28, 10, 1, 1, b'0', b'1', b'0');

-- Copiando estrutura para tabela faculdade.curso
CREATE TABLE IF NOT EXISTS `curso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt_inicio` date DEFAULT NULL,
  `dt_fim` date DEFAULT NULL,
  `nome_curso` varchar(30) NOT NULL,
  `ativo` bit(1) NOT NULL DEFAULT b'0',
  `admitindo_alunos` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela faculdade.curso: ~5 rows (aproximadamente)
REPLACE INTO `curso` (`id`, `dt_inicio`, `dt_fim`, `nome_curso`, `ativo`, `admitindo_alunos`) VALUES
	(1, '2010-01-20', NULL, 'Análise de Sistemas', b'1', b'1'),
	(2, '1998-07-20', NULL, 'Engenharia Elétrica', b'1', b'1'),
	(3, '1985-04-25', NULL, 'Psicologia', b'1', b'1'),
	(4, '1975-04-25', '2000-06-20', 'Processamento de Dados', b'0', b'0'),
	(5, '2000-01-20', '0000-00-00', 'Curso em extinção ', b'1', b'0');

-- Copiando estrutura para tabela faculdade.disciplina
CREATE TABLE IF NOT EXISTS `disciplina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(70) DEFAULT NULL,
  `numeroDeCreditos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela faculdade.disciplina: ~18 rows (aproximadamente)
REPLACE INTO `disciplina` (`id`, `titulo`, `numeroDeCreditos`) VALUES
	(1, 'Matemática', 10),
	(2, 'Física', 10),
	(3, 'Cálculo I', 15),
	(4, 'Cálculo II', 15),
	(5, 'Cálculo III', 15),
	(6, 'O Homem e o Trabalho na Administração Tradicional e na Emergente', 15),
	(7, 'Narcisismo e Sociedade', 15),
	(8, 'Trabalho, Desemprego e as Novas Formas de Carreira', 15),
	(9, 'Preparação Pedagógica em Psicologia Social', 10),
	(10, 'Desenvolvimento de Banco de Dados', 15),
	(11, 'Wireframe e prototipagem', 15),
	(12, 'Estrutura da Internet', 20),
	(13, 'Estruturas de Sistemas para Internet', 10),
	(14, 'Paradigmas de Linguagem de Programação', 15),
	(15, 'Álgebra', 10),
	(16, 'A História da Matemática', 10),
	(17, 'Cálculo Avançado', 30),
	(18, 'Design de Software', 10);

-- Copiando estrutura para tabela faculdade.disciplina_curso
CREATE TABLE IF NOT EXISTS `disciplina_curso` (
  `id_disciplina` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  PRIMARY KEY (`id_disciplina`,`id_curso`),
  KEY `FK__curso` (`id_curso`),
  CONSTRAINT `FK__curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__disciplina` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela faculdade.disciplina_curso: ~20 rows (aproximadamente)
REPLACE INTO `disciplina_curso` (`id_disciplina`, `id_curso`) VALUES
	(2, 4),
	(3, 2),
	(5, 2),
	(7, 3),
	(7, 5),
	(8, 1),
	(9, 3),
	(9, 5),
	(10, 1),
	(11, 1),
	(12, 1),
	(12, 4),
	(13, 1),
	(15, 2),
	(16, 2),
	(16, 3),
	(17, 2),
	(17, 5),
	(18, 1),
	(18, 4);

-- Copiando estrutura para tabela faculdade.disciplina_dependencias
CREATE TABLE IF NOT EXISTS `disciplina_dependencias` (
  `id_disciplina` int(11) NOT NULL,
  `id_disciplina_dependencia` int(11) NOT NULL,
  PRIMARY KEY (`id_disciplina`,`id_disciplina_dependencia`),
  KEY `FK_disciplina_dependencias_disciplina_2` (`id_disciplina_dependencia`),
  CONSTRAINT `FK_disciplina_dependencias_disciplina` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_disciplina_dependencias_disciplina_2` FOREIGN KEY (`id_disciplina_dependencia`) REFERENCES `disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela faculdade.disciplina_dependencias: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela faculdade.disciplina_periodo
CREATE TABLE IF NOT EXISTS `disciplina_periodo` (
  `id_disciplina` int(11) NOT NULL,
  `id_periodo` int(11) NOT NULL,
  PRIMARY KEY (`id_disciplina`,`id_periodo`),
  KEY `FK_disciplina_periodo_periodo` (`id_periodo`),
  CONSTRAINT `FK_disciplina_periodo_disciplina` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_disciplina_periodo_periodo` FOREIGN KEY (`id_periodo`) REFERENCES `periodo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela faculdade.disciplina_periodo: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela faculdade.disciplina_professor
CREATE TABLE IF NOT EXISTS `disciplina_professor` (
  `id_pessoa` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL,
  PRIMARY KEY (`id_pessoa`,`id_disciplina`),
  KEY `FK_disciplina_pessoa_disciplina` (`id_disciplina`),
  CONSTRAINT `FK_disciplina_pessoa_disciplina` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_disciplina_pessoa_pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela faculdade.disciplina_professor: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela faculdade.empresa
CREATE TABLE IF NOT EXISTS `empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '',
  `cnpj` varchar(50) NOT NULL DEFAULT '',
  `endereco` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela faculdade.empresa: ~1 rows (aproximadamente)
REPLACE INTO `empresa` (`id`, `nome`, `cnpj`, `endereco`) VALUES
	(1, 'GE - General Eletric', '24.4.3.42.4.23.23', 'Rua da GE');

-- Copiando estrutura para tabela faculdade.estagio
CREATE TABLE IF NOT EXISTS `estagio` (
  `id` int(11) NOT NULL,
  `id_pessoa` int(11) NOT NULL DEFAULT 0,
  `id_empresa` int(11) NOT NULL DEFAULT 0,
  `dt_inicio` date NOT NULL,
  `dt_termino` date NOT NULL,
  `em_andamento` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `FK__pessoa` (`id_pessoa`),
  KEY `FK__empresa` (`id_empresa`),
  CONSTRAINT `FK__empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela faculdade.estagio: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela faculdade.periodo
CREATE TABLE IF NOT EXISTS `periodo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ano` smallint(6) DEFAULT NULL,
  `semestre` bit(1) DEFAULT NULL COMMENT '0=1º semestre e 1=2º semestre',
  `dataDeInicio` date DEFAULT NULL,
  `dataDeTermino` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela faculdade.periodo: ~8 rows (aproximadamente)
REPLACE INTO `periodo` (`id`, `ano`, `semestre`, `dataDeInicio`, `dataDeTermino`) VALUES
	(1, 2023, b'1', '2023-02-01', '2023-06-30'),
	(2, 2023, b'1', '2023-08-01', '2023-12-15'),
	(3, 2024, b'1', '2024-02-01', '2024-06-30'),
	(4, 2024, b'1', '2024-08-01', '2024-12-15'),
	(5, 2023, b'0', '2023-02-01', '2023-06-30'),
	(6, 2023, b'1', '2023-08-01', '2023-12-15'),
	(7, 2024, b'0', '2024-02-01', '2024-06-30'),
	(8, 2024, b'1', '2024-08-01', '2024-12-15');

-- Copiando estrutura para tabela faculdade.pessoa
CREATE TABLE IF NOT EXISTS `pessoa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `cidade` varchar(30) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `dadosPessoais` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela faculdade.pessoa: ~10 rows (aproximadamente)
REPLACE INTO `pessoa` (`id`, `nome`, `endereco`, `cidade`, `estado`, `celular`, `dadosPessoais`, `email`) VALUES
	(1, 'Marcio CS', 'Rua tal', 'Sao Paulo', 'SP', '1199998888', 'CPF XYZ', 'mcavalcante@gmail.com'),
	(2, 'Ana Maria', 'x', 'c', 'f', '76576', 'jhgjh', 'anamariatestesteteste@gmail.com'),
	(3, 'João da Silva', 'y', 'cidadey', 'es', 'y33333333', 'ycpf', 'y@y.com'),
	(4, 'Renato Garcia', 'Rua m', 'Cidade R', 'PA', '114444444', 'CPF Renato', 'r@r.com'),
	(5, 'Manuela Santos', 'Rua ms', 'Vitoria', 'ES', '11555555', 'CPF manuela', 'manuela@manuela.com.br'),
	(6, 'José Roberto', 'Rua js', 'Joinville', 'SC', '11666666', 'CPF JR', 'jr@jr.com.br'),
	(7, 'Joaquim Alves', 'Rua ja', 'Rio de Janeiro', 'RJ', '117777772', 'CPF JA', 'ja@ja.com.br'),
	(8, 'Carlos Alberto', 'Rua ca', 'Varginha', 'MG', '118888888', 'CPF CA', 'ca@ca.com.br'),
	(9, 'Maria da Dores', 'Rua Maria', 'Belo Horizonte', 'MG', '1199999999', 'CPF Maria Dores', 'md@md.com'),
	(10, 'Joaquim Lima', 'Rua jl', 'Recife', 'PE', '1110101010', 'CPF JL', 'jl@jl.com.br');

-- Copiando estrutura para tabela faculdade.professor
CREATE TABLE IF NOT EXISTS `professor` (
  `id_pessoa` int(11) DEFAULT NULL,
  `email_profissional` varchar(100) DEFAULT NULL,
  `RF` varchar(10) DEFAULT NULL,
  `ativo` bit(1) DEFAULT NULL,
  UNIQUE KEY `id_pessoa` (`id_pessoa`),
  CONSTRAINT `FK_professor_pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela faculdade.professor: ~2 rows (aproximadamente)
REPLACE INTO `professor` (`id_pessoa`, `email_profissional`, `RF`, `ativo`) VALUES
	(1, 'marcio.cavalcante@belasartes.com.br', '111222334', NULL),
	(3, 'joaodasilvateste@belasartes.com.br', '333333', NULL);

-- Copiando estrutura para tabela faculdade.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_pessoa` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `senha` varchar(30) DEFAULT NULL,
  UNIQUE KEY `id_pessoa` (`id_pessoa`),
  CONSTRAINT `FK_usuario_pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela faculdade.usuario: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
