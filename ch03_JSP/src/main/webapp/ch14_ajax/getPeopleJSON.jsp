<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import ="kr.util.DBUtil"  %>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
[<% 
	Connection conn = null;
  	PreparedStatement pstmt = null;
  	ResultSet rs = null;
  	String sql = null;
  	
  	try{
  		//Connection 객체 반환
  		conn = DBUtil.getConnection();
  		
  		//SQL문 작성
  		sql = "SELECT * FROM people ORDER BY reg_date DESC";
  		
  		//JDBC 수행 3단계
  		pstmt = conn.prepareStatement(sql);
  		
  		//JDBC 수행 4단계
  		rs = pstmt.executeQuery();
  		while(rs.next()){
  			String id = rs.getString("id");
  			String name = rs.getString("name");
  			String job = rs.getString("job");
  			String address = rs.getString("address");
  			String blood_type = rs.getString("blood_type");
  			String reg_date = rs.getString("reg_date"); //Date가 아닌 String으로하면 시분초까지 나옴.
  			//while이 돌고 if가 나오기 때문에 첫번째에는 쉼표가 들어가지않음
  			if(rs.getRow()>1) out.println(",");
  			%>
  			{
  				"id":"<%= id %>", <%-- 자바스크립트 에서는 <%= id %> 를 명시할 떄 ""를 해줘야 문자열로 인식한다. --%>
  				"name":"<%= name %>",
  				"job":"<%= job %>",
  				"address":"<%= address %>",
  				"blood_type":"<%= blood_type %>",
  				"reg_date":"<%= reg_date %>"
  				
  			}
  			<%
  		}
  	}catch(Exception e){
  		e.printStackTrace();
  	}finally{
  		//자원정리
  		DBUtil.executeClose(rs, pstmt, conn);
  	}
 %>]
