package com.javalec.ajaxservlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.BoardDAO;
import com.javalec.dto.BoardDTO;


/**
 * Servlet implementation class BoardSearchServlet
 */
@WebServlet("/BoardSearchServlet")
public class BoardSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String boTitle = request.getParameter("boTitle");
		  
		System.out.println("서블릿전송");
		response.getWriter().write(getJSON(boTitle));		
	}

	public String getJSON(String boTitle) {
		if(boTitle == null) boTitle ="";	
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		BoardDAO boardDAO = new BoardDAO();
			ArrayList<BoardDTO> titleList = boardDAO.search(boTitle);
			for(int i = 0; i< titleList.size(); i++) {
				result.append("[{\"value\":\"" + titleList.get(i).getBoardID() + "\"},");
				result.append("{\"value\":\"" + titleList.get(i).getBoTitle() + "\"},");
				result.append("{\"value\":\"" + titleList.get(i).getBmID() + "\"},");			
				result.append("{\"value\":\"" + titleList.get(i).getBoDate() + "\"},");
				result.append("{\"value\":\"" + titleList.get(i).getBoardHit() + "\"}],");
	        }
			result.append("]}");
			return result.toString();	  
	  }			
	
}// End
