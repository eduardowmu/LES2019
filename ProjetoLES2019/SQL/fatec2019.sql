-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 08-Out-2019 às 01:48
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
  `picture` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `client`
--

INSERT INTO `client` (`id`, `name`, `surname`, `nascimento`, `cpf`, `genero`, `password`, `cadastro`, `picture`) VALUES
(1, 'Eduardo', 'Murakoshi', '1984-01-24', '32167624832', 'M', '!@#Abc123', '2019-08-25', NULL),
(24, 'ttttttttta', 'bbbbbbbbbbb', '1999-08-25', '58889372079', 'M', '!@#Abc123', '2019-08-25', NULL),
(26, 'rrrrrrrrrrrrrr', 'ssssssssssssss', '1983-01-25', '31551172062', 'M', '!@#Abc123', '2019-08-26', NULL),
(27, 'uuuuuuu', 'ttttttttt', '1992-08-26', '64359794053', 'M', '!@#Abc123', '2019-08-26', NULL),
(29, 'oooo', 'pppp', '1999-01-01', '94126895000', 'M', '!@#Abc123', '2019-08-26', NULL);

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
  `img` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `course`
--

INSERT INTO `course` (`id`, `instrutor`, `categoria`, `titulo`, `descricao`, `valor`, `gr_precos`, `cadastro`, `img`) VALUES
(2, 'Gustavo Guanabara', 'Linguagem de Programação', 'Curso Basico de Python', 'Aprenda a programar a linguagem de programação que mais cresce no ramo da internet e inteligência artificial.', 40, 'x1.15', '2019-09-01 19:59:28', 'imagens/python.png'),
(3, 'Gustavo Guanabara', 'Linguagem de Programação', 'Curso basico de PHP', 'Aprenda a programar uma das linguagens programação mais usada no mundo web no Brasil.', 30, 'x1.15', '2019-09-01 20:02:33', 'imagens/php.jpg'),
(4, 'Gustavo Guanabara', 'Software', 'Curso de MySQL', 'Aprenda a trabalhar de forma estrutural com programa de banco de dados mais simples e com ele saberá trabalhar com qualquer outro SQBD, pois a linguagem é a mesma.', 35, 'x1.15', '2019-09-01 20:08:51', 'imagens/mysql-logos.gif'),
(5, 'Gustavo Guanabara', 'Linguagem de Programação', 'Curso Basico de Java Script', 'Aprenda a programar uma das linguagens programação mais usada no mundo web no mundo.', 50, 'x1.15', '2019-09-01 20:14:05', 'imagens/java.jpg'),
(6, 'Gustavo Guanabara', 'Linguagem de Programação', 'Curso completo de JQuery', 'Aprenda a programar uma das linguagens programação mais usada no mundo web no mundo.', 30, 'x1.15', '2019-09-01 20:22:14', 'imagens/jquery.png'),
(7, 'Gustavo Guanabara', 'Linguagem de Programação', 'Curso completo de PL/SQL', 'Seja um DBA com banco de dados mais poderoso e robusto que existe e ganhe muito dinheiro.', 45, 'x1.15', '2019-09-01 20:28:25', 'imagens/plsql.png'),
(8, 'Gustavo Guanabara', 'Linguagem de Programação', 'Curso Orientação a Objetos com Java', 'Aprenda Java, que é uma linguagem orientada a objetos e domine este paradigma que é o primeiro passo para se colocar no mercado de trabalho de desenvolvimento de software.', 60, 'x1.15', '2019-09-01 20:38:30', 'imagens/poojava.jpg'),
(9, 'Gustavo Guanabara', 'Software', 'Curso completo de Excel', 'Domine a criar planilhas com o programa mais usado no mercado de trabalho.', 30, 'x1.25', '2019-09-01 20:50:59', 'imagens/excel.png'),
(10, 'Gustavo Guanabara', 'Linguagem de Programação', 'Curso completo de World', 'Escreva com o editor de texto mais usado no mundo e se destaque escrevendo textos de trabalho.', 50, 'x1.25', '2019-09-01 20:54:54', 'imagens/word.jpg'),
(11, 'Gustavo Guanabara', 'Software', 'Curso completo de Photoshop', 'Aprenda a criar imagens digitais personalizados com a ferramenta mais exigido no mercado de design de imagens.', 35, 'x1.15', '2019-09-01 20:58:29', 'imagens/pshop.jpg'),
(13, 'Gustavo Guanabara', 'Linguagem de Programação', 'Curso completo de Desenvolvimento Android Studio com Java', 'Desenvolva aplicativos mobile', 40, 'x1.15', '2019-09-01 21:10:59', 'imagens/astudio.jpg');

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
(8, 26, 'rrrrrrrrrr', '1234567890123456', 'Master', '123', '2025-03-23'),
(9, 27, 'uuuuuuuuuu', '1234567890123456', 'Master', '123', '2025-03-23'),
(11, 29, 'oooppp', '1234567890123456', 'Master', '123', '2025-03-23');

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
  `status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cupom`
--

INSERT INTO `cupom` (`id`, `cup_cli_id`, `cup_ite_id`, `codigo`, `tipo`, `valor`, `status`) VALUES
(1, 26, 12, '26-3', 'troca', 30, 'pendente'),
(2, 24, 15, '24-2', 'troca', 40, 'pendente');

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
(24, 29, 'ooo@gmail.com');

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
  `ite_cur_id` int(11) NOT NULL,
  `ite_sal_id` int(11) NOT NULL,
  `registry` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `item`
--

INSERT INTO `item` (`id`, `code`, `ite_cur_id`, `ite_sal_id`, `registry`) VALUES
(12, '26-3', 3, 8, '2019-10-03 02:09:33'),
(13, '26-2', 2, 8, '2019-10-03 02:09:33'),
(14, '24-3', 3, 9, '2019-10-07 20:38:52'),
(15, '24-2', 2, 9, '2019-10-07 20:38:52');

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
  `total` double NOT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `payment`
--

INSERT INTO `payment` (`id`, `pay_sal_id`, `pay_car_id`, `total`, `status`) VALUES
(5, 8, 8, 70, 'pendente'),
(6, 9, 5, 70, 'pendente');

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
(15, 29, '999999999', '11', 'movel');

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
(8, 26, '2632', 70, 'pendente', '2019-10-03 02:09:33'),
(9, 24, '2432', 70, 'pendente', '2019-10-07 20:38:52');

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

-- --------------------------------------------------------

--
-- Estrutura da tabela `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `vid_cur_id` int(11) NOT NULL,
  `titulo` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `duracao` double NOT NULL,
  `frame` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `creditcard`
--
ALTER TABLE `creditcard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `cupom`
--
ALTER TABLE `cupom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `email`
--
ALTER TABLE `email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `matricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `matricula`
--
ALTER TABLE `matricula`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `perfil`
--
ALTER TABLE `perfil`
  MODIFY `cargo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `phone`
--
ALTER TABLE `phone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `regional`
--
ALTER TABLE `regional`
  MODIFY `regional_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `setor`
--
ALTER TABLE `setor`
  MODIFY `setor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `shopcar`
--
ALTER TABLE `shopcar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
