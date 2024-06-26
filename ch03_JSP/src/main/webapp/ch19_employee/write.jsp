<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO" %>
<%
Integer user_num = (Integer)session.getAttribute("user_num");
	if(user_num==null){//로그인이 되지 않은 경우
		response.sendRedirect("loginForm.jsp");
	}else{
	//전송된 데이터 인코딩 처리
	request.setCharacterEncoding("utf-8");
%>   
<jsp:useBean id="story" class="kr.story.vo.StoryVO"/>
<jsp:setProperty property="*" name="story"/>
<%
	//작성자
	story.setNum(user_num);
	//클라이언트의 ip 주소 저장
	story.setIp(request.getRemoteAddr());

	StoryDAO dao = StoryDAO.getInstance();
	dao.insert(story);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 완료</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" type="text/css">
</head>
<body>
<div class="page-main">
	<h1>글쓰기 완료</h1>
	<div class="result-display">
	    <div class="align-center">
		게시판에 글을 등록했습니다. <br>
		<a href="list.jsp">목록</a>
		</div>
	</div>
</div>
</body>
</html>
<%
	}
%>









