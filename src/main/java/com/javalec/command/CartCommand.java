package com.javalec.command;
// 장바구니 정보가져오기.
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.dao.CartDao;
import com.javalec.dto.CartDto;

public class CartCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String cmid = ((String)session.getAttribute("userId")==null)? "james" : (String)session.getAttribute("userId");

		CartDao dao = new CartDao();

		ArrayList<CartDto> listCartMenu = dao.getMyCart(cmid);	//로그인한 사용자의 장바구니 가져오기.
		
		request.setAttribute("listCartMenu", listCartMenu);
		
//		OrderDto dto = new OrderDto(omid, omncode, olength, obread, otoast, ocheese, ovegetables, osauce,  oprice);
	}

}
