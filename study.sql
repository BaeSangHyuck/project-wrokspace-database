use workspace;

create table tbl_study(
	study_num int primary key auto_increment,
	user_num int,
	study_title varchar(1000),
	study_part varchar(500),
	study_loaction char(1),
	study_on_off char(1),
	study_max tinyint,
	study_content varchar(2000),
	study_stauts char(1) default 1,
	study_read_count int default 0,
	constraint fk_study foreign key(user_num) references tbl_user(user_num)
);

create table tbl_study_keyword(
	study_keyword_num int primary key auto_increment,
	study_num int,
	studey_keyword varchar(1000),
	constraint fk_study_keyword foreign key(study_num) references tbl_study(study_num)
)

create table tbl_study_member(
	study_member_num int primary key auto_increment,
	study_num int,
	user_num int,
	study_member_status char(1) default 0,
	study_motive varchar(1000),
	constraint fk_study_member foreign key(study_num) references tbl_study(study_num),
	constraint fk_study_user foreign key(user_num) references tbl_user(user_num)	
)
