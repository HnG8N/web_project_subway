package com.javalec.ajaxservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.dao.BoardDAO;
import com.javalec.dto.BoardDTO;


public class BoardReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		 // 사용자 입력값 확인을 위한 로그 출력
        System.out.println("사용자 입력값 확인:");
        System.out.println("bmID: " + request.getParameter("userId"));
        System.out.println("boardID: " + request.getParameter("boardID"));
        System.out.println("boTitle: " + request.getParameter("boTitle"));
        System.out.println("boardContent: " + request.getParameter("boardContent"));
        
		String bmID = request.getParameter("userId");
	    if (bmID == null) {
	        // bmID가 null일 때 처리할 내용
	        HttpSession session = request.getSession();
	        session.setAttribute("messageType", "오류 메시지");
	        session.setAttribute("messageContent", "사용자 ID가 없습니다.");
	        response.sendRedirect("index.jsp");
	        return;
	        
	    } else { 
		HttpSession session=request.getSession();
		if(!bmID.equals((String) session.getAttribute("userId"))) {
			session.setAttribute("messageType","오류 메시지");
			session.setAttribute("messageContent","접근할 수 없습니다.");
			response.sendRedirect("index.jsp");
			return;
		}
		String boardID =request.getParameter("boardID");		
		if(boardID == null || boardID.equals("")){
			session.setAttribute("messageType","오류 메시지");
			session.setAttribute("messageContent","접근할 수 없습니다.");
			response.sendRedirect("index.jsp");
			return;
		}
		String boTitle = request.getParameter("boTitle");
		String boContent = request.getParameter("boContent");
		if(boTitle == null || boTitle.equals("") || boContent == null || boContent.equals("")) {
			session.setAttribute("messageType","오류 메시지");
			session.setAttribute("messageContent","내용을 모두 채워주세요.");
			response.sendRedirect("bwrite.do");
			return;
		}
		
		BoardDAO boardDAO = new BoardDAO();
		BoardDTO parent = boardDAO.getBbs(Integer.parseInt(boardID));
		boardDAO.replyUpdate(parent);
		boardDAO.reply(bmID, boTitle, boContent, parent);
		session.setAttribute("messageType", "성공 메시지");
		session.setAttribute("messageContent","성공적으로 답변이 작성되었습니다.");
		response.sendRedirect("board.do");
		return;
	    }
	}
	    

}
