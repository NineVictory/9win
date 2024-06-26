<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.dao.EmployeeDAO" %>
<%@ page import="kr.employee.vo.EmployeeVO" %>
<%
Integer user_num = (Integer)session.getAttribute("user_num");
	if(user_num==null){//로그인이 되지 않은 경우
		response.sendRedirect("loginForm.jsp");
	}else{
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원정보수정</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
<script type="text/javascript">
	window.onload=function(){
		let form = document.getElementById('modify_form');
		form.onsubmit=function(){
			let items = document.querySelectorAll('.input-check');
    		for(let i=0;i<items.length;i++){
    			if(items[i].value.trim()==''){
					let label = document.querySelector('label[for="'+items[i].id+'"]');
					let label_text = label.textContent;
					/*
					받침 유무에 따라 조사 처리
					한글은 초성 19개, 중성 21개, 종성 28개로 구성
					
					한글은 유니코드로 표시하면 0,28,56 ... 번째 글자는 종성이 없음. 따라서 28로 나누어서 0이면 종성이 없음
					label text의 마지막 문자 유니코드에서 '가'의 유니코드를 뺀 값을 28로 나누었을 때,
					나머지 값이 0보다 크면 종성(받침)이 있는 것임
					charCodeAt(index) index에 해당하는 문자의 유니코드 반환
					*/
					let post = (label_text.charCodeAt(label_text.length-1) - '가'.charCodeAt(0)) % 28 > 0 ? '은' : '는';
					alert(label_text + post + ' 필수 입력');
					items[i].value = '';
					items[i].focus();
					return false;
				}
    		}
		};
	};
</script>
</head>
<body>
<%
	EmployeeDAO dao = EmployeeDAO.getInstance();
	EmployeeVO emp = dao.getEmployee(user_num);
%>

<div class="page-main">
	<h1>사원정보수정</h1>
	<form action="modifyUser.jsp" method="post" id="modify_form">
		<ul>
			<li>
				<label for="name">이름</label>
				<input type="text" name="name" id="name"
					   value="<%= emp.getName() %>"
				       maxlength="10" class="input-check">              
			</li>
			<li>
				<label for="passwd">비밀번호</label>
				<input type="password" name="passwd" id="passwd"
				       maxlength="12" class="input-check">              
			</li>
			<li>
				<label for="salary">급여</label>
				<input type="number" name="salary" id="salary"
				       value="<%= emp.getSalary() %>"
				       min="1" max="99999999"
				       class="input-check">              
			</li>
			<li>
				<label for="job">업무</label>
				<input type="text" name="job" id="job"
					   value="<%= emp.getJob() %>"
				       maxlength="10" class="input-check">              
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="수정">
			<input type="button" value="홈으로"
			       onclick="location.href='main.jsp'">
		</div>
	</form>
</div>
</body>
</html>
<%
	}
%>