package com.javalec.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.dao.IngredientDao;
import com.javalec.dto.IngredientDto;

public class selectIngredientCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		session.setAttribute("mncode", request.getParameter("mncode"));
		session.setAttribute("mnprice", request.getParameter("mnprice"));
		
		IngredientDao dao = new IngredientDao();
		ArrayList<IngredientDto> breadDtos = dao.getIngredient("bread");
		ArrayList<IngredientDto> vegitableDtos = dao.getIngredient("vegetable");
		ArrayList<IngredientDto> cheeseDtos = dao.getIngredient("cheese");
		ArrayList<IngredientDto> sauceDtos = dao.getIngredient("sauce");
		
		request.setAttribute("breadDtos", breadDtos);
		request.setAttribute("vegitableDtos", vegitableDtos);
		request.setAttribute("cheeseDtos", cheeseDtos);
		request.setAttribute("sauceDtos", sauceDtos);

	}

}
