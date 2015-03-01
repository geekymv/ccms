package com.ccms.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ccms.persistence.pojo.ActivityItem;
import com.ccms.persistence.vo.ActivityItemVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/beans.xml")
public class ActItemDAOTest {
	
	@Autowired
	private ActivityItemDAO actItemDAO;
	
	@Test
	public void testQueryAllActivityItem(){
		
		List<ActivityItem> items = actItemDAO.queryAllActivityItem(1);
		
		for (ActivityItem actItem : items) {
			System.out.println(actItem);
		}
		
	}
	
	@Test
	public void testQueryApproveActivityItems() {
		
		List<ActivityItemVO> items = actItemDAO.queryActivityItemVO(1);
		
		for (ActivityItemVO actItem : items) {
			System.out.println(actItem);
		}
		
	}
	

}
