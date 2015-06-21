package com.ccms.util;

import java.io.File;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import org.lychie.jexcel.WritableExcel;

import com.ccms.persistence.dto.StudentDto;

public class WriteExcel {
	
	public static void downloadApplyStudents(List<StudentDto> dtos, OutputStream out) {
		  WritableExcel excel = new WritableExcel(dtos);
		  excel.setMapper("num", "学号");

		  excel.write(out);
	}
	
	
	public static void main(String[] args) {

		try {
			  // 创建一个可写的EXCEL对象
	        WritableExcel excel = new WritableExcel(getData());
	        // 设置POJO属性与EXCEL单元格的映射关系
//	        excel.setMapper("id", "编号");
	        excel.setMapper("name", "姓名");
//	        excel.setMapper("hiredate", "入职日期");
//	        excel.setMapper("salary", "薪资");
	        // 将对象内容写出到EXCEL文档
	        excel.write(new File("c:\\employee.xlsx"));
	        
			
		} catch (Exception e) {
			e.printStackTrace();
		}

    }

    private static List<Employee> getData() {
        List<Employee> list = new ArrayList<Employee>();
        list.add(new Employee("杨忠杰"));
        list.add(new Employee("叶水燕"));
        list.add(new Employee("杨晓婷"));
        list.add(new Employee("叶国珠"));
        list.add(new Employee("何国群"));
        return list;
    }
    
    

}

class Employee {
	
	public Employee(String name) {
		this.name = name;
	}
	
	private String id;
	private String name;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
