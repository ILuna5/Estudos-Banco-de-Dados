-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.31 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for trackstock
DROP DATABASE IF EXISTS `trackstock`;
CREATE DATABASE IF NOT EXISTS `trackstock` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `trackstock`;

-- Dumping structure for procedure trackstock.AlterarSenha
DROP PROCEDURE IF EXISTS `AlterarSenha`;
DELIMITER //
CREATE PROCEDURE `AlterarSenha`(Acesso varchar(225),Senha varchar(225))
root:Begin
	if(length(Senha)<6) then
		select 'O campo senha deve conter mais de 6 digitos' as msg;
        leave root;
	else
		update login set Senha = Senha where (Usuario = Acesso);
	end if;
    select 'Atualizado com sucesso' as msg;
    END//
DELIMITER ;

-- Dumping structure for table trackstock.bairro
DROP TABLE IF EXISTS `bairro`;
CREATE TABLE IF NOT EXISTS `bairro` (
  `idBairro` int NOT NULL AUTO_INCREMENT,
  `NomeBairro` varchar(145) COLLATE utf8mb4_general_ci NOT NULL,
  `Cidade_idCidade` int NOT NULL,
  PRIMARY KEY (`idBairro`),
  KEY `fk_Bairro_Cidade1_idx` (`Cidade_idCidade`),
  CONSTRAINT `fk_Bairro_Cidade1` FOREIGN KEY (`Cidade_idCidade`) REFERENCES `cidade` (`idCidade`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table trackstock.bairro: ~9 rows (approximately)
REPLACE INTO `bairro` (`idBairro`, `NomeBairro`, `Cidade_idCidade`) VALUES
	(1, 'Aquarius', 2),
	(2, 'Urbanova', 2),
	(3, 'Campo dos Alemães', 2),
	(5, 'Copa do Mundo 2002', 5),
	(6, 'Bairro da Paz', 6),
	(7, 'Distrito Industrial', 7),
	(8, 'Taquarí', 7),
	(9, 'Urbanova', 9),
	(10, 'convasco', 13);

-- Dumping structure for table trackstock.cidade
DROP TABLE IF EXISTS `cidade`;
CREATE TABLE IF NOT EXISTS `cidade` (
  `idCidade` int NOT NULL AUTO_INCREMENT,
  `NomeCidade` varchar(145) COLLATE utf8mb4_general_ci NOT NULL,
  `Rua` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `Numero` tinyint NOT NULL,
  `CEP` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `Estado_idEstado` int NOT NULL,
  PRIMARY KEY (`idCidade`),
  KEY `fk_Cidade_Estado1_idx` (`Estado_idEstado`),
  CONSTRAINT `fk_Cidade_Estado1` FOREIGN KEY (`Estado_idEstado`) REFERENCES `estado` (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table trackstock.cidade: ~10 rows (approximately)
REPLACE INTO `cidade` (`idCidade`, `NomeCidade`, `Rua`, `Numero`, `CEP`, `Estado_idEstado`) VALUES
	(2, 'Sao Jose dos Campos', 'Ramdom', 8, '12246002', 26),
	(5, 'São Ronaldo Fenomeno', 'Ronaldinho Bruxo', 10, '12569774', 25),
	(6, 'Salvador', 'minha Rua', 5, '74897554', 5),
	(7, 'Rio Branco', 'Travessa do Canal', 24, '69920199', 1),
	(8, 'Rio Branco', 'Travessa Cruzeiro', 13, '69906510', 1),
	(9, 'Sao jose', 'fukushima', 7, '1258978', 25),
	(10, 'Sao jose', 'tste', 12, '12587889', 25),
	(11, 'Sao jose', 'tste', 12, '12587889', 25),
	(12, 'Sao jose', 'tste', 12, '12587889', 25),
	(13, 'Vasco', 'vascainho', 2, '135897954', 27);

-- Dumping structure for table trackstock.estado
DROP TABLE IF EXISTS `estado`;
CREATE TABLE IF NOT EXISTS `estado` (
  `idEstado` int NOT NULL,
  `uf` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table trackstock.estado: ~27 rows (approximately)
REPLACE INTO `estado` (`idEstado`, `uf`) VALUES
	(1, 'AC'),
	(2, 'AL'),
	(3, 'AM'),
	(4, 'AP'),
	(5, 'BA'),
	(6, 'CE'),
	(7, 'DF'),
	(8, 'ES'),
	(9, 'GO'),
	(10, 'MA'),
	(11, 'MG'),
	(12, 'MS'),
	(13, 'MT'),
	(14, 'PA'),
	(15, 'PB'),
	(16, 'PE'),
	(17, 'PI'),
	(18, 'PR'),
	(19, 'RJ'),
	(20, 'RN'),
	(21, 'RO'),
	(22, 'RR'),
	(23, 'RS'),
	(24, 'SC'),
	(25, 'SE'),
	(26, 'SP'),
	(27, 'TO');

-- Dumping structure for view trackstock.forncedorconsulta
DROP VIEW IF EXISTS `forncedorconsulta`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `forncedorconsulta` (
	`idFornecedor` INT(10) NOT NULL,
	`Nome` VARCHAR(45) NOT NULL COLLATE 'utf8mb4_general_ci',
	`CNPJ` VARCHAR(45) NOT NULL COLLATE 'utf8mb4_general_ci',
	`Email` VARCHAR(45) NOT NULL COLLATE 'utf8mb4_general_ci',
	`Telefone` VARCHAR(45) NOT NULL COLLATE 'utf8mb4_general_ci',
	`uf` VARCHAR(45) NOT NULL COLLATE 'utf8mb4_general_ci',
	`NomeCidade` VARCHAR(145) NOT NULL COLLATE 'utf8mb4_general_ci',
	`Rua` VARCHAR(45) NOT NULL COLLATE 'utf8mb4_general_ci',
	`Numero` TINYINT(3) NOT NULL,
	`CEP` VARCHAR(45) NOT NULL COLLATE 'utf8mb4_general_ci',
	`NomeBairro` VARCHAR(145) NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for table trackstock.fornecedor
DROP TABLE IF EXISTS `fornecedor`;
CREATE TABLE IF NOT EXISTS `fornecedor` (
  `idFornecedor` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `CNPJ` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `Estado_idEstado` int NOT NULL,
  `Email` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idFornecedor`),
  KEY `fk_Fornecedor_Estado1_idx` (`Estado_idEstado`),
  CONSTRAINT `fk_Fornecedor_Estado1` FOREIGN KEY (`Estado_idEstado`) REFERENCES `estado` (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table trackstock.fornecedor: ~7 rows (approximately)
REPLACE INTO `fornecedor` (`idFornecedor`, `Nome`, `CNPJ`, `Estado_idEstado`, `Email`) VALUES
	(5, 'Embraer', '14785236987945', 26, 'embraer@gmail.com'),
	(9, 'CarecaLtd', '11846185000176', 25, 'careca@gmail.com'),
	(10, 'Enterprise', '64246490000193', 5, 'enter@hotmail.com'),
	(11, 'Sorinel', '01001649000190', 1, 'sorinel@sorinel.com'),
	(12, 'Calça Angolana', '16686558000102', 1, 'angola@calca.com'),
	(13, 'Univap', '51496639000140', 25, 'univap@gmail.com'),
	(14, 'Vasco', '44150036000127', 27, 'vasco@vas.com');

-- Dumping structure for procedure trackstock.inserir_bairro
DROP PROCEDURE IF EXISTS `inserir_bairro`;
DELIMITER //
CREATE PROCEDURE `inserir_bairro`(
    IN nome VARCHAR(255),
    IN Cidade_idCidade int
)
BEGIN
    IF (CHAR_LENGTH(nome) < 3) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nome incorreto';
    ELSE
        INSERT INTO bairro (NomeBairro, Cidade_idCidade)
        VALUES (nome, Cidade_idCidade);
    END IF;
END//
DELIMITER ;

-- Dumping structure for procedure trackstock.inserir_cidade
DROP PROCEDURE IF EXISTS `inserir_cidade`;
DELIMITER //
CREATE PROCEDURE `inserir_cidade`(
    IN p_nome VARCHAR(255),
    IN p_rua VARCHAR(255),
    IN p_numero INT,
    IN p_cep VARCHAR(255),
    IN Estado_idEstado int
)
BEGIN
    IF (CHAR_LENGTH(p_nome) < 3 OR CHAR_LENGTH(p_rua) < 3 OR p_numero = 0 OR CHAR_LENGTH(p_cep) < 7) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dados inseridos incorretamente';
    ELSE
        INSERT INTO cidade (NomeCidade, Rua, Numero, CEP, Estado_idEstado)
        VALUES (p_nome, p_rua, p_numero, p_cep,Estado_idEstado);
    END IF;
END//
DELIMITER ;

-- Dumping structure for procedure trackstock.inserir_fornecedor
DROP PROCEDURE IF EXISTS `inserir_fornecedor`;
DELIMITER //
CREATE PROCEDURE `inserir_fornecedor`(
    IN nome VARCHAR(255),
    IN email VARCHAR(255),
    IN cnpj VARCHAR(18),
    IN Estado_idEstado int
)
BEGIN
    IF (CHAR_LENGTH(nome) <= 3) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O campo Nome incorreto';
    END IF;
    
    IF (CHAR_LENGTH(email) <= 3) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O campo Email incorreto';
    END IF;
    
    IF (CHAR_LENGTH(cnpj) <= 13) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O campo CNPJ incorreto';
    END IF;
    
    INSERT INTO fornecedor (Nome, Email, CNPJ, Estado_idEstado)
    VALUES (nome, email,cnpj,Estado_idEstado);
END//
DELIMITER ;

-- Dumping structure for procedure trackstock.inserir_login
DROP PROCEDURE IF EXISTS `inserir_login`;
DELIMITER //
CREATE PROCEDURE `inserir_login`(
    IN p_usuario VARCHAR(255),
    IN p_senha VARCHAR(255)
)
BEGIN
    IF (CHAR_LENGTH(p_usuario) < 3 OR CHAR_LENGTH(p_senha) < 6) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'campos inseridos incorretamente';
    ELSE
        INSERT INTO login (Usuario, Senha)
        VALUES (p_usuario, p_senha);
    END IF;
END//
DELIMITER ;

-- Dumping structure for procedure trackstock.inserir_material
DROP PROCEDURE IF EXISTS `inserir_material`;
DELIMITER //
CREATE PROCEDURE `inserir_material`(
    IN p_nome VARCHAR(255),
    IN p_lote VARCHAR(255),
    IN p_numeroDeSerie varchar(255),
    IN p_descricao VARCHAR(255),
    IN Fornecedor_idFornecedor int
)
BEGIN
    IF (CHAR_LENGTH(p_nome) < 3 OR CHAR_LENGTH(p_lote) = 0 OR CHAR_LENGTH(p_descricao) < 3 or char_length(p_numeroDeSerie) < 3) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Valores incorretos';
    ELSE
        INSERT INTO material (Nome, Lote, NumeroDeSerie, Descricao,Fornecedor_idFornecedor)
        VALUES (p_nome, p_lote, p_numeroDeSerie, p_descricao,Fornecedor_idFornecedor);
    END IF;
END//
DELIMITER ;

-- Dumping structure for procedure trackstock.inserir_pecas
DROP PROCEDURE IF EXISTS `inserir_pecas`;
DELIMITER //
CREATE PROCEDURE `inserir_pecas`(
    IN p_identificacao VARCHAR(255),
    IN p_numero_serie_pecas VARCHAR(255),
    IN p_lote VARCHAR(255),
    IN Material_idMaterial int,
    IN Fornecedor_idFornecedor int
)
BEGIN
    IF (CHAR_LENGTH(p_identificacao) < 3 OR CHAR_LENGTH(p_numero_serie_pecas) < 3 OR CHAR_LENGTH(p_lote) < 3) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Valores invalidos';
    ELSE
        INSERT INTO pecas (Identificacao, NumeroSeriePecas, Lote,Material_idMaterial,Fornecedor_idFornecedor)
        VALUES (p_identificacao, p_numero_serie_pecas, p_lote,Material_idMaterial,Fornecedor_idFornecedor);
    END IF;
END//
DELIMITER ;

-- Dumping structure for procedure trackstock.inserir_produto
DROP PROCEDURE IF EXISTS `inserir_produto`;
DELIMITER //
CREATE PROCEDURE `inserir_produto`(
    IN p_nome_produto VARCHAR(255),
    in p_cad_produto varchar(255),
    IN p_numero_serie_produto VARCHAR(255),
    IN p_lote VARCHAR(255),
    IN p_Pecas_idPecas int
)
BEGIN
    IF (CHAR_LENGTH(p_nome_produto) < 3 OR CHAR_LENGTH(p_numero_serie_produto) < 3 OR CHAR_LENGTH(p_lote) < 3) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Valores invalidos';
    ELSE
        INSERT INTO produto (NomeProduto, Cad , NumeroSerieProduto, Lote, Pecas_idPecas)
        VALUES (p_nome_produto, p_cad_produto , p_numero_serie_produto, p_lote, p_Pecas_idPecas);
    END IF;
END//
DELIMITER ;

-- Dumping structure for procedure trackstock.inserir_telefone
DROP PROCEDURE IF EXISTS `inserir_telefone`;
DELIMITER //
CREATE PROCEDURE `inserir_telefone`(
    IN p_telefone VARCHAR(255),
    IN Fornecedor_idFornecedor int
)
BEGIN
    IF (CHAR_LENGTH(p_telefone) < 10) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Telefone inválido. O número de telefone deve ter pelo menos 11 dígitos.';
    ELSE
        INSERT INTO telefonefornecedor (Telefone, Fornecedor_idFornecedor)
        VALUES 
        (p_telefone,Fornecedor_idFornecedor);
        
        
    END IF;
END//
DELIMITER ;

-- Dumping structure for table trackstock.login
DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `Usuario` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `Senha` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Usuario`),
  UNIQUE KEY `Login_UNIQUE` (`Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table trackstock.login: ~1 rows (approximately)
REPLACE INTO `login` (`Usuario`, `Senha`) VALUES
	('Iago', '1234567891011');

-- Dumping structure for table trackstock.logs
DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `idLogs` int NOT NULL AUTO_INCREMENT,
  `TabelaAfetada` varchar(145) COLLATE utf8mb4_general_ci NOT NULL,
  `Descricao` varchar(145) COLLATE utf8mb4_general_ci NOT NULL,
  `DataHora` varchar(145) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idLogs`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table trackstock.logs: ~59 rows (approximately)
REPLACE INTO `logs` (`idLogs`, `TabelaAfetada`, `Descricao`, `DataHora`) VALUES
	(1, 'bairro', 'Inserção de registro na tabela bairro', '2023-03-16 01:28:11'),
	(2, 'bairro', 'Inserção de registro na tabela bairro', '2023-03-16 01:30:08'),
	(5, 'fornecedor', 'Inserção de registro na tabela fornecedor', '2023-05-17 01:20:06'),
	(6, 'cidade', 'Inserção de registro na tabela cidade', '2023-05-17 01:20:06'),
	(7, 'bairro', 'Inserção de registro na tabela bairro', '2023-05-17 01:27:32'),
	(8, 'bairro', 'Exclusão de registro na tabela bairro', '2023-05-17 01:28:21'),
	(9, 'cidade', 'Exclusão de registro na tabela cidade', '2023-05-17 01:41:55'),
	(10, 'cidade', 'Inserção de registro na tabela cidade', '2023-05-17 01:44:03'),
	(11, 'cidade', 'Exclusão de registro na tabela cidade', '2023-05-17 01:44:37'),
	(12, 'cidade', 'Inserção de registro na tabela cidade', '2023-05-17 01:46:14'),
	(13, 'fornecedor', 'Inserção de registro na tabela fornecedor', '2023-05-17 01:46:14'),
	(14, 'bairro', 'Inserção de registro na tabela bairro', '2023-05-17 01:46:14'),
	(15, 'telefonefornecedor', 'Inserção de registro na tabela telefonefornecedor', '2023-05-17 12:04:06'),
	(16, 'cidade', 'Inserção de registro na tabela cidade', '2023-05-17 12:45:32'),
	(17, 'fornecedor', 'Inserção de registro na tabela fornecedor', '2023-05-17 12:45:32'),
	(18, 'bairro', 'Inserção de registro na tabela bairro', '2023-05-17 12:45:32'),
	(19, 'telefonefornecedor', 'Inserção de registro na tabela telefonefornecedor', '2023-05-17 12:45:32'),
	(20, 'material', 'Inserção de registro na tabela material', '2023-05-17 16:13:18'),
	(21, 'material', 'Inserção de registro na tabela material', '2023-05-17 16:14:41'),
	(22, 'material', 'Inserção de registro na tabela material', '2023-05-17 16:15:31'),
	(23, 'material', 'Inserção de registro na tabela material', '2023-05-17 16:30:36'),
	(24, 'pecas', 'Inserção de registro na tabela pecas', '2023-05-17 19:24:06'),
	(25, 'cidade', 'Inserção de registro na tabela cidade', '2023-05-17 19:57:57'),
	(26, 'fornecedor', 'Inserção de registro na tabela fornecedor', '2023-05-17 19:57:57'),
	(27, 'bairro', 'Inserção de registro na tabela bairro', '2023-05-17 19:57:57'),
	(28, 'telefonefornecedor', 'Inserção de registro na tabela telefonefornecedor', '2023-05-17 19:57:57'),
	(29, 'pecas', 'Inserção de registro na tabela pecas', '2023-05-17 20:12:53'),
	(30, 'produto', 'Inserção de registro na tabela produto', '2023-05-17 20:53:17'),
	(31, 'material', 'Inserção de registro na tabela material', '2023-05-18 13:51:00'),
	(32, 'material', 'Inserção de registro na tabela material', '2023-05-18 13:56:44'),
	(33, 'produto', 'Alteração de registro na tabela produto', '2023-05-18 14:03:41'),
	(34, 'pecas', 'Alteração de registro na tabela pecas', '2023-05-18 16:13:49'),
	(35, 'pecas', 'Alteração de registro na tabela pecas', '2023-05-18 16:13:49'),
	(36, 'pecas', 'Alteração de registro na tabela pecas', '2023-05-18 16:13:49'),
	(37, 'material', 'Alteração de registro na tabela material', '2023-05-26 15:50:18'),
	(38, 'produto', 'Inserção de registro na tabela produto', '2023-06-02 01:08:55'),
	(39, 'cidade', 'Inserção de registro na tabela cidade', '2023-06-02 01:13:52'),
	(40, 'fornecedor', 'Inserção de registro na tabela fornecedor', '2023-06-02 01:13:52'),
	(41, 'bairro', 'Inserção de registro na tabela bairro', '2023-06-02 01:13:52'),
	(42, 'telefonefornecedor', 'Inserção de registro na tabela telefonefornecedor', '2023-06-02 01:13:52'),
	(43, 'material', 'Inserção de registro na tabela material', '2023-06-02 01:15:00'),
	(44, 'pecas', 'Inserção de registro na tabela pecas', '2023-06-02 01:22:05'),
	(45, 'produto', 'Inserção de registro na tabela produto', '2023-06-02 15:09:09'),
	(46, 'produto', 'Inserção de registro na tabela produto', '2023-06-02 15:21:23'),
	(47, 'cidade', 'Inserção de registro na tabela cidade', '2023-06-02 15:23:05'),
	(48, 'produto', 'Inserção de registro na tabela produto', '2023-06-02 15:32:12'),
	(49, 'cidade', 'Inserção de registro na tabela cidade', '2023-06-02 15:35:17'),
	(50, 'cidade', 'Inserção de registro na tabela cidade', '2023-06-02 15:35:33'),
	(51, 'cidade', 'Inserção de registro na tabela cidade', '2023-06-02 15:36:38'),
	(52, 'fornecedor', 'Inserção de registro na tabela fornecedor', '2023-06-02 15:36:38'),
	(53, 'bairro', 'Inserção de registro na tabela bairro', '2023-06-02 15:36:38'),
	(54, 'telefonefornecedor', 'Inserção de registro na tabela telefonefornecedor', '2023-06-02 15:36:38'),
	(55, 'produto', 'Inserção de registro na tabela produto', '2023-06-02 15:45:39'),
	(56, 'cidade', 'Inserção de registro na tabela cidade', '2023-06-02 15:47:59'),
	(57, 'fornecedor', 'Inserção de registro na tabela fornecedor', '2023-06-02 15:47:59'),
	(58, 'bairro', 'Inserção de registro na tabela bairro', '2023-06-02 15:48:00'),
	(59, 'telefonefornecedor', 'Inserção de registro na tabela telefonefornecedor', '2023-06-02 15:48:00'),
	(60, 'material', 'Inserção de registro na tabela material', '2023-06-02 15:49:31'),
	(61, 'pecas', 'Inserção de registro na tabela pecas', '2023-06-02 15:50:22');

-- Dumping structure for table trackstock.material
DROP TABLE IF EXISTS `material`;
CREATE TABLE IF NOT EXISTS `material` (
  `idMaterial` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `Lote` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `NumeroDeSerie` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `Descricao` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Fornecedor_idFornecedor` int DEFAULT NULL,
  PRIMARY KEY (`idMaterial`),
  KEY `fk_Material_Fornecedor1_idx` (`Fornecedor_idFornecedor`),
  CONSTRAINT `fk_Material_Fornecedor1` FOREIGN KEY (`Fornecedor_idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table trackstock.material: ~7 rows (approximately)
REPLACE INTO `material` (`idMaterial`, `Nome`, `Lote`, `NumeroDeSerie`, `Descricao`, `Fornecedor_idFornecedor`) VALUES
	(2, 'Ferro', '15-055', 'Ferro Fundido', '5-008', 5),
	(4, 'Plastico', '4-00', 'Reciclavel', '22-1', 9),
	(5, 'Madeira', '5.0', 'Ebony', '4000', 10),
	(6, 'Vidro', '77-89', 'Temperado', '1234', 5),
	(7, 'Fibra', '898', 'Carbono', '1234', 9),
	(9, 'Papel', '456', 'Reciclavel', '487-858', 11),
	(10, 'Couro', '798-797', 'Animal', '1221-855', 14);

-- Dumping structure for table trackstock.pecas
DROP TABLE IF EXISTS `pecas`;
CREATE TABLE IF NOT EXISTS `pecas` (
  `idPecas` int NOT NULL AUTO_INCREMENT,
  `Material_idMaterial` int NOT NULL,
  `Identificacao` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NumeroSeriePecas` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `Lote` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `Fornecedor_idFornecedor` int DEFAULT NULL,
  PRIMARY KEY (`idPecas`),
  UNIQUE KEY `Identificacao_UNIQUE` (`Identificacao`),
  KEY `fk_Peças_Material1_idx` (`Material_idMaterial`),
  KEY `fk_Pecas_Fornecedor1_idx` (`Fornecedor_idFornecedor`),
  CONSTRAINT `fk_Pecas_Fornecedor1` FOREIGN KEY (`Fornecedor_idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`),
  CONSTRAINT `fk_Peças_Material1` FOREIGN KEY (`Material_idMaterial`) REFERENCES `material` (`idMaterial`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table trackstock.pecas: ~5 rows (approximately)
REPLACE INTO `pecas` (`idPecas`, `Material_idMaterial`, `Identificacao`, `NumeroSeriePecas`, `Lote`, `Fornecedor_idFornecedor`) VALUES
	(1, 2, 'Parafuso', '8AF58D', '005-889', 5),
	(2, 2, 'Lata', '8DB224', '897-0', 9),
	(3, 4, 'Garrafa', 'AC558VC', '69-420', 11),
	(4, 5, 'Lapis Colorido', '45698', '79879', 9),
	(5, 10, 'Cadeira', '456456-949', '89-989', 14);

-- Dumping structure for table trackstock.produto
DROP TABLE IF EXISTS `produto`;
CREATE TABLE IF NOT EXISTS `produto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `NomeProduto` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `Cad` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NumeroSerieProduto` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `Lote` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `Pecas_idPecas` int DEFAULT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `Pecas_idPecas_idx` (`Pecas_idPecas`),
  CONSTRAINT `Pecas_idPecas` FOREIGN KEY (`Pecas_idPecas`) REFERENCES `pecas` (`idPecas`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table trackstock.produto: ~6 rows (approximately)
REPLACE INTO `produto` (`idProduto`, `NomeProduto`, `Cad`, `NumeroSerieProduto`, `Lote`, `Pecas_idPecas`) VALUES
	(1, 'Agua benta', '', '15-00', '2023', 1),
	(2, 'Aluminio', '', '555', '898', 2),
	(3, 'Teclado', '', '57-66', '56-8888', 2),
	(4, 'Mouse', '', '78-8789', '545', 2),
	(5, 'Copo', '', '798', '64565-849', 2),
	(6, 'Mascara', '', '46899', '1245-5875', 3);

-- Dumping structure for view trackstock.produtospecas
DROP VIEW IF EXISTS `produtospecas`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `produtospecas` (
	`idPecas` INT(10) NOT NULL,
	`idProduto` INT(10) NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for table trackstock.produtos_pecas
DROP TABLE IF EXISTS `produtos_pecas`;
CREATE TABLE IF NOT EXISTS `produtos_pecas` (
  `Produto_idProduto` int NOT NULL,
  `Pecas_idPecas` int NOT NULL,
  KEY `fk_Produtos_Peças_Produto1_idx` (`Produto_idProduto`),
  KEY `fk_Produtos_Peças_Peças1_idx` (`Pecas_idPecas`),
  CONSTRAINT `fk_Produtos_Peças_Peças1` FOREIGN KEY (`Pecas_idPecas`) REFERENCES `pecas` (`idPecas`),
  CONSTRAINT `fk_Produtos_Peças_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table trackstock.produtos_pecas: ~0 rows (approximately)

-- Dumping structure for table trackstock.telefonefornecedor
DROP TABLE IF EXISTS `telefonefornecedor`;
CREATE TABLE IF NOT EXISTS `telefonefornecedor` (
  `Telefone` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `Fornecedor_idFornecedor` int NOT NULL,
  PRIMARY KEY (`Telefone`),
  KEY `fk_TelefoneFornecedor_Fornecedor1_idx` (`Fornecedor_idFornecedor`),
  CONSTRAINT `fk_TelefoneFornecedor_Fornecedor1` FOREIGN KEY (`Fornecedor_idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table trackstock.telefonefornecedor: ~7 rows (approximately)
REPLACE INTO `telefonefornecedor` (`Telefone`, `Fornecedor_idFornecedor`) VALUES
	('12854795821', 5),
	('12548974856', 9),
	('(74) 3122-6272', 10),
	('(68) 3662-1694', 11),
	('13587965425', 12),
	('12598784569', 13),
	('18975864582', 14);

-- Dumping structure for trigger trackstock.tr_atualiza_log_bairro
DROP TRIGGER IF EXISTS `tr_atualiza_log_bairro`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_atualiza_log_bairro` AFTER UPDATE ON `bairro` FOR EACH ROW BEGIN
    DECLARE log_desc VARCHAR(255);
    SET log_desc = CONCAT('Atualização de registro na tabela bairro');
    INSERT INTO logs (TabelaAfetada, Descricao, DataHora) VALUES ('bairro', log_desc, NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger trackstock.tr_atualiza_log_cidade
DROP TRIGGER IF EXISTS `tr_atualiza_log_cidade`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_atualiza_log_cidade` AFTER UPDATE ON `cidade` FOR EACH ROW BEGIN
    DECLARE log_desc VARCHAR(255);
    SET log_desc = CONCAT('Atualização de registro na tabela cidade');
    INSERT INTO logs (TabelaAfetada, Descricao, DataHora) VALUES ('cidade', log_desc, NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger trackstock.tr_atualiza_log_estado
DROP TRIGGER IF EXISTS `tr_atualiza_log_estado`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_atualiza_log_estado` AFTER UPDATE ON `estado` FOR EACH ROW BEGIN
    DECLARE log_desc VARCHAR(255);
    SET log_desc = CONCAT('Atualização de registro na tabela estado');
    INSERT INTO logs (TabelaAfetada, Descricao, DataHora) VALUES ('estado', log_desc, NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger trackstock.tr_atualiza_log_fornecedor
DROP TRIGGER IF EXISTS `tr_atualiza_log_fornecedor`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_atualiza_log_fornecedor` AFTER UPDATE ON `fornecedor` FOR EACH ROW BEGIN
    DECLARE log_desc VARCHAR(255);
    SET log_desc = CONCAT('Alteração de registro na tabela fornecedor');
    INSERT INTO logs (TabelaAfetada, descricao, DataHora) VALUES ('fornecedor', log_desc, NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger trackstock.tr_atualiza_log_login
DROP TRIGGER IF EXISTS `tr_atualiza_log_login`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_atualiza_log_login` AFTER UPDATE ON `login` FOR EACH ROW BEGIN
    DECLARE log_desc VARCHAR(255);
    SET log_desc = CONCAT('Alteração de registro na tabela login');
    INSERT INTO logs (TabelaAfetada, descricao, DataHora) VALUES ('login', log_desc, NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger trackstock.tr_atualiza_log_material
DROP TRIGGER IF EXISTS `tr_atualiza_log_material`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_atualiza_log_material` AFTER UPDATE ON `material` FOR EACH ROW BEGIN
    DECLARE log_desc VARCHAR(255);
    SET log_desc = CONCAT('Alteração de registro na tabela material');
    INSERT INTO logs (TabelaAfetada, descricao, DataHora) VALUES ('material', log_desc, NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger trackstock.tr_atualiza_log_pecas
DROP TRIGGER IF EXISTS `tr_atualiza_log_pecas`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_atualiza_log_pecas` AFTER UPDATE ON `pecas` FOR EACH ROW BEGIN
    DECLARE log_desc VARCHAR(255);
    SET log_desc = CONCAT('Alteração de registro na tabela pecas');
    INSERT INTO logs (TabelaAfetada, descricao, DataHora) VALUES ('pecas', log_desc, NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger trackstock.tr_atualiza_log_produto
DROP TRIGGER IF EXISTS `tr_atualiza_log_produto`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_atualiza_log_produto` AFTER UPDATE ON `produto` FOR EACH ROW BEGIN
    DECLARE log_desc VARCHAR(255);
    SET log_desc = CONCAT('Alteração de registro na tabela produto');
    INSERT INTO logs (TabelaAfetada, descricao, DataHora) VALUES ('produto', log_desc, NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger trackstock.tr_atualiza_log_telefonefornecedorfornecedor
DROP TRIGGER IF EXISTS `tr_atualiza_log_telefonefornecedorfornecedor`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_atualiza_log_telefonefornecedorfornecedor` AFTER UPDATE ON `telefonefornecedor` FOR EACH ROW BEGIN
    DECLARE log_desc VARCHAR(255);
    SET log_desc = CONCAT('Alteração de registro na tabela telefonefornecedor');
    INSERT INTO logs (TabelaAfetada, descricao, DataHora) VALUES ('telefonefornecedor', log_desc, NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger trackstock.tr_deleta_log_bairro
DROP TRIGGER IF EXISTS `tr_deleta_log_bairro`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_deleta_log_bairro` AFTER DELETE ON `bairro` FOR EACH ROW BEGIN
    DECLARE log_desc VARCHAR(255);
    SET log_desc = CONCAT('Exclusão de registro na tabela bairro');
    INSERT INTO logs (TabelaAfetada, Descricao, DataHora) VALUES ('bairro', log_desc, NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger trackstock.tr_deleta_log_cidade
DROP TRIGGER IF EXISTS `tr_deleta_log_cidade`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_deleta_log_cidade` AFTER DELETE ON `cidade` FOR EACH ROW BEGIN
    DECLARE log_desc VARCHAR(255);
    SET log_desc = CONCAT('Exclusão de registro na tabela cidade');
    INSERT INTO logs (TabelaAfetada, Descricao, DataHora) VALUES ('cidade', log_desc, NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger trackstock.tr_deleta_log_estado
DROP TRIGGER IF EXISTS `tr_deleta_log_estado`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_deleta_log_estado` AFTER DELETE ON `estado` FOR EACH ROW BEGIN
    DECLARE log_desc VARCHAR(255);
    SET log_desc = CONCAT('Exclusão de registro na tabela estado');
    INSERT INTO logs (TabelaAfetada, Descricao, DataHora) VALUES ('estado', log_desc, NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger trackstock.tr_insere_log_bairro
DROP TRIGGER IF EXISTS `tr_insere_log_bairro`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_insere_log_bairro` AFTER INSERT ON `bairro` FOR EACH ROW BEGIN
    DECLARE log_desc VARCHAR(255);
    SET log_desc = CONCAT('Inserção de registro na tabela bairro');
    INSERT INTO logs (TabelaAfetada, Descricao, DataHora) VALUES ('bairro', log_desc, NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger trackstock.tr_insere_log_cidade
DROP TRIGGER IF EXISTS `tr_insere_log_cidade`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_insere_log_cidade` AFTER INSERT ON `cidade` FOR EACH ROW BEGIN
    DECLARE log_desc VARCHAR(255);
    SET log_desc = CONCAT('Inserção de registro na tabela cidade');
    INSERT INTO logs (TabelaAfetada, Descricao, DataHora) VALUES ('cidade', log_desc, NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger trackstock.tr_insere_log_estado
DROP TRIGGER IF EXISTS `tr_insere_log_estado`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_insere_log_estado` AFTER INSERT ON `estado` FOR EACH ROW BEGIN
    DECLARE log_desc VARCHAR(255);
    SET log_desc = CONCAT('Inserção de registro na tabela estado');
    INSERT INTO logs (TabelaAfetada, Descricao, DataHora) VALUES ('estado', log_desc, NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger trackstock.tr_insere_log_fornecedor
DROP TRIGGER IF EXISTS `tr_insere_log_fornecedor`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_insere_log_fornecedor` AFTER INSERT ON `fornecedor` FOR EACH ROW BEGIN
    DECLARE log_desc VARCHAR(255);
    SET log_desc = CONCAT('Inserção de registro na tabela fornecedor');
    INSERT INTO logs (TabelaAfetada, descricao, DataHora) VALUES ('fornecedor', log_desc, NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger trackstock.tr_insere_log_login
DROP TRIGGER IF EXISTS `tr_insere_log_login`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_insere_log_login` AFTER INSERT ON `login` FOR EACH ROW BEGIN
    DECLARE log_desc VARCHAR(255);
    SET log_desc = CONCAT('Inserção de registro na tabela login');
    INSERT INTO logs (TabelaAfetada, descricao, DataHora) VALUES ('login', log_desc, NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger trackstock.tr_insere_log_material
DROP TRIGGER IF EXISTS `tr_insere_log_material`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_insere_log_material` AFTER INSERT ON `material` FOR EACH ROW BEGIN
    DECLARE log_desc VARCHAR(255);
    SET log_desc = CONCAT('Inserção de registro na tabela material');
    INSERT INTO logs (TabelaAfetada, descricao, DataHora) VALUES ('material', log_desc, NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger trackstock.tr_insere_log_pecas
DROP TRIGGER IF EXISTS `tr_insere_log_pecas`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_insere_log_pecas` AFTER INSERT ON `pecas` FOR EACH ROW BEGIN
    DECLARE log_desc VARCHAR(255);
    SET log_desc = CONCAT('Inserção de registro na tabela pecas');
    INSERT INTO logs (TabelaAfetada, descricao, DataHora) VALUES ('pecas', log_desc, NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger trackstock.tr_insere_log_produto
DROP TRIGGER IF EXISTS `tr_insere_log_produto`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_insere_log_produto` AFTER INSERT ON `produto` FOR EACH ROW BEGIN
    DECLARE log_desc VARCHAR(255);
    SET log_desc = CONCAT('Inserção de registro na tabela produto');
    INSERT INTO logs (TabelaAfetada, descricao, DataHora) VALUES ('produto', log_desc, NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger trackstock.tr_insere_log_telefonefornecedorfornecedor
DROP TRIGGER IF EXISTS `tr_insere_log_telefonefornecedorfornecedor`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_insere_log_telefonefornecedorfornecedor` AFTER INSERT ON `telefonefornecedor` FOR EACH ROW BEGIN
    DECLARE log_desc VARCHAR(255);
    SET log_desc = CONCAT('Inserção de registro na tabela telefonefornecedor');
    INSERT INTO logs (TabelaAfetada, descricao, DataHora) VALUES ('telefonefornecedor', log_desc, NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for view trackstock.forncedorconsulta
DROP VIEW IF EXISTS `forncedorconsulta`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `forncedorconsulta`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `forncedorconsulta` AS select `fornecedor`.`idFornecedor` AS `idFornecedor`,`fornecedor`.`Nome` AS `Nome`,`fornecedor`.`CNPJ` AS `CNPJ`,`fornecedor`.`Email` AS `Email`,`telefonefornecedor`.`Telefone` AS `Telefone`,`estado`.`uf` AS `uf`,`cidade`.`NomeCidade` AS `NomeCidade`,`cidade`.`Rua` AS `Rua`,`cidade`.`Numero` AS `Numero`,`cidade`.`CEP` AS `CEP`,`bairro`.`NomeBairro` AS `NomeBairro` from ((((`fornecedor` join `telefonefornecedor` on((`fornecedor`.`idFornecedor` = `telefonefornecedor`.`Fornecedor_idFornecedor`))) join `estado` on((`fornecedor`.`Estado_idEstado` = `estado`.`idEstado`))) join `cidade` on((`estado`.`idEstado` = `cidade`.`Estado_idEstado`))) join `bairro` on((`cidade`.`idCidade` = `bairro`.`Cidade_idCidade`)));

-- Dumping structure for view trackstock.produtospecas
DROP VIEW IF EXISTS `produtospecas`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `produtospecas`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `produtospecas` AS select `pecas`.`idPecas` AS `idPecas`,`produto`.`idProduto` AS `idProduto` from (`pecas` join `produto` on((`produto`.`Pecas_idPecas` = `pecas`.`idPecas`)));

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
