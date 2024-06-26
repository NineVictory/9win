<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer = "1kb" autoFlush = "false" %> <!-- 고의적으로 오류가 나게함. 작동이 되는 것을 보기위해 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>autoFlush 속성값 false 예제</title>
</head>
<body>
<%
	for(int i=0; i<1000;i++){
		
	
%>
1234
<%
	}
%>
</body>
</html>