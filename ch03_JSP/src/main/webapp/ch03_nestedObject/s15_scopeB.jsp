<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 4개 기본객체와 영역</title>
</head>
<body>
page 영역의 msg1 = <%= pageContext.getAttribute("msg1") %><br>
request 영역의 msg2 = <%= request.getAttribute("msg2") %><br>
<!-- session은 클라이언트를 식별하기위해 사용,클라이언트가 같으면 세션을 공유한다. 그치만 다른 클라이언트가 들어오면 서버는 새로운 세션을 만듬-->
<!-- 모든 브라우저를 종료한뒤 이 파일만 다시 처음부터 실행하면 세션도 null이 나옴 why? 서버가 새로운 클라이언트로 인식하기 때문에 -->
session 영역의 msg3 = <%= session.getAttribute("msg3") %><br> 

</body>
</html>