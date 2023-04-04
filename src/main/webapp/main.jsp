<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="widht=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">

<link rel="stylesheet" href="css/index.css">
<title>JSP BBS web site</title>

<!--  스타일 추가  -->
<style>
body {
        font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI',
          Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue',
          sans-serif;
      }

      .container {
        width: 50%;
      }

      .carousel-inner {
        position: relative;
      }

      .content {
        height: 100%;
        position: absolute;
        display: flex;
        flex-direction: column;
        justify-content: space-evenly;
        padding: 30px 100px;
        color: #fff;
        background: none;
      }

      .content .title {
        text-align: center;
        font-family: 'Courier New', Courier, monospace;
        font-weight: 600;
      }

      .content .description {
        line-height: 2.2rem;
      }

      .item {
        width: 100%;
        height: auto;
        z-index: -1;
      }

      .item > img {
        width: auto;
        height: auto;
        object-fit: cover;
        object-position: center;
      }
</style>
</head>
<body>
	<!--  로그인 된 사람  -->
    <% String userID = null; if(session.getAttribute("userID")!= null){ userID =
    (String) session.getAttribute("userID"); } %>

    <!-- 하나의 웹 사이트의 전반적인 구조를 나타내는 nav  -->
    <nav class="navbar navbar-default">
      <!-- 헤더 생 -->
      <div class="navbar-header">
        <button
          type="button"
          class="navbar-toggle collapsed"
          data-toggle="collapse"
          data-target="#bs-example-navbar-collapse-1"
          aria-expanded="false"
        >
          <!--  우측 상단에 뜨는아이콘 바 구현 -->
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="main.jsp">JSP BBS web site</a>
      </div>
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <!--  메인 페이지이기 때문에, 클래스 액티브 달아줌  -->
          <li class="active"><a href="main.jsp">Main</a></li>
          <li><a href="bbs.jsp">Community </a></li>
        </ul>
        <!-- 접속하기   -->
        <% if(userID == null){ %>
        <ul class="nav navbar-nav navbar-right">
          <li class="dropdown">
            <a
              href="#"
              class="dropdowwn-toggle"
              data-toggle="dropdown"
              role="button"
              aria-haspopup="true"
              aria-expanded="false"
              >Join<span class="caret"></span
            ></a>
            <!--  바 누르면 여러 항목 보이게  -->
            <ul class="dropdown-menu">
              <li><a href="login.jsp">Log in</a></li>
              <li><a href="join.jsp">Sign up Membership</a></li>
            </ul>
          </li>
        </ul>

        <% } else { %>
        <ul class="nav navbar-nav navbar-right">
          <li class="dropdown">
            <a
              href="#"
              class="dropdowwn-toggle"
              data-toggle="dropdown"
              role="button"
              aria-haspopup="true"
              aria-expanded="false"
              >Membership management<span class="caret"></span
            ></a>
            <!--  바 누르면 여러 항목 보이게  -->
            <ul class="dropdown-menu">
              <li><a href="logoutAction.jsp">Log out</a></li>
            </ul>
          </li>
        </ul>
        <% } %>
      </div>
    </nav>

    <!--  배경화면 삽입  -->
    <div class="container">
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol> -->
        <div class="carousel-inner">
          <div class="content">
            <h2 class="title">JSP BBS web site</h2>
            <br />
            <p class="description">
              해당 웹 사이트는 만든 JSP 웹 사이트이며, 최소한의 로직만을
              이용해서 게시판을 개발했습니다. 그전에, 요즘은 SPRING이 많이
              쓰이는 추세이며, 그 이유는 크게 3가지 이유에 대해 알고 가겠습니다.<br>
              1. Spring은 JSP보다 더 유연하고 모듈화가 잘되어 있어서 더 큰
              규모의 애플리케이션을 개발하기에 적합합니다.<br> 
              2. Spring은 JSP와는 달리 의존성 주입(Dependency Injection)을 기반으로 하여 객체 간의
              결합도를 낮출 수 있습니다.<br> 
              3. Spring은 AOP(Aspect-Oriented
              Programming)를 지원하여 횡단 관심사(Cross-cutting Concerns)를
              처리하기 용이하며, 테스트와 유지보수가 편리합니다.<br>
              &lt;JSP 공부한 이유 &gt; <br>
              JSP를 공부하면 웹 애플리케이션의 생명주기, 요청-응답 모델, 서블릿, JSTL 등의 개념을 이해하는데 도움이 되기 때문에 공부 및 토이 프로젝트를 진행하게 되었습니다.
            </p>
            <h3 align="center">sjMun09, ToyProject</h3>
            <p align="center">
              <a
                class="btn btn-primary btn-pull"
                href="https://github.com/sjMun09"
                role="button"
                >Go to GitHub</a
              >
            </p>
          </div>
          <div class="item active">
            <img src="images/4.jpeg" />
          </div>
          <div class="item">
            <img src="images/5.jpeg" />
          </div>
          <div class="item">
            <img src="images/6.jpeg" />
          </div>
        </div>
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
      </div>
    </div>
    <!—  애니메이션 —>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!— 부트스트랩에서 제공하는 js 파일  —>
    <script src="js/bootstrap.js"></script>
</body>
</html>