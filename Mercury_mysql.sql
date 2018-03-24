CREATE TABLE volunteer (
  volunteer_id        INT          NOT NULL AUTO_INCREMENT,
  created_datetime    DATETIME     NOT NULL,
  data_entry_user_id  INT          NOT NULL,
  username            VARCHAR(20)  NOT NULL UNIQUE,
  PASSWORD            TEXT         NOT NULL,
  position_id         INT,
  volunteer_status    INT,
  NAME                TEXT         NOT NULL,
  about               TEXT,
  email               VARCHAR(200) NOT NULL UNIQUE,
  phone               VARCHAR(15),
  location            TEXT,
  timezone            TEXT,
  linked_in_id        VARCHAR(50),
  slack_id            VARCHAR(50),
  github_id           VARCHAR(50),
  twitter_id          VARCHAR(50),
  developer_level     INT,
  picture_url         VARCHAR(150),
  admin_portal_access BOOL         NOT NULL DEFAULT FALSE,
  admin_overall_level INT,
  salt                TEXT         NOT NULL,
  verified            BOOL         NOT NULL DEFAULT FALSE,
  PRIMARY KEY (volunteer_id)
);

CREATE TABLE position (
  position_id INT                                                                       NOT NULL AUTO_INCREMENT,
  name        ENUM ('Developer', 'Designer', 'Administrator', 'Volunteer', 'Moderator') NOT NULL,
  description TEXT                                                                      NOT NULL,
  PRIMARY KEY (position_id)
);

CREATE TABLE volunteer_status_types (
  volunteer_status_types_id INT                                NOT NULL AUTO_INCREMENT,
  type                      ENUM ('Active', 'Offline', 'Left') NOT NULL,
  description               TEXT                               NOT NULL,
  PRIMARY KEY (volunteer_status_types_id)
);

CREATE TABLE volunteer_comment (
  project_comment_id INT      NOT NULL AUTO_INCREMENT,
  data_entry_user_id INT      NOT NULL,
  receiver_id        INT      NOT NULL,
  comment_id         INT      NOT NULL,
  `read`             BOOL     NOT NULL,
  read_date          DATETIME NOT NULL,
  created_datetime   DATETIME NOT NULL,
  modified_datetime  DATETIME NOT NULL,
  PRIMARY KEY (project_comment_id)
);

CREATE TABLE comment (
  comment_id         INT      NOT NULL AUTO_INCREMENT,
  data_entry_user_id INT      NOT NULL,
  comment            TEXT     NOT NULL,
  internal_only      BOOL     NOT NULL,
  created_datetime   DATETIME NOT NULL,
  modified_datetime  DATETIME NOT NULL,
  PRIMARY KEY (comment_id)
);

CREATE TABLE volunteer_assignment (
  volunteer_assignment_id INT      NOT NULL AUTO_INCREMENT,
  completed_datetime      DATETIME NOT NULL,
  data_entry_user_id      INT      NOT NULL,
  created_datetime        DATETIME NOT NULL,
  assignment_text         TEXT     NOT NULL,
  modified_datetime       DATETIME NOT NULL,
  volunteer               INT      NOT NULL,
  issue_url               TEXT     NOT NULL,
  completed               BOOL     NOT NULL,
  PRIMARY KEY (volunteer_assignment_id)
);

CREATE TABLE volunteer_announcement (
  volunteer_announcement_id INT  NOT NULL AUTO_INCREMENT,
  created_datetime          DATE NOT NULL,
  data_entry_user_id        INT  NOT NULL,
  announcement              INT  NOT NULL,
  volunteer_id              INT  NOT NULL,
  `read`                    BOOL NOT NULL,
  read_date                 DATETIME,
  PRIMARY KEY (volunteer_announcement_id)
);

CREATE TABLE announcement (
  announcement_id    INT      NOT NULL AUTO_INCREMENT,
  data_entry_user_id INT      NOT NULL,
  title              TEXT     NOT NULL,
  body               TEXT     NOT NULL,
  announcement_type  INT      NOT NULL,
  created_datetime   DATETIME NOT NULL,
  modified_datetime  DATETIME NOT NULL,
  PRIMARY KEY (announcement_id)
);

CREATE TABLE announcement_type (
  announcement_type_id INT                        NOT NULL AUTO_INCREMENT,
  type                 ENUM ('Volunteer', 'Site') NOT NULL,
  description          TEXT                       NOT NULL,
  PRIMARY KEY (announcement_type_id)
);

CREATE TABLE volunteer_project_announcement (
  volunteer_project_announcement_id INT  NOT NULL AUTO_INCREMENT,
  created_datetime                  DATE NOT NULL,
  data_entry_user_id                INT  NOT NULL,
  project_activity_announcement     INT  NOT NULL,
  PRIMARY KEY (volunteer_project_announcement_id)
);

CREATE TABLE project_activity_announcement (
  project_activity_announcement_id INT      NOT NULL AUTO_INCREMENT,
  created_datetime                 DATETIME NOT NULL,
  data_entry_user_id               INT      NOT NULL,
  title                            TEXT     NOT NULL,
  body                             TEXT     NOT NULL,
  project_activity                 INT      NOT NULL,
  announcement_type                INT      NOT NULL,
  PRIMARY KEY (project_activity_announcement_id)
);

CREATE TABLE project_announcement_type (
  project_announcement_type_id INT                       NOT NULL AUTO_INCREMENT,
  type                         ENUM ('Success', 'Error') NOT NULL,
  description                  TEXT                      NOT NULL,
  PRIMARY KEY (project_announcement_type_id)
);

CREATE TABLE project_activity (
  project_activity_id INT      NOT NULL AUTO_INCREMENT,
  created_datetime    DATETIME NOT NULL,
  data_entry_user_id  INT      NOT NULL,
  project             INT      NOT NULL,
  title               TEXT     NOT NULL,
  activity_type       INT      NOT NULL,
  staff               INT      NOT NULL,
  drive_link          TEXT     NOT NULL,
  PRIMARY KEY (project_activity_id)
);

CREATE TABLE project (
  project_id         INT      NOT NULL AUTO_INCREMENT,
  created_datetime   DATETIME NOT NULL,
  data_entry_user_id INT      NOT NULL,
  title              TEXT     NOT NULL,
  status             INT      NOT NULL,
  project_category   INT      NOT NULL,
  hidden             BOOL     NOT NULL DEFAULT FALSE,
  image_directory    TEXT,
  description        TEXT,
  summary            TEXT,
  PRIMARY KEY (project_id)
);

CREATE TABLE activity_type (
  activity_type_id INT                                     NOT NULL AUTO_INCREMENT,
  type             ENUM ('volunteer', 'project', 'status') NOT NULL,
  description      TEXT                                    NOT NULL,
  PRIMARY KEY (activity_type_id)
);

CREATE TABLE project_status (
  project_status_id INT                        NOT NULL AUTO_INCREMENT,
  status            ENUM ('Online', 'Offline') NOT NULL,
  description       TEXT                       NOT NULL,
  PRIMARY KEY (project_status_id)
);

CREATE TABLE project_category (
  project_category_id INT                                                  NOT NULL AUTO_INCREMENT,
  category            ENUM ('Web', 'IOS', 'Android', 'Local', 'Worldwide') NOT NULL,
  description         TEXT                                                 NOT NULL,
  PRIMARY KEY (project_category_id)
);

CREATE TABLE project_team_request (
  project_team_request_id INT      NOT NULL AUTO_INCREMENT,
  created_datetime        DATETIME NOT NULL,
  data_entry_user_id      INT      NOT NULL,
  project_id              INT      NOT NULL,
  request_user_id         INT      NOT NULL,
  request_status          INT      NOT NULL,
  response_user_id        INT      NOT NULL,
  response_message        TEXT     NOT NULL,
  response_date           DATETIME NOT NULL,
  PRIMARY KEY (project_team_request_id)
);

CREATE TABLE request_status (
  request_status_id INT                             NOT NULL AUTO_INCREMENT,
  status            ENUM ('Complete', 'Processing') NOT NULL,
  description       TEXT                            NOT NULL,
  PRIMARY KEY (request_status_id)
);

CREATE TABLE project_sub_activity (
  sub_activity_id     INT      NOT NULL AUTO_INCREMENT,
  data_entry_user_id  INT      NOT NULL,
  approved_by         INT      NOT NULL,
  platform            INT      NOT NULL,
  lead_mentor         INT      NOT NULL,
  assistant_mentor    INT      NOT NULL,
  information         TEXT     NOT NULL,
  data_entry_date     DATETIME NOT NULL,
  project_activity    INT      NOT NULL,
  development_team    TEXT     NOT NULL,
  ideation_team       TEXT     NOT NULL,
  specification_team  TEXT     NOT NULL,
  negotiation_team    TEXT     NOT NULL,
  research_team       TEXT     NOT NULL,
  design_team         TEXT     NOT NULL,
  design_review_team  TEXT     NOT NULL,
  marketing_plan_team TEXT     NOT NULL,
  drive_link          TEXT     NOT NULL,
  git_link            TEXT     NOT NULL,
  description         TEXT     NOT NULL,
  PRIMARY KEY (sub_activity_id)
);

CREATE TABLE platform (
  platform_id INT                            NOT NULL AUTO_INCREMENT,
  platform    ENUM ('Web', 'Android', 'IOS') NOT NULL,
  description TEXT                           NOT NULL,
  PRIMARY KEY (platform_id)
);

CREATE TABLE project_team (
  project_team_id      INT      NOT NULL AUTO_INCREMENT,
  created_datetime     DATETIME NOT NULL,
  data_entry_user_id   INT      NOT NULL,
  project              INT      NOT NULL,
  volunteer            INT      NOT NULL,
  is_project_organizer BOOL     NOT NULL,
  member_role          INT      NOT NULL,
  member_status        INT      NOT NULL,
  platform             INT      NOT NULL,
  PRIMARY KEY (project_team_id)
);

CREATE TABLE member_role (
  member_role_id INT                                    NOT NULL AUTO_INCREMENT,
  role           ENUM ('Admin', 'Developer', 'Trainer') NOT NULL,
  description    TEXT                                   NOT NULL,
  PRIMARY KEY (member_role_id)
);

CREATE TABLE member_status (
  member_status_id INT                        NOT NULL AUTO_INCREMENT,
  status           ENUM ('Active', 'Offline') NOT NULL,
  description      TEXT                       NOT NULL,
  PRIMARY KEY (member_status_id)
);

CREATE TABLE volunteer_reports (
  volunteer_reports_id       INT      NOT NULL AUTO_INCREMENT,
  created_datetime           DATETIME NOT NULL,
  volunteer_id               INT      NOT NULL,
  name                       TEXT     NOT NULL,
  email                      TEXT     NOT NULL,
  slack_reminder             TEXT     NOT NULL,
  activity_note              TEXT     NOT NULL,
  marketing_outreach         TEXT     NOT NULL,
  staffing_current           TEXT     NOT NULL,
  staffing_upcoming          TEXT     NOT NULL,
  intake_volunteer_type      INT      NOT NULL,
  platform                   INT      NOT NULL,
  developer_type             INT      NOT NULL,
  interested_in              INT      NOT NULL,
  experience                 TEXT     NOT NULL,
  client_experience          BOOL     NOT NULL,
  client_experience_types    TEXT     NOT NULL,
  team_management_experience BOOL     NOT NULL,
  previous_non_profit_exp    BOOL     NOT NULL,
  will_be_active_on_slack    BOOL     NOT NULL,
  PRIMARY KEY (volunteer_reports_id)
);

CREATE TABLE developer_level (
  developer_level_id INT                                   NOT NULL AUTO_INCREMENT,
  level              ENUM ('Basic', 'Average', 'Advanced') NOT NULL,
  description        TEXT                                  NOT NULL,
  PRIMARY KEY (developer_level_id)
);

CREATE TABLE report_volunteer_type (
  report_volunteer_type_id INT                      NOT NULL AUTO_INCREMENT,
  type                     ENUM ('success', 'fail') NOT NULL,
  description              TEXT                     NOT NULL,
  PRIMARY KEY (report_volunteer_type_id)
);

CREATE TABLE report_volunteer_interest (
  report_volunteer_interest_id INT                                              NOT NULL AUTO_INCREMENT,
  interest                     ENUM ('Volunteering', 'Developing', 'Designing') NOT NULL,
  description                  TEXT                                             NOT NULL,
  PRIMARY KEY (report_volunteer_interest_id)
);

CREATE TABLE developer_type (
  developer_type_id INT                            NOT NULL AUTO_INCREMENT,
  type              ENUM ('Web', 'Android', 'IOS') NOT NULL,
  description       TEXT                           NOT NULL,
  PRIMARY KEY (developer_type_id)
);

CREATE TABLE joining_reason (
  joining_reason_id INT                                             NOT NULL AUTO_INCREMENT,
  reason            ENUM ('Volunteer', 'Programming', 'Experience') NOT NULL,
  description       TEXT                                            NOT NULL,
  PRIMARY KEY (joining_reason_id)
);

CREATE TABLE intake_process_steps (
  intake_process_steps_id INT  NOT NULL AUTO_INCREMENT,
  description             TEXT NOT NULL,
  PRIMARY KEY (intake_process_steps_id)
);

CREATE TABLE role_type (
  role_type_id INT                                                                       NOT NULL AUTO_INCREMENT,
  role         ENUM ('Developer', 'Designer', 'Administrator', 'Volunteer', 'Moderator') NOT NULL,
  description  TEXT                                                                      NOT NULL,
  PRIMARY KEY (role_type_id)
);

CREATE TABLE entrollment_form (
  entrollment_form_id             INT      NOT NULL AUTO_INCREMENT,
  created_datetime                DATETIME NOT NULL,
  data_entry_user_id              INT      NOT NULL,
  volunteer_id                    INT      NOT NULL,
  URL_sample_project              TEXT     NOT NULL,
  URL_additional                  TEXT     NOT NULL,
  is_working                      BOOL     NOT NULL,
  interested_to_join_as           TEXT     NOT NULL,
  desired_roles                   TEXT     NOT NULL,
  looking_to_work_on_project      BOOL     NOT NULL,
  spending_free_time_volunteering BOOL     NOT NULL,
  contribute_time_per_week        TEXT     NOT NULL,
  primary_join_reason             INT      NOT NULL,
  secondary_join_reason           INT      NOT NULL,
  additional_info                 TEXT     NOT NULL,
  intake_process_step             INT      NOT NULL,
  developer_platforms             TEXT     NOT NULL,
  developer_other_tech            TEXT     NOT NULL,
  developer_self_level            INT      NOT NULL,
  PRIMARY KEY (entrollment_form_id)
);

CREATE TABLE project_suggestion_form (
  project_suggestion_form_id INT      NOT NULL AUTO_INCREMENT,
  created_datetime           DATETIME NOT NULL,
  data_entry_user_id         INT      NOT NULL,
  name                       TEXT     NOT NULL,
  email                      TEXT     NOT NULL,
  applied_to_volunteer       BOOL     NOT NULL,
  part_of_team               BOOL     NOT NULL,
  want_involved_reason       TEXT     NOT NULL,
  project_idea               TEXT     NOT NULL,
  PRIMARY KEY (project_suggestion_form_id)
);

CREATE TABLE verification_code (
  verification_code_id INT  NOT NULL AUTO_INCREMENT,
  code                 TEXT NOT NULL,
  created_datetime     DATE NOT NULL,
  salt                 TEXT NOT NULL,
  PRIMARY KEY (verification_code_id)
);

CREATE TABLE password_reset_code (
  password_reset_code_id INT      NOT NULL AUTO_INCREMENT,
  code                   TEXT     NOT NULL,
  created_datetime       DATETIME NOT NULL,
  salt                   TEXT     NOT NULL,
  PRIMARY KEY (password_reset_code_id)
);

CREATE TABLE stored_email (
  stored_id                INT      NOT NULL AUTO_INCREMENT,
  stored_retry_count       INT      NOT NULL,
  stored_to                TEXT     NOT NULL,
  stored_from              TEXT NOT NULL,
  stored_subject           TEXT     NOT NULL,
  stored_text              TEXT     NOT NULL,
  stored_html              TEXT     NOT NULL,
  stored_created_datetime  DATETIME NOT NULL,
  stored_modified_datetime DATETIME NOT NULL,
  PRIMARY KEY (stored_id)
);

ALTER TABLE volunteer
  ADD CONSTRAINT fk_position_id FOREIGN KEY (position_id) REFERENCES position (position_id),
  ADD CONSTRAINT fk_volunteer_status FOREIGN KEY (volunteer_status) REFERENCES volunteer_status_types (volunteer_status_types_id);

ALTER TABLE volunteer_comment
  ADD CONSTRAINT volunteer_comment_fk0 FOREIGN KEY (data_entry_user_id) REFERENCES volunteer (volunteer_id);

ALTER TABLE volunteer_comment
  ADD CONSTRAINT volunteer_comment_fk1 FOREIGN KEY (receiver_id) REFERENCES volunteer (volunteer_id);

ALTER TABLE volunteer_comment
  ADD CONSTRAINT volunteer_comment_fk2 FOREIGN KEY (comment_id) REFERENCES comment (comment_id);

ALTER TABLE comment
  ADD CONSTRAINT comment_fk0 FOREIGN KEY (data_entry_user_id) REFERENCES volunteer (volunteer_id);

ALTER TABLE volunteer_assignment
  ADD CONSTRAINT volunteer_assignment_fk0 FOREIGN KEY (data_entry_user_id) REFERENCES volunteer (volunteer_id);

ALTER TABLE volunteer_assignment
  ADD CONSTRAINT volunteer_assignment_fk1 FOREIGN KEY (volunteer) REFERENCES volunteer (volunteer_id);

ALTER TABLE volunteer_announcement
  ADD CONSTRAINT volunteer_announcement_fk0 FOREIGN KEY (data_entry_user_id) REFERENCES volunteer (volunteer_id);

ALTER TABLE volunteer_announcement
  ADD CONSTRAINT volunteer_announcement_fk1 FOREIGN KEY (announcement) REFERENCES announcement (announcement_id);

ALTER TABLE volunteer_announcement
  ADD CONSTRAINT volunteer_announcement_fk2 FOREIGN KEY (volunteer_id) REFERENCES volunteer (volunteer_id);

ALTER TABLE announcement
  ADD CONSTRAINT announcement_fk0 FOREIGN KEY (data_entry_user_id) REFERENCES volunteer (volunteer_id);

ALTER TABLE announcement
  ADD CONSTRAINT announcement_fk1 FOREIGN KEY (announcement_type) REFERENCES announcement_type (announcement_type_id);

ALTER TABLE volunteer_project_announcement
  ADD CONSTRAINT volunteer_project_announcement_fk0 FOREIGN KEY (data_entry_user_id) REFERENCES volunteer (volunteer_id);

ALTER TABLE project_activity_announcement
  ADD CONSTRAINT project_activity_announcement_fk0 FOREIGN KEY (data_entry_user_id) REFERENCES volunteer (volunteer_id);

ALTER TABLE project_activity_announcement
  ADD CONSTRAINT project_activity_announcement_fk1 FOREIGN KEY (announcement_type) REFERENCES project_announcement_type (project_announcement_type_id);

ALTER TABLE project_activity
  ADD CONSTRAINT project_activity_fk0 FOREIGN KEY (data_entry_user_id) REFERENCES volunteer (volunteer_id);

ALTER TABLE project_activity
  ADD CONSTRAINT project_activity_fk1 FOREIGN KEY (project) REFERENCES project (project_id);

ALTER TABLE project_activity
  ADD CONSTRAINT project_activity_fk2 FOREIGN KEY (activity_type) REFERENCES activity_type (activity_type_id);

ALTER TABLE project_activity
  ADD CONSTRAINT project_activity_fk3 FOREIGN KEY (staff) REFERENCES volunteer (volunteer_id);

ALTER TABLE project
  ADD CONSTRAINT project_fk0 FOREIGN KEY (data_entry_user_id) REFERENCES volunteer (volunteer_id);

ALTER TABLE project
  ADD CONSTRAINT project_fk1 FOREIGN KEY (status) REFERENCES project_status (project_status_id);

ALTER TABLE project
  ADD CONSTRAINT project_fk2 FOREIGN KEY (project_category) REFERENCES project_category (project_category_id);

ALTER TABLE project_team_request
  ADD CONSTRAINT project_team_request_fk0 FOREIGN KEY (data_entry_user_id) REFERENCES volunteer (volunteer_id);

ALTER TABLE project_team_request
  ADD CONSTRAINT project_team_request_fk1 FOREIGN KEY (project_id) REFERENCES project (project_id);

ALTER TABLE project_team_request
  ADD CONSTRAINT project_team_request_fk2 FOREIGN KEY (request_user_id) REFERENCES volunteer (volunteer_id);

ALTER TABLE project_team_request
  ADD CONSTRAINT project_team_request_fk3 FOREIGN KEY (request_status) REFERENCES request_status (request_status_id);

ALTER TABLE project_team_request
  ADD CONSTRAINT project_team_request_fk4 FOREIGN KEY (response_user_id) REFERENCES volunteer (volunteer_id);

ALTER TABLE project_sub_activity
  ADD CONSTRAINT project_sub_activity_fk0 FOREIGN KEY (data_entry_user_id) REFERENCES volunteer (volunteer_id);

ALTER TABLE project_sub_activity
  ADD CONSTRAINT project_sub_activity_fk1 FOREIGN KEY (approved_by) REFERENCES volunteer (volunteer_id);

ALTER TABLE project_sub_activity
  ADD CONSTRAINT project_sub_activity_fk2 FOREIGN KEY (platform) REFERENCES platform (platform_id);

ALTER TABLE project_sub_activity
  ADD CONSTRAINT project_sub_activity_fk3 FOREIGN KEY (lead_mentor) REFERENCES volunteer (volunteer_id);

ALTER TABLE project_sub_activity
  ADD CONSTRAINT project_sub_activity_fk4 FOREIGN KEY (assistant_mentor) REFERENCES volunteer (volunteer_id);

ALTER TABLE project_sub_activity
  ADD CONSTRAINT project_sub_activity_fk5 FOREIGN KEY (project_activity) REFERENCES project_activity (project_activity_id);

ALTER TABLE project_team
  ADD CONSTRAINT project_team_fk0 FOREIGN KEY (data_entry_user_id) REFERENCES volunteer (volunteer_id);

ALTER TABLE project_team
  ADD CONSTRAINT project_team_fk1 FOREIGN KEY (project) REFERENCES project (project_id);

ALTER TABLE project_team
  ADD CONSTRAINT project_team_fk2 FOREIGN KEY (volunteer) REFERENCES volunteer (volunteer_id);

ALTER TABLE project_team
  ADD CONSTRAINT project_team_fk3 FOREIGN KEY (member_role) REFERENCES member_role (member_role_id);

ALTER TABLE project_team
  ADD CONSTRAINT project_team_fk4 FOREIGN KEY (member_status) REFERENCES member_status (member_status_id);

ALTER TABLE project_team
  ADD CONSTRAINT project_team_fk5 FOREIGN KEY (platform) REFERENCES platform (platform_id);

ALTER TABLE volunteer_reports
  ADD CONSTRAINT volunteer_reports_fk0 FOREIGN KEY (volunteer_id) REFERENCES volunteer (volunteer_id);

ALTER TABLE volunteer_reports
  ADD CONSTRAINT volunteer_reports_fk1 FOREIGN KEY (intake_volunteer_type) REFERENCES report_volunteer_type (report_volunteer_type_id);

ALTER TABLE volunteer_reports
  ADD CONSTRAINT volunteer_reports_fk2 FOREIGN KEY (platform) REFERENCES platform (platform_id);

ALTER TABLE volunteer_reports
  ADD CONSTRAINT volunteer_reports_fk3 FOREIGN KEY (developer_type) REFERENCES developer_type (developer_type_id);

ALTER TABLE volunteer_reports
  ADD CONSTRAINT volunteer_reports_fk4 FOREIGN KEY (interested_in) REFERENCES report_volunteer_interest (report_volunteer_interest_id);

ALTER TABLE entrollment_form
  ADD CONSTRAINT entrollment_form_fk0 FOREIGN KEY (data_entry_user_id) REFERENCES volunteer (volunteer_id);

ALTER TABLE entrollment_form
  ADD CONSTRAINT entrollment_form_fk1 FOREIGN KEY (volunteer_id) REFERENCES volunteer (volunteer_id);

ALTER TABLE entrollment_form
  ADD CONSTRAINT entrollment_form_fk2 FOREIGN KEY (primary_join_reason) REFERENCES joining_reason (joining_reason_id);

ALTER TABLE entrollment_form
  ADD CONSTRAINT entrollment_form_fk3 FOREIGN KEY (secondary_join_reason) REFERENCES joining_reason (joining_reason_id);

ALTER TABLE entrollment_form
  ADD CONSTRAINT entrollment_form_fk4 FOREIGN KEY (intake_process_step) REFERENCES intake_process_steps (intake_process_steps_id);

ALTER TABLE entrollment_form
  ADD CONSTRAINT entrollment_form_fk5 FOREIGN KEY (developer_self_level) REFERENCES developer_level (developer_level_id);

ALTER TABLE project_suggestion_form
  ADD CONSTRAINT project_suggestion_form_fk0 FOREIGN KEY (data_entry_user_id) REFERENCES volunteer (volunteer_id);

ALTER TABLE verification_code
  ADD CONSTRAINT verification_code_fk0 FOREIGN KEY (verification_code_id) REFERENCES volunteer (volunteer_id);

ALTER TABLE password_reset_code
  ADD CONSTRAINT password_reset_code_fk0 FOREIGN KEY (password_reset_code_id) REFERENCES volunteer (volunteer_id);
