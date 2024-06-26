<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 사진 업로드 폼</title>
<script type="text/javascript">
window.onload=function(){
	//미리 보기 이미지 호출
	const image = document.getElementById('image');
	//전송 버튼 호출
	const submit_btn = document.getElementById('submit_btn');
	
	//파일 선택시 이벤트 연결
	const file = document.getElementById('file');
	file.onchange = function(){
		if(!file.files[0]){ // 파일이 선택되지 않았을 때(파일을 변경했다가 취소를 했을 떄)
			image.src='../images/face.png';// 기본 이미지로 설정
			submit_btn.style.display = 'none';// 전송 버튼 숨김
			return; //함수종료, onchange라서 cnsubmit면 false까지 명시 
		}
		//선택한 이미지 읽기
		const reader = new FileReader(); // FileReader 객체 생성
		reader.readAsDataURL(file.files[0]); // 선택된 파일을 읽음
		
		// 파일 읽기가 완료되었을 때 실행되는 이벤트 핸들러
		reader.onload=function(){
			image.src = reader.result;// 읽은 이미지를 미리 보기로 표시
			submit_btn.style.display = ''; // 전송 버튼 표시
		};
	};
	
	
}
</script>
</head>
<body>
<h2>프로필 사진 업로드하기</h2>
<img src ="../images/face.png" width="200" height="200" id="image">
<form action = "/ch03_JSP/profile" method="post" enctype="multipart/form-data">
	<input type="file" name="file" id="file" accept = "image/png,image/jpeg,image/gif">
	<input type = "submit" value="전송" id="submit_btn" style="display:none;">
</form>
</body>
</html>