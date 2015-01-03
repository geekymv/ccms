package com.ccms.dao;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.ccms.pojo.RankActivityType;
import com.ccms.pojo.RankActivityTypeVO;


public class RankActivityTypeDAOTest extends BaseTest {

	@Autowired
	private RankActivityTypeDAO rankActivityTypeDAO;
	
	@Test
	public void testqueryByRankIdActivityTypeId(){
		
		RankActivityType rankActivityType = rankActivityTypeDAO.queryByRankIdActivityTypeId(1, 1);
		
		System.out.println(rankActivityType);
		
	}
	
	@Test
	public void testQueryByRankId() {
		
		List<RankActivityTypeVO> rankActivityTypes = rankActivityTypeDAO.queryByRankId(1);
		
		for (RankActivityTypeVO rankActivityType : rankActivityTypes) {
			System.out.println(rankActivityType);
		}
		
	}

}
