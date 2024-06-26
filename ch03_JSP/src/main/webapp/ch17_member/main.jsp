<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 메인</title>
<!-- href="/ch03_JSP/css/style.css" ==> 컨텍스트 경로 -->
<!-- <link rel="stylesheet" href="/ch03_JSP/css/style.css" type="text/css"> -->
 <!-- request.getContextPath() 를 명시해주면 주소의 이름이 바뀌더라도 문제가 없음 -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" type="text/css">
</head>
<body>
<%
	String user_id = (String)session.getAttribute("user_id");
%>
<div class="page-main">
	<h1>회원관리 메인</h1>
	<div class = "align-right">
	<%
		if(user_id == null){//로그인이 되지 않은 경우
	%>
		<a href="registerUserForm.jsp">회원가입</a>
		<a href="loginForm.jsp">로그인</a>
	<%
		}else{//로그인이 된 경우
	%>
		<a href="myPage.jsp">MyPage</a>
		[<b><%= user_id %></b>님 로그인 중]
		<a href="logout.jsp">로그아웃</a>
	<%
		}
	%>
	</div>
</div>
</body>
</html>