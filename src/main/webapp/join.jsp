<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- 참조  -->
<title>JSP BBS web site</title>
</head>
<body>
<!-- 하나의 웹 사이트의 전반적인 구조를 나타내는 nav  -->
    <nav class ="navbar navbar-default">
    <!-- 헤더 생 -->
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
                <li><a href="main.jsp">Main</a></li>
                <li><a href="bbs.jsp">Community</a></li>
            </ul>
            
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                <a href="#" class = "dropdown-toggle"
                    data-toggle="dropdown" role ="button" aria-haspopup="true"
                    aria-expanded="false">Join<span class="caret"></span></a>
                    <!--  바 누르면 여러 항목 보이게  -->
                    <ul class="dropdown-menu">
                        <li><a href="login.jsp">Log in</a></li>
                        <li class="active"><a href="join.jsp">Sign up Membership</a></li>                    
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <!-- 로그인 양식  -->
    <div class="container">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <div class ="jumbotron" style="padding-top:20px;">
                <form method = "post" action="joinAction.jsp">
                    <h3 style="text-align:center;">Membership Page</h3>
                    <div class ="form-group">
                        <input type ="text" class="form-control" placeholder="ID" name ="userID" maxlength='20'>
                    </div>
                    <div class ="form-group">
                        <input type ="password" class="form-control" placeholder="PW" name ="userPassword" maxlength='20'>
                    </div>
                    <div class ="form-group">
                        <input type ="text" class="form-control" placeholder="NAME" name ="userName" maxlength='20'>
                    </div>
                    <div class ="form-group" style="text-align: center;">
                        <div class="btn-group" data-toggle="buttons">
                            <label class="btn btn-primary active">
                                <input type="radio" name="userGender" autocomplete="off" value="남자" checked>Male
                            </label>
                            <label class="btn btn-primary">
                                <input type="radio" name="userGender" autocomplete="off" value="여자" checked>Female
                            </label>
                            </div>    
                    </div>
                    <div class ="form-group">
                        <input type ="email" class="form-control" placeholder="Email" name ="userEmail" maxlength='20'>
                    </div>                   
                    <input type="submit" class="btn btn-primary form-control" value="Sign up Membership">  <!-- 버튼 명칭임.  -->
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