<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP BBS Web site</title>
</head>
<body>
<%	
//	로그인이 이미 된 사람은 회원가입 페이지에 접속하지 못하도록 설정.
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 되어있습니다. ')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}
	// 윗 부분까지 
	
	if(user.getUserID()==null|| user.getUserPassword() ==null|| user.getUserName()== null 
		|| user.getUserGender() == null || user.getUserEmail()==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다. ')"); /* 이전 페이지로 사용자를 돌려보냄  */
		script.println("history.back()");
		script.println("</script>");
	} else{
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다. ')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href ='main.jsp'");
			script.println("</script>");
		}
	}
%>
	
</body>
</html>