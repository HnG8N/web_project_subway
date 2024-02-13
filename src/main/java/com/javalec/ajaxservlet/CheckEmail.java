package com.javalec.ajaxservlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.javalec.dao.Signup_Dao;

/**
 * Servlet implementation class CheckEmail
 */
@WebServlet("/CheckEmail")
public class CheckEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		response.setContentType("text/html;charset=UTF-8");
		

		Signup_Dao dao = new Signup_Dao();
		int count = dao.checkEmail(email);
		
		// 회원 아이디 중복 여부를 JSON으로 변환하여 응답
		String json = new Gson().toJson(count);
		PrintWriter out = response.getWriter();
		out.print(json);

		out.flush();
	}

}
