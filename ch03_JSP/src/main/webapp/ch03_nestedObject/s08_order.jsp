<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.HashMap" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
</head>
<body>
<% 
    //post방식으로 전송된 데이터 인코딩 타입 지정
    request.setCharacterEncoding("utf-8");
	//가격정보
	HashMap<String,Integer> map = new HashMap<String,Integer>();

	map.put("가방",200000);
	map.put("신발",100000);
	map.put("옷",50000);
	map.put("식사권",150000);
	
	//배송비
	int delivery_fee = 5000;
	//총구매비용
	int sum = 0;
	
%>
이름: <%= request.getParameter("name") %><br> 
배송희망일: <%= request.getParameter("order_date") %><br>
구입내용:
<%
	String[] items = request.getParameterValues("item");
	if(items != null) { //체크박스를 체크 하지않으면 values가 null값이기 때문에 null값이 아닐 때만 돌려줌 
		for(int i=0;i<items.length;i++){
			sum+=map.get(items[i]);
			if(i>0) out.print(",");
%>
			<%= items[i] %>
<% 			
		}//end of for
		if(sum<300000)
			sum += delivery_fee;
		else
			delivery_fee = 0;

%>
	<br>
	배송비 : <%= String.format("%,d원",delivery_fee) %> <br>
	총구매비용(배송비포함) : <%= String.format("%,d원",sum) %> 		 		
<% 		
	}//end of if
			
%>
		
</body>
</html>