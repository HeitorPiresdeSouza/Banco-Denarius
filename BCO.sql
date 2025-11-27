-- Banco DENARIUS
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bancodenarius
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bancodenarius
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bancodenarius` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb3 ;
USE `bancodenarius` ;

-- -----------------------------------------------------
-- Table `bancodenarius`.`cadastrop`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodenarius`.`cadastrop` (
  `id_cadastro` INT NOT NULL AUTO_INCREMENT,
  `Usuario` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(12) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `tel` VARCHAR(15) NOT NULL,
  `nomeCompleto` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id_cadastro`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancodenarius`.`cartaovirtual`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodenarius`.`cartaovirtual` (
  `id_cartao` INT NOT NULL AUTO_INCREMENT,
  `idCadastroP` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_cartao`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancodenarius`.`extrato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodenarius`.`extrato` (
  `id_extrato` INT NOT NULL AUTO_INCREMENT,
  `idPixTransf` VARCHAR(50) NULL DEFAULT NULL,
  `idPagar` INT NULL DEFAULT NULL,
  `idrecargaCelular` INT NULL DEFAULT NULL,
  `idCadastroP` INT NULL DEFAULT NULL,
  `dataHora` DATETIME NOT NULL,
  PRIMARY KEY (`id_extrato`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancodenarius`.`pagar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodenarius`.`pagar` (
  `id_pagamento` INT NOT NULL AUTO_INCREMENT,
  `idCadastroP` INT NULL DEFAULT NULL,
  `Transf` VARCHAR(50) NOT NULL,
  `idPixTransf` VARCHAR(50) NOT NULL,
  `dataHora` DATETIME NOT NULL,
  PRIMARY KEY (`id_pagamento`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancodenarius`.`pixtransf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodenarius`.`pixtransf` (
  `id_transf` INT NOT NULL AUTO_INCREMENT,
  `nomeEnvio` VARCHAR(100) NOT NULL,
  `nomeReceptor` VARCHAR(100) NOT NULL,
  `contaEnvio` VARCHAR(20) NOT NULL,
  `contaReceptor` VARCHAR(20) NOT NULL,
  `horarioEnvio` TIME NOT NULL,
  `idCadastroP` INT NULL DEFAULT NULL,
  `dataHora` DATETIME NOT NULL,
  PRIMARY KEY (`id_transf`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancodenarius`.`recargacelular`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodenarius`.`recargacelular` (
  `id_recarga` INT NOT NULL AUTO_INCREMENT,
  `numeroTel` VARCHAR(15) NOT NULL,
  `valor` FLOAT NOT NULL,
  `idCadastroP` INT NULL DEFAULT NULL,
  `operadora` VARCHAR(15) NOT NULL,
  `dataHora` DATETIME NOT NULL,
  PRIMARY KEY (`id_recarga`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bancodenarius`.`telalogin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodenarius`.`telalogin` (
  `id_login` INT NOT NULL AUTO_INCREMENT,
  `idCadastroP` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_login`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`aluno` (
  `id_aluno` INT NOT NULL AUTO_INCREMENT,
  `nome_aluno` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `data_nascimento` DATE NULL DEFAULT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_aluno`))
ENGINE = InnoDB
AUTO_INCREMENT = 35
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`curso` (
  `id_curso` INT NOT NULL AUTO_INCREMENT,
  `nome_curso` VARCHAR(45) NULL DEFAULT NULL,
  `carga_horaria` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_curso`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`matrícula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`matrícula` (
  `id_aluno` INT NOT NULL,
  `id_curso` INT NOT NULL,
  `data_matrícula` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id_aluno`, `id_curso`),
  INDEX `fk_aluno_has_curso_curso1_idx` (`id_curso` ASC) VISIBLE,
  INDEX `fk_aluno_has_curso_aluno_idx` (`id_aluno` ASC) VISIBLE,
  CONSTRAINT `fk_aluno_has_curso_aluno`
    FOREIGN KEY (`id_aluno`)
    REFERENCES `mydb`.`aluno` (`id_aluno`),
  CONSTRAINT `fk_aluno_has_curso_curso1`
    FOREIGN KEY (`id_curso`)
    REFERENCES `mydb`.`curso` (`id_curso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
