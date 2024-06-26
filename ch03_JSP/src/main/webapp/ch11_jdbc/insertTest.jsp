<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="kr.util.DBUtil" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 글쓰기 처리</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>
<%
	//POST 방식
	request.setCharacterEncoding("utf-8");

	//전송된 데이터 반환
	String name = request.getParameter("name");
	int price = Integer.parseInt(request.getParameter("price"));
	int stock = Integer.parseInt(request.getParameter("stock"));
	String origin = request.getParameter("origin");
	
	//DB연동
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	try{
		//커넥션 객체 반환
		conn = DBUtil.getConnection();
		//sql문 실행
		sql = "INSERT INTO PRODUCT (num,name,price,stock,origin,reg_date) VALUES (product_seq.nextval,?,?,?,?,SYSDATE)";
		
		//JDBC 3단계
		pstmt = conn.prepareStatement(sql);
		
		//? 데이터 바인딩
		pstmt.setString(1, name);
		pstmt.setInt(2, price);
		pstmt.setInt(3, stock);
		pstmt.setString(4, origin);
		
		//JDBC 4단계
		pstmt.executeUpdate();
%>
	<div class="result-display">
			<div class = "align-center">
				글 등록 성공!<br>
				<input type = "button" value="목록"
					onclick="location.href='selectTest.jsp'">
			</div>
  		</div>
<%
	}catch(Exception e){
%>
	<div class="result-display">
			<div class = "align-center">
				오류 발생! 글 등록 실패!<p>
				<input type = "button" value="글쓰기"
					onclick="location.href='insertTestForm.jsp'">
			</div>
  		</div>
<%
		e.printStackTrace();
		
	}finally{
		DBUtil.executeClose(null, pstmt, conn);
	}
	
%>

</body>
</html>