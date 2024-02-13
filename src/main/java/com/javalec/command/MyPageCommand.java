package com.javalec.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.digester.SystemPropertySource;

import com.javalec.dao.MyPage_Dao;
import com.javalec.dto.MyPage_Dto;

public class MyPageCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userId");
		
		
		MyPage_Dao dao = new MyPage_Dao();
		MyPage_Dto dto = dao.Mypage(id);
		
		request.setAttribute("dto", dto);
	}

}
