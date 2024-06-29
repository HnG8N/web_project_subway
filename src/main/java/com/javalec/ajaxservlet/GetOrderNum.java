package com.javalec.ajaxservlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.javalec.dao.OrderDao;

/**
 * Servlet implementation class GetOrderNum
 */
@WebServlet("/GetOrderNum")
public class GetOrderNum extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetOrderNum() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderDao dao = new OrderDao();
		String orderNum = "ORD"+dao.getOrderNumber();
//		System.out.println("orderNum : "+orderNum);
		// 만든 오더 넘버를 전송.
		String json = new Gson().toJson(orderNum);
		PrintWriter out = response.getWriter();
		out.print(json);

		out.flush();
	}

}
