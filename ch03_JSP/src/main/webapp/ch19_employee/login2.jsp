<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.dao.EmployeeDAO" %>
<%@ page import="kr.employee.vo.EmployeeVO" %>
<%
	//전송된 데이터 인코딩 타입 지정
	request.setCharacterEncoding("utf-8");
	//전송된 데이터 반환
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	EmployeeDAO dao = EmployeeDAO.getInstance();
	//id 존재 여부 확인
	EmployeeVO vo = dao.checkEmployee(id);
	boolean check = false;
	
	if(vo!=null){//id 존재
		//사용자가 입력한 비밀번호와 table에 저장된 비밀번호 일치 여부 확인
		check = vo.isCheckedPassword(passwd);	
	}
	if(check){//인증성공 (check가 true일 떄)
		//로그인 처리
		session.setAttribute("user_num", vo.getNum());
		session.setAttribute("user_id", id); 
		
		//main.jsp로 리다이렉트
		response.sendRedirect("writeForm.jsp");
	}else{//인증실패
%>
	<script type = "text/javascript">
		alert('아이디 또는 비밀번호가 불일치합니다.');
		history.go(-1);
	</script>
<%		
	}
	
%>