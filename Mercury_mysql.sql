-- MySQL Script generated by MySQL Workbench
-- Sun Sep 16 21:05:33 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mercury
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mercury
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mercury` DEFAULT CHARACTER SET utf8 ;
USE `mercury` ;

-- -----------------------------------------------------
-- Table `mercury`.`social`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercury`.`social` (
  `social_id` INT(11) NOT NULL AUTO_INCREMENT,
  `social_github` VARCHAR(50) NULL DEFAULT NULL,
  `social_skype` VARCHAR(50) NULL DEFAULT NULL,
  `social_slack` VARCHAR(50) NULL DEFAULT NULL,
  `social_linkedin` VARCHAR(50) NULL DEFAULT NULL,
  `social_googleplus` VARCHAR(50) NULL DEFAULT NULL,
  `social_instagram` VARCHAR(50) NULL DEFAULT NULL,
  `social_facebook` VARCHAR(50) NULL DEFAULT NULL,
  `create_datetime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_datetime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`social_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mercury`.`volunteer_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercury`.`volunteer_status` (
  `volunteer_status_id` INT(11) NOT NULL AUTO_INCREMENT,
  `volunteer_status_name` VARCHAR(50) NOT NULL COMMENT 'This is the volunteers online status',
  `create_datetime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`volunteer_status_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mercury`.`volunteer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercury`.`volunteer` (
  `volunteer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `volunteer_username` VARCHAR(20) NOT NULL,
  `volunteer_password` TEXT NOT NULL,
  `volunteer_nick_name` VARCHAR(200) NOT NULL,
  `volunteer_fullname` VARCHAR(200) NOT NULL,
  `volunteer_preferred_name` VARCHAR(200) NOT NULL,
  `volunteer_about` VARCHAR(500) NULL DEFAULT NULL,
  `volunteer_email` VARCHAR(200) NOT NULL,
  `volunteer_phone` VARCHAR(12) NULL DEFAULT NULL,
  `volunteer_dob` DATETIME NULL DEFAULT NULL,
  `volunteer_timezone` VARCHAR(50) NULL DEFAULT NULL,
  `volunteer_gender` VARCHAR(20) NULL DEFAULT NULL,
  `volunteer_admin_portal_access` TINYINT(4) NULL DEFAULT '0',
  `volunteer_salt` TEXT NOT NULL,
  `volunteer_verified` TINYINT(4) NULL DEFAULT '0',
  `volunteer_location` VARCHAR(100) NULL DEFAULT NULL,
  `volunteer_social_id` INT(11) NOT NULL,
  `volunteer_status_id` INT(11) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`volunteer_id`),
  UNIQUE INDEX `volunteer_username` (`volunteer_username` ASC),
  UNIQUE INDEX `volunteer_email` (`volunteer_email` ASC),
  INDEX `fk_volunteer_social1_idx` (`volunteer_social_id` ASC),
  INDEX `fk_volunteer_volunteer_status1_idx` (`volunteer_status_id` ASC),
  CONSTRAINT `fk_volunteer_social1`
    FOREIGN KEY (`volunteer_social_id`)
    REFERENCES `mercury`.`social` (`social_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_volunteer_volunteer_status1`
    FOREIGN KEY (`volunteer_status_id`)
    REFERENCES `mercury`.`volunteer_status` (`volunteer_status_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mercury`.`acknowledgement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercury`.`acknowledgement` (
  `acknowledgement_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'This is the message they write when they first join to find out how they found code does good',
  `acknowledgement_content` VARCHAR(500) NOT NULL,
  `acknowledgemen_volunteer_id` INT(11) NOT NULL,
  `create_datetime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`acknowledgement_id`, `acknowledgemen_volunteer_id`),
  INDEX `fk_volunteer_acknowledgement_volunteer1_idx` (`acknowledgemen_volunteer_id` ASC),
  CONSTRAINT `fk_volunteer_acknowledgement_volunteer1`
    FOREIGN KEY (`acknowledgemen_volunteer_id`)
    REFERENCES `mercury`.`volunteer` (`volunteer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mercury`.`notification_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercury`.`notification_type` (
  `notification_type_id` INT(11) NOT NULL AUTO_INCREMENT,
  `notification_type_name` VARCHAR(100) NOT NULL,
  `create_datetime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notification_type_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mercury`.`notification`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercury`.`notification` (
  `notification_id` INT(11) NOT NULL AUTO_INCREMENT,
  `notification_volunteer_id` INT(11) NOT NULL,
  `notification_type_id` INT(11) NOT NULL,
  `notification_source_id` INT(11) NOT NULL,
  `create_datetime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notification_id`, `notification_volunteer_id`, `notification_type_id`),
  INDEX `fk_notification_volunteer1_idx` (`notification_volunteer_id` ASC),
  INDEX `fk_notification_notification_type1_idx` (`notification_type_id` ASC),
  INDEX `notification_idx` (`notification_volunteer_id` ASC, `create_datetime` ASC),
  CONSTRAINT `fk_notification_notification_type1`
    FOREIGN KEY (`notification_type_id`)
    REFERENCES `mercury`.`notification_type` (`notification_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notification_volunteer1`
    FOREIGN KEY (`notification_volunteer_id`)
    REFERENCES `mercury`.`volunteer` (`volunteer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mercury`.`password_reset_code`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercury`.`password_reset_code` (
  `password_reset_code_id` INT(11) NOT NULL AUTO_INCREMENT,
  `password_reset_code_code` TEXT NOT NULL,
  `password_reset_code_salt` TEXT NOT NULL,
  `create_datetime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`password_reset_code_id`),
  CONSTRAINT `password_reset_code_fk0`
    FOREIGN KEY (`password_reset_code_id`)
    REFERENCES `mercury`.`volunteer` (`volunteer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mercury`.`team_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercury`.`team_status` (
  `team_status_id` INT(11) NOT NULL AUTO_INCREMENT,
  `team_status_name` VARCHAR(50) NOT NULL COMMENT 'This is the volunteers online status',
  `create_datetime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`team_status_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mercury`.`team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercury`.`team` (
  `team_id` INT(11) NOT NULL AUTO_INCREMENT,
  `team_leader` INT(11) NOT NULL,
  `team_name` VARCHAR(100) NULL DEFAULT NULL,
  `team_description` VARCHAR(500) NULL DEFAULT NULL,
  `team_summary` VARCHAR(200) NULL DEFAULT NULL,
  `team_status_id` INT(11) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`team_id`, `team_leader`, `team_status_id`),
  INDEX `fk_team_volunteer1_idx` (`team_leader` ASC),
  INDEX `fk_team_team_status1_idx` (`team_status_id` ASC),
  CONSTRAINT `fk_team_team_status1`
    FOREIGN KEY (`team_status_id`)
    REFERENCES `mercury`.`team_status` (`team_status_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_team_volunteer1`
    FOREIGN KEY (`team_leader`)
    REFERENCES `mercury`.`volunteer` (`volunteer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mercury`.`project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercury`.`project` (
  `project_id` INT(11) NOT NULL AUTO_INCREMENT,
  `project_name` VARCHAR(200) NOT NULL,
  `project_summary` VARCHAR(500) NOT NULL,
  `project_version` TEXT NULL DEFAULT NULL,
  `project_next_version` TEXT NULL DEFAULT NULL,
  `project_mvp` VARCHAR(50) NULL DEFAULT NULL,
  `project_totaltime` VARCHAR(20) NOT NULL,
  `project_image_link` VARCHAR(200) NULL DEFAULT NULL,
  `project_description` TEXT NULL DEFAULT NULL,
  `project_github_link` VARCHAR(300) NULL DEFAULT NULL,
  `project_google_drive_link` VARCHAR(300) NULL DEFAULT NULL,
  `project_slack` VARCHAR(100) NULL DEFAULT NULL,
  `project_status` VARCHAR(40) NOT NULL,
  `project_services` VARCHAR(200) NULL DEFAULT NULL,
  `project_team_id` INT(11) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_id`, `project_team_id`),
  INDEX `fk_project_team1_idx` (`project_team_id` ASC),
  CONSTRAINT `fk_project_team1`
    FOREIGN KEY (`project_team_id`)
    REFERENCES `mercury`.`team` (`team_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mercury`.`project_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercury`.`project_category` (
  `project_category_id` INT(11) NOT NULL AUTO_INCREMENT,
  `project_category_name` VARCHAR(100) NOT NULL,
  `create_datetime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mercury`.`project_has_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercury`.`project_has_category` (
  `project_id` INT(11) NOT NULL AUTO_INCREMENT,
  `project_category_id` INT(11) NOT NULL,
  `create_datetime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_id`, `project_category_id`),
  INDEX `fk_project_has_project_category_project_category1_idx` (`project_category_id` ASC),
  INDEX `fk_project_has_project_category_project1_idx` (`project_id` ASC),
  CONSTRAINT `fk_project_has_project_category_project1`
    FOREIGN KEY (`project_id`)
    REFERENCES `mercury`.`project` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_project_has_project_category_project_category1`
    FOREIGN KEY (`project_category_id`)
    REFERENCES `mercury`.`project_category` (`project_category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mercury`.`project_platform`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercury`.`project_platform` (
  `project_platform_id` INT(11) NOT NULL AUTO_INCREMENT,
  `project_platform_name` VARCHAR(100) NOT NULL,
  `create_datetime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_platform_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mercury`.`project_has_platform`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercury`.`project_has_platform` (
  `project_id` INT(11) NOT NULL AUTO_INCREMENT,
  `project_platform_id` INT(11) NOT NULL,
  `create_datetime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_id`, `project_platform_id`),
  INDEX `fk_project_has_project_platform_project_platform1_idx` (`project_platform_id` ASC),
  INDEX `fk_project_has_project_platform_project1_idx` (`project_id` ASC),
  CONSTRAINT `fk_project_has_project_platform_project1`
    FOREIGN KEY (`project_id`)
    REFERENCES `mercury`.`project` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_project_has_project_platform_project_platform1`
    FOREIGN KEY (`project_platform_id`)
    REFERENCES `mercury`.`project_platform` (`project_platform_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mercury`.`team_has_volunteer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercury`.`team_has_volunteer` (
  `team_id` INT(11) NOT NULL AUTO_INCREMENT,
  `volunteer_id` INT(11) NOT NULL,
  `create_datetime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`team_id`, `volunteer_id`),
  INDEX `fk_team_has_volunteer_volunteer1_idx` (`volunteer_id` ASC),
  INDEX `fk_team_has_volunteer_team1_idx` (`team_id` ASC),
  CONSTRAINT `fk_team_has_volunteer_team1`
    FOREIGN KEY (`team_id`)
    REFERENCES `mercury`.`team` (`team_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_team_has_volunteer_volunteer1`
    FOREIGN KEY (`volunteer_id`)
    REFERENCES `mercury`.`volunteer` (`volunteer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mercury`.`verification_code`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercury`.`verification_code` (
  `verification_code_id` INT(11) NOT NULL,
  `verification_code_code` TEXT NOT NULL,
  `verification_code_salt` TEXT NOT NULL,
  `create_datetime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`verification_code_id`),
  CONSTRAINT `verification_code_fk0`
    FOREIGN KEY (`verification_code_id`)
    REFERENCES `mercury`.`volunteer` (`volunteer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mercury`.`volunteer_position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercury`.`volunteer_position` (
  `volunteer_position_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'This is the volunteers position in codedoesgood',
  `volunteer_position_name` VARCHAR(100) NOT NULL,
  `create_datetime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`volunteer_position_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mercury`.`volunteer_has_position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercury`.`volunteer_has_position` (
  `volunteer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `volunteer_position_id` INT(11) NOT NULL,
  `create_datetime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`volunteer_id`, `volunteer_position_id`),
  INDEX `fk_volunteer_has_volunteer_position_volunteer_position1_idx` (`volunteer_position_id` ASC),
  INDEX `fk_volunteer_has_volunteer_position_volunteer1_idx` (`volunteer_id` ASC),
  CONSTRAINT `fk_volunteer_has_volunteer_position_volunteer1`
    FOREIGN KEY (`volunteer_id`)
    REFERENCES `mercury`.`volunteer` (`volunteer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_volunteer_has_volunteer_position_volunteer_position1`
    FOREIGN KEY (`volunteer_position_id`)
    REFERENCES `mercury`.`volunteer_position` (`volunteer_position_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mercury`.`volunteer_skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercury`.`volunteer_skills` (
  `volunteer_skills_id` INT(11) NOT NULL AUTO_INCREMENT,
  `volunteer_skills_name` VARCHAR(255) NOT NULL,
  `create_datetime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`volunteer_skills_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mercury`.`volunteer_has_skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercury`.`volunteer_has_skills` (
  `volunteer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `volunteer_skills_id` INT(11) NOT NULL,
  `create_datetime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`volunteer_id`, `volunteer_skills_id`),
  INDEX `fk_volunteer_has_volunteer_skills_volunteer_skills1_idx` (`volunteer_skills_id` ASC),
  INDEX `fk_volunteer_has_volunteer_skills_volunteer1_idx` (`volunteer_id` ASC),
  CONSTRAINT `fk_volunteer_has_volunteer_skills_volunteer1`
    FOREIGN KEY (`volunteer_id`)
    REFERENCES `mercury`.`volunteer` (`volunteer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_volunteer_has_volunteer_skills_volunteer_skills1`
    FOREIGN KEY (`volunteer_skills_id`)
    REFERENCES `mercury`.`volunteer_skills` (`volunteer_skills_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mercury`.`volunteer_status`
-- -----------------------------------------------------
START TRANSACTION;
USE `mercury`;
INSERT INTO `mercury`.`volunteer_status` (`volunteer_status_id`, `volunteer_status_name`, `create_datetime`, `modify_time`) VALUES (1, 'Active', NULL, NULL);
INSERT INTO `mercury`.`volunteer_status` (`volunteer_status_id`, `volunteer_status_name`, `create_datetime`, `modify_time`) VALUES (2, 'Former', NULL, NULL);
INSERT INTO `mercury`.`volunteer_status` (`volunteer_status_id`, `volunteer_status_name`, `create_datetime`, `modify_time`) VALUES (3, 'Pending', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mercury`.`notification_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `mercury`;
INSERT INTO `mercury`.`notification_type` (`notification_type_id`, `notification_type_name`, `create_datetime`, `modify_time`) VALUES (1, 'Standard', NULL, NULL);
INSERT INTO `mercury`.`notification_type` (`notification_type_id`, `notification_type_name`, `create_datetime`, `modify_time`) VALUES (2, 'Announcement', NULL, NULL);
INSERT INTO `mercury`.`notification_type` (`notification_type_id`, `notification_type_name`, `create_datetime`, `modify_time`) VALUES (3, 'Project', NULL, NULL);
INSERT INTO `mercury`.`notification_type` (`notification_type_id`, `notification_type_name`, `create_datetime`, `modify_time`) VALUES (4, 'Team', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mercury`.`team_status`
-- -----------------------------------------------------
START TRANSACTION;
USE `mercury`;
INSERT INTO `mercury`.`team_status` (`team_status_id`, `team_status_name`, `create_datetime`, `modify_time`) VALUES (1, 'Active', NULL, NULL);
INSERT INTO `mercury`.`team_status` (`team_status_id`, `team_status_name`, `create_datetime`, `modify_time`) VALUES (2, 'Inactive', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mercury`.`project_platform`
-- -----------------------------------------------------
START TRANSACTION;
USE `mercury`;
INSERT INTO `mercury`.`project_platform` (`project_platform_id`, `project_platform_name`, `create_datetime`, `modify_time`) VALUES (1, 'Web', NULL, NULL);
INSERT INTO `mercury`.`project_platform` (`project_platform_id`, `project_platform_name`, `create_datetime`, `modify_time`) VALUES (2, 'Mobile (iOS)', NULL, NULL);
INSERT INTO `mercury`.`project_platform` (`project_platform_id`, `project_platform_name`, `create_datetime`, `modify_time`) VALUES (3, 'Mobile (Android)', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mercury`.`volunteer_position`
-- -----------------------------------------------------
START TRANSACTION;
USE `mercury`;
INSERT INTO `mercury`.`volunteer_position` (`volunteer_position_id`, `volunteer_position_name`, `create_datetime`, `modify_time`) VALUES (1, 'Developer', NULL, NULL);
INSERT INTO `mercury`.`volunteer_position` (`volunteer_position_id`, `volunteer_position_name`, `create_datetime`, `modify_time`) VALUES (2, 'Designer', NULL, NULL);
INSERT INTO `mercury`.`volunteer_position` (`volunteer_position_id`, `volunteer_position_name`, `create_datetime`, `modify_time`) VALUES (3, 'Administrator', NULL, NULL);
INSERT INTO `mercury`.`volunteer_position` (`volunteer_position_id`, `volunteer_position_name`, `create_datetime`, `modify_time`) VALUES (4, 'Project Leader', NULL, NULL);
INSERT INTO `mercury`.`volunteer_position` (`volunteer_position_id`, `volunteer_position_name`, `create_datetime`, `modify_time`) VALUES (5, 'Management', NULL, NULL);
INSERT INTO `mercury`.`volunteer_position` (`volunteer_position_id`, `volunteer_position_name`, `create_datetime`, `modify_time`) VALUES (6, 'Volunteer', NULL, NULL);

COMMIT;

