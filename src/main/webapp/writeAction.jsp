<!-- 실제로 글쓰기를 눌러서 만들어주는 Action페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트 문장사용 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 파일을 UTF-8로 -->
<!-- id 등 BBS로  -->
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP게시판 웹사이트</title>
</head>
<body>
    <%
	//	글쓰기 같은 경우, 로그인이 되어 있어야지 할 수 있음.
        String userID = null;
        // 로그인 된 사람은 회원가입페이지에 들어갈수 없다
        if(session.getAttribute("userID") != null )
        {
            userID = (String) session.getAttribute("userID");
        }
        if(userID == null)    // 이렇게 수정해야 로그인했는데 또 로그인 하라고 안뜸.
        {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인을 하세요')");
            script.println("location.href = 'login.jsp'");
            script.println("</script>");
        } else {
        if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안된 사항이 있습니다.')"); /* 이전 페이지로 사용자를 돌려보냄  */
            script.println("history.back()");
            script.println("</script>");
        } else {
        	// 그게 아니라면 db로 넘겨
            BbsDAO bbsDAO = new BbsDAO();
            int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
          		//db 오류 
                if(result == -1){ // 글쓰기에 실패했을 경우
                    PrintWriter script = response.getWriter(); //하나의 스크립트 문장을 넣을 수 있도록.
                    script.println("<script>");
                    script.println("alert('글쓰기에 실패했습니다.')"); //db 오류 
                    script.println("history.back()");
                    script.println("</script>");
                }
                else { // 글쓰기에 성공했을 경우 , 메인화면으로 이동 
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("location.href= 'bbs.jsp'");
                    script.println("</script>");
                    }
            }
        }
    %>
</body>
</html> 
