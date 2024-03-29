<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.javalec.dao.BoardDAO" %>  
<%@ page import="com.javalec.dto.BoardDTO" %> 
 <%@ page import="java.io.PrintWriter" %> 
 <% request.setCharacterEncoding("UTF-8");%>
 <jsp:useBean id="BoardDTO" class="com.javalec.dto.BoardDTO" scope="page"/>
 <jsp:setProperty name="BoardDTO" property="boTitle"/>
 <jsp:setProperty name="BoardDTO" property="boContent"/> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="jsp/board/css/bootstrap.css">
<link rel="stylesheet" href="jsp/board/css/custom.css">
<title>사용자 게시판</title>
</head>
<body>
	<%	
		String bmID = null;
		if(session.getAttribute("userId") != null){
			bmID =(String)session.getAttribute("userId");
		}
		if(bmID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login_view.do'");
		script.println("</script>");
		} else{
			if (BoardDTO.getBoTitle() == null || BoardDTO.getBoContent() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				BoardDAO boardDAO = new BoardDAO();
				int result = boardDAO.write(BoardDTO.getBoTitle(), bmID, BoardDTO.getBoContent());
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