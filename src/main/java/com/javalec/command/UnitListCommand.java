package com.javalec.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.MenuDao;
import com.javalec.dto.MenuDto;

public class UnitListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		MenuDao dao = new MenuDao();
		ArrayList<MenuDto> dtos = dao.getMenuList("wrap");
		request.setAttribute("MenuList", dtos);
	}

}
