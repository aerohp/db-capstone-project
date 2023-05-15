-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FirstName` VARCHAR(255) NOT NULL,
  `LastName` VARCHAR(255) NOT NULL,
  `ContactNumber` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `BookingDate` DATETIME NOT NULL,
  `TableNumber` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Cuisines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Cuisines` (
  `CuisineID` INT NOT NULL,
  `CuisineName` VARCHAR(45) NOT NULL,
  `CuisinePrice` DECIMAL(10) NOT NULL,
  PRIMARY KEY (`CuisineID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Starters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Starters` (
  `StarterID` INT NOT NULL,
  `StarterName` VARCHAR(45) NOT NULL,
  `StarterPrice` DECIMAL(10) NOT NULL,
  PRIMARY KEY (`StarterID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Courses` (
  `CourseID` INT NOT NULL,
  `CourseName` VARCHAR(45) NOT NULL,
  `CoursePrice` DECIMAL(10) NOT NULL,
  PRIMARY KEY (`CourseID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Drinks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Drinks` (
  `DrinkID` INT NOT NULL,
  `DrinkName` VARCHAR(45) NOT NULL,
  `DrinkPrice` DECIMAL(10) NOT NULL,
  PRIMARY KEY (`DrinkID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Desserts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Desserts` (
  `DessertID` INT NOT NULL,
  `DessertName` VARCHAR(45) NOT NULL,
  `DessertPrice` DECIMAL(10) NOT NULL,
  PRIMARY KEY (`DessertID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `MenuID` INT NOT NULL,
  `CuisineID` INT NOT NULL,
  `StarterID` INT NOT NULL,
  `CourseID` INT NOT NULL,
  `DrinkID` INT NOT NULL,
  `DessertID` INT NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `CuisineID_idx` (`CuisineID` ASC) VISIBLE,
  INDEX `StarterID_idx` (`StarterID` ASC) VISIBLE,
  INDEX `CourseID_idx` (`CourseID` ASC) VISIBLE,
  INDEX `DrinkID_idx` (`DrinkID` ASC) VISIBLE,
  INDEX `DessertID_idx` (`DessertID` ASC) VISIBLE,
  CONSTRAINT `cuisine_id_fk`
    FOREIGN KEY (`CuisineID`)
    REFERENCES `LittleLemonDB`.`Cuisines` (`CuisineID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `starter_id_fk`
    FOREIGN KEY (`StarterID`)
    REFERENCES `LittleLemonDB`.`Starters` (`StarterID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `course_id_fk`
    FOREIGN KEY (`CourseID`)
    REFERENCES `LittleLemonDB`.`Courses` (`CourseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `drink_id_fk`
    FOREIGN KEY (`DrinkID`)
    REFERENCES `LittleLemonDB`.`Drinks` (`DrinkID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `dessert_id_fk`
    FOREIGN KEY (`DessertID`)
    REFERENCES `LittleLemonDB`.`Desserts` (`DessertID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATETIME NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL(10) NOT NULL,
  `CustomerID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `MenuID_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `menu_id_fk`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDB`.`Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Delivery` (
  `DeliveryID` INT NOT NULL,
  `DeliveryDate` DATETIME NOT NULL,
  `DeliveryStatus` VARCHAR(45) NULL,
  `OrderID` INT NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `OrderID_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `order_id_fk`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDB`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
