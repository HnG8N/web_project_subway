package com.javalec.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.dao.BLoginDAO;


public class BloginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");	
		HttpSession session = request.getSession();
				
		BLoginDAO dao = new BLoginDAO();
		
		if(dao.checkCredentials(id, pw)) {	// 로그인 성공 시 세션에 아이디값을 넣어줌.
			session.setAttribute("id", id);
			
		} else { // 로그인 실패 시
	        // 오류 메시지를 request의 속성에 저장
	        request.setAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
	    }
	}

}
