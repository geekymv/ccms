/*学分认证管理系统*/
create database ccms;
use ccms;

/*学院/单位*/
create table t_colleges(
	id int primary key auto_increment,
	account varchar(20) unique not null, /*登录账号唯一*/
	name varchar(20) unique not null, /*学院名称唯一*/
	pwd varchar(30), /*登录密码*/ 
	phone varchar(20), /*电话号码*/
	contact varchar(20), /*联系人姓名*/ 
	address varchar(30) /*办公地址*/
);
/*专业*/
create table t_specialty(
	id int primary key auto_increment,
	name varchar(30) unique not null, /*专业名称*/
	col_id int /*所属学院*/
);

/*学生*/
create table t_students(
	id int primary key auto_increment,
	num int unique not null,	/*学号*/
	pwd varchar(30) not null, /*密码*/
	name varchar(20) not null, /*姓名*/
	gender varchar(5), /*性别*/
	phone varchar(20), /*手机号码*/
	email varchar(30), /*邮箱*/
	qq varchar(11), /*qq*/
	col_id int, /*所在学院*/
	spec_id int, /*所在专业*/
	introduce varchar(60) /*个人简介*/ 
);

/*用户访问记录表*/
create table t_access_log(
	id int primary key auto_increment, 
	user_id varchar(20) not null, 
	ip varchar(20), /*用户ip*/
	login_time datetime, /*登录时间*/
	logout_time datetime, /*退出时间*/
	status int /*用户状态：已登录1， 未登录0*/
);



/*受助等级：甲乙丙*/
create table t_rank(
	id int primary key auto_increment,
	name varchar(30) unique not null /*等级名称*/
);
/*活动类型：劳务类，文体类，实践类*/
create table t_activity_type(
	id int primary key auto_increment,
	name varchar(30) unique not null /*类型名称*/
);
/*等级-类型中间表*/
create table t_rank_acttype(
	id int primary key auto_increment,
	rank_id int,
	acttype_id int, 
	duration int /*时长*/
);

/*活动*/
create table t_activities(
	id int primary key auto_increment,
	name varchar(60) not null, /*活动名称*/
	col_id int, /*发布单位*/
	publish_time datetime, /*发布时间*/
	date_time varchar(30),	/*活动时间*/
	end_date date, /*报名截止日期*/
	location varchar(60), /*地点*/
	aim varchar(30), /*目的*/
	content varchar(60), /*活动内容*/
	activity_type int, /*活动加分类型*/
	duration int, /*活动时长*/
	act_object varchar(30), /*参与对象*/
	number int, /*参与人数*/
	contact varchar(20), /*联系人姓名*/ 
	phone varchar(20), /*联系方式*/
	assist varchar(20), /*活动协助人员*/
	
	status int /*状态:通过1， 未通过0， 删除-1*/
);

/*活动报名清单*/
create table t_activity_item (
	id int primary key auto_increment,
	act_id int, /*活动编号*/
	stu_id int, /*学生编号*/
	audit int /*审核：认证通过1，等待认证0， 认证不通过-1*/
);
