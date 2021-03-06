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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `IdUser` INT NOT NULL AUTO_INCREMENT,
  `NameUser` VARCHAR(45) NOT NULL,
  `PasswdUser` VARCHAR(500) NOT NULL,
  `HasAdminUser` TINYINT NOT NULL,
  `AgeUser` INT(3) NOT NULL,
  `GenderUser` VARCHAR(45) NULL,
  `ZoneUser` VARCHAR(45) NULL,
  `HasFursuitUser` TINYINT NULL,
  `ImageUrlUser` VARCHAR(2048) NULL,
  PRIMARY KEY (`IdUser`),
  UNIQUE (NameUser))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`species`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`species` (
  `IdSpec` INT NOT NULL AUTO_INCREMENT,
  `NameSpec` VARCHAR(45) NOT NULL,
  `InRealLifeSpec` TINYINT NOT NULL,
  `IsFurrySpec` TINYINT NOT NULL,
  `IsScalieSpec` TINYINT NOT NULL,
  `IsOtherSpec` TINYINT NOT NULL,
  PRIMARY KEY (`IdSpec`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`fursona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`fursona` (
  `IdSona` INT NOT NULL AUTO_INCREMENT,
  `OwnedByUserSona` INT NOT NULL,
  `NameSona` VARCHAR(45) NOT NULL,
  `GenderSona` VARCHAR(45) NULL,
  `ImageUrlSona` VARCHAR(2048) NULL,
  `IdSpecSona` INT NOT NULL,
  PRIMARY KEY (`IdSona`),
  INDEX `fk_fursona_user_idx` (`OwnedByUserSona` ASC),
  INDEX `fk_fursona_species1_idx` (`IdSpecSona` ASC),
  CONSTRAINT `fk_fursona_user`
    FOREIGN KEY (`OwnedByUserSona`)
    REFERENCES `mydb`.`user` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fursona_species1`
    FOREIGN KEY (`IdSpecSona`)
    REFERENCES `mydb`.`species` (`IdSpec`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
