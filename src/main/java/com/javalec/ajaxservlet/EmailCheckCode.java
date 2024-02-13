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

/**
 * Servlet implementation class EmailCheckCode
 */
@WebServlet("/EmailCheckCode")
public class EmailCheckCode extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EmailCheckCode() {
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

		HttpSession session = request.getSession();
		String code = (String) session.getAttribute("CODE");
		String emailcode = request.getParameter("emailcode");
		String result = "";

		if (code.equals(emailcode)) {
			result = "true";
		} else {
			result = "false";
		}

		response.setContentType("text/html;charset=UTF-8");

		String json = new Gson().toJson(result);
		PrintWriter out = response.getWriter();
		out.print(json);

		out.flush();

	}

}
