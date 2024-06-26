<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    //post방식
    request.setCharacterEncoding("utf-8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

 이름: <%= request.getParameter("name") %><br>
 아이디: <%= request.getParameter("id") %><br>
 비밀번호: <%= request.getParameter("password") %><br>
 전화번호: <%= request.getParameter("phone") %><br>
 자기소개: <%= request.getParameter("content") %><br>
 
<%
	String[] hobbies = request.getParameterValues("hobby");
	if(hobbies != null) { //체크박스를 체크 하지않으면 values가 null값이기 때문에 null값이 아닐 때만 돌려줌 
		
%>
취미:
<% 			
		for(int i=0;i<hobbies.length;i++){
			if(i>0) out.print(",");
%>
			<%= hobbies[i] %>
<%
		}
		out.println("<br>");
	}
%>
 
</body>
</html>