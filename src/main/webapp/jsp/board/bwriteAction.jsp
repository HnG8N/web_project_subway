<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.javalec.dao.BoardDAO" %>  
<%@ page import="com.javalec.dto.BoardDTO" %> 
 <%@ page import="java.io.PrintWriter" %> 
 <% request.setCharacterEncoding("UTF-8");%>
 <jsp:useBean id="BoardDTO" class="com.javalec.dto.BoardDTO" scope="page"/>
 <jsp:setProperty name="BoardDTO" property="btitle"/>
 <jsp:setProperty name="BoardDTO" property="bcontent"/> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>사용자 게시판</title>
</head>
<body>
	<%	
		String id = null;
		if(session.getAttribute("id") != null){
			id =(String)session.getAttribute("id");
		}
		if(id == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login_view.do'");
		script.println("</script>");
		} else{
			if (BoardDTO.getBtitle() == null || BoardDTO.getBcontent() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				BoardDAO bbsDAO = new BoardDAO();
				int result = bbsDAO.write(id, BoardDTO.getBtitle(), BoardDTO.getBcontent());
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else {				
					PrintWriter script = response.getWriter();
					script.println("<script>");				
					script.println("location.href = 'board.do'");
					script.println("</script>");
				}			
			}			
		}
		
	%>

</body>
</html>