-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema companydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema companydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `companydb` DEFAULT CHARACTER SET latin1 ;
USE `companydb` ;

-- -----------------------------------------------------
-- Table `companydb`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `companydb`.`employee` (
  `Fname` VARCHAR(20) NULL DEFAULT NULL,
  `Lname` VARCHAR(20) NULL DEFAULT NULL,
  `Ssn` CHAR(9) NOT NULL,
  `Bdate` DATE NULL DEFAULT NULL,
  `Address` VARCHAR(30) NULL DEFAULT NULL,
  `Gender` CHAR(1) NULL DEFAULT NULL,
  `Salary` FLOAT NULL DEFAULT NULL,
  `SuperSsn` CHAR(9) NULL DEFAULT NULL,
  `Dno` INT(2) NULL DEFAULT NULL,
  PRIMARY KEY (`Ssn`),
  UNIQUE INDEX `Ssn_UNIQUE` (`Ssn` ASC) VISIBLE,
  INDEX `Ssn_idx` (`SuperSsn` ASC) VISIBLE,
  INDEX `Dno_idx` (`Dno` ASC) VISIBLE,
  CONSTRAINT `SuperSsn`
    FOREIGN KEY (`SuperSsn`)
    REFERENCES `companydb`.`employee` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Dno`
    FOREIGN KEY (`Dno`)
    REFERENCES `companydb`.`department` (`Dnumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `companydb`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `companydb`.`department` (
  `Dname` VARCHAR(20) NULL DEFAULT NULL,
  `Dnumber` INT(11) NOT NULL,
  `MgrSsn` CHAR(9) NULL DEFAULT NULL,
  `MgrStartDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`Dnumber`),
  UNIQUE INDEX `Dnumber_UNIQUE` (`Dnumber` ASC) VISIBLE,
  INDEX `Ssn_idx` (`MgrSsn` ASC) VISIBLE,
  CONSTRAINT `MgrSsn`
    FOREIGN KEY (`MgrSsn`)
    REFERENCES `companydb`.`employee` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `companydb`.`dependent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `companydb`.`dependent` (
  `Essn` CHAR(9) NOT NULL,
  `DependentName` VARCHAR(20) NOT NULL,
  `Sex` CHAR(1) NULL DEFAULT NULL,
  `Bdate` DATE NULL DEFAULT NULL,
  `Relationship` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`Essn`, `DependentName`),
  CONSTRAINT `Essn`
    FOREIGN KEY (`Essn`)
    REFERENCES `companydb`.`employee` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `companydb`.`dept_locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `companydb`.`dept_locations` (
  `Dnumber` INT(11) NOT NULL,
  `Dlocation` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Dnumber`, `Dlocation`),
  CONSTRAINT `Dnumber`
    FOREIGN KEY (`Dnumber`)
    REFERENCES `companydb`.`department` (`Dnumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `companydb`.`project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `companydb`.`project` (
  `Pname` VARCHAR(20) NULL DEFAULT NULL,
  `Pnumber` INT NOT NULL,
  `Plocation` VARCHAR(20) NULL DEFAULT NULL,
  `Dnum` INT(11) GENERATED ALWAYS AS (NULL) VIRTUAL,
  PRIMARY KEY (`Pnumber`),
  UNIQUE INDEX `Pnumber_UNIQUE` (`Pnumber` ASC) VISIBLE,
  INDEX `Dnum_idx` (`Dnum` ASC) VISIBLE,
  CONSTRAINT `Dnum`
    FOREIGN KEY (`Dnum`)
    REFERENCES `companydb`.`department` (`Dnumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `companydb`.`workson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `companydb`.`workson` (
  `Essn` CHAR(9) NOT NULL,
  `Pno` INT NOT NULL,
  `Hours` FLOAT(3,1) NULL DEFAULT NULL,
  PRIMARY KEY (`Essn`, `Pno`),
  INDEX `Pno_idx` (`Pno` ASC) VISIBLE,
  CONSTRAINT `Essn`
    FOREIGN KEY (`Essn`)
    REFERENCES `companydb`.`employee` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Pno`
    FOREIGN KEY (`Pno`)
    REFERENCES `companydb`.`project` (`Pnumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
