use workspace;

create table tbl_story(
	story_num int primary key auto_increment,
	user_num int,
	story_part varchar(500),
	story_title varchar(1000),
	story_content varchar(2000),
	story_img_name varchar(500),
	story_img_uuid varchar(500),
	story_img_path varchar(500),
	story_read_count int default 0,
	constraint fk_story foreign key(user_num) references tbl_user (user_num) on delete cascade
);

create table tbl_story_tag(
	story_tag_num int primary key auto_increment,
	story_num int,
	tag_name varchar(1000),
	constraint fk_story_tag foreign key(story_num) references tbl_story (story_num) on delete cascade
);

create table tbl_story_reply(
	story_reply_num int primary key auto_increment,
	story_num int,
	story_reply varchar(1000),
	user_num int,
	reply_time timestamp default now(),
	status char(1) default 0,
	constraint fk_story_user foreign key(user_num) references tbl_user (user_num) on delete cascade,
	constraint fk_story_reply foreign key(story_num) references tbl_story (story_num) on delete cascade
);

create table tbl_series(
	series_num int primary key auto_increment,
	story_num int,
	user_num int,
	series_name varchar(1000),
	constraint fk_series_user foreign key(user_num) references tbl_user (user_num) on delete cascade,
	constraint fk_series_story foreign key(story_num) references tbl_story (story_num) on delete cascade
)

create table tbl_like_story(
	like_num int primary key auto_increment,
	story_num int,
	user_num int,
	constraint fk_like_story foreign key(user_num) references tbl_user (user_num) on delete cascade
)

select * from tbl_story;
select * from tbl_story_tag;
select * from tbl_story_reply;
select * from tbl_series;

drop table tbl_story;
drop table tbl_story_tag;
drop table tbl_story_reply;
drop table tbl_series;