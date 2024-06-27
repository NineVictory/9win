<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 후기 게시판 글 쓰기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<div>
			<h2 class="mt-5 mb-5">구매 후기 게시판 글 쓰기</h2>
			<form id="write_form" action="write.do" method="post" enctype="multipart/form-data">
				<ul class="list-unstyled">
					<li class="mb-4">
						<label for="b_re_title" class="fs-4 mt-2 mb-2">제목(필수)</label>
						<br>
						<input type="text" class="form-control" name="b_re_title" id="b_re_title" maxlength="50">
					</li>
					<li>
						<label for="buy_num" class="fs-4 mb-2">거래 내역(필수)</label>
						<br>
						<select class="btn btn-secondary dropdown-toggle fs-5" name="buy_num" id="buy_num">
                            <option value="">거래 내역을 선택하세요</option>
                            <c:forEach var="buy" items="${buyList}">
                                <option value="${buy.buy_num}">${buy.buy_num}. ${buy.car_name} / ${buy.buy_reg}</option>
                            </c:forEach>
                        </select>
					</li>
					<li>
						<label for="b_re_content" class="fs-4 mt-3 mb-2">내용(필수)</label>
						<br>
						<textarea rows="20" cols="70" class="form-control" name="b_re_content" id="b_re_content"></textarea>
					</li>
					<li>
						<input type="file" name="b_re_photo" id="b_re_photo" class="form-control mt-3 mb-2" onchange="displaySelectedFiles(this)" accept="image/gif,image/png,image/jpeg" multiple>
						<!-- 업로드하려는 파일명 노출 -->
						<div class="mt-3 mb-3 border rounded p-3" id="filename">
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
</body>
<script type="text/javascript">
	window.onload=function(){
		const myForm = document.getElementById('write_form');
		myForm.onsubmit=function(){
			const title = document.getElementById('b_re_title');
			if(title.value.trim()==''){
				alert('제목을 입력하세요!');
				title.value='';
				title.focus();
				return false;
			}
			const buy = document.getElementById('buy_num');
			if(buy.value.trim()==''){
				alert('거래내역을 선택하세요!');
				buy.value='';
				buy.focus();
				return false;
			}
			const content = document.getElementById('b_re_content');
			if(content.value.trim()==''){
				alert('내용을 입력하세요!');
				content.value='';
				content.focus();
				return false;
			}
			const photo = document.getElementById('b_re_photo');
			if(photo.value.trim()==''){
				alert('사진을 첨부하세요!');
				photo.value='';
				photo.focus();
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