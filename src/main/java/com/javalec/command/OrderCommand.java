package com.javalec.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.OrderDao;

public class OrderCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String omid = request.getParameter("omid");
		int omncode = Integer.parseInt(request.getParameter("omncode"));
		int olength = Integer.parseInt(request.getParameter("breadLength"));
		String obread = request.getParameter("breadType"); 
		String otoast = request.getParameter("breadWarm");
		String ocheese = request.getParameter("cheese");
		String ovegetables = request.getParameter("vegetable");
		String osauce = request.getParameter("souce"); 
		int oprice = Integer.parseInt(request.getParameter("totPrice"));
		
		OrderDao dao = new OrderDao();
		dao.addOrder(omid, omncode, olength, obread, otoast, ocheese, ovegetables, osauce, oprice);
	}

}