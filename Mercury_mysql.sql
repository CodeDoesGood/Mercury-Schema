CREATE TABLE `volunteer` (
	`volunteer_id` INT NOT NULL AUTO_INCREMENT,
	`created_datetime` DATETIME NOT NULL,
	`data_entry_user_id` INT NOT NULL,
	`username` TEXT NOT NULL UNIQUE,
	`password` TEXT NOT NULL,
	`position_id` INT,
	`volunteer_status` INT,
	`name` TEXT NOT NULL,
	`about` TEXT,
	`email` TEXT NOT NULL UNIQUE,
	`phone` INT,
	`location` TEXT,
	`timezone` TEXT,
	`linked_in_url` TEXT,
	`slack_id` INT,
	`github_id` INT,
	`developer_level` INT,
	`admin_portal_access` bool NOT NULL DEFAULT false,
	`admin_overall_level` INT,
	`salt` TEXT NOT NULL,
	`verified` bool NOT NULL DEFAULT false,
	PRIMARY KEY (`volunteer_id`)
);

CREATE TABLE `position` (
	`position_id` INT NOT NULL AUTO_INCREMENT,
	`name` TEXT NOT NULL,
	`description` TEXT NOT NULL,
	PRIMARY KEY (`position_id`)
);

CREATE TABLE `volunteer_status_types` (
	`volunteer_status_types_id` INT NOT NULL AUTO_INCREMENT,
	`type` varchar(10) NOT NULL,
	`description` TEXT NOT NULL,
	PRIMARY KEY (`volunteer_status_types_id`)
);

CREATE TABLE `volunteer_comment` (
	`project_comment_id` INT NOT NULL AUTO_INCREMENT,
	`data_entry_user_id` INT NOT NULL,
	`receiver_id` INT NOT NULL,
	`comment_id` INT NOT NULL,
	`read` bool NOT NULL,
	`read_date` DATETIME,
	`created_datetime` DATETIME NOT NULL,
	`modified_datetime` DATETIME NOT NULL,
	PRIMARY KEY (`project_comment_id`)
);

CREATE TABLE `comment` (
	`comment_id` INT NOT NULL AUTO_INCREMENT,
	`data_entry_user_id` INT NOT NULL,
	`comment` TEXT NOT NULL,
	`internal_only` bool NOT NULL,
	`created_datetime` DATETIME NOT NULL,
	`modified_datetime` DATETIME NOT NULL,
	PRIMARY KEY (`comment_id`)
);

CREATE TABLE `volunteer_assignment` (
	`volunteer_assignment_id` INT NOT NULL AUTO_INCREMENT,
	`completed_datetime` DATETIME NOT NULL,
	`data_entry_user_id` INT NOT NULL,
	`created_datetime` DATETIME NOT NULL,
	`assignment_text` TEXT NOT NULL,
	`modified_datetime` DATETIME NOT NULL,
	`volunteer` INT NOT NULL,
	`issue_url` TEXT NOT NULL,
	`completed` bool NOT NULL,
	PRIMARY KEY (`volunteer_assignment_id`)
);

CREATE TABLE `volunteer_announcement` (
	`volunteer_announcement_id` INT NOT NULL AUTO_INCREMENT,
	`created_datetime` DATE NOT NULL,
	`data_entry_user_id` INT NOT NULL,
	`announcement` INT NOT NULL,
	`volunteer_id` INT NOT NULL,
	`read` bool NOT NULL,
	`read_date` DATETIME,
	PRIMARY KEY (`volunteer_announcement_id`)
);

CREATE TABLE `announcement` (
	`announcement_id` INT NOT NULL AUTO_INCREMENT,
	`data_entry_user_id` INT NOT NULL,
	`title` TEXT NOT NULL,
	`body` TEXT NOT NULL,
	`announcement_type` INT NOT NULL,
	`created_datetime` DATETIME NOT NULL,
	`modified_datetime` DATETIME NOT NULL,
	PRIMARY KEY (`announcement_id`)
);

CREATE TABLE `announcement_type` (
	`announcement_type_id` INT NOT NULL AUTO_INCREMENT,
	`type` TEXT NOT NULL,
	`description` TEXT NOT NULL,
	PRIMARY KEY (`announcement_type_id`)
);

CREATE TABLE `volunteer_project_announcement` (
	`volunteer_project_announcement_id` INT NOT NULL AUTO_INCREMENT,
	`created_datetime` DATE NOT NULL,
	`data_entry_user_id` INT NOT NULL,
	`project_activity_announcement` INT NOT NULL,
	PRIMARY KEY (`volunteer_project_announcement_id`)
);

CREATE TABLE `project_activity_announcement` (
	`project_activity_announcement_id` INT NOT NULL AUTO_INCREMENT,
	`created_datetime` DATETIME NOT NULL,
	`data_entry_user_id` INT NOT NULL,
	`title` TEXT NOT NULL,
	`body` TEXT NOT NULL,
	`project_activity` INT NOT NULL,
	`announcement_type` INT NOT NULL,
	PRIMARY KEY (`project_activity_announcement_id`)
);

CREATE TABLE `project_announcement_type` (
	`project_announcement_type_id` INT NOT NULL AUTO_INCREMENT,
	`type` TEXT NOT NULL,
	`description` TEXT NOT NULL,
	PRIMARY KEY (`project_announcement_type_id`)
);

CREATE TABLE `project_activity` (
	`project_activity_id` INT NOT NULL AUTO_INCREMENT,
	`created_datetime` DATETIME NOT NULL,
	`data_entry_user_id` INT NOT NULL,
	`project` INT NOT NULL,
	`title` TEXT NOT NULL,
	`activity_type` INT NOT NULL,
	`staff` INT NOT NULL,
	`drive_link` TEXT NOT NULL,
	PRIMARY KEY (`project_activity_id`)
);

CREATE TABLE `project` (
	`project_id` INT NOT NULL AUTO_INCREMENT,
	`created_datetime` DATETIME NOT NULL,
	`data_entry_user_id` INT NOT NULL,
	`title` TEXT NOT NULL,
	`status` INT NOT NULL,
	`project_category` INT NOT NULL,
	`hidden` bool NOT NULL DEFAULT false,
	`image_directory` TEXT,
	`description` TEXT,
	`summary` TEXT,
	PRIMARY KEY (`project_id`)
);

CREATE TABLE `activity_type` (
	`activity_type_id` INT NOT NULL AUTO_INCREMENT,
	`type` TEXT NOT NULL,
	`description` TEXT NOT NULL,
	PRIMARY KEY (`activity_type_id`)
);

CREATE TABLE `project_status` (
	`project_status_id` INT NOT NULL AUTO_INCREMENT,
	`status` TEXT NOT NULL,
	`description` TEXT NOT NULL,
	`created_datetime` DATETIME NOT NULL,
	`modified_datetime` DATETIME NOT NULL,
	PRIMARY KEY (`project_status_id`)
);

CREATE TABLE `project_category` (
	`project_category_id` INT NOT NULL AUTO_INCREMENT,
	`name` TEXT NOT NULL DEFAULT ' ',
	`description` TEXT NOT NULL DEFAULT ' ',
	PRIMARY KEY (`project_category_id`)
);

CREATE TABLE `project_team_request` (
	`project_team_request_id` INT NOT NULL AUTO_INCREMENT,
	`created_datetime` DATETIME NOT NULL,
	`data_entry_user_id` INT NOT NULL,
	`project_id` INT NOT NULL,
	`request_user_id` INT NOT NULL,
	`request_status` INT NOT NULL,
	`response_user_id` INT NOT NULL,
	`response_message` TEXT NOT NULL,
	`response_date` DATETIME NOT NULL,
	PRIMARY KEY (`project_team_request_id`)
);

CREATE TABLE `request_status` (
	`request_status_id` INT NOT NULL AUTO_INCREMENT,
	`name` TEXT NOT NULL,
	`description` TEXT NOT NULL,
	PRIMARY KEY (`request_status_id`)
);

CREATE TABLE `project_sub_activity` (
	`sub_activity_id` INT NOT NULL AUTO_INCREMENT,
	`data_entry_user_id` INT NOT NULL,
	`approved_by` INT NOT NULL,
	`platform` INT NOT NULL,
	`lead_mentor` INT NOT NULL,
	`assistant_mentor` INT NOT NULL,
	`information` TEXT NOT NULL,
	`data_entry_date` DATETIME NOT NULL,
	`project_activity` INT NOT NULL,
	`development_team` TEXT NOT NULL,
	`ideation_team` TEXT NOT NULL,
	`specification_team` TEXT NOT NULL,
	`negotiation_team` TEXT NOT NULL,
	`research_team` TEXT NOT NULL,
	`design_team` TEXT NOT NULL,
	`design_review_team` TEXT NOT NULL,
	`marketing_plan_team` TEXT NOT NULL,
	`drive_link` TEXT NOT NULL,
	`git_link` TEXT NOT NULL,
	`description` TEXT NOT NULL,
	PRIMARY KEY (`sub_activity_id`)
);

CREATE TABLE `platform` (
	`platform_id` INT NOT NULL AUTO_INCREMENT,
	`name` TEXT NOT NULL,
	`description` TEXT NOT NULL,
	PRIMARY KEY (`platform_id`)
);

CREATE TABLE `project_team` (
	`project_team_id` INT NOT NULL AUTO_INCREMENT,
	`created_datetime` DATETIME NOT NULL,
	`data_entry_user_id` INT NOT NULL,
	`project` INT NOT NULL,
	`volunteer` INT NOT NULL,
	`is_project_organizer` bool NOT NULL,
	`member_role` INT NOT NULL,
	`member_status` INT NOT NULL,
	`platform` INT NOT NULL,
	PRIMARY KEY (`project_team_id`)
);

CREATE TABLE `member_role` (
	`member_role_id` INT NOT NULL AUTO_INCREMENT,
	`role` TEXT NOT NULL,
	`description` TEXT NOT NULL,
	PRIMARY KEY (`member_role_id`)
);

CREATE TABLE `member_status` (
	`member_status_id` INT NOT NULL AUTO_INCREMENT,
	`status` TEXT NOT NULL,
	`description` TEXT NOT NULL,
	PRIMARY KEY (`member_status_id`)
);

CREATE TABLE `volunteer_reports` (
	`volunteer_reports_id` INT NOT NULL AUTO_INCREMENT,
	`created_datetime` DATETIME NOT NULL,
	`volunteer_id` INT NOT NULL,
	`name` TEXT NOT NULL,
	`email` TEXT NOT NULL,
	`slack_reminder` TEXT NOT NULL,
	`activity_note` TEXT NOT NULL,
	`marketing_outreach` TEXT NOT NULL,
	`staffing_current` TEXT NOT NULL,
	`staffing_upcoming` TEXT NOT NULL,
	`intake_volunteer_type` INT NOT NULL,
	`platform` INT NOT NULL,
	`developer_type` INT NOT NULL,
	`interested_in` INT NOT NULL,
	`experience` TEXT NOT NULL,
	`client_experience` bool NOT NULL,
	`client_experience_types` TEXT NOT NULL,
	`team_management_experience` bool NOT NULL,
	`previous_non_profit_exp` bool NOT NULL,
	`will_be_active_on_slack` bool NOT NULL,
	PRIMARY KEY (`volunteer_reports_id`)
);

CREATE TABLE `developer_level` (
	`developer_level_id` INT NOT NULL AUTO_INCREMENT,
	`level` int NOT NULL,
	`description` TEXT NOT NULL,
	PRIMARY KEY (`developer_level_id`)
);

CREATE TABLE `report_volunteer_type` (
	`report_volunteer_type_id` INT NOT NULL AUTO_INCREMENT,
	`type` varchar(5) NOT NULL,
	`description` TEXT NOT NULL,
	PRIMARY KEY (`report_volunteer_type_id`)
);

CREATE TABLE `report_volunteer_interest` (
	`report_volunteer_interest_id` INT NOT NULL AUTO_INCREMENT,
	`name` TEXT NOT NULL,
	`description` TEXT NOT NULL,
	PRIMARY KEY (`report_volunteer_interest_id`)
);

CREATE TABLE `developer_type` (
	`developer_type_id` INT NOT NULL AUTO_INCREMENT,
	`type` varchar(5) NOT NULL,
	`description` TEXT NOT NULL,
	PRIMARY KEY (`developer_type_id`)
);

CREATE TABLE `joining_reason` (
	`joining_reason_id` INT NOT NULL AUTO_INCREMENT,
	`reason` TEXT NOT NULL,
	`description` TEXT NOT NULL,
	PRIMARY KEY (`joining_reason_id`)
);

CREATE TABLE `intake_process_steps` (
	`intake_process_steps_id` INT NOT NULL AUTO_INCREMENT,
	`description` TEXT NOT NULL,
	PRIMARY KEY (`intake_process_steps_id`)
);

CREATE TABLE `role_type` (
	`role_type_id` INT NOT NULL AUTO_INCREMENT,
	`role` varchar(25) NOT NULL,
	`description` TEXT NOT NULL,
	PRIMARY KEY (`role_type_id`)
);

CREATE TABLE `entrollment_form` (
	`entrollment_form_id` INT NOT NULL AUTO_INCREMENT,
	`created_datetime` DATETIME NOT NULL,
	`data_entry_user_id` INT NOT NULL,
	`volunteer_id` INT NOT NULL,
	`URL_sample_project` TEXT NOT NULL,
	`URL_additional` TEXT NOT NULL,
	`is_working` bool NOT NULL,
	`interested_to_join_as` TEXT NOT NULL,
	`desired_roles` TEXT NOT NULL,
	`looking_to_work_on_project` bool NOT NULL,
	`spending_free_time_volunteering` bool NOT NULL,
	`contribute_time_per_week` TEXT NOT NULL,
	`primary_join_reason` INT NOT NULL,
	`secondary_join_reason` INT NOT NULL,
	`additional_info` TEXT NOT NULL,
	`intake_process_step` INT NOT NULL,
	`developer_platforms` TEXT NOT NULL,
	`developer_other_tech` TEXT NOT NULL,
	`developer_self_level` INT NOT NULL,
	PRIMARY KEY (`entrollment_form_id`)
);

CREATE TABLE `project_suggestion_form` (
	`project_suggestion_form_id` INT NOT NULL AUTO_INCREMENT,
	`created_datetime` DATETIME NOT NULL,
	`data_entry_user_id` INT NOT NULL,
	`name` TEXT NOT NULL,
	`email` TEXT NOT NULL,
	`applied_to_volunteer` bool NOT NULL,
	`part_of_team` bool NOT NULL,
	`want_involved_reason` TEXT NOT NULL,
	`project_idea` TEXT NOT NULL,
	PRIMARY KEY (`project_suggestion_form_id`)
);

CREATE TABLE `verification_code` (
	`verification_code_id` INT NOT NULL,
	`code` TEXT NOT NULL,
	`created_datetime` DATE NOT NULL,
	`salt` TEXT NOT NULL,
	PRIMARY KEY (`verification_code_id`)
);

CREATE TABLE `password_reset_code` (
	`password_reset_code_id` INT NOT NULL,
	`code` TEXT NOT NULL,
	`created_datetime` DATETIME NOT NULL,
	`salt` TEXT NOT NULL,
	PRIMARY KEY (`password_reset_code_id`)
);

ALTER TABLE `volunteer` ADD CONSTRAINT `volunteer_fk0` FOREIGN KEY (`position_id`) REFERENCES `position`(`position_id`);

ALTER TABLE `volunteer` ADD CONSTRAINT `volunteer_fk1` FOREIGN KEY (`volunteer_status`) REFERENCES `volunteer_status_types`(`volunteer_status_types_id`);

ALTER TABLE `volunteer` ADD CONSTRAINT `volunteer_fk2` FOREIGN KEY (`admin_overall_level`) REFERENCES ``(``);

ALTER TABLE `volunteer_comment` ADD CONSTRAINT `volunteer_comment_fk0` FOREIGN KEY (`data_entry_user_id`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `volunteer_comment` ADD CONSTRAINT `volunteer_comment_fk1` FOREIGN KEY (`receiver_id`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `volunteer_comment` ADD CONSTRAINT `volunteer_comment_fk2` FOREIGN KEY (`comment_id`) REFERENCES `comment`(`comment_id`);

ALTER TABLE `comment` ADD CONSTRAINT `comment_fk0` FOREIGN KEY (`data_entry_user_id`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `volunteer_assignment` ADD CONSTRAINT `volunteer_assignment_fk0` FOREIGN KEY (`data_entry_user_id`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `volunteer_assignment` ADD CONSTRAINT `volunteer_assignment_fk1` FOREIGN KEY (`volunteer`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `volunteer_announcement` ADD CONSTRAINT `volunteer_announcement_fk0` FOREIGN KEY (`data_entry_user_id`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `volunteer_announcement` ADD CONSTRAINT `volunteer_announcement_fk1` FOREIGN KEY (`announcement`) REFERENCES `announcement`(`announcement_id`);

ALTER TABLE `volunteer_announcement` ADD CONSTRAINT `volunteer_announcement_fk2` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `announcement` ADD CONSTRAINT `announcement_fk0` FOREIGN KEY (`data_entry_user_id`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `announcement` ADD CONSTRAINT `announcement_fk1` FOREIGN KEY (`announcement_type`) REFERENCES `announcement_type`(`announcement_type_id`);

ALTER TABLE `volunteer_project_announcement` ADD CONSTRAINT `volunteer_project_announcement_fk0` FOREIGN KEY (`data_entry_user_id`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `project_activity_announcement` ADD CONSTRAINT `project_activity_announcement_fk0` FOREIGN KEY (`data_entry_user_id`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `project_activity_announcement` ADD CONSTRAINT `project_activity_announcement_fk1` FOREIGN KEY (`announcement_type`) REFERENCES `project_announcement_type`(`project_announcement_type_id`);

ALTER TABLE `project_activity` ADD CONSTRAINT `project_activity_fk0` FOREIGN KEY (`data_entry_user_id`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `project_activity` ADD CONSTRAINT `project_activity_fk1` FOREIGN KEY (`project`) REFERENCES `project`(`project_id`);

ALTER TABLE `project_activity` ADD CONSTRAINT `project_activity_fk2` FOREIGN KEY (`activity_type`) REFERENCES `activity_type`(`activity_type_id`);

ALTER TABLE `project_activity` ADD CONSTRAINT `project_activity_fk3` FOREIGN KEY (`staff`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `project` ADD CONSTRAINT `project_fk0` FOREIGN KEY (`data_entry_user_id`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `project` ADD CONSTRAINT `project_fk1` FOREIGN KEY (`status`) REFERENCES `project_status`(`project_status_id`);

ALTER TABLE `project` ADD CONSTRAINT `project_fk2` FOREIGN KEY (`project_category`) REFERENCES `project_category`(`project_category_id`);

ALTER TABLE `project_team_request` ADD CONSTRAINT `project_team_request_fk0` FOREIGN KEY (`data_entry_user_id`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `project_team_request` ADD CONSTRAINT `project_team_request_fk1` FOREIGN KEY (`project_id`) REFERENCES `project`(`project_id`);

ALTER TABLE `project_team_request` ADD CONSTRAINT `project_team_request_fk2` FOREIGN KEY (`request_user_id`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `project_team_request` ADD CONSTRAINT `project_team_request_fk3` FOREIGN KEY (`request_status`) REFERENCES `request_status`(`request_status_id`);

ALTER TABLE `project_team_request` ADD CONSTRAINT `project_team_request_fk4` FOREIGN KEY (`response_user_id`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `project_sub_activity` ADD CONSTRAINT `project_sub_activity_fk0` FOREIGN KEY (`data_entry_user_id`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `project_sub_activity` ADD CONSTRAINT `project_sub_activity_fk1` FOREIGN KEY (`approved_by`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `project_sub_activity` ADD CONSTRAINT `project_sub_activity_fk2` FOREIGN KEY (`platform`) REFERENCES `platform`(`platform_id`);

ALTER TABLE `project_sub_activity` ADD CONSTRAINT `project_sub_activity_fk3` FOREIGN KEY (`lead_mentor`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `project_sub_activity` ADD CONSTRAINT `project_sub_activity_fk4` FOREIGN KEY (`assistant_mentor`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `project_sub_activity` ADD CONSTRAINT `project_sub_activity_fk5` FOREIGN KEY (`project_activity`) REFERENCES `project_activity`(`project_activity_id`);

ALTER TABLE `project_team` ADD CONSTRAINT `project_team_fk0` FOREIGN KEY (`data_entry_user_id`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `project_team` ADD CONSTRAINT `project_team_fk1` FOREIGN KEY (`project`) REFERENCES `project`(`project_id`);

ALTER TABLE `project_team` ADD CONSTRAINT `project_team_fk2` FOREIGN KEY (`volunteer`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `project_team` ADD CONSTRAINT `project_team_fk3` FOREIGN KEY (`member_role`) REFERENCES `member_role`(`member_role_id`);

ALTER TABLE `project_team` ADD CONSTRAINT `project_team_fk4` FOREIGN KEY (`member_status`) REFERENCES `member_status`(`member_status_id`);

ALTER TABLE `project_team` ADD CONSTRAINT `project_team_fk5` FOREIGN KEY (`platform`) REFERENCES `platform`(`platform_id`);

ALTER TABLE `volunteer_reports` ADD CONSTRAINT `volunteer_reports_fk0` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `volunteer_reports` ADD CONSTRAINT `volunteer_reports_fk1` FOREIGN KEY (`intake_volunteer_type`) REFERENCES `report_volunteer_type`(`report_volunteer_type_id`);

ALTER TABLE `volunteer_reports` ADD CONSTRAINT `volunteer_reports_fk2` FOREIGN KEY (`platform`) REFERENCES `platform`(`platform_id`);

ALTER TABLE `volunteer_reports` ADD CONSTRAINT `volunteer_reports_fk3` FOREIGN KEY (`developer_type`) REFERENCES `developer_type`(`developer_type_id`);

ALTER TABLE `volunteer_reports` ADD CONSTRAINT `volunteer_reports_fk4` FOREIGN KEY (`interested_in`) REFERENCES `report_volunteer_interest`(`report_volunteer_interest_id`);

ALTER TABLE `entrollment_form` ADD CONSTRAINT `entrollment_form_fk0` FOREIGN KEY (`data_entry_user_id`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `entrollment_form` ADD CONSTRAINT `entrollment_form_fk1` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `entrollment_form` ADD CONSTRAINT `entrollment_form_fk2` FOREIGN KEY (`primary_join_reason`) REFERENCES `joining_reason`(`joining_reason_id`);

ALTER TABLE `entrollment_form` ADD CONSTRAINT `entrollment_form_fk3` FOREIGN KEY (`secondary_join_reason`) REFERENCES `joining_reason`(`joining_reason_id`);

ALTER TABLE `entrollment_form` ADD CONSTRAINT `entrollment_form_fk4` FOREIGN KEY (`intake_process_step`) REFERENCES `intake_process_steps`(`intake_process_steps_id`);

ALTER TABLE `entrollment_form` ADD CONSTRAINT `entrollment_form_fk5` FOREIGN KEY (`developer_self_level`) REFERENCES `developer_level`(`developer_level_id`);

ALTER TABLE `project_suggestion_form` ADD CONSTRAINT `project_suggestion_form_fk0` FOREIGN KEY (`data_entry_user_id`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `verification_code` ADD CONSTRAINT `verification_code_fk0` FOREIGN KEY (`verification_code_id`) REFERENCES `volunteer`(`volunteer_id`);

ALTER TABLE `password_reset_code` ADD CONSTRAINT `password_reset_code_fk0` FOREIGN KEY (`password_reset_code_id`) REFERENCES `volunteer`(`volunteer_id`);
