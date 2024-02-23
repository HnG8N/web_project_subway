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

/**
 * Servlet implementation class deleteCartItem
 */
@WebServlet("/deleteCartItem")
public class deleteCartItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteCartItem() {
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
//		int cseq = Integer.parseInt(request.getParameter("cartIdx"));
		String cartIdxArr[] = request.getParameterValues("cartIdxArr[]");
//		System.out.println(cartIdxArr.length);
		int execnt = 0;
		for(int i=0; i<cartIdxArr.length; i++) {
			CartDao dao = new CartDao();
			execnt += dao.deleteCartItem(Integer.parseInt(cartIdxArr[i]), cmid);
		}
		// 변경되었는지 확인하고 결과를 전송.
		String json = new Gson().toJson(execnt);
		PrintWriter out = response.getWriter();
		out.print(json);

		out.flush();
	}

}
