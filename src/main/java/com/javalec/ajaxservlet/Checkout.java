package com.javalec.ajaxservlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.javalec.dao.CartDao;
import com.javalec.dao.OrderDao;

/**
 * Servlet implementation class Checkout
 */
@WebServlet("/Checkout")
public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Checkout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		String cmid = ((String)session.getAttribute("userId")==null)? "james" : (String)session.getAttribute("userId");

		String itemIdxArr[] = request.getParameterValues("itemIndexArray[]");
//		System.out.println("itemIdxArr : " + itemIdxArr.length);
		int execnt = 0, exeDelCartCnt = 0;
		OrderDao dao = new OrderDao();

		for(int i=0; i<itemIdxArr.length; i++) {	 // 주문정보 orderpurchase DB에 입력. 
//			System.out.println(itemIdxArr[i]);
			execnt += dao.addOrder(Integer.parseInt(itemIdxArr[i]), cmid);
		}
		if(execnt>0) {	// 입력하고 나서 장바구니에 담은 내역 삭제. 
			for(int i=0; i<itemIdxArr.length; i++) {
				exeDelCartCnt += dao.deleteCartItem(Integer.parseInt(itemIdxArr[i]), cmid);
			}
		}
		// 변경되었는지 확인하고 결과를 전송.
		String json = new Gson().toJson(exeDelCartCnt);
		PrintWriter out = response.getWriter();
		out.print(json);

		out.flush();
	}

}
