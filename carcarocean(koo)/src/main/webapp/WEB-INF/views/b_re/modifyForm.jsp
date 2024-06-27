<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 후기 게시판 글 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<div>
			<h2 class="mt-5 mb-5">구매 후기 게시판 글 쓰기</h2>
			<form id="modify_form" action="modify.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="b_re_num" value="${b_re.b_re_num}">
				<ul class="list-unstyled">
					<li class="mb-4">
						<label for="b_re_title" class="fs-4 mt-2 mb-2">제목(필수)</label>
						<br>
						<input type="text" class="form-control" name="b_re_title" id="b_re_title" value="${b_re.b_re_title}" maxlength="50">
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
						<textarea rows="20" cols="70" class="form-control" name="b_re_content" id="b_re_content">${b_re.b_re_content}</textarea>
					</li>
					<li>
						<input type="file" id="b_re_photo" name="b_re_photo" class="form-control mt-3 mb-2" onchange="displaySelectedFiles(this)" accept="image/gif,image/png,image/jpeg" multiple>
						<!-- 업로드하려는 파일명 노출 -->
						<div class="mt-3 border rounded p-3">
					    	<div id="fileNames" class="mt-3 mb-2 fs-5"></div>
						</div>
						<br>
						<hr size="1" noshade="noshade" width="100%">
						<div id="file_detail">
							<ul class="list-unstyled">
								<c:if test="${fn:contains(b_re.b_re_photo, ',')}">
									<c:set var="photoList" value="${fn:split(b_re.b_re_photo, ',')}" />
									<li>
										<c:forEach var="photoList" items="${photoList}">
											<img src="${pageContext.request.contextPath}/upload/${photoList}" id="b_re_photo2" name="b_re_photo2" class="detail-img">
										</c:forEach>
									</li>
								</c:if>
								<c:if test="${!fn:contains(b_re.b_re_photo, ',')}">
									<li>
										<img src="${pageContext.request.contextPath}/upload/${b_re.b_re_photo}" id="b_re_photo2" name="b_re_photo2" class="detail-img">
									</li>
								</c:if>
								<br>
								<input type="button" class="btn btn-warning mb-4 text-white" value="파일 삭제" id="file_del">
							</ul>
						</div>
						<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
						<script type="text/javascript">
							$(function(){
								$('#file_del').click(function(){
									let choice = confirm('삭제하시겠습니까?');
									if(choice){
										//서버와 통신
										$.ajax({
											url:'deleteFile.do',
											type:'post',
											data:{b_re_num:${b_re.b_re_num}},
											dataType:'json',
											success:function(param){
												if(param.result == 'success'){
													$('#file_detail').hide();
												}else{
													alert('파일 삭제 오류 발생');
												}
											},
											error:function(){
												alert('네트워크 오류 발생');
											}
										});
										
									}
								});
							});
						</script>
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
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script type="text/javascript">
	window.onload=function(){
		const myForm = document.getElementById('modify_form');
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
			const fileDetail = document.getElementById('file_detail');
			if(fileDetail.style.display === 'none'){
			    // file_detail이 숨겨져 있으면 실행될 코드
			    const photo = document.getElementById('b_re_photo');
			    if(photo.value.trim()==''){
			        alert('사진을 첨부하세요!');
			        photo.value='';
			        photo.focus();
			        return false;
			    }
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
	        
			// 파일 선택 시, 이전 파일을 삭제하는 부분
	        const photo2 = document.getElementById('b_re_photo2');
	        if (photo2.value.trim() !== '') {
	            const photo = document.getElementById('b_re_photo');
	            photo.value = ''; // 이전 파일 input 초기화
	        }
	    }
	}
</script>
</html>