use workspace;

create table tbl_project(
	project_num int primary key auto_increment,
	user_num int,
	project_name varchar(500),
	project_part varchar(500),
	project_location char(1),
	project_on_off char(1),
	project_platform char(1),
	project_content varchar(1000),
	project_status char(1) default 1,
	project_img varchar(500),
	project_img_uuid varchar(500),
	project_img_path varchar(500),
	project_total int,
	project_read_count int default 0,
	login_count int,
	constraint fk_project foreign key(user_num) references tbl_user (user_num) on delete cascade
)

create table tbl_project_skill(
	project_skill_num int primary key auto_increment,
	project_num int,
	project_skill varchar(1000),
	constraint fk_project_skill foreign key(project_num) references tbl_project (project_num) on delete cascade
)

create table tbl_project_person(
	project_person_num int primary key auto_increment,
	project_num int,
	project_main_skill varchar(1000),
	project_sub_skill varchar(1000),
	project_count int,
	constraint fk_project_person foreign key(project_num) references tbl_project (project_num) on delete cascade
)

create table tbl_project_reference(
	project_reference_num int primary key auto_increment,
	project_num int,
	project_url varchar(1000),
	constraint fk_project_reference foreign key(project_num) references tbl_project (project_num) on delete cascade
)

create table tbl_project_member(
	project_member_num int primary key auto_increment,
	project_num int,
	user_num int,
	project_part varchar(1000),
	project_motive varchar(1000),
	project_apply_date timestamp default now(),
	project_member_status char(1) default 0,
	constraint fk_project_member foreign key(project_num) references tbl_project (project_num) on delete cascade,
	constraint fk_project_user foreign key(user_num) references tbl_user (user_num) on delete cascade
)

create table tbl_like_project(
	project_like_num int primary key auto_increment,
	project_num int,
	user_num int,
	constraint fk_like_project_user foreign key(project_num) references tbl_project (project_num) on delete cascade,
	constraint fk_like_project foreign key(user_num) references tbl_user (user_num) on delete cascade
)


