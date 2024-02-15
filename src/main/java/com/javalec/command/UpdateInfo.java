package com.javalec.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.dao.MyPage_Dao;

public class UpdateInfo implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String newpw = request.getParameter("newpw"); 
		String address = request.getParameter("address1")+" "+request.getParameter("address2"); ; 
		
		System.out.println(newpw);
		
		MyPage_Dao dao = new MyPage_Dao();
		dao.updateInfo((String)session.getAttribute("userId"), newpw , address);
	}

}
