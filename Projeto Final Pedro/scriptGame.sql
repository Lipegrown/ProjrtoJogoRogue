-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `game` DEFAULT CHARACTER SET utf8 ;
USE `game` ;

-- -----------------------------------------------------
-- Table `mydb`.`Atributos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Atributos` (
  `idAtributos` INT NOT NULL,
  `Forca` INT NOT NULL,
  `Destreza` INT NOT NULL,
  `Inteligencia` INT NOT NULL,
  `Constituicao` INT NOT NULL,
  `sabedoria` INT NOT NULL,
  `carisma` INT NOT NULL,
  `Percepcao` INT NOT NULL,
  PRIMARY KEY (`idAtributos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Raca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Raca` (
  `idRaca` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `Atributos_idAtributos` INT NOT NULL,
  PRIMARY KEY (`idRaca`),
  INDEX `fk_Raca_Atributos1_idx` (`Atributos_idAtributos` ASC) VISIBLE,
  CONSTRAINT `fk_Raca_Atributos1`
    FOREIGN KEY (`Atributos_idAtributos`)
    REFERENCES `Atributos` (`idAtributos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Classe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Classe` (
  `idClasse` INT NOT NULL,
  `classeDeArmadura` INT NOT NULL,
  `iniciativa` INT NOT NULL,
  `pontos_de_vida` INT NOT NULL,
  `DadosDeVida` INT NOT NULL,
  `Atributos_idAtributos` INT NOT NULL,
  PRIMARY KEY (`idClasse`),
  INDEX `fk_Classe_Atributos1_idx` (`Atributos_idAtributos` ASC) VISIBLE,
  CONSTRAINT `fk_Classe_Atributos1`
    FOREIGN KEY (`Atributos_idAtributos`)
    REFERENCES `Atributos` (`idAtributos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ficha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ficha` (
  `idFicha` INT NOT NULL,
  `nomePersonagem` VARCHAR(45) NOT NULL,
  `Nivel` INT NOT NULL,
  `nomeJogador` VARCHAR(45) NOT NULL,
  `experiencia` VARCHAR(45) NOT NULL,
  `tesdeDevida` TINYINT NULL,
  `Raca_idRaca` INT NOT NULL,
  `Classe_idClasse` INT NOT NULL,
  `Pontos_de_vida_temporario` INT NOT NULL,
  PRIMARY KEY (`idFicha`),
  INDEX `fk_Ficha_Raca1_idx` (`Raca_idRaca` ASC) VISIBLE,
  INDEX `fk_Ficha_Classe1_idx` (`Classe_idClasse` ASC) VISIBLE,
  CONSTRAINT `fk_Ficha_Raca1`
    FOREIGN KEY (`Raca_idRaca`)
    REFERENCES `Raca` (`idRaca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ficha_Classe1`
    FOREIGN KEY (`Classe_idClasse`)
    REFERENCES `Classe` (`idClasse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tesouros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tesouros` (
  `idTesouros` INT NOT NULL,
  `Conteudo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTesouros`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AtaquesEmagias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AtaquesEmagias` (
  `idAtaquesEmagias` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `nescessario` VARCHAR(45) NULL COMMENT 'Lgumas magias e ataques precisam de igredientes para cerem realizados por isso que existe esse atributo e ele não é obrigatório',
  `Ficha_idFicha` INT NOT NULL,
  `Tesouros_idTesouros` INT NOT NULL,
  PRIMARY KEY (`idAtaquesEmagias`),
  INDEX `fk_AtaquesEmagias_Ficha1_idx` (`Ficha_idFicha` ASC) VISIBLE,
  INDEX `fk_AtaquesEmagias_Tesouros1_idx` (`Tesouros_idTesouros` ASC) VISIBLE,
  CONSTRAINT `fk_AtaquesEmagias_Ficha1`
    FOREIGN KEY (`Ficha_idFicha`)
    REFERENCES `Ficha` (`idFicha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AtaquesEmagias_Tesouros1`
    FOREIGN KEY (`Tesouros_idTesouros`)
    REFERENCES `Tesouros` (`idTesouros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Equipamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Equipamentos` (
  `idEquipamentos` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `quantidade` INT NOT NULL,
  `peso` DOUBLE NOT NULL,
  `Ficha_idFicha` INT NOT NULL,
  `Tesouros_idTesouros` INT NOT NULL,
  PRIMARY KEY (`idEquipamentos`),
  INDEX `fk_Equipamentos_Ficha1_idx` (`Ficha_idFicha` ASC) VISIBLE,
  INDEX `fk_Equipamentos_Tesouros1_idx` (`Tesouros_idTesouros` ASC) VISIBLE,
  CONSTRAINT `fk_Equipamentos_Ficha1`
    FOREIGN KEY (`Ficha_idFicha`)
    REFERENCES `Ficha` (`idFicha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Equipamentos_Tesouros1`
    FOREIGN KEY (`Tesouros_idTesouros`)
    REFERENCES `Tesouros` (`idTesouros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Combate_acao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Combate_acao` (
  `Rolagem` INT NOT NULL,
  `IdCombate_acaocol` INT NOT NULL AUTO_INCREMENT,
  `Ficha_idFicha` INT NOT NULL,
  PRIMARY KEY (`IdCombate_acaocol`),
  INDEX `fk_Combate_acao_Ficha1_idx` (`Ficha_idFicha` ASC) VISIBLE,
  CONSTRAINT `fk_Combate_acao_Ficha1`
    FOREIGN KEY (`Ficha_idFicha`)
    REFERENCES `Ficha` (`idFicha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Monstros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Monstros` (
  `idMonstros` INT NOT NULL,
  `Atributos_idAtributos` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Descricao` VARCHAR(45) NOT NULL,
  `Experiencia` VARCHAR(45) NOT NULL,
  `vida` INT NOT NULL,
  PRIMARY KEY (`idMonstros`),
  INDEX `fk_Monstros_Atributos1_idx` (`Atributos_idAtributos` ASC) VISIBLE,
  CONSTRAINT `fk_Monstros_Atributos1`
    FOREIGN KEY (`Atributos_idAtributos`)
    REFERENCES `Atributos` (`idAtributos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AtaquesEmagias_has_Monstros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AtaquesEmagias_has_Monstros` (
  `AtaquesEmagias_idAtaquesEmagias` INT NOT NULL,
  `Monstros_idMonstros` INT NOT NULL,
  PRIMARY KEY (`AtaquesEmagias_idAtaquesEmagias`, `Monstros_idMonstros`),
  INDEX `fk_AtaquesEmagias_has_Monstros_Monstros1_idx` (`Monstros_idMonstros` ASC) VISIBLE,
  INDEX `fk_AtaquesEmagias_has_Monstros_AtaquesEmagias1_idx` (`AtaquesEmagias_idAtaquesEmagias` ASC) VISIBLE,
  CONSTRAINT `fk_AtaquesEmagias_has_Monstros_AtaquesEmagias1`
    FOREIGN KEY (`AtaquesEmagias_idAtaquesEmagias`)
    REFERENCES `AtaquesEmagias` (`idAtaquesEmagias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AtaquesEmagias_has_Monstros_Monstros1`
    FOREIGN KEY (`Monstros_idMonstros`)
    REFERENCES `Monstros` (`idMonstros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Equipamentos_has_Monstros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Equipamentos_has_Monstros` (
  `Equipamentos_idEquipamentos` INT NOT NULL,
  `Monstros_idMonstros` INT NOT NULL,
  PRIMARY KEY (`Equipamentos_idEquipamentos`, `Monstros_idMonstros`),
  INDEX `fk_Equipamentos_has_Monstros_Monstros1_idx` (`Monstros_idMonstros` ASC) VISIBLE,
  INDEX `fk_Equipamentos_has_Monstros_Equipamentos1_idx` (`Equipamentos_idEquipamentos` ASC) VISIBLE,
  CONSTRAINT `fk_Equipamentos_has_Monstros_Equipamentos1`
    FOREIGN KEY (`Equipamentos_idEquipamentos`)
    REFERENCES `Equipamentos` (`idEquipamentos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Equipamentos_has_Monstros_Monstros1`
    FOREIGN KEY (`Monstros_idMonstros`)
    REFERENCES `Monstros` (`idMonstros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Dungeons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dungeons` (
  `idDungeons` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `quantidadeDeMontros` INT NOT NULL,
  `Roteiro_idRoteiro` INT NOT NULL,
  PRIMARY KEY (`idDungeons`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Armadilhas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Armadilhas` (
  `idArmadilhas` INT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Descricao` VARCHAR(45) NOT NULL,
  `dano` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idArmadilhas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tesouros_has_Equipamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tesouros_has_Equipamentos` (
  `Tesouros_idTesouros` INT NOT NULL,
  `Equipamentos_idEquipamentos` INT NOT NULL,
  PRIMARY KEY (`Tesouros_idTesouros`, `Equipamentos_idEquipamentos`),
  INDEX `fk_Tesouros_has_Equipamentos_Equipamentos1_idx` (`Equipamentos_idEquipamentos` ASC) VISIBLE,
  INDEX `fk_Tesouros_has_Equipamentos_Tesouros1_idx` (`Tesouros_idTesouros` ASC) VISIBLE,
  CONSTRAINT `fk_Tesouros_has_Equipamentos_Tesouros1`
    FOREIGN KEY (`Tesouros_idTesouros`)
    REFERENCES `Tesouros` (`idTesouros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tesouros_has_Equipamentos_Equipamentos1`
    FOREIGN KEY (`Equipamentos_idEquipamentos`)
    REFERENCES `Equipamentos` (`idEquipamentos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Monstros_has_Dungeons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Monstros_has_Dungeons` (
  `Monstros_idMonstros` INT NOT NULL,
  `Dungeons_idDungeons` INT NOT NULL,
  PRIMARY KEY (`Monstros_idMonstros`, `Dungeons_idDungeons`),
  INDEX `fk_Monstros_has_Dungeons_Dungeons1_idx` (`Dungeons_idDungeons` ASC) VISIBLE,
  INDEX `fk_Monstros_has_Dungeons_Monstros1_idx` (`Monstros_idMonstros` ASC) VISIBLE,
  CONSTRAINT `fk_Monstros_has_Dungeons_Monstros1`
    FOREIGN KEY (`Monstros_idMonstros`)
    REFERENCES `Monstros` (`idMonstros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Monstros_has_Dungeons_Dungeons1`
    FOREIGN KEY (`Dungeons_idDungeons`)
    REFERENCES `Dungeons` (`idDungeons`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Dungeons_has_Tesouros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dungeons_has_Tesouros` (
  `Dungeons_idDungeons` INT NOT NULL,
  `Tesouros_idTesouros` INT NOT NULL,
  PRIMARY KEY (`Dungeons_idDungeons`, `Tesouros_idTesouros`),
  INDEX `fk_Dungeons_has_Tesouros_Tesouros1_idx` (`Tesouros_idTesouros` ASC) VISIBLE,
  INDEX `fk_Dungeons_has_Tesouros_Dungeons1_idx` (`Dungeons_idDungeons` ASC) VISIBLE,
  CONSTRAINT `fk_Dungeons_has_Tesouros_Dungeons1`
    FOREIGN KEY (`Dungeons_idDungeons`)
    REFERENCES `Dungeons` (`idDungeons`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dungeons_has_Tesouros_Tesouros1`
    FOREIGN KEY (`Tesouros_idTesouros`)
    REFERENCES `Tesouros` (`idTesouros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Armadilhas_has_Dungeons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Armadilhas_has_Dungeons` (
  `Armadilhas_idArmadilhas` INT NOT NULL,
  `Dungeons_idDungeons` INT NOT NULL,
  PRIMARY KEY (`Armadilhas_idArmadilhas`, `Dungeons_idDungeons`),
  INDEX `fk_Armadilhas_has_Dungeons_Dungeons1_idx` (`Dungeons_idDungeons` ASC) VISIBLE,
  INDEX `fk_Armadilhas_has_Dungeons_Armadilhas1_idx` (`Armadilhas_idArmadilhas` ASC) VISIBLE,
  CONSTRAINT `fk_Armadilhas_has_Dungeons_Armadilhas1`
    FOREIGN KEY (`Armadilhas_idArmadilhas`)
    REFERENCES `Armadilhas` (`idArmadilhas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Armadilhas_has_Dungeons_Dungeons1`
    FOREIGN KEY (`Dungeons_idDungeons`)
    REFERENCES `Dungeons` (`idDungeons`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Combate_acao_has_Monstros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Combate_acao_has_Monstros` (
  `Combate_acao_IdCombate_acaocol` INT NOT NULL,
  `Monstros_idMonstros` INT NOT NULL,
  PRIMARY KEY (`Combate_acao_IdCombate_acaocol`, `Monstros_idMonstros`),
  INDEX `fk_Combate_acao_has_Monstros_Monstros1_idx` (`Monstros_idMonstros` ASC) VISIBLE,
  INDEX `fk_Combate_acao_has_Monstros_Combate_acao1_idx` (`Combate_acao_IdCombate_acaocol` ASC) VISIBLE,
  CONSTRAINT `fk_Combate_acao_has_Monstros_Combate_acao1`
    FOREIGN KEY (`Combate_acao_IdCombate_acaocol`)
    REFERENCES `Combate_acao` (`IdCombate_acaocol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Combate_acao_has_Monstros_Monstros1`
    FOREIGN KEY (`Monstros_idMonstros`)
    REFERENCES `Monstros` (`idMonstros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
