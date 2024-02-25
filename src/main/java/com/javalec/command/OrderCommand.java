package com.javalec.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.dao.CartDao;
import com.javalec.dao.OrderDao;
import com.javalec.dto.CartDto;
import com.javalec.dto.OrderDto;

public class OrderCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String ordNo = request.getParameter("ordNo");
		HttpSession session = request.getSession();
		
		String mid = ((String)session.getAttribute("userId")==null)? "james" : (String)session.getAttribute("userId");

		CartDao dao = new CartDao();
		ArrayList<CartDto> listCartMenu = dao.getMyCart(mid);	//	로그인한 ID의 장바구니에 담은 주문 가져오기.
		String memberTelno = dao.getTelNo(mid);		// 로그인한 사용자의 전화번호 가져오기.
		
		request.setAttribute("ordNo", ordNo);
		request.setAttribute("orderInfo", listCartMenu);
		request.setAttribute("memberTelno", memberTelno);
		
	}

}