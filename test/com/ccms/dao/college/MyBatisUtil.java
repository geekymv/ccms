package com.ccms.dao.college;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisUtil {
	
	public static SqlSession getSqlSession() {
		
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(reader);
			
			SqlSession session = factory.openSession();
			
			return session;
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
