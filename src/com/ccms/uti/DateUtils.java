package com.ccms.uti;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;


public class DateUtils extends org.apache.commons.lang.time.DateUtils{
	
	private static String FORMAT_NORMAL = "yyyy-MM-dd HH:mm:ss";
	
	private static String FORMAT_NO_SIGN = "yyyy-MM-dd";
	
	private static String FORMAT_YEAR_MONTH = "yyyy-MM";
	
	public static String getCurrentDate(String format) {
		if(StringUtils.isBlank(format)) {
			format = FORMAT_NORMAL;
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat(FORMAT_NO_SIGN);
		Date date = new Date();
		
		return dateFormat.format(date);
	}
	
	/**
	 * 获得当年的学年 2014-09 -- 2015-07
	 * @return
	 */
	public static List<String> getCurrentXueNian() {
		// 当前时间		
		String currentDate = new SimpleDateFormat(FORMAT_YEAR_MONTH).format(new Date());
		Integer currentYear = Integer.valueOf(currentDate.substring(0, 4));
		Integer currentMonth = Integer.valueOf(currentDate.substring(5));

		String startDate = "";
		String endDate = "";
		
		if(currentMonth >= 9) {
			startDate = currentYear + "-09";
			endDate = (currentYear + 1) + "-07";
		}else {
			startDate = (currentYear-1) + "-09";
			endDate = currentYear + "-07";
		}
		
		System.out.println("s = " + startDate);
		System.out.println("e = " + endDate);
		
		return Arrays.asList(startDate, endDate);
	}
	
	/**
	 * 获得最近5学年的
	 * @return
	 */
	public static List<String> getRecent5XueYear() {
		List<String> years = new ArrayList<String>();
		
		List<String> currentXueNian = getCurrentXueNian();
		String startDate = currentXueNian.get(0);
		String endDate = currentXueNian.get(1);
		int startYear = Integer.valueOf(startDate.substring(0, 4));
		int endYear = Integer.valueOf(endDate.substring(0, 4));
		
		for(int i = 4; i >= 0; i--) {
			String year = (startYear-i) + "-" + (endYear-i);
			years.add(year);
		}
		
		System.out.println(years);
		
		return years;
	}
	
	public static void main(String[] args) {
		getRecent5XueYear();
		
		
	}
	
}




















