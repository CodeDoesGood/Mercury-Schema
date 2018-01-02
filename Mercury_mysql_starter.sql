INSERT INTO position (name, description) VALUES ('Developer', 'A Developer focused around programming');
INSERT INTO position (name, description) VALUES ('Designer', 'A Designer working on artwork');
INSERT INTO position (name, description) VALUES ('Administrator', 'A site administrator');
INSERT INTO position (name, description) VALUES ('Moderator', 'A site Moderator');
INSERT INTO position (name, description) VALUES ('Volunteer', 'A site Volunteer');

INSERT INTO volunteer_status_types (type, description) VALUES ('Active', 'The Volunteer is active');
INSERT INTO volunteer_status_types (type, description) VALUES ('Offline', 'The Volunteer is not active anymore');
INSERT INTO volunteer_status_types (type, description) VALUES ('Left', 'The Volunteer has left');

INSERT INTO member_status (status, description) VALUES ('active', 'The Volunteer is active on the project');
INSERT INTO member_status (status, description) VALUES ('offline', 'The Volunteer is off the project');

INSERT INTO member_role (role, description) VALUES ('Admin', 'The member is a Admin ');
INSERT INTO member_role (role, description) VALUES ('Developer', 'The member is Developer');
INSERT INTO member_role (role, description) VALUES ('Trainer', 'The member is Trainer');

INSERT INTO role_type (role, description) VALUES ('Developer', 'The members role is Developer');
INSERT INTO role_type (role, description) VALUES ('Designer', 'The members role is Designer');
INSERT INTO role_type (role, description) VALUES ('Administrator', 'The members role is Administrator');
INSERT INTO role_type (role, description) VALUES ('Volunteer', 'The members role is Volunteer');
INSERT INTO role_type (role, description) VALUES ('Moderator', 'The members role is Moderator');

INSERT INTO developer_type (type, description) VALUES ('Web', 'The volunteer is based on the web');
INSERT INTO developer_type (type, description) VALUES ('IOS', 'The volunteer is based on ios');
INSERT INTO developer_type (type, description) VALUES ('Android', 'The volunteer is based on android');

INSERT INTO developer_level (level, description) VALUES ('Basic', 'The volunteer level is Basic');
INSERT INTO developer_level (level, description) VALUES ('Average', 'The volunteer level is Averageid');
INSERT INTO developer_level (level, description) VALUES ('Advanced', 'The volunteer level is Advanced');

INSERT INTO project_status (status, description) VALUES ('Online', 'Online project');
INSERT INTO project_status (status, description) VALUES ('Offline', 'Offline project');

INSERT INTO joining_reason (reason, description) VALUES ('Volunteer', 'The volunteer joined for volunteering');
INSERT INTO joining_reason (reason, description) VALUES ('Programming', 'The volunteer joined for programming');
INSERT INTO joining_reason (reason, description) VALUES ('Experience', 'The volunteer joined for Experience');

INSERT INTO report_volunteer_interest (interest, description) VALUES ('Volunteering', 'The volunteer is interested in Volunteering');
INSERT INTO report_volunteer_interest (interest, description) VALUES ('Developing', 'The volunteer is interested in Developing');
INSERT INTO report_volunteer_interest (interest, description) VALUES ('Designing', 'The volunteer is interested in Designing');

INSERT INTO project_category (category, description) VALUES ('Web', 'A project based on the web');
INSERT INTO project_category (category, description) VALUES ('IOS', 'A project based on ios');
INSERT INTO project_category (category, description) VALUES ('Android', 'A project based on android');
INSERT INTO project_category (category, description) VALUES ('Local', 'A project based locally');
INSERT INTO project_category (category, description) VALUES ('Worldwide', 'A project based worldwide');

INSERT INTO announcement_type (type, description) VALUES ('Volunteer', 'A announcement for a volunteer');
INSERT INTO announcement_type (type, description) VALUES ('Site', 'A announcement for the whole site');

INSERT INTO project_announcement_type (type, description) VALUES ('Success', 'A announcement for a good project announcement');
INSERT INTO project_announcement_type (type, description) VALUES ('Error', 'A announcement for a error project announcement');

INSERT INTO request_status (status, description) VALUES ('Complete', 'A request is complete');
INSERT INTO request_status (status, description) VALUES ('Processing', 'A request is processing');

INSERT INTO platform (platform, description) VALUES ('Web', 'The platform Web');
INSERT INTO platform (platform, description) VALUES ('Android', 'The platform Android');
INSERT INTO platform (platform, description) VALUES ('IOS', 'The platform IOS');

INSERT INTO project (created_datetime, data_entry_user_id, title, status, project_category, hidden, image_directory, description, summary) VALUES (
    '2017-12-04',
    1,
    'Helping Hands',
    1,
    2,
    false,
    '',
    'Helping Hands',
    'Helping Hands'
);

INSERT INTO volunteer (created_datetime, data_entry_user_id, username, password, position_id, volunteer_status, name, about, email, phone, location, timezone, linked_in_url, slack_id, github_id, developer_level, admin_portal_access, admin_overall_level, salt, verified) VALUES (
    '2001-06-22',
    1,
    'user1',
    '311fceecf784532ffdc941cc4ca6316ba1c4568ccaa3cabc626e816143f539880c7591e4bf22f55d08b2c40cf156fbc521a6974676ab4892f4a7558593af7f20478cb794c022acba69f6f3c9da751bf396834a1dda6f08e21595d116f7b98faf11b89203834807249be30cd9160e67a08f98fb7662c242b27edb0701d2a85e975bd8f470abe995003278052a2b6ab984eba9c867b719e7a14c95009c41e5cda7fbbbf35d52555e0720102a9cfccd477fcc72f6c002029a9959bea364e1a43959c9568a3124a19537df54460ffe0f04cecf7981a94cde88c952176169d7fd8c6fa853ffbfc9799f9e52a0e2a0f862722166e93aac53f8e5c96c24f75aceb41e7d53b4129d6c9ab4b3cb09329db5296b1600b45e5c6476f7b9e2eb0902b42a3db88edc3f4803570e8bd490400505e85da7b87adb1867e9d252867290cdfabad3ec4afc110f46fb09f556f5e93925e423d2d8073de63033e6a94f7984546171a8af47bf541a25e105eae79d21a7602aefca1bc84686b93012c256ebdcc881b28ad67988f751c7c0e926d18eee9f39edcfcbc95885ef74fe15745b705749c3b880be4d8ef1ac053cf1cff94fa001d9e2540ce75fcbdde2c8de896ff6469374996bf7974f2f8a64aa7606297107328535cd29fe1d0f81ddaf2f205424d5f885872a26c509da3418d1356f1a16edfbc74d71958159947861cd4c07838613b658b7b2f1',
    1,
    1,
    'user1',
    'A user that is used for testing',
    'Alys.DURHA2665@gmail.com',
    Null,
    Null,
    Null,
    null,
    null,
    null,
    1,
    0,
    2,
    'HfPXZZooAThIQpUnhs4fwDPcLtLYwI7PE5ajg59R06AX0i0QNs+HGL27z/D/FgFkC1lX4dvctqMVm3KpgtdjDnbneAsiL0mbZVM4p2TNmHsp/HEpUvF3l1BmSmMNOYiew/RTUKy/Ah5CuhN7eXLtAsUzkuI55gAasfw/FmKfEUw=',
    true);

INSERT INTO announcement (data_entry_user_id, title, body, announcement_type, created_datetime, modified_datetime) VALUES (1, 'Sample Announcement', 'Sample Body', 1, '2018-01-02', '2018-01-02');
INSERT INTO volunteer_announcement (created_datetime, data_entry_user_id, announcement, volunteer_id, `read`) VALUES ('2018-01-02', 1, 1, 1, 0);