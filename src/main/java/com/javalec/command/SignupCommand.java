package com.javalec.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.Signup_Dao;

public class SignupCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String mid = request.getParameter("id");
		String mpw = request.getParameter("pw");
		String mname = request.getParameter("name");
		String maddress = "(" + request.getParameter("postcode") + ") " + request.getParameter("address") + " "
				+ request.getParameter("detailAddress") + " " + request.getParameter("extraAddress");
		String mtel = request.getParameter("start") + request.getParameter("mid") + request.getParameter("end");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String mbirth = year + "-" + (month.length() == 1 ? "0" + month : month) + "-"
				+ (day.length() == 1 ? "0" + day : day);

		Signup_Dao dao = new Signup_Dao();
		dao.signUpMember(mid, mpw, mname, maddress, mtel, mbirth);
	}

}
