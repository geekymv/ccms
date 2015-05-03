package com.ccms.util;

import java.io.File;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import com.ccms.persistence.pojo.College;
import com.ccms.persistence.pojo.Student;

public class ExcelUtil {

	public static void readExcel() {
		try {
			Workbook book = Workbook.getWorkbook(new File(
					"C:/Users/miying/Desktop/2014-2015学年受资助生一轮考核情况统计表.xls"));

			Sheet sheet = book.getSheet(0); // 获得第一个工作表对象

			Cell cell = sheet.getCell(0, 0); // 得到第一列第一行的单元格

			String content = cell.getContents(); // 得到单元格的内容

			System.out.println(content);

			book.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 循环读取Excel的内容
	public static void readExcel2() {
		try {
			Workbook workbook = Workbook.getWorkbook(new File("C:/Users/miying/Desktop/2014-2015学年受资助生一轮考核情况统计表.xls"));

			Sheet sheet = workbook.getSheet(0);

			int cols = sheet.getColumns();
			int rows = sheet.getRows();

			System.out.println("列数 = " + cols + ", 行数 = " + rows);

			Student student = null;
			for (int i = 2; i < 100; i++) {
				student = new Student();
				
				String name = sheet.getCell(1, i).getContents();
				String num = sheet.getCell(2, i).getContents();
				String pwd = num;
				String gender = sheet.getCell(3, i).getContents();
				String mz = sheet.getCell(4, i).getContents();
				String nj = sheet.getCell(5, i).getContents();
				String zhuanye = sheet.getCell(6, i).getContents();
				College college = new College();
				
				//
				
				String colName = sheet.getCell(6, i).getContents();
				String money = sheet.getCell(6, i).getContents();
				
				/*
				for (int j = 0; j < cols; j++) {
					value = sheet.getCell(j, i).getContents();
				}
				*/
			}

			workbook.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static void main(String[] args) {

		readExcel2();
	}

}
