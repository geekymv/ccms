package com.ccms.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ccms.persistence.pojo.Activity;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/beans.xml")
public class ActivityDAOTest {

	@Autowired
	private ActivityDAO activityDAO;
	
	@Test
	public void testQueryById() {
		Activity activity = activityDAO.queryById(1);
		
		System.out.println(activity);
	}
	
	@Test
	public void testUpdate() {
		
		Activity activity = activityDAO.queryById(1);
		activity.setAim("aim");
		
		int res = activityDAO.update(activity);

		System.out.println(res);
	}
	
	
	@Test
	public void testList() {
		
		List<Activity> activities = activityDAO.queryByPage(0, 3);
		
		for (Activity activity : activities) {
			System.out.println(activity);
		}
	}
	
	
	@Test
	public void testQueryAllStatusByPage() {
		
//		List<Activity> activities = activityDAO.queryAllStatusByPage(0, 3);
//		
//		for (Activity activity : activities) {
//			System.out.println(activity);
//		}
	}

}



























