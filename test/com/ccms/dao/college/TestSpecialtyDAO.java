package com.ccms.dao.college;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.ccms.dao.CollegeDAO;
import com.ccms.dao.SpecialtyDAO;
import com.ccms.pojo.College;
import com.ccms.pojo.Specialty;

public class TestSpecialtyDAO {

	@Test
	public void testUpdate() {
		
		SqlSession session = MyBatisUtil.getSqlSession();
		try {
			SpecialtyDAO specialtyDAO = session.getMapper(SpecialtyDAO.class);
			
			Specialty specialty = new Specialty(2, "网络工程"); 
			
			int res = specialtyDAO.update(specialty);
			
			session.commit();
			
			System.out.println(res);
			
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
		SqlSession session = MyBatisUtil.getSqlSession();
		try {

			CollegeDAO collegeDAO = session.getMapper(CollegeDAO.class);
			College college = collegeDAO.query(1);
			SpecialtyDAO specialtyDAO = session.getMapper(SpecialtyDAO.class);
			
			Specialty specialty = new Specialty("网络工程", college); 
			
			int res = specialtyDAO.add(specialty);
			
			session.commit();
			
			System.out.println(res);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
	}

}
