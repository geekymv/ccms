package com.ccms.util;

public class SysCode {
	/**
	 * 用户
	 * @author miying
	 */
	public static final class User {
		/**
		 * 用户在线
		 */
		public static final Integer USER_STATUS_ONLINE = 1; 
		
		/**
		 * 用户不在线
		 */
		public static final Integer USER_STATUS_OFFLINE = 0;
		
	}
	
	/**
	 * 报名明细
	 * @author miying
	 */
	public static final class ActivityItem {
		/**
		 * ActItem等待认证
		 */
		public static final Integer ACTITEM_AUDIT_WAIT = 0;
		/**
		 * ActItem认证通过
		 */
		public static final Integer ACTITEM_AUDIT_APPROVE = 1;
		/**
		 * ActItem认证未通过
		 */
		public static final Integer ACTITEM_AUDIT_UNAPPROVE = -1;
		
		
	}
	
	/**
	 * 文件权限
	 * @author miying
	 */
	public static final class FileAuthority {
		/**
		 *  公有：所有用户都可以看
		 */
		public static final Integer FILE_PUBLIC = 1;
		
		/**
		 * 默认：管理员和用工单位可以看
		 */
		public static final Integer FILE_DEFAULT = 0;
		
		/**
		 * 私有：只有本单位可以看
		 */
		public static final Integer FILE_PRIVATE = -1;
	}
	
	/**
	 * 勤管中心
	 */
	public static final Integer COLTYPE_QGZX = 1;
	/**
	 * 学院
	 */
	public static final Integer COLTYPE_COLLEGE = 2;
	/**
	 * 社团
	 */
	public static final Integer COLTYPE_CORPORATION = 3;

	/**
	 * 管理员权限
	 * @author miying
	 */
	public static interface CollegeAuthority {
		/**
		 * 管理员
		 */
		public static final Integer ADMIN = 1;
		
		/**
		 * 学院/用工单位
		 */
		public static final Integer COMMON = 0;
		
	}
	
	/**
	 * 活动状态
	 * @author miying
	 *
	 */
	public static interface ActivityStatus {
		/**
		 * 等待审核
		 */
		public static final Integer WAIT = 0;
		/**
		 * 审核通过
		 */
		public static final Integer APPROVED = 1;
		/**
		 * 审核未通过
		 */
		public static final Integer UNAPPROVED = -1;
	}
	
	public static final String ADD_STUDENT_TIME = "ADD_STUDENT_TIME";
}
