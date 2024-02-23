package com.javalec.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.dao.OrderDao;

public class OrderCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		String mid = ((String)session.getAttribute("userId")==null)? "james" : (String)session.getAttribute("userId");
		
		OrderDao dao = new OrderDao();
		dao.getMyOrder(mid);
	}

}