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
skill_id VARCHAR(50) not null,
SKILL VARCHAR(50),
primary key(skill_id)
);

CREATE TABLE SKILLS (
skill_id VARCHAR(50) not null,
SKILL VARCHAR(50),
asset_version INT NOT NULL,
workspace_id VARCHAR(40) NOT NULL,
branch_id VARCHAR(40) NOT NULL,
is_head NUMERIC(1) NOT NULL,
version_deleted NUMERIC(1) NOT NULL,
version_editable NUMERIC(1) NOT NULL,
pred_version INT NULL,
checkin_date TIMESTAMP NULL,
PRIMARY KEY(skill_id, asset_version)
);

CREATE TABLE RESUME (
resume_id VARCHAR(50) not null,
NAME VARCHAR(50),
ABOUT VARCHAR(50),
primary key(resume_id)
);

CREATE TABLE RESUME (
resume_id VARCHAR(50) not null,
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
PRIMARY KEY(resume_id, asset_version)
);
CREATE TABLE skill_to_resume (
resume_id VARCHAR(50) not null,
skill_id VARCHAR(50) not null,
primary key (resume_id, skill_id)
);
CREATE TABLE skill_to_resume (
resume_id VARCHAR(50) not null,
skill_id VARCHAR(50) not null,
asset_version INT NOT NULL,
primary key (resume_id, skill_id, asset_version)
);
CREATE TABLE person_to_resume (
resume_id VARCHAR(50) not null,
person_id VARCHAR(50) not null,
asset_version INT NOT NULL,
primary key (resume_id, person_id, asset_version)
);
CREATE TABLE person_to_resume (
resume_id VARCHAR(50) not null,
person_id VARCHAR(50) not null,
primary key (resume_id, person_id)
);
