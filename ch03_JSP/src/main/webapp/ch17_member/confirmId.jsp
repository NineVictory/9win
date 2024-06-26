<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import ="kr.member.dao.MemberDao" %>
<%@ page import ="kr.member.vo.MemberInfoVO" %>

<%
//전송된 데이터 인코딩 타입 지정
	request.setCharacterEncoding("utf-8");
	//전송된 데이터 반환
	String id = request.getParameter("id");
	
	MemberDao dao = MemberDao.getInstance();
	MemberInfoVO member = dao.checkMember(id);
	if(member !=null){//아이디 중복
%>
	{"result":"idDuplicated"}
<%		
	}else{//아이디 미중복
%>
	{"result":"idNotFound"}
<%
	}
			
%>


