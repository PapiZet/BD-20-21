-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SupplyChain
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SupplyChain
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SupplyChain` DEFAULT CHARACTER SET utf8 ;
USE `SupplyChain` ;

-- -----------------------------------------------------
-- Table `SupplyChain`.`Produto_Tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SupplyChain`.`Produto_Tipo` (
  `idProduto_Tipo` INT NOT NULL,
  `Preco` FLOAT NULL,
  `Peso_m2` FLOAT NULL,
  `Nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idProduto_Tipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SupplyChain`.`Produto_Fisico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SupplyChain`.`Produto_Fisico` (
  `idProduto_Fisico` INT NOT NULL,
  `Preco` FLOAT NULL,
  `Quantidade` INT NULL,
  `Dimensoes` FLOAT NULL,
  `Peso` FLOAT NULL,
  `Data_Validade` DATE NULL,
  `Composto` VARCHAR(75) NULL,
  `fk_idProdutoTipo` INT NOT NULL,
  PRIMARY KEY (`idProduto_Fisico`),
  INDEX `fk_idProdutoTipo_idx` (`fk_idProdutoTipo` ASC) VISIBLE,
  CONSTRAINT `fk_idProdutoTipo`
    FOREIGN KEY (`fk_idProdutoTipo`)
    REFERENCES `SupplyChain`.`Produto_Tipo` (`idProduto_Tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SupplyChain`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SupplyChain`.`Empresa` (
  `idEmpresa` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Contacto` FLOAT NOT NULL,
  `Pais` VARCHAR(45) NULL,
  `Rua` VARCHAR(45) NOT NULL,
  `Codigo_Postal` VARCHAR(45) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmpresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SupplyChain`.`Lote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SupplyChain`.`Lote` (
  `idLote` INT NOT NULL,
  `Data` DATE NOT NULL,
  `fk_idEmpresa_Origem` INT NOT NULL,
  `fk_idEmpresa_Destino` INT NOT NULL,
  PRIMARY KEY (`idLote`),
  INDEX `fk_idEmpresa_Origem_idx` (`fk_idEmpresa_Origem` ASC) VISIBLE,
  INDEX `fk_idEmpresa_Destino_idx` (`fk_idEmpresa_Destino` ASC) VISIBLE,
  CONSTRAINT `fk_idEmpresa_Origem`
    FOREIGN KEY (`fk_idEmpresa_Origem`)
    REFERENCES `SupplyChain`.`Empresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idEmpresa_Destino`
    FOREIGN KEY (`fk_idEmpresa_Destino`)
    REFERENCES `SupplyChain`.`Empresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SupplyChain`.`Elementos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SupplyChain`.`Elementos` (
  `fk_idLote` INT NOT NULL,
  `fk_idProduto_Fisico` INT NOT NULL,
  INDEX `fk_idProduto_Fisico_idx` (`fk_idProduto_Fisico` ASC) VISIBLE,
  INDEX `fk_idLote_idx` (`fk_idLote` ASC) VISIBLE,
  CONSTRAINT `fk_idLote`
    FOREIGN KEY (`fk_idLote`)
    REFERENCES `SupplyChain`.`Lote` (`idLote`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idProduto_Fisico`
    FOREIGN KEY (`fk_idProduto_Fisico`)
    REFERENCES `SupplyChain`.`Produto_Fisico` (`idProduto_Fisico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SupplyChain`.`Componentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SupplyChain`.`Componentes` (
  `Produto_origem` INT NOT NULL,
  `Componentes` INT NOT NULL,
  INDEX `Produto_Origem_idx` (`Produto_origem` ASC) VISIBLE,
  INDEX `Componenetes_idx` (`Componentes` ASC) VISIBLE,
  CONSTRAINT `Produto_Origem`
    FOREIGN KEY (`Produto_origem`)
    REFERENCES `SupplyChain`.`Produto_Fisico` (`idProduto_Fisico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Componenetes`
    FOREIGN KEY (`Componentes`)
    REFERENCES `SupplyChain`.`Produto_Fisico` (`idProduto_Fisico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;