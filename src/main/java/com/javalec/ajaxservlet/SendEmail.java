package com.javalec.ajaxservlet;

import java.io.IOException;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class SendEmail
 */
@WebServlet("/SendEmail")
public class SendEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SendEmail() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		String email = request.getParameter("email");

		// mail server 설정
		String smtpEmail = "imoiksr@gmail.com";
		String password = "lcymjqthiqybhyuy";

		// 메일 받을 주소
		String to_email = email;

		// SMTP 서버 정보를 설정한다.
		/* Properties p = new Properties(); */
		Properties p = System.getProperties();
		p.setProperty("mail.transport.protocol", "smtp");
		/* p.setProperty("mail.host", "smtp.gmail.com"); */
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "587");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.ssl.protocols", "TLSv1.2");
		p.put("mail.smtp.socketFactory.port", "587");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

		// 인증 번호 생성기
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 4; i++) {
			temp.append(rnd.nextInt(10)); // 0부터 9까지의 숫자 중 하나를 랜덤하게 선택하여 추가
		}
		String authenticationKey = temp.toString();
		System.out.println("인증 번호: " + authenticationKey);
		
		//session
		HttpSession code = request.getSession();
		code.setAttribute("CODE", authenticationKey);

		Session session = Session.getDefaultInstance(p, new javax.mail.Authenticator() {
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(smtpEmail, password);
			}
		});

		// email 전송
		try {

			MimeMessage msg = new MimeMessage(session);

			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

			System.out.println(msg);
			// 메일 제목
			msg.setSubject("Subway 회원가입 인증번호 입니다.");
			// 메일 내용
			msg.setText("인증 번호는 [" + temp + "] 입니다");

			Transport t = session.getTransport("smtp");
			t.connect(smtpEmail, password);
			t.sendMessage(msg, msg.getAllRecipients());
			t.close();
			
			System.out.println("이메일 전송");

		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
