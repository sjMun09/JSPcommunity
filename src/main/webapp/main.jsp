<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="widht=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP BBS Web site</title>
</head>
<body>
	<!--  로그인 된 사람  -->
	<%
		String userID = null;
	if(session.getAttribute("userID")!= null){
		userID = (String) session.getAttribute("userID");
	}
	%>

	<!-- 하나의 웹 사이트의 전반적인 구조를 나타내는 nav  -->
	<nav class="navbar navbar-default">
	<!-- 헤더 생 -->
		<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
			<!--  우측 상단에 뜨는아이콘 바 구현 -->
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>			
		</button>
		<a class="navbar-brand" href="main.jsp">JSP Web BBS Site</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		 	<ul class="nav navbar-nav">
		 		<!--  메인 페이지이기 때문에, 클래스 액티브 달아줌  -->
		 		<li class="active"><a href="main.jsp">메인</a></li>
		 		<li><a href="bbs.jsp">게시판 </a></li>
			</ul>
			<!-- 접속하기   -->
			<%
				if(userID == null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdowwn-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기 <span class="caret"></span></a>
						<!--  바 누르면 여러 항목 보이게  -->
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
			</ul>
			<%
				} else {
			%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdowwn-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리 <span class="caret"></span></a> <!--  바 누르면 여러 항목 보이게  -->
						<ul class="dropdown-menu">
							<li><a href="logoutAction.jsp">로그아웃</a></li>
						</ul>
					</li>
				</ul>
			<%
				}
			%>
		</div>		
	</nav>	
	<!--  애니메이션 -->
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩에서 제공하는 js 파일  -->
	<script src="js/bootstrap.js"></script>
	
</body>
</html>