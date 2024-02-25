package com.javalec.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.dao.OrderDao;
import com.javalec.dto.OrderDto;

public class ConfirmOrderCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String ordNo = request.getParameter("ordNo");
		HttpSession session = request.getSession();
		
		String mid = ((String)session.getAttribute("userId")==null)? "james" : (String)session.getAttribute("userId");
		
		OrderDao dao = new OrderDao();
		
		ArrayList<OrderDto> orderInfo = dao.getMyOrder(mid);
		String memberTelno = dao.getTelNo(mid);
		
		request.setAttribute("ordNo", ordNo);
		request.setAttribute("orderInfo", orderInfo);
		request.setAttribute("memberTelno", memberTelno);
		
	}

}