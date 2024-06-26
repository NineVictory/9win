<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	//가격정보
	HashMap<String,Integer> map = new HashMap<String,Integer>();
	
	map.put("짜장면",4000);
	map.put("짬뽕",5000);
	map.put("볶음밥",6000);
	
	//총지불금액
	int sum =0;
	
	
%>
<%
String[] foods = {"짜장면", "짬뽕", "볶음밥"};
String[] counts = {request.getParameter("food_c0"), 
		request.getParameter("food_c1"), 
		request.getParameter("food_c2")};

%>

<%
	for(int i=0; i<foods.length;i++){
		int count = Integer.parseInt(counts[i]);
		if(count>0){
%>
		<%= foods[i] %> : <%= counts[i] %> 개<br>
<%
		sum += count*map.get(foods[i]);
		}
	}
%>
총지불금액:<%= String.format("%,d원",sum) %>
</body>
</html>