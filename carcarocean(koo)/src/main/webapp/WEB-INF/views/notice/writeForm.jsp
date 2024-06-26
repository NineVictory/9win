<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글 쓰기(관리자)</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<div>
			<h2 class="mt-5 mb-5"><b>공지사항 글 쓰기</b></h2>
			<form id="write_form" action="write.do" method="post" enctype="multipart/form-data">
				<ul class="list-unstyled">
					<li class="mb-4">
						<input type="checkbox" class="form-check-input fs-4" name="notice_impt" id="notice_impt" value="1">
						<label for="notice_impt" class="fs-4"><b>중요</b></label>
					</li>
					<li class="mb-2">
						<label for="notice_title" class="fs-4 mb-2">제목(필수)</label>
						<br>
						<input type="text" class="form-control" name="notice_title" id="notice_title" maxlength="50"	>
					</li>
					<li class="mt-2">
						<label for="notice_content" class="fs-4 mb-2">내용(필수)</label>
						<br>
						<textarea rows="20" cols="70" class="form-control" name="notice_content" id="notice_content"></textarea>
					</li>
					<li>
						<input type="file" class="form-control mt-3 mb-2" onchange="displaySelectedFiles(this)" name="notice_photo" accept="image/gif,image/png,image/jpeg" multiple>
					    <div class="mt-3 mb-3 border rounded">
					    	<div id="fileNames" class="mt-3 mb-3 fs-5"></div>
						</div>
					</li>
				</ul>
				<div class="mt-3 mb-5 row justify-content-center">
					<div class="col-auto">
						<input type="submit" class="btn btn-warning text-white" value="글 쓰기">
					</div>		
					<div class="col-auto">
						<input type="button" class="btn btn-warning text-white" value="목록" onclick="location.href='list.do'">
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script type="text/javascript">
	window.onload=function(){
		const myForm = document.getElementById('write_form');
		myForm.onsubmit=function(){
			const title = document.getElementById('notice_title');
			if(title.value.trim()==''){
				alert('제목을 입력하세요!');
				title.value='';
				title.focus();
				return false;
			}
			const content = document.getElementById('notice_content');
			if(content.value.trim()==''){
				alert('내용을 입력하세요!');
				content.value='';
				content.focus();
				return false;
			}
		};
	};
	//파일명 노출
	function displaySelectedFiles(input) {
	    const files = input.files;
	    const fileNamesContainer = document.getElementById('fileNames');
	    fileNamesContainer.innerHTML = ''; // 이전에 선택된 파일들의 이름을 모두 지움

	    if (files.length === 0) {
	        fileNamesContainer.textContent = '선택된 파일 없음';
	    } else {
	        const list = document.createElement('ul');
	        for (let i = 0; i < files.length; i++) {
	            const listItem = document.createElement('li');
	            listItem.textContent = files[i].name;
	            list.appendChild(listItem);
	        }
	        fileNamesContainer.appendChild(list);
	    }
	}
</script>
</html>