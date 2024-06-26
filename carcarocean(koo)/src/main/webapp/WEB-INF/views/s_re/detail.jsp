<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>글상세</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="container"> 
	<div>
		<div class="mt-4 mb-4"> 
			<div class="text-start fs-4 mt-1">${s_re.s_re_title}</div>
		</div>
		<hr size="1" noshade="noshade" width="100%">
		<div class="mt-1 mb-1 d-flex justify-content-between align-items-center">
			<!-- 작성자 정보 -->
			<div class="d-flex align-items-center">
				<div class="me-3 d-inline">
				<img src="${pageContext.request.contextPath}/upload/${s_re.mem_photo}" class="rounded-circle me-1" width="30" height="30">
				</div>
				<div class="me-4 d-inline">${s_re.mem_id}</div>
			</div>
			<!-- 작성일 -->
			<div class="text-end">
				<c:if test="${!empty s_re.s_re_modify}">
					${fn:substring(s_re.s_re_modify, 0, 10)}
				</c:if>
				<c:if test="${empty s_re.s_re_modify}">
					${fn:substring(s_re.s_re_reg, 0, 10)}
				</c:if>
			</div>
		</div>
		<hr size="1" noshade="noshade" width="100%">
		<!-- 기본정보 -->
		<ul class="list-unstyled mt-4 mb-4">
			<h3 style="color:#dbcf30;">기본정보</h3>
			<li>주행거리 : ${sellvo.sell_mile} km</li> 
			<li>차량번호 : ${sellvo.sell_cnumber}</li> 
			<li>제조사 : ${sellvo.sell_maker}</li> 
			<li>차명 : ${sellvo.sell_cname}</li> 
			<li>방문진단 요청지역 : ${sellvo.sell_place1} /  ${sellvo.sell_place2}</li> 
			<c:if test="${sellvo.sell_check == 0}">
			검수완료여부 : 검수 미완료<br>
			</c:if>
			<c:if test="${sellvo.sell_check == 1}">
			검수완료여부 : 검수 진행중<br>
			</c:if>
			<c:if test="${sellvo.sell_check == 2}">
			검수완료여부 : 검수 완료<br>
			</c:if>
		</ul>
		<hr size="1" noshade="noshade" width="100%">
		<!-- 고객후기 -->
		<div class="row mt-4 mb-4">
		    <div class="col">
		        <h3 style="color: #dbcf30;">고객 후기</h3>
		        <div class="d-flex align-items-center">
		            <i class="bi bi-chat-dots" style="font-size:40px; margin-right:20px;"></i>
		            <span>${s_re.s_re_content}</span>
		        </div>
		    </div>
		</div>
		<hr size="1" noshade="noshade" width="100%">
		<ul class="list-unstyled text-end">
			<li>
				<%-- 로그인한 회원번호와 작성자 회원번호가 일치해야 수정, 삭제 가능 --%>
				<c:if test="${user_num == s_re.mem_num}">
					<input type="button" value="수정" class="btn btn-warning text-white" onclick="location.href='updateForm.do?s_re_num=${s_re.s_re_num}'">
					<input type="button" value="삭제" class="btn btn-warning text-white" id="delete_btn">
					<script type="text/javascript">
						const delete_btn = document.getElementById('delete_btn')
						//이벤트 연결
						delete_btn.onclick=function(){
							let choice = confirm('삭제하시겠습니까?');
							if(choice){
								location.replace('delete.do?s_re_num=${s_re.s_re_num}');
							}
						};
					</script>
				</c:if>
			</li>
		</ul>
		<!-- 댓글 시작 -->
		<div id = "reply_div">
			<span class="fw-bold">댓글 달기</span>
			<form id="s_re_form" class="mt-3">
				<input type="hidden" name="s_re_num" value="${s_re.s_re_num}" id="s_re_num">
				<!-- disabled는 댓글을 달지 못하도록 비활설화 시키는 역할 -->
				<div class="input-group">
					<textarea rows="3" cols="50" name="s_re_comm_content" id="s_re_comm_content"
					class="form-control rep-content"<c:if test="${empty user_num}">disabled="disabled"</c:if> 
					class="s_re_comm_content"><c:if test="${empty user_num}">로그인해야 작성할 수 있습니다</c:if></textarea>
				<c:if test="${!empty user_num}">
					<div id="re_second" class="input-group-append">
						<input type="submit" class="btn btn-warning text-white pt-5 pb-5" value="등록">
					</div>
				</c:if>
				</div>
				<c:if test="${!empty user_num}">
				<div id="s_re_first" class="mt-2">
					<span class="s_re_letter-count">300/300</span><!-- 글자수 제한  -->
				</div>
				</c:if>
			</form>
		</div>
			<!-- 댓글 목록 출력 시작 -->
			<div id="output" class="mt-5"></div>
			<div class="paging-button" style="display:none;">
				<input type="button" value="다음글 보기">
			</div>
			<div id="loading" style="display:none">
				<img src="${pageContext.request.contextPath}/images/loading.gif" width="50" height="50">
			</div>
			<!-- 댓글 목록 출력 끝 -->

		<!-- 댓글 끝 -->
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
<script type="text/javascript">
$(function(){
	let rowCount = 10;
	let currentPage;
	let count;
   /*====================================
	*댓글 목록
	* ====================================*/
	function selectList(pageNum){
		currentPage = pageNum;
		//로딩 이미지 노출
		$('#loading').show();
		//서버와 통신
		$.ajax({
			url:'listReply.do',
			type:'post',
			//	  식별자   :숫자로바뀐변수
			data:{pageNum:pageNum,rowCount:rowCount,s_re_num:$('#s_re_num').val()},
			dataType:'json',
			success:function(param){
				//로딩 이미지 감추기
				$('#loading').hide(); // jQuery를 사용하여 HTML 요소를 숨기는 역할
				count = param.count;
				
				if(pageNum==1){
					//처음 호출시는 해당 ID의 div의 내부 내용물을 제거
					$('#output').empty();
				}
				
				$(param.list).each(function(index,item){ //item은 댓글의 하나의 레코드라고 보면된다.
					let output = '<div class="card mb-3 border-0">';
					output += '<div class="card-body">';
					output += '<div class="d-flex align-items-center">';
			        output += '<img class="rounded-circle me-3" width="50" height="50" src="${pageContext.request.contextPath}/upload/' + item.mem_photo + '">';
					output +='<h5 class="card-title mb-0">' + item.mem_id + '</h5>';
					output += '</div>';
					output += '<p class="card-text mt-2 mb-2">' + item.s_re_comm_content + '</p>';
					output += '<p class="card-text mb-0"><small class="text-muted">등록일 : ' + item.s_re_comm_reg + '</small></p>';
					output += '</div>';
					output += '</div>';
					output += '<hr>';
					
					//문서 객체에 추가
					$('#output').append(output);
				});
				
				//page button 처리
				//currentPage: 현재 페이지를 나타내는 변수
				//count: 전체 댓글의 개수
				//rowCount: 한 페이지에 보여질 댓글의 개수
				if(currentPage>=Math.ceil(count/rowCount)){ //Math.ceil() 함수는 주어진 숫자를 올림하여 반환
					//다음페이지가 없음
					$('.paging-button').hide();
				}else{
					//다음페이지가 존재
					$('.paging-button').show();
				}
				
			},
			error:function(){
				$('#loading').hide();
				alert('네트워크 오류 발생');
			}
			
		});
	}
	/*====================================
	*댓글 등록
	* ====================================*/
	//댓글 등록
	$('#s_re_form').submit(function(event){
		if($('#s_re_comm_content').val().trim()==''){
			alert('내용을 입력하세요');
			$('#s_re_comm_content').val('').focus();
			return false;
		}
		
		//form 이하의 태그에 입혁한 데이터를 모두 읽어서 쿼리 스트링으로 반환
		let form_data = $(this).serialize(); //serialize: jQuery 메서드로 폼 데이터를 URL 인코딩된 문자열로 직렬화
		
		//서버와 통신
		$.ajax({
			url:'writeReply.do',
			type:'post',
			data:form_data,
			dataType:'json',
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인을 해야 작성할 수 있습니다.');
				}else if(param.result == 'success'){
					//로그인 성공시 폼 초기화를 해야됨.
					initForm(); //아래에 만들어둔 initForm을 호출 (초기화 하는 역할)
					//댓글 작성이 성공하면 새로 삽입한 글을 포함해서 첫번째 페이지에 게시글 목록을 다시 호출함.
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
		$('#s_re_first .s_re_letter-count').text('300/300'); //#re_first .s_re_letter-count 사이에 공백이 있는 경우는 후손선택자로 들어가기 때문에
	}
	//textarea에 내용 입력시 글자 수 체크
	$(document).on('keyup','textarea',function(){
		//입력한 글자수 구함
		let inputLength = $(this).val().length;
		
		if(inputLength > 300){ //300자를 넘어선 경우
			$(this).val($(this).val().substring(0,300)); //substring: JavaScript 문자열 메서드로, 문자열의 일부를 추출. 두 인덱스를 사용하여 시작 위치와 끝 위치를 지정
			
		}else{//300자 이하인 경우
			let remain = 300 - inputLength;
			remain +='/300';
			if($(this).attr('id') == 's_re_comm_content'){
				//등록폼 글자수
				$('#s_re_first .s_re_letter-count').text(remain);
			}
		}
	});
	
	/*====================================
	*초기 데이터(목록) 호출
	* ====================================*/
	selectList(1); //댓글 목록의 function이름
	});
</script>
</html>