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
		int olength = Integer.parseInt(request.getParameter("olength"));
		String obread = request.getParameter("obread"); 
		String otoast = request.getParameter("otoast");
		String ocheese = request.getParameter("ocheese");
		String ovegetables = request.getParameter("ovegetables");
		String osauce = request.getParameter("osauce"); 
		int oprice = Integer.parseInt(request.getParameter("oprice"));
		
		OrderDao dao = new OrderDao();
		dao.addOrder(omid, omncode, olength, obread, otoast, ocheese, ovegetables, osauce, oprice);
	}

}