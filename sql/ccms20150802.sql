CREATE TABLE `t_access_log` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` varchar(20) NOT NULL,
  `ip` varchar(20) default NULL,
  `login_time` datetime default NULL,
  `logout_time` datetime default NULL,
  `status` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `t_activities` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL COMMENT '活动名称',
  `col_id` int(11) default NULL COMMENT '发布单位',
  `publish_time` varchar(20) default NULL COMMENT '发布时间',
  `date_time` varchar(30) default NULL COMMENT '活动时间',
  `end_date` varchar(20) default NULL COMMENT '报名截止时间',
  `location` varchar(60) default NULL COMMENT '活动地点',
  `aim` varchar(1500) default NULL COMMENT '活动目的',
  `content` varchar(2000) default NULL COMMENT '活动内容',
  `activity_type` int(11) default NULL COMMENT '活动加分类型',
  `second_level` int(11) default '-1',
  `duration` float default '0' COMMENT '活动加分时长',
  `act_object` varchar(30) default NULL COMMENT '参与对象',
  `number` int(11) default NULL COMMENT '参与人数',
  `contact` varchar(20) default NULL COMMENT '联系人',
  `phone` varchar(20) default NULL COMMENT '联系方式',
  `assist` varchar(20) default NULL COMMENT '协助人员',
  `status` int(11) default NULL COMMENT '活动状态:通过1， 待审核0，未通过-1',
  `reason` varchar(255) default NULL,
  `activityUuid` varchar(120) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_activity_item` (
  `id` int(11) NOT NULL auto_increment,
  `act_id` int(11) default NULL,
  `stu_id` int(11) default NULL,
  `audit` int(11) default NULL COMMENT '审核结果：等待认证0， 认证通过1， 未通过-1，等待勤管中心审核1， 勤管中心审核通过2， 勤管中心审核未通过3，',
  `applyTime` varchar(20) default NULL COMMENT '记录时间',
  `reason` varchar(255) default NULL COMMENT '认证/审核不通过原因',
  `duration` float default '0' COMMENT '加分时长(包括附加分)',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_activity_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_colleges` (
  `id` int(11) NOT NULL auto_increment,
  `account` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `pwd` varchar(30) default NULL,
  `phone` varchar(20) default NULL,
  `contact` varchar(20) default NULL,
  `address` varchar(30) default NULL,
  `colType` int(11) default NULL COMMENT '1勤管中心，2学院， 3社团',
  `authority` int(11) NOT NULL COMMENT '1管理员，0一般用户',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `account` (`account`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_comments` (
  `id` int(11) NOT NULL auto_increment,
  `objectId` int(11) default NULL,
  `category` int(11) default NULL,
  `userId` int(11) default NULL,
  `content` varchar(1000) default NULL,
  `comDate` varchar(14) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_dicts` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `val` varchar(60) NOT NULL,
  `category` varchar(60) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_files` (
  `id` int(11) NOT NULL auto_increment,
  `col_id` int(11) default NULL COMMENT '所属单位',
  `originalFilename` varchar(60) default NULL COMMENT '文件原始名称',
  `newFileName` varchar(255) default NULL COMMENT '文件新的名称',
  `saveUrl` varchar(20) default NULL COMMENT '文件的保存路径',
  `fileSize` varchar(20) default NULL COMMENT '文件大小',
  `uploadDate` datetime default NULL COMMENT '上传时间',
  `authority` int(11) default NULL COMMENT '查看文件的权限 1公有：所有用户,0一般：管理员和用工单位,-1 私有：只有本单位',
  `status` int(11) default '1' COMMENT '文件状态：1默认, -1删除',
  `activityUuid` varchar(60) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_rank_activity_type` (
  `id` int(11) NOT NULL auto_increment,
  `rank_id` int(11) default NULL,
  `activity_type_id` int(11) default NULL,
  `beginDuration` int(11) default NULL,
  `endDuration` int(11) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_ranks` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `duration` int(11) default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `t_secondlevels` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `superiorId` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_specialties` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `col_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_stu_level` (
  `id` int(11) NOT NULL auto_increment,
  `stu_id` int(11) NOT NULL,
  `num` varchar(11) NOT NULL,
  `rank_id` int(11) default NULL,
  `year` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_students` (
  `id` int(11) NOT NULL auto_increment,
  `num` int(11) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `name` varchar(20) NOT NULL,
  `gender` varchar(5) default NULL,
  `phone` varchar(20) default NULL,
  `email` varchar(30) default NULL,
  `qq` varchar(11) default NULL,
  `col_id` int(11) NOT NULL,
  `spec_id` int(11) default NULL,
  `introduce` varchar(60) default NULL,
  `status` int(11) default '1' COMMENT '学生状态（1可用，0不可用）',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `num` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
