package com.ccms.util;

import java.io.File;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.ccms.persistence.dto.StudentDto;
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
	
	/**
	 * 下载活动报名的学生列表
	 * @param dtos
	 * @param response
	 */
	public static void downloadApplyStudents(List<StudentDto> dtos, List<String> titles, HttpServletResponse response) {
		WritableWorkbook book = null;
		
		try {
			OutputStream os = response.getOutputStream();
			response.setHeader("Content-disposition", 
					"attachment; filename=" + new String("报名表".getBytes("GB2312"),"8859_1") + ".xls");// 设定输出文件头
	        response.setContentType("application/msexcel");
	        // 创建一个工作薄，就是整个Excel文档
	        book = Workbook.createWorkbook(os);
	        // 创建工作表
	        WritableSheet sheet = book.createSheet("学生报名表", 0);
	        
	        // 标题
	        for (int i = 0; i < titles.size(); i++) {
				// 第1行，第(i+1)列添加标题
				Label label = new Label(i, 0, titles.get(i));
				sheet.addCell(label);
			}
	        
	        if(dtos.size() == 0) {
	        	
	        }else {
	        	for(int i = 0; i < dtos.size(); i++) {
	        		StudentDto dto = dtos.get(i);
	        		String num = dto.getNum();
	        		String name = dto.getName();
	        		String phone = dto.getPhone();
	        		String college = dto.getCollegeName();
	        		String epecialty = dto.getSpecialtyName();
	        		List<String> datas = Arrays.asList((i+1)+"", num, name, phone, college, epecialty);
	        		for(int j = 0; j < datas.size(); j++) {
	    				Label label = new Label(j, i+1, datas.get(j));
	    				sheet.addCell(label);
	        		}
	        	}
	        }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				book.write();
				book.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 创建
	 * @param downloadDto
	 * @param response
	 */
	/*
	public static void createExcel(DownloadDto downloadDto, HttpServletResponse response) {
		String fileName = downloadDto.getFileName();
		List<SalaryDto> list = downloadDto.getContents();
		String month = downloadDto.getMonth();
		List<String> titles = downloadDto.getTitles();
		
		WritableWorkbook book = null;
		try {
			OutputStream os = response.getOutputStream();
			response.setHeader("Content-disposition", 
					"attachment; filename=" + new String(fileName.getBytes("GB2312"),"8859_1") + ".xls");// 设定输出文件头
	        response.setContentType("application/msexcel");
	        // 创建一个工作薄，就是整个Excel文档
	        book = Workbook.createWorkbook(os);
	        // 创建工作表
	        WritableSheet sheet = book.createSheet("学生补助报表", 0);
	        
	        // 设定列宽
	        sheet.setColumnView(3, 15);
	        sheet.setColumnView(4, 15); // 设定第5列的宽度15
	        sheet.setColumnView(5, 20);
	        
	        WritableCellFormat format = new WritableCellFormat();
	        
	        // 指定字体、字号和粗细
	        WritableFont font = new WritableFont(WritableFont.TIMES, 12,
	     					WritableFont.BOLD);
			format = new WritableCellFormat(font);
        	format.setAlignment(Alignment.CENTRE); // 水平居中
	        format.setVerticalAlignment(VerticalAlignment.CENTRE); // 垂直居中
        	
	        // 创建标签（单元格）
	        Label label = new Label(0, 0, "安徽农业大学学生勤工助学工资表("+ month + ")", format);
	        
	        // 将单元格加入工作表中
	        sheet.addCell(label);
	        // 合并第1行第1列-第1行第12列
	        sheet.mergeCells(0, 0, 11, 0);
	      
	        label = new Label(0, 1, "单位盖章处", format);
	        sheet.addCell(label);
	        // 合并第2行第1列-第3行第3列
	        sheet.mergeCells(0, 1, 2, 2);
	        
	        if(list == null || list.size() == 0) {
	        	// 暂无
	        	label = new Label(0, 3, "暂无工资", format);
	        	sheet.addCell(label);
	        }else {
	        	// 设置标题样式
	        	font = new WritableFont(WritableFont.TIMES, 10,
     					WritableFont.BOLD);
	        	format = new WritableCellFormat(font);
	        	format.setAlignment(Alignment.CENTRE);
	        	format.setVerticalAlignment(VerticalAlignment.CENTRE);
	        	
	        	// 标题
		        for (int i = 0; i < titles.size(); i++) {
					// 第4行，第(i+1)列添加标题
					label = new Label(i, 3, titles.get(i), format);
					sheet.addCell(label);
				}
		        
	        	format = new WritableCellFormat();
	        	format.setAlignment(Alignment.CENTRE);
	        	format.setVerticalAlignment(VerticalAlignment.CENTRE);
	        	
	        	int authority = downloadDto.getAuthority();
	        	
	        	Map<String, SalaryDto> map = new HashMap<String, SalaryDto>();
	        	
	        	if(authority == SysCode.EmployerCode.ADMIN_AUTHORITY) {	// 管理员
	        	  	// 将同一个学生的工资信息拼接在一起
			        for(int i = 0; i < list.size(); i++) {
			        	SalaryDto s = list.get(i);
			        	
			        	String salary = s.getSalary();
			        	String toolFee = s.getToolFee();
			        	String bonus = s.getBonus();
			        	float total = Float.valueOf(salary) + Float.valueOf(toolFee) + Float.valueOf(bonus);
			        	s.setTotal(total);
			        	
		        		String num = s.getNum();
		        		if(map.containsKey(num)) {
		        			SalaryDto salaryDto = map.get(num);	
		        			salaryDto.setPostName(salaryDto.getPostName() + "，" + s.getPostName());
		        			salaryDto.setEmpName(salaryDto.getEmpName() + "，" + s.getEmpName());
		        			salaryDto.setWorktime(salaryDto.getWorktime() + "+" + s.getWorktime());
		        			salaryDto.setSalary(salaryDto.getSalary() + "+" + s.getSalary());
		        			salaryDto.setToolFee(salaryDto.getToolFee() + "+" + s.getToolFee());
		        			salaryDto.setBonus(salaryDto.getBonus() + "+" + s.getBonus());
		        			salaryDto.setTotal(salaryDto.getTotal() + s.getTotal());
		        			salaryDto.setRemarks(salaryDto.getRemarks() + "，" + s.getRemarks());
		        		}else {
		        			map.put(num, s);
		        		}
			        }
			        
			        Set<Entry<String, SalaryDto>> set = map.entrySet();
			        int i = 0;
			        for(Iterator<Entry<String, SalaryDto>> iter = set.iterator(); iter.hasNext(); ){
			        	Entry<String, SalaryDto> enter = iter.next();
			        	SalaryDto s = enter.getValue();
			        	
			        	String[] values = new String[]{String.valueOf(i+1), s.getName(), s.getNum(), s.getProfession(), s.getPostName(),
				        			s.getEmpName(), s.getWorktime(), s.getSalary(), s.getToolFee(), s.getBonus(),  
				        			s.getTotal()+"", s.getRemarks()};
		        		for(int k = 0; k < values.length; k++) {
			        		label = new Label(k, 4+i, values[k], format);
				        	sheet.addCell(label);	
			        	}
		        		i++;
			        }
			        
			       
	        		
	        	}else if(authority == SysCode.EmployerCode.EMPLOYER_AUTHORITY) { // 用工单位
	        	  	// 内容
			        for(int i = 0; i < list.size(); i++) {
			        	SalaryDto s = list.get(i);
			        	
			        	float total = Float.valueOf(s.getSalary()) + Float.valueOf(s.getToolFee()) + Float.valueOf(s.getBonus());
			        	s.setTotal(total);
			        	
			        	String[] values = new String[]{String.valueOf(i+1), s.getName(), s.getNum(), s.getProfession(), s.getPostName(),
				        					s.getWorktime(), s.getSalary(), s.getToolFee(), s.getBonus(),  s.getTotal()+"",
				        					s.getRemarks()};
			       
			        	for(int k = 0; k < values.length; k++) {
			        		label = new Label(k, 4+i, values[k], format);
				        	sheet.addCell(label);	
			        	}
			        }
	        	}
	      
	        }
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				book.write();
				book.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	*/
	

	public static void main(String[] args) {

		readExcel2();
	}

}
