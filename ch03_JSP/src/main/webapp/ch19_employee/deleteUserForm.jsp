<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Integer user_num = (Integer)session.getAttribute("user_num");
	if(user_num==null){//로그인이 되지 않은 경우
		session.setAttribute("back_page", request.getRequestURI());
		response.sendRedirect("loginForm.jsp?url=deleteUserForm.jsp");
	}else{
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 탈퇴 폼</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" type="text/css">
<script type="text/javascript">
	window.onload=function(){
		var form = document.getElementById('delete_form');
		form.onsubmit=function(){
			let id = document.getElementById('id');
			if(id.value.trim()==''){
				alert('아이디를 입력하세요!');
				id.focus();
				id.value = '';
				return false;
			}
			let passwd = document.getElementById('passwd');
			if(passwd.value.trim()==''){
				alert('비밀번호를 입력하세요!');
				passwd.focus();
				passwd.value = '';
				return false;
			}
			let cpasswd = document.getElementById('cpasswd');
			if(cpasswd.value.trim()==''){
				alert('비밀번호 확인을 입력하세요!');
				cpasswd.focus();
				cpasswd.value = '';
				return false;
			}
			//비밀번호와 비밀번호 확인 일치여부 체크
			if(passwd.value != cpasswd.value){
				alert('비밀번호와 비밀번호 확인이 불일치합니다!');
				cpasswd.focus();
				cpasswd.value = ''; //데이터 초기화
				return false;
			}
		};
	};
</script>
</head>
<body>
<div class="page-main">
	<h1>사원탈퇴</h1>
	<form id="delete_form" action="deleteUser.jsp" method="post">
		<ul>
			<li>
				<label for="id">아이디</label>
				<input type="text" name="id" id="id"
				                maxlength="12">
			</li>
			<li>
				<label for="passwd">비밀번호</label>
				<input type="password" name="passwd" id="passwd"
				                       maxlength="12">
			</li>
			<li>
				<label for="cpasswd">비밀번호 확인</label>
				<input type="password" id="cpasswd"
				                       maxlength="12">
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="사원탈퇴">
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






