	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더 목록 출력</title>
</head>
<body>
<%
	Enumeration headerEnum = request.getHeaderNames();
	while(headerEnum.hasMoreElements()){/* name이 있는지없는지 체크해주는 함수 */
		String headerName = (String)headerEnum.nextElement();
		String headerValue = request.getHeader(headerName);
		out.println(headerName+ " = " +headerValue+"<br>");
	}
%>
</body>
</html>