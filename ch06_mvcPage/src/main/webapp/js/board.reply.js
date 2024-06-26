$(function(){
	let rowCount = 10;
	let currentPage;
	let count;
   /*====================================
	*댓글 목록
	* ====================================*/
	//댓글 목록
	function selectList(pageNum){
		currentPage = pageNum;
		//로딩 이미지 노출
		$('#loading').show();
		//서버와 통신
		$.ajax({
			url:'listReply.do',
			type:'post',
			//	  식별자   :숫자로바뀐변수
			data:{pageNum:pageNum,rowCount:rowCount,board_num:$('#board_num').val()},
			dataType:'json',
			success:function(param){
				//로딩 이미지 감추기
				$('#loading').hide(); // jQuery를 사용하여 HTML 요소를 숨기는 역할
				count = param.count;
				
				if(pageNum==1){ //이걸 명시하지않으면 댓글을 달 때 마다 데이터가 중첩된다.
					//처음 호출시는 해당 ID의 div의 내부 내용물을 제거
					$('#output').empty();
				}
				
				$(param.list).each(function(index,item){ //item은 댓글의 하나의 레코드라고 보면된다.
					let output = '<div class="item">';
					output +='<h4>' + item.id + '</h4>';
					output += '<div class="sub-item">';
					output += '<p>' + item.re_content + '</p>';
					
					if(item.re_modifydate){
						output += '<span class="modify-date">최근 수정일 : ' + item.re_modifydate + '</span>';
					}else{
						output += '<span class="modify-date">최근 등록일 : ' + item.re_date + '</span>';
					}
					//로그인한 회원번호와 작성자의 회원번호 일치 여부 체크
					if(param.user_num == item.mem_num){
						output +=' <input type="button" data-renum="'+ item.re_num +'" value="수정" class="modify-btn">';
						output +=' <input type="button" data-renum="'+ item.re_num +'" value="삭제" class="delete-btn">';
					}
					output +='<hr size="1" noshade width="100%">'
					output += '</div>';
					output += '</div>';
					
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
	//페이지 처리 이벤트 연결(다음 댓글 보기 버튼 클릭시 데이터 추가)
	$('.paging-button input').click(function(){
		selectList(currentPage + 1); //다음페이지를 보이게 하는법: 현재페이지에서 1페이지를 증가시킴
	});
	/*====================================
	*댓글 등록
	* ====================================*/
	//댓글 등록
	$('#re_form').submit(function(event){
		if($('#re_content').val().trim()==''){
			alert('내용을 입력하세요');
			$('#re_content').val('').focus();
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
		$('#re_first .letter-count').text('300/300'); //#re_first .letter-count 사이에 공백이 있는 경우는 후손선택자로 들어가기 때문에
	}
	
	/*====================================
	*댓글 수정
	* ====================================*/
	$(document).on('click','.modify-btn',function(){
		//댓글 번호
		let re_num = $(this).attr('data-renum');
		//댓글 내용 		
		//컨텐트의 바로위에부모 div중 p태그를 찾아서 br 태그를 \n으로 바꾼다(?)		//g:지정문자열 모두,i:대소문자 무시
		let content = $(this).parent().find('p').html().replace(/<br>/gi,'\n'); //<br>을 전부 검색 하는 법 //gi 안에 내용넣기. 콤마 다음은 바꿀내용. 즉 <br>을 \n으로 바꾼다.
		
		//댓글 수정폼 UI
		let modifyUI = '<form id="mre_form">';
		modifyUI += '<input type="hidden" name="re_num" id="mre_num" value="'+re_num+'">';
		modifyUI += '<textarea rows="3" cols="50" name="re_content" id="mre_content" class="rep-content">'+content+'</textarea>';
		modifyUI += '<div id="mre_first"><span class="letter-count">300/300</span></div>';
		modifyUI += '<div id="mre_second" class="align-right">';
		modifyUI += ' <input type="submit" value="수정">';
		modifyUI += ' <input type="button" value="취소" class="re-reset">';
		modifyUI += '</div>';
		modifyUI += '<hr size="1" noshade width="96%">';
		modifyUI += '</form>';
		
		//이전에 이미 수정하는 댓글이 있을경우 수정 버튼을 클릭하면 sub-item 클래스로 지정된 div를 환원시키고 수정폼을 제거함
		initModifyForm();
		
		//수정버튼을 감싸고 있는 div
		//this는 수정버튼. 수정버튼의 바로위에있는 div를 숨긴다.
		$(this).parent().hide();
		
		//수정폼을 수정하고자 하는 데이터가 있는 div에 노출
			//parent는 바로위에 부모, parents는 여러개 부모중 검색가능. 여기선 item을 찾아서 추가
		$(this).parents('.item').append(modifyUI);
		
		//입력한 글자수 셋팅
		let inputLength = $('#mre_content').val().length;
		let remain = 300 - inputLength;
		remain += '/300';
		
		//문서 객체에 반영
		$('#mre_first .letter-content').text(remain);
	});
	
	//댓글 수정폼 초기화
	function initModifyForm(){
		$('.sub-item').show();
		$('#mre_form').remove();
	}
	//수정폼에서 취소버튼 클릭시 수정폼 초기화 (취소버튼 누르면 수정폼이 사라짐)
	$(document).on('click','.re-reset',function(){
		initModifyForm();
	});
	//댓글 수정
	$(document).on('submit','#mre_form',function(event){
		if($('#mre_content').val().trim()==''){
			alert('내용을 입력하세요');
			$('#mre_content').val('').focus();
			return false;
		}
		
		//폼에 입력한 데이터 반환
		let form_data = $(this).serialize();
		
		//서버와 통신
		$.ajax({
			url:'updateReply.do',   
			type:'post',
			data:form_data,
			dataType:'json',
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인해야 수정할 수 있습니다.');
				}else if(param.result == 'success'){
					//수정된 댓글 내용을 화면에 반영하는 역할
					//mre_form 의 부모 div의 하위 p태그의 접근 후 html 괄호안에 수정된 내용을 넣어준다.
					$('#mre_form').parent().find('p').html($('#mre_content').val().replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/\n/g,'<br>'));
					$('#mre_form').parent().find('.modify-date').text('최근 수정일 : 5초 미만');
					
					//수정폼 삭제 및 초기화
					initModifyForm();
				}else if(param.result == 'wrongAccess'){
					alert('타인의 글을 수정할 수 없습니다.');
				}else{
					alert('댓글 수정 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류 발생');   
			}
		});
		
		//기본 이벤트 제거
		event.preventDefault();
	});
	/*====================================
	*댓글 등록 및 수정 공통
	* ====================================*/
	//textarea에 내용 입력시 글자 수 체크
	$(document).on('keyup','textarea',function(){
		//입력한 글자수 구함
		let inputLength = $(this).val().length;
		
		if(inputLength > 300){ //300자를 넘어선 경우
			$(this).val($(this).val().substring(0,300)); //substring: JavaScript 문자열 메서드로, 문자열의 일부를 추출. 두 인덱스를 사용하여 시작 위치와 끝 위치를 지정
			
		}else{//300자 이하인 경우
			let remain = 300 - inputLength;
			remain +='/300';
			if($(this).attr('id') == 're_content'){
				//등록폼 글자수
				$('#re_first .letter-count').text(remain);
			}else{
				//수정폼 글자수
				$('#mre_first .letter-count').text(remain);
			}
		}
	});	
	/*====================================
	*댓글 삭제
	* ====================================*/
	$(document).on('click','.delete-btn',function(){
		//댓글번호
		let re_num = $(this).attr('data-renum');
		//서버와 통신
		$.ajax({
			url:'deleteReply.do',
			type:'post',
			data:{re_num:re_num},
			dataType:'json',
			success:function(param){
				if(param.result=='logout'){
					alert('로그인해야 삭제할 수 있습니다.');
				}else if(param.result=='success'){
					alert('삭제 완료!');
					selectList(1); //삭제를 완료하면 다시 첫페이지를 호출
				}else if(param.result=="wrongAccess"){
					alert('타인의 글을 삭제할 수 없습니다.');
				}else{
					alert('댓글 삭제 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	});
	/*====================================
	*초기 데이터(목록) 호출
	* ====================================*/
	selectList(1); //댓글 목록의 function이름
});
	
