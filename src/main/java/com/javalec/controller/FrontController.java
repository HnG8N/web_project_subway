package com.javalec.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.command.Command;
import com.javalec.command.LoginCommand;
import com.javalec.command.SaladListCommand;
import com.javalec.command.SandwichListCommand;
import com.javalec.command.SignupCommand;
import com.javalec.command.UnitListCommand;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet"); // get방식으로 들어왔을 때 확인
		actionDo(request, response); // actionDo method로 보냄
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost"); // post방식으로 들어왔을 때 확인
		actionDo(request, response); // actionDo method로 보냄
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("actionDo");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		Command command = null;
		String viewPage = null;
		HttpSession session = request.getSession();
		
		String url = request.getRequestURI();
		System.out.println(url); 	   	//  /MVCBoard/list.do 라고 뜸
		String conPath = request.getContextPath();
		System.out.println(conPath);	 //  /MVCBoard 라고 뜸
		String com = url.substring(conPath.length());
		System.out.println(com);		//  /list.do라고 뜸(이걸로 페이지를 판단)

		switch (com) {
		case("/login_view.do"):
			viewPage = "/jsp/signup/login.jsp";
			break;
		case("/login.do"):
			command = new LoginCommand();
			command.execute(request, response);
			
			
			String userid = (String)session.getAttribute("userId");
			
			if(userid == "admin") {
				//viewPage="signup_view.do";
			}
			else {
				viewPage="home.do";
			}
			break;
		case ("/signup_view.do"):
			viewPage = "/jsp/signup/signup.jsp";
			break;
		case ("/signup.do"):
			command = new SignupCommand();
			command.execute(request, response);
			viewPage = "login_view.do";
			break;
		case ("/mypage.do"):	// 마이페이지.
//			command = new SandwichListCommand();
//			command.execute(request, response);
			viewPage = "/jsp/mypage/mypage.jsp";
			break;
		case("/home.do"):	// 홈으로~
			viewPage = "/index.jsp";
		break;
		case("/logout.do"):	// 로그아웃.
			viewPage = "/index.jsp";
			session.invalidate();
		break;
		case ("/agreement.do"):	// 이용약관
//			command = new SandwichListCommand();
//			command.execute(request, response);
			viewPage = "/jsp/about/agreement.jsp";
			break;
		case ("/storeSearch.do"):	// 매장찾기
//			command = new SandwichListCommand();
//			command.execute(request, response);
			viewPage = "/jsp/about/storeSearch.jsp";
			break;
		case ("/utilizationSubway.do"):	// 서브웨이 이용방법
//			command = new SandwichListCommand();
//			command.execute(request, response);
			viewPage = "/jsp/about/utilizationSubway.jsp";
			break;
		case ("/freshNutritionFacts.do"):	// 서브웨이 이용방법
//			command = new SandwichListCommand();
//			command.execute(request, response);
			viewPage = "/jsp/about/freshNutritionFacts.jsp";
			break;
		case ("/freshInfo.do"):	// 신선한 재료 소개
//			command = new SandwichListCommand();
//			command.execute(request, response);
			viewPage = "/jsp/about/freshInfo.jsp";
			break;
		case ("/history.do"):	// 서브웨이 역사
//			command = new UnitListCommand();
//			command.execute(request, response);
			viewPage = "/jsp/about/history.jsp";
		break;
		case ("/privacy.do"):	// 개인정보처리방침
//			command = new UnitListCommand();
//			command.execute(request, response);
			viewPage = "/jsp/about/privacy.jsp";
		break;
		case ("/store.do"):	// FAST_SUB
//			command = new SandwichListCommand();
//			command.execute(request, response);
			viewPage = "/jsp/order/view/fast/near/store.jsp";
			break;
		case ("/sandwich.do"):	// 샌드위치 메뉴소개
			command = new SandwichListCommand();
			command.execute(request, response);
			viewPage = "/jsp/productlist/sandwich.jsp";
			break;
		case ("/salad.do"):	// 샐러드 메뉴소개
			command = new SaladListCommand();
			command.execute(request, response);
			viewPage = "/jsp/productlist/salad.jsp";
			break;
		case ("/unit.do"):	// 랩, 기타 메뉴소개
			command = new UnitListCommand();
			command.execute(request, response);
			viewPage = "/jsp/productlist/unit.jsp";
			break;
			//
		case ("/faq.do"):	// FAQ
//			command = new UnitListCommand();
//			command.execute(request, response);
			viewPage = "/jsp/board/faq.jsp";
			break;
		case ("/qna.do"):	// 1:1 문의
//			command = new UnitListCommand();
//			command.execute(request, response);
			viewPage = "/jsp/board/qna.jsp";
		break;
		case ("/cart.do"):	// 장바구니.
//			command = new UnitListCommand();
//			command.execute(request, response);
			viewPage = "/jsp/cart/fastsub.jsp";
		break;
		case("/findId_view.do"):
		   viewPage = "/jsp/signup/findId.jsp";
		   break;
		case("/findPw_view.do"):
		   viewPage = "/jsp/signup/findPw.jsp";
		   break;
		case("/infoModify.do"):
			viewPage = "/jsp/mypage/info/modify.jsp";
		break;
		case("/modifyPW.do"):
			viewPage = "/jsp/mypage/info/pw.jsp";
		break;
		default:
			break;
		}

		if (viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	} // actionDo()

} // End
