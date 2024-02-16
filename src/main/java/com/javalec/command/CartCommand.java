package com.javalec.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.dto.OrderDto;

public class CartCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String omid = request.getParameter("omid");
		int omncode = Integer.parseInt(request.getParameter("omncode"));
		int olength = Integer.parseInt(request.getParameter("breadLength"));
		String obread = request.getParameter("breadType"); 
		String otoast = request.getParameter("breadWarm");
		String ocheese = request.getParameter("cheese");
		String ovegetables = request.getParameter("vegetable");
		String osauce = request.getParameter("souce"); 
		int oprice = Integer.parseInt(request.getParameter("totPrice"));
		
		// 장바구니 추가시 세션에 저장.
		HttpSession session = request.getSession();

		session.setAttribute("omid", omid);
		session.setAttribute("omncode", omncode);
		session.setAttribute("olength", olength);
		session.setAttribute("obread", obread);
		session.setAttribute("otoast", otoast);
		session.setAttribute("ocheese", ocheese);
		session.setAttribute("ovegetables", ovegetables);
		session.setAttribute("osauce", osauce);
		session.setAttribute("oprice", oprice);
		
		
		
//		OrderDto dto = new OrderDto(omid, omncode, olength, obread, otoast, ocheese, ovegetables, osauce,  oprice);
	}

}
