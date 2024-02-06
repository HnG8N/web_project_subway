package com.javalec.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.command.Command;
import com.javalec.command.SignupCommand;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet"); // get방식으로 들어왔을 때 확인
		actionDo(request, response); // actionDo method로 보냄
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost"); // post방식으로 들어왔을 때 확인
		actionDo(request, response); // actionDo method로 보냄
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("actionDo");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		Command command = null;
		String viewPage = null;
		
		String url = request.getRequestURI();
		System.out.println(url); 	   	//  /MVCBoard/list.do 라고 뜸
		String conPath = request.getContextPath();
		System.out.println(conPath);	 //  /MVCBoard 라고 뜸
		String com = url.substring(conPath.length());
		System.out.println(com);		//  /list.do라고 뜸(이걸로 페이지를 판단)

		switch (com) {
		case ("/signup_view.do"):
			viewPage = "/jsp/signup/signup.jsp";
			break;
		case ("signup.do"):
			command = new SignupCommand();
			command.execute(request, response);
			viewPage = "/jsp/signup/login.jsp";
			break;
		default:
			break;
		}

		if (viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	} // actionDo()

} // End
