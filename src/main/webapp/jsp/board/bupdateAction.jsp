<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.javalec.dao.BoardDAO" %>  
<%@ page import="com.javalec.dto.BoardDTO" %>   
 <%@ page import="java.io.PrintWriter" %> 
 <% request.setCharacterEncoding("UTF-8");%>
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
		String userId = null;
		if(session.getAttribute("userId") != null){
			userId =(String)session.getAttribute("userId");
		}
		if(userId == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login_view.do'");
		script.println("</script>");
		} 
		int boardID = 0;
		if(request.getParameter("boardID")!= null){
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		if (boardID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'board.do'");
			script.println("</script>");
		}
		BoardDTO boardDTO = new BoardDAO().getBbs(boardID);
		if(!userId.equals(boardDTO.getBmID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'board.do'");
			script.println("</script>");
		} else{
			if (request.getParameter("boTitle") == null || request.getParameter("boContent") == null ||request.getParameter("boTitle").equals("") || request.getParameter("boContent").equals("")){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				BoardDAO boardDAO = new BoardDAO();
				int result = boardDAO.update(boardID, request.getParameter("boTitle"), request.getParameter("boContent"));
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정에 실패했습니다.')");
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