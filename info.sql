use workspace;

create table tbl_notice(
	notice_num int primary key auto_increment,
	notice_title varchar(1000),
	notice_content varchar(2000),
	notice_date timestamp default now(),
	notice_read_count int default 0,
	notice_img varchar(500),
	notice_img_uuid varchar(500),
	notice_img_path varchar(500)
)