package com.javalec.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.dao.Login_Dao;
import com.javalec.dao.Signup_Dao;

public class BoardCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
				
			
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		String boardID = (String) session.getAttribute("boardID");
		
		request.setAttribute("userId", userId);
		request.setAttribute("boardID", boardID);
	

	}

}
