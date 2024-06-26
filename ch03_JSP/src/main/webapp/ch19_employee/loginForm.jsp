<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" type="text/css">
<script type="text/javascript">
   //alert(document.referrer);
	window.onload=function(){
		let form = document.getElementById('login_form');
		form.onsubmit=function(){
			var id = document.getElementById('id');
			if(id.value.trim()==''){
				alert('id를 입력하세요!');
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
		};
	};
</script>
</head>
<body>
<div class="page-main">
	<h1>로그인</h1>
	<form action="login.jsp" method="post" id="login_form">
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
		</ul>
		<div class="align-center">
			<input type="submit" value="로그인">
			<input type="button" value="홈으로"
			       onclick="location.href='main.jsp'">
		</div>
	</form>
</div>
</body>
</html>




