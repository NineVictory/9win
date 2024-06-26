<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[실습]회원가입</title>
<script type="text/javascript">
window.onload = function(){
	const myForm = document.getElementById('myForm');
	//폼 이벤트 연결
	myForm.onsubmit = function(){
		//반복문을 이용한 유효성 체크
		const items = document.querySelectorAll('.input-check');
		
		for(let i=0; i<items.length;i++){
			//입력을 하지 않았거나 공백 입력한 경우
			if(items[i].value.trim()==''){
				const label = document.querySelector('label[for="'+items[i].id+'"]');
				const label_text = label.textContent;
				alert(label_text + ' 항목은 필수 입력');
				items[i].value = '';
				items[i].focus();
				return false;
			}
			if (items[i].id == 'id' && !/^[A-Za-z0-9]{4,12}$/.test(items[i].value)) {
			    alert('영문 또는 숫자 사용, 최소 4자 최대 12자 입력가능');
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
	<%--
이름(name), 아이디(id),비밀번호(password),전화번호(phone),
취미(hobby)-영화보기,음악감상,등산,낚시, 춤 => checkbox 사용
자기소개(content) => textarea 사용

s06_register.jsp로 전송, 전송 방식 post

출력예시
(유효성 체크 -> 필수입력,영문,숫자 등 비밀번호 몇자리까지인지 스스로 정하기)
이름:홍길동 *필수
아이디:dragon *필수
비밀번호:1234 *필수
전화번호:010-1234-5678
자기소개:서울에서 태어나서 계속 서울 거주

 --%>
	<form action="s06_register.jsp" method="post" id="myForm">
		<ul>
		<li>
			<label for ="name">이름</label>
			<input type="text" name="name" id="name" class="input-check">
		</li>
		<li>
			<label for ="id">아이디</label>
			<input type="text" name="id" id="id" class="input-check">
		</li>
		<li>
			<label for ="password">비밀번호</label>
			<input type="password" name="password" id="password" class="input-check">
		</li>
		<li>
			<label for ="phone">전화번호</label>
			<input type="text" name="phone" id="phone">
		</li>
		
		<li>
			<label for ="content">자기소개</label>
			<textarea rows="5" cols="50" name="content"></textarea><br>
		</li>
		<li>
		<label>취미</label>
		<input type="checkbox" name="hobby" value="movie"> 영화보기
		<input type="checkbox" name="hobby" value="music"> 음악감상
		<input type="checkbox" name="hobby" value="climbing"> 등산
		<input type="checkbox" name="hobby" value="fishing"> 낚시
		<input type="checkbox" name="hobby" value="dance"> 춤
		<br>
		<input type="submit" value="전송">
		</li>
	</ul>
	
		
		
		
	</form>
</body>
</html>