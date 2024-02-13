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
		String bmid = null;
		if(session.getAttribute("id") != null){
			bmid =(String)session.getAttribute("id");
		}
		if(bmid == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login_view.do'");
		script.println("</script>");
		} 
		int bseq = 0;
		if(request.getParameter("bseq")!= null){
			bseq = Integer.parseInt(request.getParameter("bseq"));
		}
		if (bseq == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'board.do'");
			script.println("</script>");
		}
		BoardDTO bbs = new BoardDAO().getBbs(bseq);
		if(!bmid.equals(bbs.getBmid())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'board.do'");
			script.println("</script>");
		} else{
			if (request.getParameter("btitle") == null || request.getParameter("bcontent") == null ||request.getParameter("btitle").equals("") || request.getParameter("bcontent").equals("")){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				BoardDAO bbsDAO = new BoardDAO();
				int result = bbsDAO.update(bseq, request.getParameter("btitle"), request.getParameter("bcontent"));
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