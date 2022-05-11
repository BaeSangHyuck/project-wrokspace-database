use workspace;

create table tbl_lounge(
	lounge_num int primary key auto_increment,
	user_num int,
	lounge_content varchar(1000),
	lounge_date timestamp default now(),
	constraint fk_lounge foreign key(user_num) references tbl_user(user_num)
)

create table tbl_like_lounge(
	lounge_like_num int primary key auto_increment,
	lounge_num int,
	user_num int,
constraint fk_like_lounge foreign key(user_num) references tbl_user(user_num),
constraint fk_like_lounge_num foreign key(lounge_num) references tbl_lounge(lounge_num)
)

create table tbl_lounge_reply(
	lounge_reply_num int primary key auto_increment,
	lounge_num int, 
	user_num int,
	lounge_reply_content varchar(1000),
	lounge_reply_date timestamp default now(),
	lounge_reply_status char(1) default 0,
	constraint fk_lounge_reply foreign key(user_num) references tbl_user(user_num),
	constraint fk_lounge_reply_num foreign key(lounge_num) references tbl_lounge(lounge_num)	
)