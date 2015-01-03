package com.ccms.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.ccms.pojo.RankActivityType;


public class RankActivityTypeDAOTest extends BaseTest {

	@Autowired
	private RankActivityTypeDAO rankActivityTypeDAO;
	
	@Test
	public void testqueryByRankIdActivityTypeId(){
		
		RankActivityType rankActivityType = rankActivityTypeDAO.queryByRankIdActivityTypeId(1, 1);
		
		System.out.println(rankActivityType);
		
	}

}
