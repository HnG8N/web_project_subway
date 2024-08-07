package com.javalec.ajaxservlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.dao.OrderDao;
import com.javalec.dto.OrderDto;

/**
 * Servlet implementation class gotoOrder
 */
@WebServlet("/gotoOrder")
public class gotoOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public gotoOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		String omid = ((String)session.getAttribute("userId")==null)? "james" : (String)session.getAttribute("userId");
		
		OrderDao dao = new OrderDao();
		ArrayList<OrderDto> orderInfo = dao.getMyOrder(omid);
		
	}

}
