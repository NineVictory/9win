<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.dao.EmployeeDAO" %>
<%@ page import="kr.employee.vo.EmployeeVO" %>
<%
Integer user_num = (Integer)session.getAttribute("user_num");
	if(user_num==null){//로그인이 되지 않은 경우
		response.sendRedirect("loginForm.jsp");
	}else{
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원상세정보</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
</head>
<body>
<%
EmployeeDAO dao = EmployeeDAO.getInstance();
	EmployeeVO member = dao.getEmployee(user_num);
%>
<div class="page-main">
	<h1>사원정보</h1>
	<ul>
		<li>아이디 : <%= member.getId() %></li>
		<li>이름 : <%= member.getName() %></li>
		<li>급여 : <%= member.getSalary() %></li>
		<li>업무 : <%= member.getJob() %></li>
		<li>입사일 : <%= member.getReg_date() %></li>
	</ul>
	<hr size="1" width="100%" noshade="noshade">
	<div class="align-right">
		<input type="button" value="사원정보수정" onclick="location.href='modifyUserForm.jsp'">
		<input type="button" value="퇴사" onclick="location.href='deleteUserForm.jsp'">
		<input type="button" value="홈으로" onclick="location.href='main.jsp'">
	</div>
</div>
</body>
</html>
<%
	}
%>










