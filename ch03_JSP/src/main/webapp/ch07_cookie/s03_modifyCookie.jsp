<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 값 변경</title>
</head>
<body>
<%
	//클라이언트로부터 전송된 쿠키정보를 반환
	Cookie[] cookies = request.getCookies();
	if(cookies!=null && cookies.length>0){
		for(int i=0;i<cookies.length;i++){
			if(cookies[i].getName().equals("name")){ //문자열 비교할 때는 .equals()를 써야된다. 비교연산자는안됨
				//검색하는 쿠키의 쿠키명과 동일한 이름의 쿠키 생성
				Cookie cookie = new Cookie("name",
						URLEncoder.encode("JSP프로그래밍","UTF-8"));
				//생성된 쿠키를 클라이언트에 전송
				response.addCookie(cookie);
				
				out.println("name 쿠키의 값을 변경합니다.");
			}
		}
	}else{
		out.println("쿠키가 존재하지 않습니다.");
	}
		
%>
</body>
</html>