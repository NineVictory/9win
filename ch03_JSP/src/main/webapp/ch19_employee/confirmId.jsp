<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="kr.employee.dao.EmployeeDAO" %>
<%@ page import="kr.employee.vo.EmployeeVO" %>    
<%
    //전송된 데이터 인코딩 처리
    request.setCharacterEncoding("utf-8");

    //전송된 데이터 반환
    String id = request.getParameter("id");
        	
    EmployeeDAO dao = EmployeeDAO.getInstance();
    EmployeeVO emp = dao.checkEmployee(id);
    if(emp!=null){//아이디 중복
    %>
	{"result":"idDuplicated"}
<%		
	}else{//아이디 미중복
%>
	{"result":"idNotFound"}
<%		
	}
%>






