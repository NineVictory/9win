<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//전송된 데이터 인코딩 타입 지정
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현언어의 사용 예제</title>
</head>
<body>
<h3>표현언어의 - 파라미터 값 처리</h3>
<form action="s02_el.jsp" method="post">
이름 : <input type="text" name="name"><br>
<input type="submit" value="확인"/><!-- 맨뒤에 /를 넣는건 xml의 영향을 받아서 끝을 의미하는 뜻 있든없든 작동은 똑같음 -->
</form>
<br/>
이름은 <%= request.getParameter("name") %><br> <!-- 아무것도 입력이 안된 맨처음 시작시 null을 표시함(별로좋은 방식아님) -->
이름은 ${param.name}<br> <!-- 위에 name과 같음. ""를 쓰지않음 --> 
이름은 ${param["name"]} 입니다.<br>
</body>
</html>