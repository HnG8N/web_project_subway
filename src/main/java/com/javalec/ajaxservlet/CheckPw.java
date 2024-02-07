package com.javalec.ajaxservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.javalec.dao.Login_Dao;

/**
 * Servlet implementation class CheckPw
 */
@WebServlet("/CheckPw")
public class CheckPw extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckPw() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mid = request.getParameter("mid");

		Login_Dao dao = new Login_Dao();
		String pw = dao.checkPw(mid);
		System.out.println(pw);
		response.setContentType("text/html;charset=UTF-8");

		// 회원 아이디 중복 여부를 JSON으로 변환하여 응답
		String json = new Gson().toJson(pw);
		PrintWriter out = response.getWriter();
		out.print(json);

		out.flush();

	}

}
