<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %> <!-- 게시판 목록을 출력하기 위해.  -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">

<title>JSP BBS Web site</title>
<style type="text/css">
	a, a:hover{
		color : #000000;
		text-decoration: none;
	}
</style>
</head>
<body>
	<!--  로그인 된 사람  -->
	<%
		String userID = null;
	if(session.getAttribute("userID")!= null){
		userID = (String)session.getAttribute("userID");
	}
	/* 현재 게시판이 몇 번째 페이지인지 알려줌 */
	int pageNumber =1; // 1은 기본페이지
	if (request.getParameter("pageNumber")!=null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
		 		<li><a href="main.jsp">메인</a></li>
		 		<li class="active"><a href="bbs.jsp">게시판</a> <!-- ======= li  -->
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
				</li>
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
		<div class="row">
			<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align:center;">번호</th>
						<th style="background-color: #eeeeee; text-align:center;">제목</th>
						<th style="background-color: #eeeeee; text-align:center;">작성자</th>
						<th style="background-color: #eeeeee; text-align:center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<!-- 게시글 목록 출력   -->
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for(int i=0; i< list.size();i++){
					%>
					
					<tr>
						<!-- 현재 게시글의 정보를 데이터베이스에서 불러와서 가져옴  -->
						<td><%= list.get(i).getBbsID() %></td>
						<!--제목을 눌렀을 때는 그 해당 게시글의 내용을 보여주는 페이지로 이동하게끔 하기위해  -->
						<!-- view.jsp 페이지로 ㅎ ㅐ당 게시글 번호를 매게 변수로 보냄으로써 처리할 수 있도록 함  -->												
						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<%-- <td><%= list.get(i).getBbsDate().substring(0,10) %> <%=list.get(i).getBbsDate().substring(11,13) %>시 <%=list.get(i).getBbsDate().substring(14,16) %>분</td> --%>
						<td><%= list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13) + "시 " + list.get(i).getBbsDate().substring(14,16) + "분 " %> </td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<!--  페이지를 보여주는 부분  -->
			<%
				if(pageNumber != 1){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber-1 %>" class="btn btn-success btn-arraw-left">이전</a>
			<%
				/* 만약 다음 페이지가 존재한다면, */
				} if(bbsDAO.nextPage(pageNumber +1)){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber+1 %>" class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
			%>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	<!-- 게시글 홀짝 색 구분  -->
	<!--  애니메이션 -->
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩에서 제공하는 js 파일  -->
	<script src="js/bootstrap.js"></script>
	
</body>
</html>