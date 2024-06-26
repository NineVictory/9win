<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//POST방식으로 전송시 전송된 데이터의 인코딩 타입 지정
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 파라미터 출력</title>
</head>
<body>
<h3>request.getParameter() 메서드 사용</h3>
name 파라미터 = <%= request.getParameter("name") %><br>
address 파라미터 = <%= request.getParameter("address") %><br>

<h3>request.getParameterValues 메서드 사용</h3>
<%
	String[] values = request.getParameterValues("pet");
	if(values != null) { //체크박스를 체크 하지않으면 values가 null값이기 때문에 null값이 아닐 때만 돌려줌 
		for(int i=0;i<values.length;i++){
%>
	<%= values[i] %>
<% 			
		}
	}
%>
</body>
</html>