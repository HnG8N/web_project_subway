package com.javalec.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.command.CartCommand;
import com.javalec.command.Command;
import com.javalec.command.DeleteInfoCommand;
import com.javalec.command.LoginCommand;
import com.javalec.command.MenuDetailCommand;
import com.javalec.command.MenuListCommand;
import com.javalec.command.MyPageCommand;
import com.javalec.command.OrderCommand;
import com.javalec.command.SaladListCommand;
import com.javalec.command.SaladViewCommand;
import com.javalec.command.SandwichListCommand;
import com.javalec.command.SandwichViewCommand;
import com.javalec.command.SignupCommand;
import com.javalec.command.UnitListCommand;
import com.javalec.command.UnitViewCommand;
import com.javalec.command.UpdateInfo;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet"); // get방식으로 들어왔을 때 확인
		actionDo(request, response); // actionDo method로 보냄
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		System.out.println(url); // /MVCBoard/list.do 라고 뜸
		String conPath = request.getContextPath();
		System.out.println(conPath); // /MVCBoard 라고 뜸
		String com = url.substring(conPath.length());
		System.out.println(com); // /list.do라고 뜸(이걸로 페이지를 판단)

		switch (com) {
		case ("/login_view.do"):
			viewPage = "/jsp/signup/login.jsp";
			break;
		case ("/login.do"):
			command = new LoginCommand();
			command.execute(request, response);
			viewPage = "home.do";
			break;
		case ("/signup_view.do"):
			viewPage = "/jsp/signup/signup.jsp";
			break;
		case ("/signup.do"):
			command = new SignupCommand();
			command.execute(request, response);
			viewPage = "login_view.do";
			break;
		case ("/mypage.do"): // 마이페이지.
			command = new MyPageCommand();
			command.execute(request, response);
			viewPage = "/jsp/mypage/mypage.jsp";
			break;
		case("/updateInfo.do"):
			command = new UpdateInfo();
			command.execute(request, response);
			viewPage = "mypage.do";
			break;
		case("/deleteInfo.do"):
			command = new DeleteInfoCommand();
			command.execute(request, response);
			session.invalidate();
			viewPage = "logout.do";
			
		case ("/findId_view.do"):
			viewPage = "/jsp/signup/findId.jsp";
			break;
		case ("/findPw_view.do"):
			viewPage = "/jsp/signup/findPw.jsp";
			break;
		case ("/infoModify.do"):
			command = new MyPageCommand();
			command.execute(request, response);
			viewPage = "/jsp/mypage/info/modify.jsp";
			break;
		case ("/modifyPW.do"):
			viewPage = "/jsp/mypage/info/pw.jsp";
			break;			
		// 로그아웃시 세션 정보 삭제.
		case ("/logout.do"): // 로그아웃.
			viewPage = "/index.jsp";
			session.invalidate();
			break;

		
		// 	[홈]
		// 	main page.
		case ("/home.do"): 
			viewPage = "/index.jsp";
			break;
			
		// 	[홈] 
		// 	[footer] 
		// 	이용약관 페이지.
		case ("/agreement.do"): 
			viewPage = "/jsp/about/agreement.jsp";
			break;

		// 	[홈]
		// 	[footer] 
		// 	개인정보처리방침 페이지. 
		case ("/privacy.do"): 
			viewPage = "/jsp/about/privacy.jsp";
			break;

		
		
		// 	[서브웨이] 
		// 	서브웨이 역사 페이지.
		case ("/history.do"): 
			viewPage = "/jsp/about/history.jsp";
			break;
			
		// 	[서브웨이] 
		// 	매장 찾기 페이지.
		case ("/storeSearch.do"): 
			viewPage = "/jsp/about/storeSearch.jsp";
			break;

			
			
		// 	[이용방법] 
		// 	서브웨이 이용방법 페이지.
		case ("/utilizationSubway.do"): 
			viewPage = "/jsp/about/utilizationSubway.jsp";
			break;
			
		//	[이용방법] 
		//	신선한 재료 소개 페이지.
		case ("/freshInfo.do"): 
			viewPage = "/jsp/about/freshInfo.jsp";
			break;
			
		// 	[이용방법] 
		// 	신선한 재료 소개 영양 정보 페이지.
		case ("/freshNutritionFacts.do"): 
			viewPage = "/jsp/about/freshNutritionFacts.jsp";
			break;

			
		// 	[메뉴소개]
		// 	샌드위치 메뉴 리스트. 
		case ("/sandwich.do"): 
			command = new SandwichListCommand();
			command.execute(request, response);
			viewPage = "/jsp/productlist/sandwich.jsp";
			break;
			
		// 	[메뉴소개]
		// 	샐러드 메뉴 리스트. 
		case ("/salad.do"): 
			command = new SaladListCommand();
			command.execute(request, response);
			viewPage = "/jsp/productlist/salad.jsp";
			break;
		
		// 	[메뉴소개]
		// 	랩, 기타 메뉴 리스트. 
		case ("/unit.do"): 
			command = new UnitListCommand();
			command.execute(request, response);
			viewPage = "/jsp/productlist/unit.jsp";
			break;
			
			

		// 	[온라인 주문]
		// 	[FAST_SUB-STEP1]
		// 	매장선택.
		case ("/store.do"):
			viewPage = "/jsp/order/view/fast/near/store.jsp";
			break;
		
		// 	[온라인 주문]
		// 	[FAST_SUB-STEP2]
		// 	메뉴 선택. 
		case ("/step2.do"):	 
			command = new MenuListCommand();
			command.execute(request, response);
			viewPage = "/jsp/order/progress/step2.jsp";
			break;
			
		// 	[온라인 주문]
		// 	[FAST_SUB-STEP2] 
		// 	메뉴 상세 페이지. 
		case ("/menuView.do"):	
			command = new MenuDetailCommand();
			command.execute(request, response);
			viewPage = "/jsp/order/progress/view.jsp";
			break;
			
		// 	[온라인 주문]
		// 	[FAST_SUB-STEP2] 
		//	샌드위치 메뉴상세
		case ("/sandwichView.do"):
			command = new SandwichViewCommand();
		command.execute(request, response);
		viewPage = "/jsp/menuView/sandwich.jsp";
		break;
		
		// 	[온라인 주문]
		// 	[FAST_SUB-STEP2] 
		//	샐러드 메뉴상세
		case ("/saladView.do"):	
			command = new SaladViewCommand();
		command.execute(request, response);
		viewPage = "/jsp/menuView/salad.jsp";
		break;
		
		// 	[온라인 주문]
		// 	[FAST_SUB-STEP2] 
		// 	[팝업] 
		//	랩, 기타 메뉴상세
		case ("/unitView.do"):
			command = new UnitViewCommand();
		command.execute(request, response);
		viewPage = "/jsp/menuView/wrap.jsp";
		break;
		
		// 	[온라인 주문]
		// 	[FAST_SUB-STEP2] 
		//	[메뉴상세]
		// 	[팝업] 
		//	알레르기 정보
		case ("/allergy.do"):
			viewPage = "/jsp/ingredientNcountry/allergy.jsp";
		break;
		
		// 	[온라인 주문]
		// 	[FAST_SUB-STEP2] 
		//	[메뉴상세]
		// 	[팝업] 
		// 	원산지 정보
		case ("/origin.do"):
			viewPage = "/jsp/ingredientNcountry/origin.jsp";
		break;

		// 	[온라인 주문]
		// 	[FAST_SUB-STEP2] 
		//	[메뉴상세]
		// 	[팝업] 
		// 	추천 꿀 조함. 
		case ("/combination.do"):	
			viewPage = "/jsp/order/progress/combination/pop.jsp";
			break;
		
		// 	[온라인 주문]
		// 	[FAST_SUB-STEP2] 
		//	[메뉴상세]
		// 	[팝업] 
		// 	빵길이 선택
		case ("/bread_length.do"):	
			viewPage = "/jsp/order/progress/choice/bread_length.jsp";
			break;
			
		// 	[온라인 주문]
		// 	[FAST_SUB-STEP2] 
		//	[메뉴상세]
		// 	[팝업] 
		// 	빵 선택
		case ("/bread.do"):	
			viewPage = "/jsp/order/progress/choice/bread_type.jsp";
			break;
		
		// 	[온라인 주문]
		// 	[FAST_SUB-STEP2] 
		//	[메뉴상세]
		// 	[팝업] 
		// 	토스팅 선택
		case ("/bread_warm.do"):	
			viewPage = "/jsp/order/progress/choice/bread_warm.jsp";
			break;
		
		
		// 	[온라인 주문]
		// 	[FAST_SUB-STEP2] 
		// 	[팝업] 
		//	[메뉴상세]
		// 	치즈 선택
		case ("/cheese.do"):	
			viewPage = "/jsp/order/progress/choice/cheese.jsp";
			break;
		
		// 	[온라인 주문]
		// 	[FAST_SUB-STEP2] 
		// 	[팝업] 
		//	[메뉴상세]
		// 	소스 선택
		case ("/souce.do"):	
			viewPage = "/jsp/order/progress/choice/souce.jsp";
			break;

		// 	[온라인 주문]
		// 	[FAST_SUB-STEP2] 
		// 	[팝업] 
		//	[메뉴상세]
		// 	야채 선택 
		case ("/vegetable.do"):	
			viewPage = "/jsp/order/progress/choice/vegetable.jsp";
			break;
		// 	[온라인 주문]
		// 	[FAST_SUB-STEP3] 
		//	[주문하기]
		case ("/checkout.do"):	
			command = new OrderCommand();
		command.execute(request, response);
		viewPage = "/jsp/order/progress/bill/checkout.jsp";
		break;
		

		// 	[장바구니]	
		case ("/cart.do"):	
			command = new CartCommand();
			command.execute(request, response);
			viewPage = "/jsp/cart/fastsub.jsp";
			break;
		
		
		//	[게시판]
		// 	FAQ
		case ("/faq.do"): 
//			command = new UnitListCommand();
//			command.execute(request, response);
			viewPage = "/jsp/board/faq.jsp";
			break;
			
		//	[게시판]
		// 	1:1 문의
		case ("/qna.do"): 
//			command = new UnitListCommand();
//			command.execute(request, response);
			viewPage = "/jsp/board/qna.jsp";
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
