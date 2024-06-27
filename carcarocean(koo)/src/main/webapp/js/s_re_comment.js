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
					if (item.mem_photo != null) {
			            output += '<img class="rounded-circle me-3" width="50" height="50" src="${pageContext.request.contextPath}/upload/' + item.mem_photo + '">';
			        } else {
			            // 만약 mem_photo가 null인 경우, 기본 이미지를 사용
			            output += '<img class="rounded-circle me-3" width="50" height="50" src="../images/face.png">';
			        }
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