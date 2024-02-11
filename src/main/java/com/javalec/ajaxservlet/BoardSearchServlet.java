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
		String btitle = request.getParameter("btitle");
		  
		System.out.println("서블릿전송");
		response.getWriter().write(getJSON(btitle));
		
	}

	public String getJSON(String btitle) {
		if(btitle == null) btitle ="";	
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		BoardDAO bbsDAO = new BoardDAO();
			ArrayList<BoardDTO> titleList = bbsDAO.search(btitle);
			for(int i = 0; i< titleList.size(); i++) {
				result.append("[{\"value\":\"" + titleList.get(i).getBseq() + "\"},");
				result.append("{\"value\":\"" + titleList.get(i).getBmid() + "\"},");
				result.append("{\"value\":\"" + titleList.get(i).getBtitle() + "\"},");			
				result.append("{\"value\":\"" + titleList.get(i).getBdate() + "\"}],");
				
	        }
			result.append("]}");
			return result.toString();	  
	  }		
	
	
}// End
