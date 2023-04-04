<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="widht=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP BBS Web site</title>
</head>
<body>
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
		 		<li><a href="main.jsp">메인</a></li>
		 		<li><a href="bbs.jsp">게시판 </a></li>
			</ul>
			<!--  우측 정렬  -->
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdowwn-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기 <span class="caret"></span></a>
						<!--  바 누르면 여러 항목 보이게  -->
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
			</ul>			
		</div>		
	</nav>
	<!-- 로그인 양식  -->
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align: center">로그인 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="ID" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="PW" name="userPassword" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="로그인"> <!-- 로그인 벨류 고쳐줌 L에서 l -->
				</form>
			</div>
	</div>
		<div class="col-lg-4"></div>
	</div>
	<!--  애니메이션 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩에서 제공하는 js 파일  -->
	<script src="js/bootstrap.js"></script>
	
</body>
</html>