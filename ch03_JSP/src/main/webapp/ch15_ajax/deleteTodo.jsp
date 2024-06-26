<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import = "kr.util.DBUtil" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>

<%
	//전송된 데이터 인코딩 타입 지정
	request.setCharacterEncoding("utf-8");

	//전송된 데이터 반환
	int id = Integer.parseInt(request.getParameter("id"));
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	
	try{
		//커넥션 객체 반환
		conn=DBUtil.getConnection();
		//sql작성
		sql = "DELETE FROM todo WHERE id=?";
		
		//JDBD수행3단계
		pstmt = conn.prepareStatement(sql);
		//?데이터 바인딩
		pstmt.setInt(1,id);
		//JDBC수행 4단계
		pstmt.executeUpdate();
		%>
		{"result": "success"}
		<%
		
	}catch(Exception e){
		%>
		{"result":"failure"}
		<%
		e.printStackTrace();
		
	}finally{
		DBUtil.executeClose(null, pstmt, conn);
	}
%>
