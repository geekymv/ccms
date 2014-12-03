/*学分认证管理系统*/
create database ccms;

/*学生*/
create table t_students(
	id int primary key auto_increment,
	num int not null,	/*学号*/
	name varchar(20) not null, /*姓名*/
);

/*学院*/
create table t_colleges(
	id int primary key auto_increment,
	account varchar(20) unique not null, /*登录账号*/
	password varchar(30), /*登录密码*/ 
	name varchar(20) unique not null, /*学院名称唯一*/
	phone varchar(20), /*电话号码*/
	contact varchar(20), /*联系人姓名*/ 
	address varchar(30) /*办公地址*/
);
/*系别*/
create table t_departments(
	id int primary key auto_increment,
	name varchar(30), /*系名*/
	col_id int /*所属学院*/
); 
/*专业*/
create table t_specialty(
	id int primary key auto_increment,
	name varchar(30), /*专业名称*/
	dept_id int /*所属系别*/
);


/*受助等级*/


/*活动类型*/
create table t_activity_type(
	id int primary key auto_increment,
	name varchar(30), /*类型名称*/
	duration int, /*时长*/
);


/*活动*/
create table t_activities(
	id int primary key auto_increment,
	name varchar(60) not null, /*活动名称*/
	date_time datetime,	/*时间*/
	location varchar(60), /*地点*/
	aim varchar(30), /*目的*/
	/*活动类型*/
	/*时长*/
);






























