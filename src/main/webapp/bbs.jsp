<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %> <!-- 게시판 목록 출  -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- 참조  -->
<title>JSP BBS web site</title>
<style type = "text/css">
    a, a:hover
    {
        color: #000000;
        text-decoration: none;
    }
</style>
</head>
<body>
<!--  로그인 된 사람  -->
<%
    String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("userID") != null)
    {
        userID = (String)session.getAttribute("userID");
    }
    int pageNumber = 1; // 기본페이지 기본적으로 페이지 1부터 시작하므로
    if (request.getParameter("pageNumber") != null)
    {
        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    }
%>
<!-- 하나의 웹 사이트의 전반적인 구조를 나타내는 nav  -->
    <nav class ="navbar navbar-default">
        <div class="navbar-header"> <!-- 홈페이지의 로고 -->
            <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expand="false">
                <!--  우측 상단에 뜨는아이콘 바 구현 -->
                <span class ="icon-bar"></span> <!-- 줄였을때 옆에 짝대기 -->
                <span class ="icon-bar"></span>
                <span class ="icon-bar"></span>
            </button>
            <a class ="navbar-brand" href="main.jsp">JSP BBS web site</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
            <!--  메인 페이지이기 때문에, 클래스 액티브 달아줌  -->
                <li><a href="main.jsp">Main</a></li>
                <li class="active"><a href="bbs.jsp">Community</a></li>
            </ul>
            <!-- 접속하기   -->
            <%           
            // 접속하기는 로그인이 되어있지 않은 경우만 나오게한다 
                if(userID == null)
                {
            %>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                <a href="#" class = "dropdown-toggle"
                    data-toggle="dropdown" role ="button" aria-haspopup="true"
                    aria-expanded="false">Join<span class="caret"></span></a> <!--  바 누르면 여러 항목 보이게  -->
                    <!--  바 누르면 여러 항목 보이게  -->
                    <ul class="dropdown-menu">
                        <li><a href="login.jsp">Log in</a></li>
                        <li><a href="join.jsp">Sign up Membership</a></li>                    
                    </ul>
                </li>
            </ul>
            <%
            // 로그인이 되어있는 사람만 볼수 있는 화면
                } else {
            %>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                <a href="#" class = "dropdown-toggle"
                    data-toggle="dropdown" role ="button" aria-haspopup="true"
                    aria-expanded="false">Membership Management<span class="caret"></span></a> <!--  바 누르면 여러 항목 보이게  -->
                    <ul class="dropdown-menu">
                        <li><a href="loginAction.jsp">Log out</a></li>
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
            <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
                <thead>
                    <tr >                   
                        <th style="background-color:#eeeeee; text-align:center; border: 1px solid #dddddd;border-collapse: collapse;">번호</th>
                        <th style="background-color:#eeeeee; text-align:center; border: 1px solid #dddddd;border-collapse: collapse;">제목</th>
                        <th style="background-color:#eeeeee; text-align:center; border: 1px solid #dddddd;border-collapse: collapse;">작성자</th>
                        <th style="background-color:#eeeeee; text-align:center; border: 1px solid #dddddd;border-collapse: collapse;">작성일</th>
                    </tr>
                </thead>
                <tbody>
                <!-- 게시글 목록 출력   -->
                <%
                    BbsDAO bbsDAO = new BbsDAO();
                    ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
                    for(int i = 0; i < list.size(); i++)
                    {
                %>
                
                    <tr>
                    <!-- 현재 게시글의 정보를 데이터베이스에서 불러와서 가져옴  -->
                        <td style="border: 1px solid #dddddd;border-collapse: collapse;"><%=list.get(i).getBbsID() %></td> <!-- 특수문자를 제대로 출력하기위해 & 악성스크립트를 방지하기위해 -->
                         <!--제목을 눌렀을 때는 그 해당 게시글의 내용을 보여주는 페이지로 이동하게끔 하기위해  -->
						<!-- view.jsp 페이지로 ㅎ ㅐ당 게시글 번호를 매게 변수로 보냄으로써 처리할 수 있도록 함  -->
						<!--  replace()를 사용해서 특수문자(공백) 등 처리해줌. -->
                        <td style="border: 1px solid #dddddd;border-collapse: collapse;"><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></a></td>
                        <td style="border: 1px solid #dddddd;border-collapse: collapse;"><%=list.get(i).getUserID() %></td>
                        <td style="border: 1px solid #dddddd;border-collapse: collapse;"><%=list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14,16) + "분" %></td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <!--  페이지를 보여주는 부분  -->
            <%
                if(pageNumber != 1) {
            %>
                <a href="bbs.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arrow-left">Previous</a>
            <%
                } if (bbsDAO.nextPage(pageNumber + 1)) {
            %>
                <a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arrow-left" > Next</a>
            
            <%
                }
            %>
            <a href="write.jsp" class="btn btn-primary pull-right">Write a Post</a>
        </div>
    </div>
    <!-- 게시글 홀짝 색 구분  -->
	<!--  애니메이션 -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!-- 부트스트랩에서 제공하는 js 파일  --> 
    <script src="js/bootstrap.js"></script>
</body>
</html>