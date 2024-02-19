package com.javalec.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.dao.IngredientDao;
import com.javalec.dto.IngredientDto;

public class selectIngredientCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		
		
		IngredientDao dao = new IngredientDao();
		IngredientDto breadDto = dao.getIngredient("bread");
		IngredientDto vegitableDto = dao.getIngredient("vegitable");
		IngredientDto cheeseDto = dao.getIngredient("cheese");
		IngredientDto souceDto = dao.getIngredient("souce");
		
		request.setAttribute("breadDto", breadDto);
		request.setAttribute("vegitableDto", vegitableDto);
		request.setAttribute("cheeseDto", cheeseDto);
		request.setAttribute("souceDto", souceDto);

		HttpSession session = request.getSession();

		session.setAttribute("mncode", request.getParameter("mncode"));
		session.setAttribute("price", request.getParameter("price"));
	}

}
