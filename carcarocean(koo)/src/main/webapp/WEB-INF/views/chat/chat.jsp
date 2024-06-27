<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<title>채팅</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
.noto-sans-kr-<uniquifier> {
  font-family: "Noto Sans KR", sans-serif;
  font-optical-sizing: auto;
  font-weight: <weight>;
  font-style: normal;
}
</style>
</head>
<body style="font-family:Noto Sans KR;">
	<%-- <jsp:include page="/WEB-INF/views/common/loading.jsp" /> --%>
	<div class="container bg-light my-3 rounded">
		<div class="container d-flex justify-content-between rounded-top p-3">
			<div class="float-start align-self-center">
				<button onclick="history.back()" class="btn btn-warning text-white fw-bold">뒤로가기</button>
			</div>
			<div class="align-self-center me-3 fs-3">
				<span class="fw-bold" id="partner"></span>님과의 채팅
			</div>
			<div>
				<img class="rounded-circle" width="60px;" height="60px" src="${pageContext.request.contextPath}/upload/${user.mem_photo}">
			</div>
		</div>
		<hr>
		
		<div id="chatRoom" style="overflow-x:hidden; overflow-y:scroll; height:670px;">
			
		</div>
		
		<hr>
		<form id="form" class="d-flex justify-content-center rounded-bottom p-3">
			<input type="text" class="form-control text-center" id="message" name="message" style="width:500px;" placeholder="채팅을 입력하세요">
			<input type="button" id="submitButton" class="btn btn-warning btn-lg text-white fw-bold" value="전송">
		</form>
	</div>
	<script>
		window.onload = function(){
			let message_socket = new WebSocket("ws://localhost:8080/carcarocean/webSocket");
			message_socket.onopen = function(evt) {
					message_socket.send("used");
			};
			//서버로부터 메시지를 받으면 호출되는 함수 지정
			message_socket.onmessage = function(evt) {
				//메시지 알림
				let data = evt.data;
				if (data.substring(0, 4) == "used") {
					/* console.log('데이터 처리'); */
					getChat();
				}
			};
			message_socket.onclose = function(evt) {
				//소켓이 종료된 후 부과적인 작업이 있을 경우 명시
				//console.log('chat close');
				//alert('채팅이 종료되었습니다!');
			};			
			
			/* setInterval(function() {
		        getChat(${item_num}, ${chat_receiver}, ${chat_giver});
		    }, 3000); */
			$('#message').keypress(function(key){
				if(key.keyCode==13){
 					key.preventDefault();
 					$('#submitButton').trigger('click');
				}
			});
		    
		    $('#submitButton').click(function(){
		    	if($('#message').val()=='' || $('#message').val()==null){
		    		alert('채팅을 입력하세요');
		    		return false;
		    	}
		    	$.ajax({
					url:'chatAjax.do',
					type:'post',
					data:{item_num:"${item_num}",message:$('#message').val(),chat_receiver:"${chat_receiver}",chat_giver:"${chat_giver}"},
					dataType:'json',
					success:function(param){
						$('#message').val('').focus();
						message_socket.send('used');
					},
					error:function(){
						message_socket.close();
					}
					
				});
		    });
		    
			function getChat(){
				$('#chatRoom').empty();
				$.ajax({
					url:'getChatAjax.do',
					type:'get',
					data:{item_num:${item_num},chat_receiver:${chat_receiver},chat_giver:${chat_giver}},
					dataType:'json',
					success:function(param){
						for(let i=0; i<param.chatList.length; i++){
							const chat = param.chatList[i];
							//내가 받은 채팅임
							if(chat.receiver.mem_num==${user_num}){
								$('#chatRoom').append('<div class="d-flex justify-content-start">'
										+'<div class="border rounded-4 bg-warning fw-bold p-2 my-2 fs-5">'
										+'<img src="../upload/'+param.receiver.mem_photo+'" class="rounded-circle me-2" width="35px" height="35px">'
										+param.receiver.mem_id+'님 : ' + chat.chat_message+'</div>'
										+'<span class="small align-self-center ms-2 text-secondary fw-bold">'
										+chat.chat_reg.substring(10,16)+'</span></div>');
							}
							
							//내가 보낸 채팅임
							else if(chat.giver.mem_num==${user_num}){ // 내가 채팅을 보낸 입장일 때
								$('#chatRoom').append('<div class="d-flex justify-content-end">'
										+'<span class="small align-self-center me-2 text-secondary fw-bold">'
										+chat.chat_reg.substring(10,16)+'</span>'
										+'<div class="border rounded-4 bg-warning fw-bold p-2 my-2 fs-5">'
										+'<img src="../upload/'+param.giver.mem_photo+'" class="rounded-circle me-2" width="35px" height="35px">'
										+param.giver.mem_id+'님 : ' + chat.chat_message+'</div></div>');
							}
						}
						$('#partner').empty();
						$('#partner').append(param.receiver.mem_id);
						// 스크롤을 제일 아래로 이동
			            $('#chatRoom').scrollTop($('#chatRoom')[0].scrollHeight);
					},
					error:function(){
						messge_socket.close();
					}
				});
			};
		    
		};
	</script>
</body>
</html>