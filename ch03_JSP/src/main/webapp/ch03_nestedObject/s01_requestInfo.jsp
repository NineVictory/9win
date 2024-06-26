<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클라이언트 및 서버 정보</title>
</head>
<body>
클라이언트 IP = <%= request.getRemoteAddr() %><br>
요청정보 프로토콜 = <%= request.getProtocol() %><br>
요청정보 전송방식 = <%= request.getMethod() %><br>
요청 URL(Uniform Resource Locator) = 
		<%= request.getRequestURL() %><br> <!-- URL : 전체주소 -->
요청 URI(Uniform Resource Identifier) = 
		<%= request.getRequestURI() %><br><!-- URI : 부분주소 , 서블릿에서 Webservlet:/ch_03_JSP/어쩌구 <- 이게 URI를 쓴것 -->
컨텍스트 경로 = <%= request.getContextPath() %><br>
쿼리 문자열 = <%= request.getQueryString() %><br>
서버 이름 = <%= request.getServerName() %> <br>
서버 포트 = <%= request.getServerPort() %>
</body>
</html>