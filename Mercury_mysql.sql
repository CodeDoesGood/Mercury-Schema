CREATE TABLE `volunteer`
(
	`volunteer_id` INT NOT NULL AUTO_INCREMENT,
	`created_datetime` DATETIME NOT NULL,
	`data_entry_user_id` INT NOT NULL,
	`username` varchar
(20) NOT NULL UNIQUE,
	`password` TEXT NOT NULL,
	`position_id` INT,
	`volunteer_status` INT,
	`name` TEXT NOT NULL,
	`about` TEXT,
	`email` varchar
(200) NOT NULL UNIQUE,
	`phone` INT,
	`location` TEXT,
	`timezone` TEXT,
	`linked_in_url` TEXT,
	`slack_id` INT,
	`github_id` INT,
	`admin_portal_access` bool NOT NULL DEFAULT 0,
	`admin_overall_level` INT,
	`salt` TEXT NOT NULL,
	`verified` bool NOT NULL DEFAULT 0,
	PRIMARY KEY
(`volunteer_id`)
);

CREATE TABLE `project`
(
	`project_id` INT NOT NULL AUTO_INCREMENT,
	`created_datetime` DATETIME NOT NULL,
	`modify_datetime` DATETIME NOT NULL,
	`data_entry_user_id` INT NOT NULL,
	`title` TEXT NOT NULL,
	`status` int NOT NULL,
	`project_category` INT NOT NULL,
	`hidden` bool NOT NULL DEFAULT 0,
	`image_directory` TEXT,
	`description` TEXT,
	`summary` TEXT,
	`platform` int NOT NULL,
	PRIMARY KEY
(`project_id`)
);

CREATE TABLE `verification_code`
(
	`verification_code_id` INT NOT NULL,
	`code` TEXT NOT NULL,
	`created_datetime` DATE NOT NULL,
	`salt` TEXT NOT NULL,
	PRIMARY KEY
(`verification_code_id`)
);

CREATE TABLE `password_reset_code`
(
	`password_reset_code_id` INT NOT NULL,
	`code` TEXT NOT NULL,
	`created_datetime` DATETIME NOT NULL,
	`salt` TEXT NOT NULL,
	PRIMARY KEY
(`password_reset_code_id`)
);

CREATE TABLE `platform`
(
	`platform_id` INT NOT NULL AUTO_INCREMENT,
	`platform` enum
("Web", "Android", "IOS") NOT NULL,
	`description` TEXT NOT NULL,
	PRIMARY KEY
(`platform_id`)
);

CREATE TABLE `project_category`
(
	`project_category_id` INT NOT NULL AUTO_INCREMENT,
	`category` enum
("Web", "IOS", "Android", "Local", "Worldwide") NOT NULL,
	`description` TEXT NOT NULL,
	PRIMARY KEY
(`project_category_id`)
);

CREATE TABLE `project_status`
(
	`project_status_id` INT NOT NULL AUTO_INCREMENT,
	`status` enum
("Online", "Offline") NOT NULL,
	`description` TEXT NOT NULL,
	PRIMARY KEY
(`project_status_id`)
);

CREATE TABLE `position`
(
	`position_id` INT NOT NULL AUTO_INCREMENT,
	`name` enum
("Developer", "Designer", "Administrator", "Volunteer", "Moderator") NOT NULL,
	`description` TEXT NOT NULL,
	PRIMARY KEY
(`position_id`)
);

CREATE TABLE `volunteer_status_types`
(
	`volunteer_status_types_id` INT NOT NULL AUTO_INCREMENT,
	`type` enum
("Active", "Offline", "Left") NOT NULL,
	`description` TEXT NOT NULL,
	PRIMARY KEY
(`volunteer_status_types_id`)
);

CREATE TABLE stored_email
(
    stored_id INT NOT NULL
    AUTO_INCREMENT,
  stored_retry_count       INT      NOT NULL,
  stored_to                TEXT     NOT NULL,
  stored_from              TEXT NOT NULL,
  stored_subject           TEXT     NOT NULL,
  stored_text              TEXT     NOT NULL,
  stored_html              TEXT     NOT NULL,
  stored_created_datetime  DATETIME NOT NULL,
  stored_modified_datetime DATETIME NOT NULL,
  PRIMARY KEY
    (stored_id)
);

    ALTER TABLE `volunteer`
    ADD CONSTRAINT `volunteer_fk0` FOREIGN KEY
    (`position_id`) REFERENCES `position`
    (`position_id`);

    ALTER TABLE `volunteer`
    ADD CONSTRAINT `volunteer_fk1` FOREIGN KEY
    (`volunteer_status`) REFERENCES `volunteer_status_types`
    (`volunteer_status_types_id`);

    ALTER TABLE `project`
    ADD CONSTRAINT `project_fk0` FOREIGN KEY
    (`data_entry_user_id`) REFERENCES `volunteer`
    (`volunteer_id`);

    ALTER TABLE `project`
    ADD CONSTRAINT `project_fk1` FOREIGN KEY
    (`status`) REFERENCES `project_status`
    (`project_status_id`);

    ALTER TABLE `project`
    ADD CONSTRAINT `project_fk2` FOREIGN KEY
    (`project_category`) REFERENCES `project_category`
    (`project_category_id`);

    ALTER TABLE `project`
    ADD CONSTRAINT `project_fk3` FOREIGN KEY
    (`platform`) REFERENCES `platform`
    (`platform_id`);

    ALTER TABLE `verification_code`
    ADD CONSTRAINT `verification_code_fk0` FOREIGN KEY
    (`verification_code_id`) REFERENCES `volunteer`
    (`volunteer_id`);

    ALTER TABLE `password_reset_code`
    ADD CONSTRAINT `password_reset_code_fk0` FOREIGN KEY
    (`password_reset_code_id`) REFERENCES `volunteer`
    (`volunteer_id`);
