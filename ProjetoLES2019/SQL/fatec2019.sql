-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 09-Dez-2019 às 12:47
-- Versão do servidor: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fatec2019`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `surname` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `nascimento` date DEFAULT NULL,
  `cpf` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `genero` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `cadastro` date DEFAULT NULL,
  `status` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `client`
--

INSERT INTO `client` (`id`, `name`, `surname`, `nascimento`, `cpf`, `genero`, `password`, `cadastro`, `status`, `picture`) VALUES
(1, 'Eduardo', 'Murakoshi', '1984-01-24', '32167624832', 'M', '!@#Abc123', '2019-08-25', 'ativado', NULL),
(24, 'ttttttttta', 'bbbbbbbbbbb', '1999-08-25', '58889372079', 'M', '!@#Abc123', '2019-08-25', 'ativado', NULL),
(26, 'rrrrrrrrrrrrrr', 'ssssssssssssss', '1983-01-25', '31551172062', 'M', '!@#Abc123', '2019-08-26', 'ativado', NULL),
(27, 'uuuuuuu', 'ttttttttt', '1992-08-26', '64359794053', 'M', '!@#Abc123', '2019-08-26', 'inativado', NULL),
(29, 'oooo', 'pppp', '1999-01-01', '94126895000', 'M', '!@#Abc123', '2019-08-26', 'ativado', NULL),
(34, 'aaabbb', 'cccddd', '1995-02-14', '17658285030', 'M', '!@#Abc123', '2019-10-23', 'ativado', NULL),
(35, 'ccc', 'ddd', '1999-01-01', '11499434081', 'M', '!@#Abc123', '2019-11-15', 'ativado', NULL),
(36, 'dd2', 'ee2', '1999-01-01', '56967835033', 'M', '!@#Abc123', '2019-11-16', 'ativado', NULL),
(37, 'eee', 'fff', '1999-01-01', '92545812080', 'M', '@#$Abc123', '2019-11-16', 'ativado', NULL),
(38, 'fff', 'ggg', '1999-01-01', '90377419087', 'M', '!@#Abc123', '2019-11-21', 'ativado', NULL),
(39, 'ggg', 'hhh', '1999-01-01', '84945347000', 'M', '!@#Abc123', '2019-11-23', 'ativado', NULL),
(40, 'hhh', 'iii', '1999-01-01', '00891766006', 'M', '!@#Abc123', '2019-11-26', 'ativado', NULL),
(41, 'iii', 'jjj', '1999-01-01', '81031802037', 'M', '!@#Abc123', '2019-11-28', 'ativado', NULL),
(42, 'jjj', 'kkk', '1999-01-01', '78437155096', 'M', '!@#Abc123', '2019-11-30', 'ativado', NULL),
(43, 'kkk', 'lll', '1999-01-01', '16824164020', 'M', '!@#Abc123', '2019-12-01', 'ativado', NULL),
(44, 'lll', 'mmm', '1999-01-01', '30788023020', 'M', '!@#Abc123', '2019-12-02', 'ativado', NULL),
(45, 'mmm', 'nnn', '1999-01-01', '37751223030', 'M', '!@#Abc123', '2019-12-02', 'ativado', NULL),
(46, 'Eduardo', 'Silva', '1999-01-01', '66548250044', 'M', '!@#Abc123', '2019-12-02', 'ativado', NULL),
(47, 'Sergio', 'Silva', '1999-01-01', '55733097060', 'M', '!@#Abc123', '2019-12-02', 'ativado', NULL),
(48, 'Alex', 'Silva', '1999-01-01', '80462086046', 'M', '!@#Abc123', '2019-12-02', 'ativado', NULL),
(49, 'Bruno', 'Silva', '1999-01-01', '48981148813', 'M', '!@#Abc123', '2019-12-03', 'ativado', NULL),
(50, 'Anderson', 'Silva', '1999-01-01', '40223524000', 'M', '!@#Abc123', '2019-12-09', 'ativado', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `instrutor` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titulo` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` double NOT NULL,
  `gr_precos` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `course`
--

INSERT INTO `course` (`id`, `instrutor`, `categoria`, `titulo`, `descricao`, `valor`, `gr_precos`, `cadastro`, `status`, `img`) VALUES
(2, 'Gustavo Guanabara', 'Linguagem de Programação', 'Curso Basico de Python', 'Aprenda a programar a linguagem de programação que mais cresce no ramo da internet e inteligência artificial.', 40, 'x1.15', '2019-09-01 19:59:28', 'inativado', 'imagens/python.png'),
(3, 'Gustavo Guanabara', 'Linguagem de Programação', 'Curso basico de PHP', 'Aprenda a programar uma das linguagens programação mais usada no mundo web no Brasil.', 30, 'x1.15', '2019-09-01 20:02:33', 'ativado', 'imagens/php.jpg'),
(4, 'Gustavo Guanabara', 'Software', 'Curso de MySQL', 'Aprenda a trabalhar de forma estrutural com programa de banco de dados mais simples e com ele saberá trabalhar com qualquer outro SQBD, pois a linguagem é a mesma.', 35, 'x1.15', '2019-09-01 20:08:51', 'ativado', 'imagens/mysql-logos.gif'),
(5, 'Gustavo Guanabara', 'Linguagem de Programação', 'Curso Basico de Java Script', 'Aprenda a programar uma das linguagens programação mais usada no mundo web no mundo.', 50, 'x1.15', '2019-09-01 20:14:05', 'ativado', 'imagens/java.jpg'),
(6, 'Gustavo Guanabara', 'Linguagem de Programação', 'Curso completo de JQuery', 'Aprenda a programar uma das linguagens programação mais usada no mundo web no mundo.', 30, 'x1.15', '2019-09-01 20:22:14', 'ativado', 'imagens/jquery.png'),
(7, 'Gustavo Guanabara', 'Linguagem de Programação', 'Curso completo de PL/SQL', 'Seja um DBA com banco de dados mais poderoso e robusto que existe e ganhe muito dinheiro.', 45, 'x1.15', '2019-09-01 20:28:25', 'ativado', 'imagens/plsql.png'),
(8, 'Gustavo Guanabara', 'Linguagem de Programação', 'Curso Orientação a Objetos com Java', 'Aprenda Java, que é uma linguagem orientada a objetos e domine este paradigma que é o primeiro passo para se colocar no mercado de trabalho de desenvolvimento de software.', 60, 'x1.15', '2019-09-01 20:38:30', 'ativado', 'imagens/poojava.jpg'),
(9, 'Gustavo Guanabara', 'Software', 'Curso completo de Excel', 'Domine a criar planilhas com o programa mais usado no mercado de trabalho.', 30, 'x1.25', '2019-09-01 20:50:59', 'ativado', 'imagens/excel.png'),
(10, 'Gustavo Guanabara', 'Software', 'Curso completo de World', 'Escreva com o editor de texto mais usado no mundo e se destaque escrevendo textos de trabalho.', 50, 'x1.25', '2019-09-01 20:54:54', 'ativado', 'imagens/word.jpg'),
(11, 'Gustavo Guanabara', 'Software', 'Curso completo de Photoshop', 'Aprenda a criar imagens digitais personalizados com a ferramenta mais exigido no mercado de design de imagens.', 35, 'x1.15', '2019-09-01 20:58:29', 'ativado', 'imagens/pshop.jpg'),
(13, 'Gustavo Guanabara', 'Linguagem de Programação', 'Curso completo de Desenvolvimento Android Studio com Java', 'Desenvolva aplicativos mobile', 40, 'x1.15', '2019-09-01 21:10:59', 'ativado', 'imagens/astudio.jpg'),
(14, 'Rodrigo Rocha', 'Linguagem de Programação', 'Engenharia de Software com Java', 'Aprenda a criar um CRUD usando padrões de projeto e arquiteturais de fácil manutenção e com a linguagem de programação mais usada no mercado de trabalho, com qualidade e inteligência.', 95, 'x1.25', '2019-11-17 10:23:47', 'ativado', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `creditcard`
--

CREATE TABLE `creditcard` (
  `id` int(11) NOT NULL,
  `car_cli_id` int(11) NOT NULL,
  `name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `number` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `banner` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `deadline` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `creditcard`
--

INSERT INTO `creditcard` (`id`, `car_cli_id`, `name`, `number`, `banner`, `code`, `deadline`) VALUES
(5, 24, 'sssssssssss', '1234567890123456', 'Master', '123', '2025-03-23'),
(8, 26, 'rrrrrrrrrr', '1234567890123457', 'Master', '123', '2025-03-23'),
(9, 27, 'uuuuuuuuuu', '1234567890123458', 'Master', '123', '2025-03-23'),
(11, 29, 'oooppp', '1234567890123459', 'Master', '123', '2025-03-23'),
(12, 26, 'rrrrrrrrrrrrrr', '1234567890123450', 'VISA', '234', '2023-05-19'),
(13, 29, 'ooo ppp', '1234567890123451', 'VISA', '456', '2021-02-26'),
(14, 24, 'sssssss tttt', '9876543219876543', 'VISA', '987', '2023-09-07'),
(20, 27, 'uuuvvv', '9874563210789456', 'VISA', '963', '2026-12-10'),
(21, 34, 'aaabbb cccddd', '7894561233216548', 'Visa', '654', '2032-02-10'),
(22, 35, 'bbbccc', '9876543211234569', 'Master', '123', '2024-12-12'),
(23, 36, 'dddeee', '9876543211234568', 'Master', '123', '2024-12-12'),
(24, 37, 'eeefff', '9876543211234560', 'Master', '123', '2024-12-12'),
(25, 37, 'eee fff', '9876543214569871', 'VISA', '234', '2025-12-12'),
(26, 37, 'eee fff', '1236547899874561', 'VISA', '963', '2026-12-10'),
(27, 38, 'fff ggg', '4566321178996545', 'Master', '123', '2024-12-12'),
(28, 38, 'fff ggg', '4566321178996546', 'VISA', '963', '2026-12-10'),
(29, 39, 'ggg hhh', '4566321178996546', 'Master', '123', '2024-12-12'),
(30, 40, 'hhh iii', '4566321178996547', 'Master', '123', '2024-12-12'),
(31, 41, 'iii jjj', '4566321178996548', 'Master', '123', '2024-12-12'),
(32, 41, 'hhh iii', '0566321178996546', 'VISA', '963', '2026-12-10'),
(33, 42, 'jjj kkk', '4566321178996549', 'Master', '123', '2024-12-12'),
(34, 42, 'jjj kkk', '4563217896541327', 'VISA', '246', '2026-12-10'),
(35, 24, 'rrr sss', '4566547893215647', 'VISA', '567', '2040-10-10'),
(36, 42, 'jjj kkk', '3214567896547891', 'VISA', '632', '2025-12-12'),
(37, 43, 'kkk lll', '1233214566549870', 'Master', '123', '2024-12-12'),
(39, 43, 'kkk lll', '3210456198747895', 'VISA', '246', '2026-12-10'),
(40, 44, 'lll mmm', '6547897132104563', 'Master', '123', '2024-12-12'),
(41, 44, 'lll mmm', '1236654478998712', 'VISA', '246', '2026-12-10'),
(42, 45, 'mmm nnn', '4566322178899877', 'Master', '123', '2024-12-12'),
(43, 46, 'Eduardo Silva', '1236456998745663', 'Master', '123', '2024-12-12'),
(44, 46, 'Eduardo Silva', '3012045609870456', 'VISA', '246', '2026-12-10'),
(45, 47, 'Sergio Silva', '0231045609870451', 'Master', '123', '2024-12-12'),
(46, 47, 'Sergio Silva', '0312056407980604', 'VISA', '246', '2026-12-10'),
(47, 48, 'Alex Silva', '1023045680799074', 'Master', '123', '2024-12-12'),
(48, 48, 'Alex Silva', '1023504698075049', 'VISA', '246', '2026-12-10'),
(49, 49, 'Bruno Silva', '4056032107890564', 'Master', '123', '2024-12-12'),
(50, 49, 'Bruno Silva', '0546201308975046', 'VISA', '123', '2025-12-12'),
(51, 50, 'Anderson Silva', '1032506489070465', 'Master', '123', '2024-12-12');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cupom`
--

CREATE TABLE `cupom` (
  `id` int(11) NOT NULL,
  `cup_cli_id` int(11) NOT NULL,
  `cup_ite_id` int(11) NOT NULL,
  `codigo` varchar(200) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `valor` double NOT NULL,
  `motivo` varchar(500) DEFAULT NULL,
  `status` varchar(200) NOT NULL,
  `registry` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cupom`
--

INSERT INTO `cupom` (`id`, `cup_cli_id`, `cup_ite_id`, `codigo`, `tipo`, `valor`, `motivo`, `status`, `registry`) VALUES
(1, 26, 12, '26-3', 'troca', 30, NULL, 'aprovado', '2019-10-05'),
(2, 24, 15, '24-2', 'troca', 40, NULL, 'aprovado', '2019-10-06'),
(3, 29, 19, '29-2', 'troca', 40, NULL, 'aprovado', '2019-10-07'),
(4, 26, 13, '26-2', 'troca', 40, NULL, 'aprovado', '2019-10-07'),
(5, 26, 21, '26-6', 'troca', 30, NULL, 'aprovado', '2019-11-01'),
(6, 27, 26, '27-3', 'troca', 30, NULL, 'aprovado', '2019-11-07'),
(7, 29, 31, '29-5', 'troca', 50, 'Não quero mais', 'aprovado', '2019-11-15'),
(8, 37, 33, '37-3', 'troca', 30, 'Gostaria de trocar', 'aprovado', '2019-11-17'),
(9, 26, 22, '26-4', 'troca', 35, '', 'pendente', '2019-11-19'),
(10, 37, 34, '37-2', 'troca', 40, 'NÃ£o quero mais', 'reprovado', '2019-11-19'),
(32, 39, 54, '39-3', 'troca', 30, 'Desisto', 'aprovado', '2019-11-24'),
(33, 43, 63, '43-6', 'troca', 30, 'Desisto', 'aprovado', '2019-12-01'),
(34, 46, 71, '46-4', 'troca', 35, 'Desisto', 'aprovado', '2019-12-02'),
(35, 49, 89, '49-5', 'troca', 50, 'Desisto', 'aprovado', '2019-12-03');

-- --------------------------------------------------------

--
-- Estrutura da tabela `email`
--

CREATE TABLE `email` (
  `id` int(11) NOT NULL,
  `ema_cli_id` int(11) NOT NULL,
  `adress` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `email`
--

INSERT INTO `email` (`id`, `ema_cli_id`, `adress`) VALUES
(18, 24, 'sss@gmail.com'),
(19, 1, 'eduardo@gmail.com'),
(21, 26, 'rrr@gmail.com'),
(22, 27, 'uuu@gmail.com'),
(24, 29, 'ooo@gmail.com'),
(25, 24, 'sss2@gmail.com'),
(28, 27, 'uuuvvv@gmail.com'),
(33, 34, 'aaaccc@gmail.com'),
(34, 26, 'rrrsss@gmail.com'),
(35, 35, 'cccddd@gmail.com'),
(36, 29, 'oop@gmail.com'),
(37, 29, 'opp@gmail.com'),
(38, 36, 'dde@gmail.com'),
(39, 37, 'eeefff@gmail.com'),
(40, 37, 'eeff@gmail.com'),
(41, 37, 'ef@gmail.com'),
(42, 27, 'uu@gmail.com'),
(43, 36, 'dee@gmail.com'),
(44, 38, 'fff@gmail.com'),
(45, 38, 'fg@gmail.com'),
(46, 38, 'fgg@gmail.com'),
(47, 38, 'ffgg@gmail.com'),
(48, 38, 'fgfg@gmail.com'),
(49, 38, 'fff123@gmail.com'),
(50, 39, 'ggg@gmail.com'),
(51, 39, 'gh@gmail.com'),
(52, 40, 'hhh@gmail.com'),
(53, 40, 'hi@gmail.com'),
(54, 41, 'iii@gmail.com'),
(55, 41, 'hhi@gmail.com'),
(56, 42, 'jjj@gmail.com'),
(57, 42, 'hhi@gmail.com'),
(58, 42, 'jkjk@gmail.com'),
(59, 42, 'jkkk@gmail.com'),
(60, 42, 'kkjh@gmail.com'),
(61, 42, 'jkkkk@gmail.com'),
(62, 42, 'jkkj@gmail.com'),
(63, 42, 'jkkjj@gmail.com'),
(64, 42, 'jkkkjj@gmail.com'),
(65, 43, 'kkk@gmail.com'),
(66, 43, 'kkll@gmail.com'),
(67, 43, 'klm@gmail.com'),
(68, 42, 'jkl@gmail.com'),
(69, 43, 'kllk@gmail.com'),
(70, 44, 'lll@gmail.com'),
(71, 44, 'llmmm@gmail.com'),
(72, 44, 'lmmm@gmail.com'),
(73, 45, 'mmm@gmail.com'),
(74, 45, 'mmnn@gmail.com'),
(75, 43, 'kklllkkk@gmail.com'),
(76, 46, 'dudu@gmail.com'),
(77, 46, 'duduedu@gmail.com'),
(78, 46, 'eduardowmu@gmail.com'),
(79, 47, 'sergio@gmail.com'),
(80, 47, 'ssilva@gmail.com'),
(81, 47, 'sergiosilva@gmail.com'),
(82, 48, 'alex@gmail.com'),
(83, 48, 'alexsilva@gmail.com'),
(84, 46, 'dudueduedu@gmail.com'),
(85, 49, 'bruno@gmail.com'),
(86, 49, 'brunosilva@gmail.com'),
(87, 50, 'anderson@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `matricula` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `cpf` char(11) NOT NULL,
  `cargo` int(11) NOT NULL,
  `setor_id` int(11) NOT NULL,
  `regional_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contratado` date NOT NULL,
  `estatus` varchar(7) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `usuario` int(11) NOT NULL,
  `cadastro` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `funcionarios`
--

INSERT INTO `funcionarios` (`matricula`, `nome`, `cpf`, `cargo`, `setor_id`, `regional_id`, `email`, `contratado`, `estatus`, `senha`, `usuario`, `cadastro`) VALUES
(1, 'Eduardo Watanabe Murakoshi', '99956784036', 1, 2, 5, 'eduardo@gmail.com', '2010-01-02', 'ativo', '!@#Abc123', 1, '2019-04-13 21:56:15'),
(18, 'Luis', '19814741027', 1, 1, 1, 'luis@gmail.com', '2019-02-17', 'ativo', '!@#Abc123', 1, '2019-04-17 18:04:14'),
(24, 'Andre Milani', '12030188000', 5, 1, 1, 'andremil@gmail.com', '2019-05-01', 'ativo', '!@#Abc123', 1, '2019-05-08 08:18:38'),
(26, 'Sapo', '33894157852', 3, 5, 2, 'sapo@gmail.com', '2019-05-08', 'inativo', '!@#Abc123', 1, '2019-05-08 10:47:58'),
(27, 'Willian Tanaka', '40053722019', 1, 6, 1, 'willian@gmail.com', '2019-05-08', 'ativo', '!@#Abc123', 1, '2019-05-08 14:46:57'),
(29, 'Rafael', '22548848086', 1, 2, 1, 'rafa@gmail.com', '2019-04-08', 'ativo', '!@#Abc123', 1, '2019-05-08 17:40:30'),
(31, 'Everaldo', '37432979065', 4, 2, 1, 'eve@gmail.com', '2019-05-08', 'ativo', '!@#Abc123', 1, '2019-05-08 19:44:28'),
(33, 'Yoshi', '46534308886', 1, 1, 1, 'yoshi@gmail.com', '2019-05-08', 'ativo', '!@#Abc123', 1, '2019-05-08 20:03:57'),
(34, 'Danilo', '60597257086', 1, 2, 1, 'dani@gmail.com', '2019-05-09', 'ativo', '!@#Abc123', 1, '2019-05-09 07:49:21'),
(35, 'Jorge', '98214543053', 1, 1, 1, 'jorge@gmail.com', '2019-03-11', 'ativo', '!@#Abc123', 1, '2019-05-11 12:23:21'),
(36, 'Felipe', '28174744061', 1, 2, 2, 'felipe@gmail.com', '2019-05-21', 'ativo', '!@#Abc123', 1, '2019-05-21 14:17:04'),
(37, 'Maria da Silva', '99384694002', 5, 1, 1, 'maria@gmail.com', '2019-05-23', 'ativo', '!@#Abc123', 1, '2019-05-22 23:30:18'),
(39, 'Ricardo', '65519624089', 5, 1, 1, 'ricardo@gmail.com', '2019-06-12', 'ativo', '!@#Abc123', 1, '2019-06-12 13:42:26'),
(40, 'Antonio', '13127000090', 5, 1, 1, 'antonio@gmail.com', '2019-06-12', 'ativo', '!@#Abc123', 25, '2019-06-12 14:06:02'),
(45, 'Marcelo', '92392485011', 5, 4, 1, 'marcelo@gmail.com', '2019-05-19', 'ativo', '!@#Abc123', 1, '2019-06-18 23:38:53'),
(47, 'Haroldo', '76287825073', 5, 1, 1, 'haroldo@gmail.com', '2019-05-19', 'ativo', '!@#Abc123', 29, '2019-06-19 18:22:59'),
(48, 'Jose Roberto', '83761270046', 4, 2, 5, 'joberto@gmail.com', '2019-10-01', 'inativo', '!@#Abc123', 1, '2019-10-03 23:40:24'),
(49, 'Luis Travel', '44444444444', 1, 1, 1, 'lutra@gmail.com', '2019-09-18', 'ativo', '!@#Abc123', 1, '2019-10-03 23:42:14');

-- --------------------------------------------------------

--
-- Estrutura da tabela `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `code` varchar(200) NOT NULL,
  `preco` double DEFAULT NULL,
  `ite_cur_id` int(11) NOT NULL,
  `ite_sal_id` int(11) NOT NULL,
  `status` varchar(200) NOT NULL,
  `registry` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `item`
--

INSERT INTO `item` (`id`, `code`, `preco`, `ite_cur_id`, `ite_sal_id`, `status`, `registry`) VALUES
(12, '26-3', 34.5, 3, 8, 'aprovada', '2018-12-03 02:09:33'),
(13, '26-2', 46, 2, 8, 'aprovada', '2018-12-03 02:09:33'),
(14, '24-3', 34.5, 3, 9, 'aprovada', '2018-12-07 20:38:52'),
(15, '24-2', 46, 2, 9, 'aprovada', '2018-12-07 20:38:52'),
(19, '29-2', 46, 2, 12, 'pendente', '2018-12-13 19:32:39'),
(21, '26-6', 34.5, 6, 14, 'pendente', '2018-12-14 14:24:23'),
(22, '26-4', 40.25, 4, 15, 'pendente', '2018-12-14 14:45:53'),
(23, '24-5', 57.5, 5, 16, 'pendente', '2018-12-14 16:58:17'),
(26, '27-3', 34.5, 3, 18, 'pendente', '2018-12-14 21:35:08'),
(27, '27-2', 46, 2, 18, 'pendente', '2018-12-14 21:35:08'),
(28, '26-10', 62.5, 10, 19, 'pendente', '2019-01-10 09:02:59'),
(29, '26-8', 69, 8, 19, 'pendente', '2019-01-10 09:02:59'),
(30, '29-3', 34.5, 3, 20, 'pendente', '2019-01-15 01:40:05'),
(31, '29-5', 57.5, 5, 21, 'pendente', '2019-01-15 01:45:09'),
(32, '29-4', 40.25, 4, 21, 'pendente', '2019-01-15 01:45:09'),
(33, '37-3', 34.5, 3, 22, 'pendente', '2019-01-17 02:08:56'),
(34, '37-2', 46, 2, 22, 'pendente', '2019-01-17 02:08:56'),
(35, '37-7', 51.75, 7, 23, 'pendente', '2019-01-17 19:59:50'),
(36, '37-6', 34.5, 6, 23, 'pendente', '2019-01-17 19:59:50'),
(37, '27-6', 34.5, 6, 24, 'pendente', '2019-01-21 00:20:41'),
(38, '27-4', 40.25, 4, 24, 'pendente', '2019-01-21 00:20:41'),
(39, '27-5', 57.5, 5, 24, 'pendente', '2019-01-21 00:20:41'),
(40, '36-13', 46, 13, 25, 'pendente', '2019-01-21 00:54:37'),
(41, '36-3', 34.5, 3, 25, 'pendente', '2019-01-21 00:54:37'),
(42, '36-5', 57.5, 5, 25, 'pendente', '2019-01-21 00:54:37'),
(43, '36-7', 51.75, 7, 25, 'pendente', '2019-07-21 00:54:37'),
(44, '38-3', 34.5, 3, 26, 'inativo', '2019-07-21 21:07:00'),
(45, '38-2', 46, 2, 26, 'pendente', '2019-07-21 21:07:00'),
(46, '38-3', 34.5, 3, 27, 'inativo', '2019-07-23 18:51:24'),
(47, '38-2', 46, 2, 27, 'inativo', '2019-07-23 18:51:24'),
(48, '38-3', 34.5, 3, 28, 'inativo', '2019-07-23 21:13:12'),
(49, '38-2', 46, 2, 28, 'pendente', '2019-07-23 21:13:12'),
(50, '38-3', 34.5, 3, 29, 'inativo', '2019-07-23 21:27:36'),
(51, '38-2', 46, 2, 29, 'pendente', '2019-07-23 21:27:36'),
(52, '38-3', 34.5, 3, 30, 'pendente', '2019-07-23 22:10:18'),
(53, '38-2', 46, 2, 30, 'pendente', '2019-07-23 22:10:37'),
(54, '39-3', 34.5, 3, 31, 'inativo', '2019-07-23 23:00:04'),
(55, '39-2', 46, 2, 31, 'aprovada', '2019-07-23 23:00:04'),
(56, '40-3', 34.5, 3, 32, 'pendente', '2019-07-26 23:15:29'),
(57, '40-2', 46, 2, 32, 'pendente', '2019-07-26 23:15:29'),
(58, '41-7', 51.75, 7, 33, 'pendente', '2019-08-27 23:18:03'),
(59, '41-6', 34.5, 6, 33, 'pendente', '2019-08-27 23:18:03'),
(60, '42-8', 69, 8, 34, 'pendente', '2019-09-30 00:01:48'),
(61, '42-7', 51.75, 7, 34, 'pendente', '2019-09-30 00:01:48'),
(62, '42-2', 46, 2, 35, 'pendente', '2019-09-01 08:49:55'),
(63, '43-6', 34.5, 6, 36, 'inativo', '2019-10-01 10:11:01'),
(64, '43-5', 57.5, 5, 36, 'aprovada', '2019-10-01 10:11:01'),
(65, '43-3', 34.5, 3, 39, 'pendente', '2019-10-01 19:35:40'),
(66, '44-6', 34.5, 6, 40, 'pendente', '2019-10-02 12:07:15'),
(67, '44-5', 57.49, 5, 40, 'pendente', '2019-11-02 12:07:15'),
(68, '44-2', 46, 2, 41, 'pendente', '2019-11-02 12:08:35'),
(69, '45-5', 57.49, 5, 42, 'pendente', '2019-12-02 13:33:10'),
(70, '45-2', 46, 2, 42, 'pendente', '2019-12-02 13:33:15'),
(71, '46-4', 40.25, 4, 43, 'inativo', '2019-12-02 16:29:47'),
(72, '46-3', 34.5, 3, 43, 'aprovada', '2019-12-02 16:29:47'),
(73, '46-14', 118.75, 14, 44, 'aprovada', '2019-12-02 16:32:28'),
(74, '46-5', 57.49999999999999, 5, 44, 'aprovada', '2019-12-02 16:32:28'),
(75, '46-6', 34.5, 6, 44, 'aprovada', '2019-12-02 16:32:28'),
(76, '46-7', 51.74999999999999, 7, 44, 'aprovada', '2019-12-02 16:32:28'),
(77, '46-13', 46, 13, 44, 'aprovada', '2019-12-02 16:32:28'),
(78, '47-5', 57.49999999999999, 5, 45, 'pendente', '2019-12-02 16:43:47'),
(79, '47-4', 40.25, 4, 45, 'pendente', '2019-12-02 16:43:47'),
(80, '47-10', 62.5, 10, 46, 'pendente', '2019-12-02 16:49:31'),
(81, '47-2', 46, 2, 46, 'pendente', '2019-12-02 16:49:31'),
(82, '47-3', 34.5, 3, 46, 'pendente', '2019-12-02 16:49:31'),
(83, '47-7', 51.74999999999999, 7, 46, 'pendente', '2019-12-02 16:49:31'),
(84, '47-8', 69, 8, 46, 'pendente', '2019-12-02 16:49:31'),
(85, '47-9', 37.5, 9, 46, 'pendente', '2019-12-02 16:49:31'),
(86, '48-5', 57.49999999999999, 5, 47, 'pendente', '2019-12-02 19:54:30'),
(87, '48-4', 40.25, 4, 47, 'pendente', '2019-12-02 19:54:30'),
(88, '46-10', 62.5, 10, 48, 'pendente', '2019-12-02 19:57:57'),
(89, '49-5', 57.49999999999999, 5, 49, 'inativo', '2019-12-03 18:53:23'),
(90, '49-4', 40.25, 4, 49, 'aprovada', '2019-12-03 18:53:23');

-- --------------------------------------------------------

--
-- Estrutura da tabela `matricula`
--

CREATE TABLE `matricula` (
  `id` int(11) NOT NULL,
  `mat_cur_id` int(11) NOT NULL,
  `mat_cli_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `pay_sal_id` int(11) NOT NULL,
  `pay_car_id` int(11) NOT NULL,
  `parcelas` int(11) DEFAULT NULL,
  `total` double NOT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `payment`
--

INSERT INTO `payment` (`id`, `pay_sal_id`, `pay_car_id`, `parcelas`, `total`, `status`) VALUES
(5, 8, 8, 1, 70, 'pendente'),
(6, 9, 5, 1, 70, 'pendente'),
(9, 12, 11, 1, 40, 'pendente'),
(12, 14, 8, 1, 15, 'pendente'),
(13, 14, 12, 1, 15, 'pendente'),
(14, 15, 8, 1, 5, 'pendente'),
(15, 16, 5, 1, 50, 'pendente'),
(18, 18, 9, 1, 25, 'pendente'),
(19, 18, 20, 1, 45, 'pendente'),
(20, 19, 8, 1, 110, 'pendente'),
(21, 20, 11, 1, 15, 'pendente'),
(22, 20, 13, 1, 15, 'pendente'),
(23, 21, 11, 1, 45, 'pendente'),
(24, 22, 24, 1, 70, 'pendente'),
(25, 23, 24, 1, 25, 'pendente'),
(26, 23, 25, 1, 20, 'pendente'),
(27, 24, 9, 1, 115, 'pendente'),
(28, 25, 23, 1, 165, 'pendente'),
(29, 26, 27, 1, 70, 'pendente'),
(30, 27, 27, 1, 70, 'pendente'),
(31, 28, 27, 1, 70, 'pendente'),
(32, 29, 27, 1, 70, 'pendente'),
(33, 30, 27, 1, 70, 'pendente'),
(34, 31, 29, 1, 70, 'pendente'),
(35, 32, 30, 1, 80.5, 'pendente'),
(36, 33, 31, 1, 86.25, 'pendente'),
(37, 34, 33, 1, 120.75, 'pendente'),
(38, 35, 33, 1, 20, 'pendente'),
(39, 35, 36, 1, 26, 'pendente'),
(40, 36, 37, 1, 15, 'pendente'),
(41, 36, 39, 1, 77, 'pendente'),
(43, 39, 37, 1, 34.5, 'pendente'),
(44, 40, 40, 1, 15, 'pendente'),
(45, 40, 41, 1, 77, 'pendente'),
(46, 41, 40, 1, 40, 'pendente'),
(47, 41, 41, 1, 6, 'pendente'),
(48, 42, 42, 1, 103.5, 'pendente'),
(49, 43, 43, 1, 20, 'pendente'),
(50, 43, 44, 1, 54.75, 'pendente'),
(51, 44, 43, 1, 308.5, 'pendente'),
(52, 45, 45, 1, 20, 'pendente'),
(53, 45, 46, 1, 77.75, 'pendente'),
(54, 46, 45, 1, 200, 'pendente'),
(55, 46, 46, 1, 101.25, 'pendente'),
(56, 47, 47, 1, 20, 'pendente'),
(57, 47, 48, 1, 77.75, 'pendente'),
(58, 48, 43, 1, 27.5, 'pendente'),
(59, 49, 49, 1, 50, 'pendente'),
(60, 49, 50, 1, 47.75, 'pendente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `cargo_id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`cargo_id`, `nome`) VALUES
(1, 'Engenheiro'),
(2, 'Secretario'),
(3, 'Operador'),
(4, 'Desenvolvedor'),
(5, 'Analista');

-- --------------------------------------------------------

--
-- Estrutura da tabela `phone`
--

CREATE TABLE `phone` (
  `id` int(11) NOT NULL,
  `pho_cli_id` int(11) NOT NULL,
  `number` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ddd` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `phone`
--

INSERT INTO `phone` (`id`, `pho_cli_id`, `number`, `ddd`, `type`) VALUES
(10, 24, '999999999', '11', 'movel'),
(12, 26, '999999999', '11', 'movel'),
(13, 27, '999999999', '11', 'movel'),
(15, 29, '999999999', '11', 'movel'),
(20, 34, '999999999', '99', 'movel'),
(21, 35, '999999999', '11', 'movel'),
(22, 36, '999999999', '11', 'movel'),
(23, 37, '999999999', '11', 'movel'),
(24, 38, '999999999', '11', 'movel'),
(25, 39, '999999999', '11', 'movel'),
(26, 40, '999999999', '11', 'movel'),
(27, 41, '999999999', '11', 'movel'),
(28, 42, '999999999', '11', 'movel'),
(29, 43, '999999999', '11', 'movel'),
(30, 44, '999999999', '11', 'movel'),
(31, 45, '999999999', '11', 'movel'),
(32, 46, '999999999', '11', 'movel'),
(33, 47, '999999999', '11', 'movel'),
(34, 48, '999999999', '11', 'movel'),
(35, 49, '999999999', '11', 'movel'),
(36, 50, '999999999', '11', 'movel');

-- --------------------------------------------------------

--
-- Estrutura da tabela `regional`
--

CREATE TABLE `regional` (
  `regional_id` int(11) NOT NULL,
  `nome` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `regional`
--

INSERT INTO `regional` (`regional_id`, `nome`) VALUES
(1, 'Zona Sul'),
(2, 'Zona Leste'),
(3, 'Zona Norte'),
(4, 'Zona Oeste'),
(5, 'Mogi das Cruzes');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sale`
--

CREATE TABLE `sale` (
  `id` int(11) NOT NULL,
  `sal_cli_id` int(11) NOT NULL,
  `code` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `total` double NOT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `registry` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `sale`
--

INSERT INTO `sale` (`id`, `sal_cli_id`, `code`, `total`, `status`, `registry`) VALUES
(8, 26, '2632', 70, 'aprovada', '2019-10-03 02:09:33'),
(9, 24, '2432', 70, 'aprovada', '2019-10-07 20:38:52'),
(10, 26, '264', 5, 'pendente', '2019-10-13 00:34:30'),
(12, 29, '292', 40, 'pendente', '2019-10-13 19:32:39'),
(14, 26, '266', 30, 'pendente', '2019-10-14 14:23:52'),
(15, 26, '264', 5, 'pendente', '2019-10-14 14:45:53'),
(16, 24, '245', 50, 'pendente', '2019-10-14 16:58:16'),
(18, 27, '2732', 70, 'pendente', '2019-10-14 21:35:08'),
(19, 26, '26108', 110, 'pendente', '2019-11-10 09:02:59'),
(20, 29, '293', 30, 'pendente', '2019-11-15 01:40:05'),
(21, 29, '2954', 45, 'pendente', '2019-11-15 01:45:09'),
(22, 37, '3732', 70, 'pendente', '2019-11-17 02:08:56'),
(23, 37, '3776', 45, 'pendente', '2019-11-17 19:59:50'),
(24, 27, '27645', 115, 'pendente', '2019-11-21 00:20:41'),
(25, 36, '3613357', 165, 'pendente', '2019-11-21 00:54:37'),
(26, 38, '3832', 70, 'pendente', '2019-11-21 21:07:00'),
(27, 38, '3832', 70, 'pendente', '2019-11-23 18:51:24'),
(28, 38, '3832', 70, 'pendente', '2019-11-23 21:13:12'),
(29, 38, '3832', 70, 'pendente', '2019-11-23 21:27:36'),
(30, 38, '3832', 70, 'pendente', '2019-11-23 22:09:48'),
(31, 39, '3932', 70, 'aprovada', '2019-11-23 23:00:04'),
(32, 40, '4032', 80.5, 'pendente', '2019-11-26 23:15:29'),
(33, 41, '4176', 86.25, 'pendente', '2019-11-27 23:18:03'),
(34, 42, '4287', 120.75, 'pendente', '2019-11-30 00:01:48'),
(35, 42, '422', 46, 'pendente', '2019-12-01 08:49:55'),
(36, 43, '4365', 92, 'aprovada', '2019-12-01 10:11:01'),
(39, 43, '433', 34.5, 'pendente', '2019-12-01 19:35:31'),
(40, 44, '4465', 92, 'pendente', '2019-12-02 12:07:15'),
(41, 44, '442', 46, 'pendente', '2019-12-02 12:08:35'),
(42, 45, '4552', 103.5, 'pendente', '2019-12-02 13:32:55'),
(43, 46, '4643', 74.75, 'aprovada', '2019-12-02 16:29:47'),
(44, 46, '461456713', 308.5, 'aprovada', '2019-12-02 16:32:28'),
(45, 47, '4754', 97.75, 'pendente', '2019-12-02 16:43:47'),
(46, 47, '471023789', 301.25, 'pendente', '2019-12-02 16:49:31'),
(47, 48, '4854', 97.75, 'pendente', '2019-12-02 19:54:30'),
(48, 46, '4610', 27.5, 'pendente', '2019-12-02 19:57:57'),
(49, 49, '4954', 97.75, 'aprovada', '2019-12-03 18:53:22');

-- --------------------------------------------------------

--
-- Estrutura da tabela `scupom`
--

CREATE TABLE `scupom` (
  `id` int(11) NOT NULL,
  `scu_cli_id` int(11) NOT NULL,
  `scu_sal_id` int(11) NOT NULL,
  `codigo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `valor` double NOT NULL,
  `motivo` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `registry` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `scupom`
--

INSERT INTO `scupom` (`id`, `scu_cli_id`, `scu_sal_id`, `codigo`, `tipo`, `valor`, `motivo`, `status`, `registry`) VALUES
(2, 41, 33, '41/-33', 'troca', 86.25, 'Desisto', 'pendente', '2019-11-29 03:17:43');

-- --------------------------------------------------------

--
-- Estrutura da tabela `setor`
--

CREATE TABLE `setor` (
  `setor_id` int(11) NOT NULL,
  `nome` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `setor`
--

INSERT INTO `setor` (`setor_id`, `nome`) VALUES
(1, 'Recursos Humanos'),
(2, 'Tecnologia da Informacao'),
(3, 'Suprimentos'),
(4, 'Marketing'),
(5, 'Pos Venda'),
(6, 'Engenharia');

-- --------------------------------------------------------

--
-- Estrutura da tabela `shopcar`
--

CREATE TABLE `shopcar` (
  `id` int(11) NOT NULL,
  `car_cli_id` int(11) NOT NULL,
  `car_cur_id` int(11) NOT NULL,
  `registry` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `shopcar`
--

INSERT INTO `shopcar` (`id`, `car_cli_id`, `car_cur_id`, `registry`) VALUES
(1, 47, 11, '2019-12-02 19:07:05');

-- --------------------------------------------------------

--
-- Estrutura da tabela `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `vid_cur_id` int(11) NOT NULL,
  `titulo` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `duracao` double NOT NULL,
  `frame` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `video`
--

INSERT INTO `video` (`id`, `vid_cur_id`, `titulo`, `descricao`, `duracao`, `frame`, `registro`) VALUES
(1, 14, 'Introdução', 'Video 0', 57, '<iframe width=\'560\' height=\'315\' src=\'https://www.youtube.com/embed/H4mKZ66P0qk\' frameborder=\'0\' allow=\'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\' allowfullscreen></iframe>', '2019-12-07 17:49:03'),
(2, 14, 'Requisitos', 'Video 1', 90, '<iframe width=\'560\' height=\'315\' src=\'https://www.youtube.com/embed/sgp8KCm7Exw\' frameborder=\'0\' allow=\'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\' allowfullscreen></iframe>', '2019-12-09 00:44:16'),
(3, 14, 'Orientacao a objetos', 'Video 2', 55, '<iframe width=\'560\' height=\'315\' src=\'https://www.youtube.com/embed/J8mB0aJANos\' frameborder=\'0\' allow=\'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\' allowfullscreen></iframe>', '2019-12-09 01:06:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `creditcard`
--
ALTER TABLE `creditcard`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_cli_id` (`car_cli_id`);

--
-- Indexes for table `cupom`
--
ALTER TABLE `cupom`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cup_ite_id` (`cup_ite_id`),
  ADD KEY `cup_cli_id` (`cup_cli_id`);

--
-- Indexes for table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ema_cli_id` (`ema_cli_id`);

--
-- Indexes for table `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`matricula`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `setor_id` (`setor_id`),
  ADD KEY `regional_id` (`regional_id`),
  ADD KEY `usuario` (`usuario`) USING BTREE;

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ite_cur_id` (`ite_cur_id`),
  ADD KEY `ite_sal_id` (`ite_sal_id`);

--
-- Indexes for table `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mat_cur_id` (`mat_cur_id`),
  ADD KEY `mat_cli_id` (`mat_cli_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pay_sal_id` (`pay_sal_id`),
  ADD KEY `pay_car_id` (`pay_car_id`);

--
-- Indexes for table `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`cargo_id`);

--
-- Indexes for table `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pho_cli_id` (`pho_cli_id`);

--
-- Indexes for table `regional`
--
ALTER TABLE `regional`
  ADD PRIMARY KEY (`regional_id`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sal_cli_id` (`sal_cli_id`);

--
-- Indexes for table `scupom`
--
ALTER TABLE `scupom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setor`
--
ALTER TABLE `setor`
  ADD PRIMARY KEY (`setor_id`);

--
-- Indexes for table `shopcar`
--
ALTER TABLE `shopcar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_cli_id` (`car_cli_id`),
  ADD KEY `car_cur_id` (`car_cur_id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vid_cur_id` (`vid_cur_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `creditcard`
--
ALTER TABLE `creditcard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `cupom`
--
ALTER TABLE `cupom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `email`
--
ALTER TABLE `email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `matricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;
--
-- AUTO_INCREMENT for table `matricula`
--
ALTER TABLE `matricula`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `perfil`
--
ALTER TABLE `perfil`
  MODIFY `cargo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `phone`
--
ALTER TABLE `phone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `regional`
--
ALTER TABLE `regional`
  MODIFY `regional_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `scupom`
--
ALTER TABLE `scupom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `setor`
--
ALTER TABLE `setor`
  MODIFY `setor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `shopcar`
--
ALTER TABLE `shopcar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `creditcard`
--
ALTER TABLE `creditcard`
  ADD CONSTRAINT `creditcard_ibfk_1` FOREIGN KEY (`car_cli_id`) REFERENCES `client` (`id`);

--
-- Limitadores para a tabela `cupom`
--
ALTER TABLE `cupom`
  ADD CONSTRAINT `cupom_ibfk_1` FOREIGN KEY (`cup_ite_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `cupom_ibfk_2` FOREIGN KEY (`cup_cli_id`) REFERENCES `client` (`id`);

--
-- Limitadores para a tabela `email`
--
ALTER TABLE `email`
  ADD CONSTRAINT `email_ibfk_1` FOREIGN KEY (`ema_cli_id`) REFERENCES `client` (`id`);

--
-- Limitadores para a tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `funcionarios_ibfk_1` FOREIGN KEY (`setor_id`) REFERENCES `setor` (`setor_id`),
  ADD CONSTRAINT `funcionarios_ibfk_2` FOREIGN KEY (`regional_id`) REFERENCES `regional` (`regional_id`);

--
-- Limitadores para a tabela `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`ite_cur_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`ite_sal_id`) REFERENCES `sale` (`id`);

--
-- Limitadores para a tabela `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`mat_cur_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`mat_cli_id`) REFERENCES `client` (`id`);

--
-- Limitadores para a tabela `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`pay_sal_id`) REFERENCES `sale` (`id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`pay_car_id`) REFERENCES `creditcard` (`id`);

--
-- Limitadores para a tabela `phone`
--
ALTER TABLE `phone`
  ADD CONSTRAINT `phone_ibfk_1` FOREIGN KEY (`pho_cli_id`) REFERENCES `client` (`id`);

--
-- Limitadores para a tabela `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`sal_cli_id`) REFERENCES `client` (`id`);

--
-- Limitadores para a tabela `shopcar`
--
ALTER TABLE `shopcar`
  ADD CONSTRAINT `shopcar_ibfk_1` FOREIGN KEY (`car_cli_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `shopcar_ibfk_2` FOREIGN KEY (`car_cur_id`) REFERENCES `course` (`id`);

--
-- Limitadores para a tabela `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `video_ibfk_1` FOREIGN KEY (`vid_cur_id`) REFERENCES `course` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
