package com.javalec.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.dao.CartDao;
import com.javalec.dto.CartDto;

public class AddCartCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int clength = Integer.parseInt(request.getParameter("breadLength"));
		String cbread = request.getParameter("bread"); 
		String ctoast = request.getParameter("warm");
		String ccheese = request.getParameter("cheese");
		String cvegetables = ((request.getParameter("vegetable1")==null)? "" : request.getParameter("vegetable1")+",")
							+ ((request.getParameter("vegetable2")==null)? "" : request.getParameter("vegetable2")+",")
							+ ((request.getParameter("vegetable3")==null)? "" : request.getParameter("vegetable3")+",")
							+ ((request.getParameter("vegetable4")==null)? "" : request.getParameter("vegetable4")+",")
							+ ((request.getParameter("vegetable5")==null)? "" : request.getParameter("vegetable5")+",")
							+ ((request.getParameter("vegetable6")==null)? "" : request.getParameter("vegetable6")+",")
							+ ((request.getParameter("vegetable7")==null)? "" : request.getParameter("vegetable7")+",")
							+ ((request.getParameter("vegetable8")==null)? "" : request.getParameter("vegetable8")+",")
							+ ((request.getParameter("vegetable9")==null)? "" : request.getParameter("vegetable9"));
		String csauce = request.getParameter("sauce"); 

		
		// 장바구니 추가시 cart DB에 저장.
		HttpSession session = request.getSession();
		
		String cmid = ((String)session.getAttribute("userId")==null)? "james" : (String)session.getAttribute("userId");
		int cmncode = Integer.parseInt((String)session.getAttribute("mncode"));
		int eachPrice = Integer.parseInt((String)session.getAttribute("mnprice"));
		int cqty = 1;

		CartDao dao = new CartDao();
		dao.addCart(cmid, cmncode, clength, cbread, ctoast, ccheese, cvegetables, csauce, eachPrice, cqty);	// 장바구니에 상품 추가. 

	}

}
