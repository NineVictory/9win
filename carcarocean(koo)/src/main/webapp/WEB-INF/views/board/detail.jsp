<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 상세</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/board.report.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<h2 class="pt-5 pb-3">자유 게시판</h2>
		<hr size="1" noshade="noshade" width="100%">
		<div class="mt-4 mb-4 d-flex justify-content-between align-items-center">
			<!-- 제목 -->
			<div class="text-start fs-3 mt-1">${board.board_title}</div>
			<!-- 작성일 -->
			<div class="text-end">
				<c:if test="${empty board.board_modify}">
					${fn:substring(board.board_reg, 0, 10)}
				</c:if>
				<c:if test="${!empty board.board_modify}">
					${fn:substring(board.board_modify, 0, 10)}
				</c:if>
			</div>
		</div>
    	<hr size="1" noshade="noshade" width="100%">
    	<div class="mt-1 mb-1 d-flex justify-content-between align-items-center">
    	  <!-- 작성자 정보 -->
        <div class="d-flex align-items-center">
            <div class="me-3 d-inline">
                <img src="${pageContext.request.contextPath}/upload/${board.mem_photo}" class="rounded-circle" width="30" height="30">
            </div>
            <div class="me-4 d-inline">${board.mem_id}</div>
        </div>
        <!-- 조회수 -->
        <div class="text-end">
            <div class="d-inline">조회수 : ${board.board_hit}</div>
        </div>
    </div>
		<hr size="1" noshade="noshade" width="100%">
		<c:if test="${!empty board.board_photo}">
			<div class="text-center">
				<c:forEach var="photo" items="${fn:split(board.board_photo, ',')}">
					<div class="col-12 text-center mb-2">
						<img src="${pageContext.request.contextPath}/upload/${photo}" width="600" height="400">
					</div>
				</c:forEach>
			</div>
		</c:if>
		<p class="fs-5">${board.board_content}</p>
		<hr size="1" noshade="noshade" width="100%">
		<ul class="detail-sub list-unstyled text-end">
			<li class="text-end">
				<!-- 신고 -->
				<div class="d-flex justify-content-center align-items-center mb-3">
				<input type="button" class="btn btn-warning text-white" value="목록" onclick="location.href='list.do'">
				</div>
				<p id="report_status_text"></p>
				<%-- <img id="output_report" data-num="${board.board_num}" src="${pageContext.request.contextPath}/images/report01.png" width="50" data-checkRedirect="${check_redirect}"> --%>
				<button class="btn btn-outline-danger text-end" onclick="" id="output_report" data-num="${board.board_num}" data-checkRedirect="${check_redirect}"><i id="reportIcon" class="bi bi-exclamation-octagon-fill">신고</i></button>
			</li>
		</ul>
		<div class="text-end">
			<div class="mt-3">
				<c:if test="${user_num == board.mem_num}">
					<input type="button" class="btn btn-warning text-white fw-bold" value="수정" onclick="location.href='updateForm.do?board_num=${board.board_num}'">
					<input type="button" class="btn btn-warning text-white fw-bold" value="삭제" id="delete_btn">
					<script type="text/javascript">
						const delete_btn = document.getElementById('delete_btn');
						delete_btn.onclick=function(){
							let choice = confirm('삭제하시겠습니까?');
							if(choice){
								location.replace('delete.do?board_num=${board.board_num}');
							}
						};
					</script>
				</c:if>
			</div>
		</div>
		<!-- 댓글 시작 -->
		<div id="reply_div">
			<span class="fw-bold">댓글 달기</span>
			<form id="bor_comm_form" class="mt-3">
				<input type="hidden" name="board_num" value="${board.board_num}" id="board_num">
				<div class="input-group">
					<textarea rows="3" cols="50" name="bor_comm_content" id="bor_comm_content" 
					class="form-control rep-content"<c:if test="${empty user_num}">disabled="disabled"</c:if>><c:if test="${empty user_num}">로그인해야 작성할 수 있습니다.</c:if></textarea>
					<c:if test="${!empty user_num}">
						<div id="bor_comm_second" class="input-group-append">
							<input type="submit" value="전송" class="btn btn-warning text-white pt-5 pb-5">
						</div>
					</c:if>
				</div>
				<c:if test="${!empty user_num}">
					<div id="bor_comm_first" class="mt-2">
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
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
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
			url:'listReply.do',
			type:'post',
			data:{pageNum:pageNum,rowCount:rowCount,board_num:$('#board_num').val()},
			dataType:'json',
			success:function(param){
				//로딩 이미지 감추기
				$('#loading').hide();
				count = param.count;
				
				if(pageNum==1){
					//처음 호출시는 해당 ID의 div의 내부 내용물을 제거
					$('#output').empty();
				}
				
				$(param.list).each(function(index,item){
					let output = '<div class="card mb-3 border-0">';
			        output += '<div class="card-body">';
			        output += '<div class="d-flex align-items-center">';
			        output += '<img class="rounded-circle me-3" width="50" height="50" src="${pageContext.request.contextPath}/upload/' + item.mem_photo + '">';
			        output += '<h5 class="card-title mb-0">' + item.mem_id + '</h5>';
			        output += '</div>';
			        output += '<p class="card-text mt-2 mb-2">' + item.bor_comm_content + '</p>';
			        output += '<p class="card-text mb-0"><small class="text-muted">등록일: ' + item.bor_comm_reg + '</small></p>';
			        output += '</div>';
			        output += '</div>';
			        output += '<hr>';
					
					//문서 객체에 추가
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
	$('#bor_comm_form').submit(function(event){
		if($('#bor_comm_content').val().trim()==''){
			alert('내용을 입력하세요');
			$('#bor_comm_content').val('').focus();
			return false;
		}
		
		//form 이하의 태그에 입력한 데이터를 모두 읽어서 쿼리 스트링으로 반환
		let form_data = $(this).serialize();		
		
		//서버와 통신
		$.ajax({
			url:'writeReply.do',
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
		$('#bor_comm_first .letter-count').text('300/300');
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
			if($(this).attr('id') == 'bor_comm_content'){
				//등록폼 글자수
				$('#bor_comm_first .letter-count').text(remain);
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