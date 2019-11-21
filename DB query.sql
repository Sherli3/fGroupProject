CREATE TABLE person (
id VARCHAR(50) not null,
first_name VARCHAR(50),
last_name VARCHAR(50),
primary key(id)
);

CREATE TABLE person (
id VARCHAR(50) not null,
first_name VARCHAR(50),
last_name VARCHAR(50),
asset_version INT NOT NULL,
workspace_id VARCHAR(40) NOT NULL,
branch_id VARCHAR(40) NOT NULL,
is_head NUMERIC(1) NOT NULL,
version_deleted NUMERIC(1) NOT NULL,
version_editable NUMERIC(1) NOT NULL,
pred_version INT NULL,
checkin_date TIMESTAMP NULL,
PRIMARY KEY(id, asset_version)
);

CREATE TABLE SKILLS (
id VARCHAR(50) not null,
SKILL VARCHAR(50),
primary key(id)
);

CREATE TABLE SKILLS (
id VARCHAR(50) not null,
SKILL VARCHAR(50),
asset_version INT NOT NULL,
workspace_id VARCHAR(40) NOT NULL,
branch_id VARCHAR(40) NOT NULL,
is_head NUMERIC(1) NOT NULL,
version_deleted NUMERIC(1) NOT NULL,
version_editable NUMERIC(1) NOT NULL,
pred_version INT NULL,
checkin_date TIMESTAMP NULL,
PRIMARY KEY(id, asset_version)
);

CREATE TABLE RESUME (
id VARCHAR(50) not null,
NAME VARCHAR(50),
ABOUT VARCHAR(50),
primary key(id)
);

CREATE TABLE RESUME (
id VARCHAR(50) not null,
NAME VARCHAR(50),
ABOUT VARCHAR(50),
asset_version INT NOT NULL,
workspace_id VARCHAR(40) NOT NULL,
branch_id VARCHAR(40) NOT NULL,
is_head NUMERIC(1) NOT NULL,
version_deleted NUMERIC(1) NOT NULL,
version_editable NUMERIC(1) NOT NULL,
pred_version INT NULL,
checkin_date TIMESTAMP NULL,
PRIMARY KEY(id, asset_version)
);
CREATE TABLE PERSON_TO_RESUME(
PERSON_ID INTEGER not null,
RESUME_ID INTEGER not null,
primary key(PERSON_ID,RESUME_ID)
);



CREATE TABLE user_tbl (
 id INTEGER not null,
 nam_col VARCHAR(50) null,
 primary key(id)
);
CREATE TABLE role(
 id INTEGER not null,
 nam_role_col VARCHAR(50) null,
 primary key(id)
);
CREATE TABLE role_person_id(
 id_role INTEGER not null,
 id_person INTEGER not null,
 primary key(id_role, id_person)
);
CREATE TABLE scores(
 score_id INTEGER not null,
 user_id INTEGER not null,
 score number,
 primary key(score_id)
);
CREATE TABLE visit_date_time(
 visit_id INTEGER not null,
 user_id INTEGER not null,
 visit_date date,
 isOk char(1),
primary key (visit_id)
);
CREATE TABLE mentor_and_user(
 mentor_id INTEGER not null,
 user_id INTEGER not null,
 primary key(mentor_id,user_id)
);
create table user_login_properties(
 user_id VARCHAR(32)not null,
 visit_time timestamp,
 isOk char(1),
PRIMARY KEY(user_id)
);


insert into user_tbl (ID, NAM_COL) values (1, 'Petya');
insert into user_tbl (ID, NAM_COL) values (2, 'Petya');
insert into user_tbl (ID, NAM_COL) values (3, 'Leha');
insert into user_tbl (ID, NAM_COL) values (4, 'Nastya');
insert into user_tbl (ID, NAM_COL) values (5, 'Kate');


insert into ROLE (ID, NAM_ROLE_COL) values (1, 'User');
insert into ROLE (ID, NAM_ROLE_COL) values (2, 'Mentor');
insert into ROLE (ID, NAM_ROLE_COL) values (3, 'Expert');
insert into ROLE (ID, NAM_ROLE_COL) values (4, 'Relative');

insert into role_person_id (id_role, id_person) values (1, 3);
insert into role_person_id (id_role, id_person) values (2, 5);
insert into role_person_id (id_role, id_person) values (4, 5);
insert into role_person_id (id_role, id_person) values (3, 2);
insert into role_person_id (id_role, id_person) values (4, 1);
insert into role_person_id (id_role, id_person) values (3, 1);
insert into role_person_id (id_role, id_person) values (2, 4);

insert into VISIT_DATE_TIME (VISIT_ID, USER_ID, VISIT_DATE, ISOK) VALUES (1,1,to_date('2019/11/08','YYYY/mm/dd'), 1);
insert into VISIT_DATE_TIME (VISIT_ID, USER_ID, VISIT_DATE, ISOK) VALUES (2,3,to_date('2019/11/08','YYYY/mm/dd'), 0);
insert into VISIT_DATE_TIME (VISIT_ID, USER_ID, VISIT_DATE, ISOK) VALUES (3,2,to_date('2019/11/07','YYYY/mm/dd'), 0);
insert into VISIT_DATE_TIME (VISIT_ID, USER_ID, VISIT_DATE, ISOK) VALUES (4,4,to_date('2019/11/03','YYYY/mm/dd'), 0);
insert into VISIT_DATE_TIME (VISIT_ID, USER_ID, VISIT_DATE, ISOK) VALUES (5,5,to_date('2019/11/05','YYYY/mm/dd'), 0);

insert into mentor_and_user (MENTOR_ID, USER_ID) VALUES (2, 5);
insert into mentor_and_user(MENTOR_ID, USER_ID) VALUES (2, 4);
insert into mentor_and_user (MENTOR_ID, USER_ID) VALUES (2, 1);

insert into SCORES (SCORE_ID, USER_ID, SCORE) VALUES (1,1,500);
insert into SCORES (SCORE_ID, USER_ID, SCORE) VALUES (2,5,1500);
insert into SCORES (SCORE_ID, USER_ID, SCORE) VALUES (3,4,5600);
insert into SCORES (SCORE_ID, USER_ID, SCORE) VALUES (4,3,8500);
insert into SCORES (SCORE_ID, USER_ID, SCORE) VALUES (5,2,5900);
insert into SCORES (SCORE_ID, USER_ID, SCORE) VALUES (6,2,100);

