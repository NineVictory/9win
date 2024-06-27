<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 후기 글</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="container">
	<div>
		<div class="mt-4 mb-4">
			<!-- 차 썸네일 사진 -->
			<div class="text-start mt-2">
				<c:if test="${fn:contains(b_re.car_photo, ',')}">
					<c:set var="photoList" value="${fn:split(b_re.car_photo, ',')}" />
					<c:set var="firstPhoto" value="${photoList[0]}"/>
					<div class="fs-3 d-inline">
						<img src="${pageContext.request.contextPath}/upload/${firstPhoto}" class="detail-img img-thumbnail" width="150px" height="100px">
					</div>
				</c:if>
				<c:if test="${!fn:contains(b_re.car_photo, ',')}">
					<c:set var="firstPhoto" value="${b_re.car_photo}" />
					<li class="mr-3 d-inline">
						<img src="${pageContext.request.contextPath}/upload/${firstPhoto}" class="detail-img img-thumbnail" width="150px" height="100px">
					</li>
				</c:if>
				<!-- 제조사 / 차 이름 -->
				<div class="fs-3 d-inline ms-5">${b_re.car_maker} / ${b_re.car_name}</div>
			</div>
			<hr size="1" noshade="noshade" width="100%">
			<!-- 제목 -->
			<div class="text-start fs-4 mt-1">${b_re.b_re_title}</div>
			<hr size="1" noshade="noshade" width="100%">
			<div class="mt-1 mb-1 d-flex justify-content-between align-items-center">
				<!-- 작성자 정보 -->
				<div class="d-flex align-items-center">
					<div class="me-3 d-inline">
					<img src="${pageContext.request.contextPath}/upload/${b_re.mem_photo}" class="rounded-circle me-1" width="30" height="30">
					</div>
					<div class="me-4 d-inline">${b_re.mem_id}</div>
				</div>
				<!-- 작성일 -->
				<div class="text-end">
					<c:if test="${!empty b_re.b_re_modify}">
						${fn:substring(b_re.b_re_modify, 0, 10)}
					</c:if>
					<c:if test="${empty b_re.b_re_modify}">
						${fn:substring(b_re.b_re_reg, 0, 10)}
					</c:if>
				</div>
			</div>
		</div>
		<hr size="1" noshade="noshade" width="100%">
		<!-- 구매후기게시판 첨부 사진 노출 -->
		<div id="imageModal" class="modal fade" tabindex="-1">
		  <div class="modal-dialog modal-lg modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-body">
		        <img id="modalImage" class="img-fluid" alt="Preview Image" width="900" height="900">
		        <script type="text/javascript">
			        function previewImage(image) {
			        	  var modalImage = document.getElementById('modalImage');
			        	  modalImage.src = image.src;
			        	}
		        </script>
		      </div>
		    </div>
		  </div>
		</div>
		<div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
		    <div class="carousel-inner">
		        <c:if test="${fn:contains(b_re.b_re_photo, ',')}">
		            <c:set var="photoList" value="${fn:split(b_re.b_re_photo, ',')}" />
		            <c:set var="firstPhoto" value="${photoList[0]}"/>
		            <div class="carousel-item active">
		                <img src="${pageContext.request.contextPath}/upload/${firstPhoto}" class="detail-img mx-auto d-block" 
		                style="width: 550px; height: 400px;" alt="First Photo" data-bs-toggle="modal" data-bs-target="#imageModal" onclick="previewImage(this)">
		            </div>
		            <c:forEach var="photo" items="${photoList}" varStatus="status">
		                <c:if test="${status.index != 0}">
		                    <div class="carousel-item">
		                        <img src="${pageContext.request.contextPath}/upload/${photo}" class="detail-img mx-auto d-block" 
		                        style="width: 550px; height: 400px;" alt="Photo" data-bs-toggle="modal" data-bs-target="#imageModal" onclick="previewImage(this)">
		                    </div>
		                </c:if>
		            </c:forEach>
		        </c:if>
		        <c:if test="${!fn:contains(b_re.b_re_photo, ',')}">
		            <div class="carousel-item active">
		                <img src="${pageContext.request.contextPath}/upload/${b_re.b_re_photo}" class="detail-img mx-auto d-block" style="width: 550px; height: 300px;" alt="Single Photo" 
		                data-bs-toggle="modal" data-bs-target="#imageModal" onclick="previewImage(this)">
		            </div>
		        </c:if>
		    </div>
		    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true" style="filter: invert(100%) sepia(0%) saturate(7500%) hue-rotate(0deg) brightness(100%) contrast(100%);"></span>
			    <span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true" style="filter: invert(100%) sepia(0%) saturate(7500%) hue-rotate(0deg) brightness(100%) contrast(100%);"></span>
			    <span class="visually-hidden">Next</span>
			</button>
		</div>
		<hr size="1" noshade="noshade" width="100%">
		<!-- 기본정보 -->
		<ul class="list-unstyled mt-4 mb-4">
			<h3 style="color:#dbcf30;">기본정보</h3>
			<li>주행거리 : ${b_re.car_mile} km</li>
			<li>차량번호 : ${b_re.car_cnumber}</li>
			<li>제조사 : ${b_re.car_maker}</li>
			<li>차명 : ${b_re.car_name}</li>
		</ul>
		<hr size="1" noshade="noshade" width="100%">
		<!-- 고객후기 -->
		<div class="row mt-4 mb-4">
		    <div class="col">
		        <h3 style="color: #dbcf30;">고객 후기</h3>
		        <div class="d-flex align-items-center">
		            <i class="bi bi-chat-dots" style="font-size:40px; margin-right:20px;"></i>
		            <span>${b_re.b_re_content}</span>
		        </div>
		    </div>
		</div>
		<hr size="1" noshade="noshade" width="100%">
		<!-- 검수자 정보 -->
		<div class="row mt-4 mb-4">
		    <div class="col">
		        <h3 style="color: #dbcf30;">검수자 정보</h3>
		        <ul class="list-unstyled mt-4">
		            <li class="d-inline-block align-middle">
		                <img src="${pageContext.request.contextPath}/upload/${b_re.checker_photo}" class="rounded-circle me-1" width="50" height="50">
		            </li>
		            <li class="d-inline-block align-middle">${b_re.checker_name} 검수자</li>
		        </ul>
		    </div>
		</div>
		<hr size="1" noshade="noshade" width="100%">
		<div class="text-end">
			<input type="button" class="btn btn-warning text-white me-1" value="목록" onclick="location.href='list.do'">
			<!-- 로그인한 회원번호와 작성자 회원번호가 일치해야 수정 가능 -->
			<c:if test="${user_num == b_re.mem_num}">
			<input type="button" class="btn btn-warning text-white" value="글 수정" onclick="location.href='modifyForm.do?b_re_num=${b_re.b_re_num}'">
			</c:if>
		</div>
		<!-- 댓글 시작 -->
		<div id="reply_div">
	    <span class="fw-bold">댓글 달기</span>
	    	<form id="b_re_comm_form" class="mt-3">
		        <input type="hidden" name="b_re_num" value="${b_re.b_re_num}" id="b_re_num">
		        <div class="input-group">
		            <textarea rows="3" cols="50" name="b_re_comm_content" id="b_re_comm_content" 
		            class="form-control rep-content"<c:if test="${empty user_num}">disabled="disabled"</c:if>><c:if test="${empty user_num}">로그인해야 작성할 수 있습니다.</c:if></textarea>
		        <c:if test="${!empty user_num}">
		            <div id="b_re_comm_second" class="input-group-append">
		            	<button type="submit" class="btn btn-warning text-white pt-5 pb-5">등록</button>
		            </div>
		        </c:if>
		        </div>
		        <c:if test="${!empty user_num}">
		            <div id="b_re_comm_first" class="mt-2">
		            	<span class="letter-count">300/300</span>
		            </div>
		        </c:if>
		    </form>
		</div>
		<!-- 댓글 목록 출력 시작 -->
		<div id="output" class="mt-5"></div>
		<div class="paging-button" style="display:none;">
			<input type="button" value="다음글 보기">
		</div>
		<div id="loading" style="display:none;">
			<img src="${pageContext.request.contextPath}/images/loading.gif" width="50" height="50">
		</div>
		<!-- 댓글 목록 출력 끝 -->
		<!-- 댓글 끝 -->
	</div>
</div>
</body>
<script type="text/javascript">
$(function(){
	let rowCount = 10;
	let currentPage;
	let count;
	/* ===============================
	 * 댓글 목록
	 * =============================== */
	//댓글 목록
	function selectList(pageNum){
		currentPage = pageNum;
		//로딩 이미지 노출
		$('#loading').show();
		//서버와 통신
		$.ajax({
			url:'listComm.do',
			type:'post',
			data:{pageNum:pageNum,rowCount:rowCount,b_re_num:$('#b_re_num').val()},
			dataType:'json',
			success:function(param){
				//로딩 이미지 감추기
				$('#loading').hide();
				count = param.count;
				
				if(pageNum==1){
					//처음 호출시는 해당 ID의 div의 내부 내용물을 제거
					$('#output').empty();
				}

			    $(param.list).each(function(index, item) {
			        let output = '<div class="card mb-3 border-0">';
			        output += '<div class="card-body">';
			        output += '<div class="d-flex align-items-center">';
			        output += '<img class="rounded-circle me-3" width="50" height="50" src="${pageContext.request.contextPath}/upload/' + item.mem_photo + '">';
			        output += '<h5 class="card-title mb-0">' + item.mem_id + '</h5>';
			        output += '</div>';
			        output += '<p class="card-text mt-2 mb-2">' + item.b_re_comm_content + '</p>';
			        output += '<p class="card-text mb-0"><small class="text-muted">등록일: ' + item.b_re_comm_reg + '</small></p>';
			        output += '</div>';
			        output += '</div>';
			        output += '<hr>';
			        
			        // 문서 객체에 추가
			        $('#output').append(output);
			    });
				
				//page button 처리
				if(currentPage>=Math.ceil(count/rowCount)){
					//다음 페이지가 없음
					$('.paging-button').hide();
				}else{
					//다음 페이지가 존재
					$('.paging-button').show();
				}
			},
			error:function(){
				$('#loading').hide();
				alert('네트워크 오류 발생');
			}
		});
	}
	//페이지 처리 이벤트 연결(다음 댓글 보기 버튼 클릭시 데이터 추가)
	$('.paging-button input').click(function(){
		selectList(currentPage + 1);
	});
	/* ===============================
	 * 댓글 등록
	 * =============================== */
	//댓글 등록
	$('#b_re_comm_form').submit(function(event){
		if($('#b_re_comm_content').val().trim()==''){
			alert('내용을 입력하세요');
			$('#b_re_comm_content').val('').focus();
			return false;
		}
		
		//form 이하의 태그에 입력한 데이터를 모두 읽어서 쿼리 스트링으로 반환
		let form_data = $(this).serialize();
		
		//서버와 통신
		$.ajax({
			url:'writeComm.do',
			type:'post',
			data:form_data,
			dataType:'json',
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인해야 작성할 수 있습니다.');
				}else if(param.result == 'success'){
					//폼 초기화
					initForm();
					//댓글 작성이 성공하면 새로 삽입한 글을 포함해서 첫 번째
					//페이지의 게시글 목록을 다시 호출함
					selectList(1);
				}else{
					alert('댓글 등록 오류');
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});		
		
		//기본 이벤트 제거
		event.preventDefault();
	});
	//댓글 작성 폼 초기화
	function initForm(){
		$('textarea').val('');
		$('#b_re_comm_first .letter-count').text('300/300');
	}

	/* ===============================
	 * 댓글 등록 및 수정 공통
	 * =============================== */
	//textarea에 내용 입력시 글자수 체크
	$(document).on('keyup','textarea',function(){
		//입력한 글자수 구함
		let inputLength = $(this).val().length;
		
		if(inputLength > 300){//300자를 넘어선 경우
			$(this).val($(this).val().substring(0,300));
		}else{//300자 이하인 경우
			let remain = 300 - inputLength;
			remain += '/300';
			if($(this).attr('id') == 'b_re_comm_content'){
				//등록폼 글자수
				$('#b_re_comm_first .letter-count').text(remain);
			}
		}
	});
	/* ===============================
	 * 초기 데이터(목록) 호출
	 * =============================== */
	selectList(1);
});
</script>
</html>
