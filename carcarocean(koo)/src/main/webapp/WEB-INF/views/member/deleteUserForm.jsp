<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원탈퇴</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	//아이디,비밀번호 유효성 체크
	$('#delete_form').submit(function(){
		const items = document.querySelectorAll('.input-check');
		for(let i=0;i<items.length;i++){
			if(items[i].value.trim()==''){
				const label = document.querySelector(
						       'label[for="'+items[i].id+'"]');
				alert(label.textContent + ' 항목은 필수 입력');
				items[i].value = '';
				items[i].focus();
				return false;
			}
		}//end of for
		
		if($('#mem_passwd').val()!=$('#cpasswd').val()){
			alert('새비밀번호와 새비밀번호 확인이 불일치');
			$('#mem_passwd').val('').focus();
			$('#cpasswd').val('');
			return false;
		}
	});//end of submit
	
	//비밀번호 확인까지 한 후 다시 비밀번호를 수정하려고 하면 새비밀번호 확인을
	//초기화
	$('#mem_passwd').keyup(function(){
		$('#cpasswd').val('');
		$('#message_cpasswd').text('');
	});
	
	//비밀번호와 비밀번호 확인 일치 여부 체크
	$('#cpasswd').keyup(function(){
		if($('#mem_passwd').val()==$('#cpasswd').val()){
			$('#message_cpasswd').text('비밀번호 일치');
		}else{
			$('#message_cpasswd').text('');
		}
	});
});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<div class="row">
			<c:set var="sub_title" value="회원탈퇴" scope="request" />
			<jsp:include page="/WEB-INF/views/member/myPageMenu.jsp" />
			<main class="col-md-10 pt-5 pb-5">
				<div class="mypage-div">
					<div class="content-main">
						<h2 class = "text-warning">회원탈퇴</h2>	
						<form id="delete_form" action="deleteUser.do" method="post" class="shadow p-3 bg-light">
								 <div class="form-group">
								 <label for="mem_id">아이디</label> <input type="text"
									name="mem_id" id="mem_id" maxlength="12" autocomplete="off"
									class="input-check form-control">
								 </div> 
								 <div class="form-group">
								 <label for="mem_email">이메일</label> <input type="email"
									name="mem_email" id="mem_email" maxlength="50"
									autocomplete="off" class="input-check form-control">
								 </div>
								 <div class="form-group">
								 <label for="mem_passwd">비밀번호</label> <input
									type="password" name="mem_passwd" id="mem_passwd"
									maxlength="12" class="input-check form-control"> 
								 </div>
								 <div class="form-group">	
								 <label for="cpasswd">비밀번호 확인</label> <input
									type="password" id="cpasswd" maxlength="12" class="input-check form-control">
									<span id="message_cpasswd"></span> 
								</div>
							<div class="btn-group w-100" role="group" aria-label="Basic outlined example">
								<input type="submit" value="회원탈퇴" class = "btn btn-outline-light bg-warning text-white"> 
								<input type="button" value="My페이지" class = "btn btn-outline-light bg-warning text-white" onclick="location.href='myPage.do'">
							</div>
						</form>
					</div>
				</div>
			</main>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>






