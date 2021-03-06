-- MySQL Script generated by MySQL Workbench
-- Sun Dec 10 13:38:29 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema MyBikeService
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MyBikeService
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MyBikeService` DEFAULT CHARACTER SET utf8 ;
USE `MyBikeService` ;

-- -----------------------------------------------------
-- Table `MyBikeService`.`bikeType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MyBikeService`.`bikeType` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC));


-- -----------------------------------------------------
-- Table `MyBikeService`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MyBikeService`.`address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `zip` VARCHAR(5) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `MyBikeService`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MyBikeService`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `firstName` VARCHAR(50) NOT NULL,
  `lastName` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `address` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_customer_address1_idx` (`address` ASC),
  CONSTRAINT `fk_customer_address1`
    FOREIGN KEY (`address`)
    REFERENCES `MyBikeService`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `MyBikeService`.`bike`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MyBikeService`.`bike` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `bikeType` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `customer` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bike_bikeType_idx` (`bikeType` ASC),
  INDEX `fk_bike_customer1_idx` (`customer` ASC),
  CONSTRAINT `fk_bike_bikeType`
    FOREIGN KEY (`bikeType`)
    REFERENCES `MyBikeService`.`bikeType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bike_customer1`
    FOREIGN KEY (`customer`)
    REFERENCES `MyBikeService`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
