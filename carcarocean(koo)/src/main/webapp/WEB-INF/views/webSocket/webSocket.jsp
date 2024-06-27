<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container p-5" style="width:600px;">
		<h1 class="text-center">채팅 연습장</h1>
		<div id="chatting" style="height: 700px; overflow: auto; overflow-x:hidden;" class="border">
			<ul class="list-unstyled">
			<!-- 채팅이 추가되는 부분 -->
			</ul>
		</div>
		<form class="d-flex justify-content-center">
			<input id="textMessage" type="text" class="form-control form-control-lg" style="width:300px;" placeholder="메시지를 입력하세요.">
			<input onclick="sendMessage()" value="전송" type="button" class="btn btn-warning text-white">
			<input onclick="disconnect()" value="종료" type="button" class="btn btn-secondary">
		</form>
	</div>
	<script>
		//WebSocket 오브젝트 생성 (자동으로 접속 시작한다 - onopen 함수 호출)
		var webSocket = new WebSocket("ws://localhost:8080/carcarocean/websocket");
		const chatting = document.getElementById('chatting');
		
		//WebSocket 서버와 접속이 되면 호출되는 함수
		webSocket.onopen = function(message){
			const newDiv = document.createElement('div');
			newDiv.className = 'd-flex justify-content-end my-3';
			const newP = document.createElement('pre');
			newP.className = 'bg-warning border rounded-4 p-3 text-white';
			const newText = document.createTextNode('채팅을 시작합니다!\n1: 구매진행 중 입금 확인\n2: 내차 팔기 신청\n3: 카카오션 챗봇 전체메뉴\n4: 상담원과 1대1 톡상담');
			newP.appendChild(newText);
			newDiv.appendChild(newP);
			chatting.appendChild(newDiv);
		};
		
		//WebSocket 서버로 부터 메시지가 오면 호출되는 함수
		webSocket.onmessage = function(message){
			const newDiv = document.createElement('div');
			newDiv.className = 'd-flex justify-content-end my-3';
			const newP = document.createElement('p');
			newP.className = 'bg-warning border rounded-4 p-3 text-white';
			const newText = document.createTextNode('카카오션: ' + message.data);
			newP.appendChild(newText);
			newDiv.appendChild(newP);
			chatting.appendChild(newDiv);
		};
		
		//send 버튼을 누르면 호출되는 함수
		function sendMessage(){
			//송신 메시지를 작성하는 텍스트 박스 오브젝트를 취득한다.
			var message = document.getElementById("textMessage");
			//WebSocket 서버에 메시지를 송신한다.
			webSocket.send(message.value);
			const newDiv = document.createElement('div');
			newDiv.className = 'd-flex justify-content-start my-3';
			const newP = document.createElement('p');
			newP.className = 'bg-warning border rounded-4 p-3 text-white';
			const newText = document.createTextNode('나: ' + message.value);
			newP.appendChild(newText);
			newDiv.appendChild(newP);
			chatting.appendChild(newDiv);
			message.value ="";
		};
		
		//Disconnect 버튼을 누르면 호출되는 함수
		function disconnect(){
			webSocket.close();
		};
		
		//WebSockcet 서버와 접속이 끊기면 호출되는 함수
		webSocket.onclose = function(message){
			const newDiv = document.createElement('div');
			newDiv.className = 'd-flex justify-content-center my-3';
			const newP = document.createElement('p');
			newP.className = 'bg-warning border rounded-4 p-3 text-white';
			const newText = document.createTextNode('채팅 종료!');
			newP.appendChild(newText);
			newDiv.appendChild(newP);
			chatting.appendChild(newDiv);
		};
		
		//WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수
		webSocket.onerror = function(message){
			const newDiv = document.createElement('div');
			newDiv.className = 'd-flex justify-content-center my-3';
			const newP = document.createElement('p');
			newP.className = 'bg-warning border rounded-4 p-3 text-white';
			const newText = document.createTextNode('서버 에러 발생!');
			newP.appendChild(newText);
			newDiv.appendChild(newP);
			chatting.appendChild(newDiv);
		};
	</script>
</body>
</html>