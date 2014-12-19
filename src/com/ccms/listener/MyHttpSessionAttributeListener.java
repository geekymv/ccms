package com.ccms.listener;

import java.util.Enumeration;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

public class MyHttpSessionAttributeListener implements HttpSessionAttributeListener {

	@Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		System.out.println("session added...");
		
		HttpSession session = se.getSession();
		
		Enumeration<String> enumeration = session.getAttributeNames();
		while(enumeration.hasMoreElements()){
			String ele = enumeration.nextElement();
			System.out.println("session added name = " + ele);
		}
		
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent se) {
		System.out.println("session removed...");
		
		HttpSession session = se.getSession();
		if(session == null) {
			System.out.println("session == null");
		}else {
			System.out.println("session != null");
			
			Object obj = session.getAttribute("user");
			
		}
		
//		Object obj = session.getAttribute("user");
//		
//		if(obj != null){
//			System.out.println("obj != null");
//		}else {
//			System.out.println("obj == null");
//		}
	
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent se) {
		System.out.println("session replaced...");
		
		HttpSession session = se.getSession();
		
		Enumeration<String> enumeration = session.getAttributeNames();
		while(enumeration.hasMoreElements()){
			String ele = enumeration.nextElement();
			System.out.println("session replaced name = " + ele);
		}
		
	}

}
