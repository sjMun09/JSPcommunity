<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>

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
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int bbsID = 0;
	if(request.getParameter("bbsID")!= null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if(bbsID ==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다. ')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
	%>

	<!-- 하나의 웹 사이트의 전반적인 구조를 나타내는 nav  -->
	<nav class="navbar navbar-default">
		<!-- 헤더 생 -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<!--  우측 상단에 뜨는아이콘 바 구현 -->
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP Web BBS Site</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<!--  메인 페이지이기 때문에, 클래스 액티브 달아줌  -->
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">게시판 </a></li>
			</ul>
			<!-- 접속하기   -->
			<%
			if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdowwn-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기 <span class="caret"></span></a> <!--  바 누르면 여러 항목 보이게  -->
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
	<!--  게시판 화면 넣어주기  -->
	<div class="container">
		<div class=row">			
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%;">글 제목</td>
							<!-- 특수문자를 처리해줌으로써 script의 악성코드를 방지함. (웹 보안) -->
							<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>							
						</tr>
						<tr>
							<td>작성자</td>
							<td colspan="2"><%= bbs.getUserID() %></td>							
						</tr>
						<tr>
							<td>작성일자</td>
							<td colspan="2"> <%=bbs.getBbsDate().substring(0,10) %> <%=bbs.getBbsDate().substring(11,13) %>시 <%=bbs.getBbsDate().substring(14,16) %>분</td>							
						</tr>
						<tr>
							<td>내용</td>
							<!-- 특수문자 처리   -->
							<td colspan="2" style="min-height:200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>	
						</tr>
					</tbody>					
				</table>
				<!-- 목록으로 돌아갈 수 있게 -->
				<a href="bbs.jsp" class ="btn btn-primary">목</a>
				<!-- 글 수정  -->
				<%
					if(userID != null && userID.equals(bbs.getUserID())){
				%>
						<!-- 본인이라면,  -->
						<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>
						<a href="deleteAction.jsp?bbsID=<%= bbsID %> %>" class="btn btn-primary">삭제</a>
					
				<%
					}
				%>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
		</div>
	</div>
	<!-- 게시글 홀짝 색 구분  -->
	<!--  애니메이션 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩에서 제공하는 js 파일  -->
	<script src="js/bootstrap.js"></script>

</body>
</html>
