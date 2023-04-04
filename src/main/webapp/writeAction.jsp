<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!-- id 등 bbs로 수정.  -->
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
<jsp:setProperty name="bbs" property="bbsTitle"/>
<jsp:setProperty name="bbs" property="bbsContent"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP BBS Web site</title>
</head>
<body>
<%	
//	글쓰기 같은 경우, 로그인이 되어 있어야지 할 수 있음.

	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 하세요. ')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	} else {
		if(bbs.getBbsTitle()==null|| bbs.getBbsContent() == null ){ 
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다. ')"); /* 이전 페이지로 사용자를 돌려보냄  */
				script.println("history.back()");
				script.println("</script>");
			} else{
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());	
				//db 오류 
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')"); // db 오류 
					script.println("history.back()");
					script.println("</script>");
				}
				// 성공한 경우 
				else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href ='bbs.jsp'");
					script.println("</script>");
				}
	}
}	
%>
	
</body>
</html>