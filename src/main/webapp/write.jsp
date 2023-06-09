<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- 참조  -->
<title>JSP BBS web site </title>
</head>
<body>
<!--  로그인 된 사람  -->
<%
    String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("userID") != null)
    {
        userID = (String)session.getAttribute("userID");
    }
%>

<!-- 하나의 웹 사이트의 전반적인 구조를 나타내는 nav  -->
    <nav class ="navbar navbar-default">
    <!-- 헤더 생성  -->
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
    <!-- 게시판 글쓰기 양식 UI -->
    <!--  게시판 화면에  넣어주기  -->
    <div class="container">
        <div class="row">
        <form method="post" action="writeAction.jsp">
            <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
                <thead>
                    <tr>
                        <th colspan="2" style="background-color:#eeeeee; text-align:center;">Post Form</th>
 
                    </tr>
                </thead>
                <tbody>
                    <tr>
                    <td><input type="text" class="form-control" placeholder="Post title"  name="bbsTitle" maxlength="50" ></td>
                    </tr>
                    <tr>
                    <td><textarea class="form-control" placeholder="Post content"  name="bbsContent" maxlength="2048" style="height:350px" ></textarea></td>
                    </tr>
                </tbody>
            </table>
                <input type="submit"  class="btn btn-primary pull-right" value="Write a post">
            </form>
        </div>
    </div>
    <!-- 게시글 홀짝 색 구분  -->
	<!--  애니메이션 -->   
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!-- 부트스트랩에서 제공하는 js 파일  -->
    <script src="js/bootstrap.js"></script>
</body>
</html>
