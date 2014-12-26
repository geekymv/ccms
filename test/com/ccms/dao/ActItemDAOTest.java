package com.ccms.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ccms.pojo.ActItem;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/beans.xml")
public class ActItemDAOTest {
	
	@Autowired
	private ActItemDAO actItemDAO;
	
	@Test
	public void testQueryAllActivityItem(){
		
		List<ActItem> items = actItemDAO.queryAllActivityItem(1);
		
		for (ActItem actItem : items) {
			System.out.println(actItem);
		}
		
	}
	

}
