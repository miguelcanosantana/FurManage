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
  `IdUser` INT NOT NULL,
  `NameUser` VARCHAR(45) NOT NULL,
  `PasswdUser` VARCHAR(500) NOT NULL,
  `HasAdminUser` TINYINT NOT NULL,
  `AgeUser` INT(11) NOT NULL,
  `GenderUser` VARCHAR(45) NULL,
  `ZoneUser` VARCHAR(45) NULL,
  `FavArtistUser` VARCHAR(45) NULL,
  `HasFursuitUser` TINYINT NULL,
  `ImageUrlUser` VARCHAR(2048) NULL,
  PRIMARY KEY (`IdUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`fursona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`fursona` (
  `IdSona` INT NOT NULL,
  `OwnedByUserSona` INT NOT NULL,
  `NameSona` VARCHAR(45) NOT NULL,
  `GenderSona` VARCHAR(45) NULL,
  PRIMARY KEY (`IdSona`),
  INDEX `fk_fursona_user_idx` (`OwnedByUserSona` ASC),
  CONSTRAINT `fk_fursona_user`
    FOREIGN KEY (`OwnedByUserSona`)
    REFERENCES `mydb`.`user` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`species`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`species` (
  `IdSpec` INT NOT NULL,
  `NameSpec` VARCHAR(45) NOT NULL,
  `InRealLifeSpec` TINYINT NOT NULL,
  `IsFurrySpec` TINYINT NOT NULL,
  `IsScalieSpec` TINYINT NOT NULL,
  `IsOtherSpec` TINYINT NOT NULL,
  PRIMARY KEY (`IdSpec`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`fursona_has_species`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`fursona_has_species` (
  `AssignmentOfSpeciesID` INT NOT NULL,
  `IdSona` INT NOT NULL,
  `IdSpec` INT NOT NULL,
  PRIMARY KEY (`AssignmentOfSpeciesID`),
  INDEX `fk_fursona_has_species_species1_idx` (`IdSpec` ASC),
  INDEX `fk_fursona_has_species_fursona1_idx` (`IdSona` ASC),
  CONSTRAINT `fk_fursona_has_species_fursona1`
    FOREIGN KEY (`IdSona`)
    REFERENCES `mydb`.`fursona` (`IdSona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fursona_has_species_species1`
    FOREIGN KEY (`IdSpec`)
    REFERENCES `mydb`.`species` (`IdSpec`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
