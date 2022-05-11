create schema workspace;
use workspace;

create table tbl_user(
	user_num int primary key auto_increment,
	user_id varchar(500) not null,
	user_name varchar(500),
	user_gender char(1) /*m은남자 w은 여자*/,
	user_location varchar(500),
	user_nick_name varchar(500),
	user_phone varchar(500),
	user_main_skill char(1),/*메인스킬*/
	user_main_detail char(2),/*세부스킬*/
	user_main_level char(1),
	user_sub_skill char(1),/*서브스킬*/
	user_sub_detail char(2),/*세부스킬*/
	user_sub_level char(1),
	user_on_off char(1),/*0온 , 1오프*/
	user_time char(1), /*0평일오전,1평일오후,2주말오전,3주말오후*/
	user_code varchar(500) not null unique,
	user_level tinyint default 1,
	user_exp int default 0,
	user_point int default 0,
	user_price tinyint default 3,/*대화시 필요한 코인*/
	social_type char(1),/*0카카오, 1깃허브,2구글*/
	user_status char(1) default 0,/*0기본, 1탈퇴대기*/
	user_img_uuid varchar(500) unique,
	user_img_name varchar(500),
	user_img_path varchar(500)
);

create table tbl_portfolio(
	port_num int primary key auto_increment,
	user_num int,
	port_url varchar(1000),
	constraint fk_portfolio foreign key(user_num) references tbl_user (user_num) on delete cascade
);

create table tbl_user_tag(
	tag_num int primary key auto_increment,
	user_num int,
	tag_name varchar(1000),
	constraint fk_userTag foreign key(user_num) references tbl_user (user_num) on delete cascade
);

create table tbl_user_interest(
	interest_num int primary key auto_increment,
	user_num int,
	interest varchar(1000),
	constraint fk_userInterest foreign key(user_num) references tbl_user (user_num) on delete cascade
);

create table tbl_user_alert(
	alert_num int primary key auto_increment,
	user_num int,
	alert_part varchar(1000),
	numbers int,
	alert_type varchar(1000),
	constraint fk_user_alert foreign key(user_num) references tbl_follow_user (follower_user) on delete cascade
);

create table tbl_follow_user(
	follower_user int,
	following_user int,
	constraint fk_follower_user foreign key(follower_user) references tbl_user (user_num) on delete cascade,
	constraint fk_following_user foreign key(following_user) references tbl_user (user_num) on delete cascade,
	primary key(follower_user, following_user)
);

select * from tbl_user;
select * from tbl_portfolio;
select * from tbl_user_tag;
select * from tbl_user_interest;
select * from tbl_user_alert;
select * from tbl_follow_user;

drop table tbl_user;
drop table tbl_portfolio;
drop table tbl_user_tag;
drop table tbl_user_interest;
drop table tbl_user_alert;
drop table tbl_follow_user;


INSERT INTO workspace.tbl_user
(user_id, user_name, user_gender, user_location, user_nick_name, user_phone, user_main_skill, user_main_detail, user_main_level, user_sub_skill, user_sub_detail, user_sub_level, user_on_off, user_time, user_code, user_level, user_exp, user_point, user_price, social_type, user_status, user_img_uuid, user_img_name, user_img_path)
VALUES('tkdgur', 'tkdgur', 'm', '경기도', '상냥이', '01040625261', '1', '11', '1', '2', '21', '1', '1', '1', '1', 1, 0, 0, 3, '1', '0', '1', '1', '1');

