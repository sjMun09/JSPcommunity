<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP BBS Web site</title>
</head>
<body>
<%
	// 로그인이 되었다면, 출입하지 못하게 막아주게 처리함. (자신에게 할당된 세션을 받을 수 있게함.)
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
	// 위 코드까지 
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(user.getUserID(), user.getUserPassword());
	if(result ==1){
		/*  로그인에 성공 했을 때 */
		session.setAttribute("userID", user.getUserID());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href ='main.jsp'");
		script.println("</script>");
	}
	else if(result == 0){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('비밀번호가 틀립니다. ')"); /* 이전 페이지로 사용자를 돌려보냄  */
	script.println("history.back()");
	script.println("</script>");
	}
	else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.  ')"); /* 이전 페이지로 사용자를 돌려보냄  */
		script.println("history.back()");
		script.println("</script>");
	}
	else if(result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('DB에 오류가 발생했습니다. ')"); /* 이전 페이지로 사용자를 돌려보냄  */
		script.println("history.back()");
		script.println("</script>");
	}
%>
	
</body>
</html>