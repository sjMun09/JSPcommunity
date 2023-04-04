<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP BBS Web site</title>
</head>
<body>

	<%
	// 세션을 바로 빼앗기게해서 로그아웃 하게
	session.invalidate();
	%>
	<script>
		location.href ='main.jsp';
	</script>
</body>
</html>