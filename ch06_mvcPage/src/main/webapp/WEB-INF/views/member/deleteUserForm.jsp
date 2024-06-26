<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>  
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	//아이디, 비밀번호 유효성 체크
	$('#delete_form').submit(function(){
		const items = document.querySelectorAll('.input-check');
		for(let i=0; i<items.length; i++){
			if(items[i].value.trim()==''){
				const label = document.querySelector('label[for="'+items[i].id+'"]');
				alert(label.textContent+' 항목은 필수 입력');
				items[i].value = '';
				items[i].focus();
				return false;
			}
	
		}//end of for
		if($('#passwd').val()!=$('#cpasswd').val()){
			alert('새비밀번호와 새비밀번호 확인이 불일치');
			$('#passwd').val('').focus();
			$('#cpasswd').vall('');
			return false;
		}
		
	});//end of submit   
	
	//새비밀번호 확인까지 한 후 다시 새비밀번호를 수정하려고 하면 새비밀번호 확인을 초기화
	$('#passwd').keyup(function(){
		$('#cpasswd').val('');
		$('#message_cpasswd').text('');
	});
	
	//새비밀번호와 새비밀번호 확인 일치 여부 체크
	$('#cpasswd').keyup(function(){
		if($('#passwd').val()==$('#cpasswd').val()){
			$('#message_cpasswd').text('비밀번호 일치');
		}else{
			$('#message_cpasswd').text('');
		}
	});
});
</script>
</head>
<body>
<div class="page-main">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="content-main">
		<h2>회원탈퇴</h2>
		<form id="delete_form" action="deleteUser.do" method="post">
			<ul>
				<li>
					<label for="id">아이디</label>
					<input type="text" id="id" name="id" maxlength="12" 
					autocomplete="off" class="input-check">
				</li>
				<li>
					<label for="email">이메일</label>
					<input type="email" id="email" name="email" maxlength="50" 
					autocomplete="off" class="input-check">
				</li>
				<li>
					<label for="passwd">비밀번호</label>
					<input type="password" id="passwd" name="passwd" maxlength="12" class="input-check">
					
				</li>
				<li>
					<label for="cpasswd">비밀번호 확인</label>
					<input type="password" id="cpasswd" maxlength="12" class="input-check"> <!-- 확인용이고 전달할 것이 아니기에 name은 명시하지않음 -->
					<span id="message_cpasswd"></span>
				</li>
				
			</ul>
			<div class="align-center">
				<input type="submit" value="등록">
				<input type="button" value="홈으로" 
					onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
				
			</div>
		</form>
		</div>
</div>
</body>
</html>