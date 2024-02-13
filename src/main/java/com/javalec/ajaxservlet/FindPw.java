package com.javalec.ajaxservlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.javalec.dao.FindId_Dao;
import com.javalec.dao.FindPw_Dao;

/**
 * Servlet implementation class FindId
 */
@WebServlet("/FindPw")
public class FindPw extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FindPw() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String date = request.getParameter("date");
		String email = request.getParameter("email");

		FindPw_Dao dao = new FindPw_Dao();
		int count = dao.checkInfo(id, name, date, email);

		// 회원 아이디 중복 여부를 JSON으로 변환하여 응답
		String json = new Gson().toJson(count);
		PrintWriter out = response.getWriter();
		out.print(json);

		out.flush();
	}

}
