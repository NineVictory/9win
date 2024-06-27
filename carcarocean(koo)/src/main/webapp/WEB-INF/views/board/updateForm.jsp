<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<div>
			<h2 class="mt-5 mb-5">자유게시판 글 수정</h2>
			<form id="update_form" action="update.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="board_num" value="${board.board_num}">
				<ul class="list-unstyled">
					<li class="mb-4">
						<label for="board_title" class="fs-4 mt-3 mb-2">제목</label>
						<input type="text" class="form-control" name="board_title" id="board_title" value="${board.board_title}" maxlength="50">
					</li>
					<li class="mb-2">
					<label for="board_content" class="fs-4 mb-2">내용</label>
					<textarea rows="20" cols="70" class="form-control" name="board_content" id="board_content">${board.board_content}</textarea>
					</li>
					<li>
						<input type="file" name="notice_photo" class="form-control mt-3 mb-2" onchange="displaySelectedFiles(this)" accept="image/gif,image/png,image/jpeg" multiple>
						<!-- 업로드하려는 파일명 노출 -->
						<div class="mt-3 mb-3 border rounded">
					    	<div id="fileNames" class="mt-3 mb-3 fs-5"></div>
						</div>
						<c:if test="${!empty board.board_photo}">
						<div id="file_detail">
							<ul class="list-unstyled">
							<c:if test="${fn:contains(board_photo, ',')}">
								<c:set var="photoList" value="${fn:split(board_photo, ',')}" />
								<li>
									<c:forEach var="photoList" items="${photoList}">
										<img src="${pageContext.request.contextPath}/upload/${photoList}" class="detail-img">
									</c:forEach>
								</li>
							</c:if>
							<c:if test="${!fn:contains(board_photo, ',')}">
								<li>
									<img src="${pageContext.request.contextPath}/upload/${board.board_photo}" class="detail-img">
								</li>
							</c:if>
							<br>
							<input type="button" class="btn btn-warning mb-4" value="파일 삭제" id="file_del">
							</ul>
						</div>
						<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
						<script type="text/javascript">
							$(function(){
								$('#file_del').click(function(){
									let choice = confirm('삭제하시겠습니까?');
									if(choice){
										$.ajax({
											url : 'deleteFile.do',
											type : 'post',
											data : {board_num : ${board.board_num}},
											dataType : 'json',
											success : function(param){
												if(param.result == 'logout'){
													alert('로그인 후 사용해주세요.');
												}else if(param.result == 'success'){
													$('#file_detail').hide();
												}else if(param.result == 'wrongAccess'){
													alert('잘못된 접근입니다.');
												}else{
													alert('파일 삭제 오류');
												}
											},
											error : function(){
												alert('네트워크 오류 발생');
											}
										});
									}
								});
							});
						</script>
						</c:if>
					</li>
				</ul>
				<div class="mt-3 mb-5 row justify-content-center">
			    <div class="col-auto">
			        <input type="submit" class="btn btn-warning text-white" value="글 수정">
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
	window.onload = function(){
		const myForm = document.getElementById('update_form');
		
		myForm.onsubmit = function(){
			const board_title = document.getElementById('board_title');
			if(board_title.value.trim() == ''){
				alert('제목을 입력하세요.');
				board_title.value='';
				board_title.focus();
				return false;
			}
			const board_content = document.getElementById('board_content');
			if(board_content.value.trim == ''){
				alert('내용을 입력하세요.');
				board_content.value='';
				board_content.focus();
				return false;
			}
		};
	};
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
	};
</script>
</html>