package com.ccms.dao.college;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.ccms.dao.CollegeDAO;
import com.ccms.pojo.College;

public class TestCollegeDAO {

	@Test
	public void testQuerySpecialtys() {
		SqlSession session = MyBatisUtil.getSqlSession();
		try {

			CollegeDAO collegeDAO = session.getMapper(CollegeDAO.class);
			
			College college = collegeDAO.querySpecialtys(1);
			
			System.out.println(college);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
	}
	
	@Test
	public void testQuery(){
		SqlSession session = MyBatisUtil.getSqlSession();
		try {

			CollegeDAO collegeDAO = session.getMapper(CollegeDAO.class);
			
			College college = collegeDAO.query(1);
			
			System.out.println(college);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
		
	}

	@Test
	public void testUpdate() {

		College college = new College(3, "zbxy1", "植物保护学院1", "1231", "1234561", "陶老师1", "植保楼1");
		SqlSession session = MyBatisUtil.getSqlSession();
		try {

			CollegeDAO collegeDAO = session.getMapper(CollegeDAO.class);
			
			int res = collegeDAO.update(college);
			
			session.commit();
			
			System.out.println(res == 1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
	}
	
	@Test
	public void testAdd() {
		College college = new College("zbxy", "植物保护学院", "123", "123456", "陶老师", "植保楼");
		SqlSession session = MyBatisUtil.getSqlSession();
		try {

			CollegeDAO collegeDAO = session.getMapper(CollegeDAO.class);
			
			int res = collegeDAO.add(college);
			
			session.commit();
			
			System.out.println(res == 1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
		
	}
	
	
	
	

}
