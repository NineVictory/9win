<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챗봇</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
</head>
<body>
	<!-- 챗봇 시작-->
	<i
		class="bi bi-chat-dots-fill position-fixed bottom-0 end-0 m-3 pb-5 pe-5"
		style="font-size: 2rem; color: #FFD700;" data-bs-toggle="modal"
		data-bs-target="#chatbot"> </i>

	<!-- 모달 -->
	<div class="modal fade" id="chatbot" tabindex="-1"
		aria-labelledby="chatbotLabel" aria-hidden="true"
		data-bs-backdrop="static">
		<div
			class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header bg-warning">
					<h4 class="modal-title" id="chatbotLabel">
					<img src="${pageContext.request.contextPath}/images/logo.png" style="height: 60px;">
						<b>챗봇</b>
					</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
				<img src="${pageContext.request.contextPath}/images/bot.png" style="height: 40px;">
					<div class="d-inline-block border rounded bg-light p-3">
						<ul class="list-unstyled">
							<li><span class="float-start">
							안녕하세요. 24시간 깨어있는 carcaroean 
									챗봇이에요🚗 무엇을 도와드릴까요? <br>
									궁금한 내용을 선택하거나 채팅으로 물어보세요.</span></li>
						</ul>
					</div>
					<br><br>
					<ul class="nav flex-column rounded">
             	<!-- 첫번째 토글 -->
                 <li class="my-3 text-left fw-bold">
					<a data-bs-toggle="collapse" type="button" href="#collapseExample1" aria-expanded="false" aria-controls="collapseExample1" class="btn btn-warning text-white">
						구매진행 중 입금 확인
					</a>
					 <div class="collapse mt-3" id="collapseExample1">
						<div class="row justify-content-center">
							<div class="card card-body" style="width: 300px;">
								온라인으로 구매하셨을 경우 로그인 후 마이페이지를 확인하세요. 오프라인 구매는 차량을 구매하신 매장 또는 차량평가사에게 문의해주세요.
							</div>
						</div>
					 </div>
                 </li>
                  <li class="my-3 text-left fw-bold">
					<a data-bs-toggle="collapse" type="button" href="#collapseExample2" aria-expanded="false" aria-controls="collapseExample2" class="btn btn-warning text-white">
						내차 팔기 신청
					</a>
					<div class="collapse mt-3" id="collapseExample2">
						<div class="row justify-content-center">
							<div class="card card-body" style="width: 300px;">
								마이페이지 => 거래내역
							</div>
						</div>
					 </div>
                 </li>  
                 <li class="my-3 text-left fw-bold">
					<a data-bs-toggle="collapse" type="button" href="#collapseExample3" aria-expanded="false" aria-controls="collapseExample3" class="btn btn-warning text-white">
						카카오션 챗봇 전체메뉴
						
					</a>
						<div class="collapse mt-3" id="collapseExample3">
						<div class="row justify-content-center">
							<div class="card card-body" style="width: 300px;">
								메뉴들 대충 링크걸어서 넣기
							</div>
						</div>
					 </div>
                 </li>
                 <li class="my-3 text-left fw-bold">
					<a data-bs-toggle="collapse" type="button" href="#collapseExample4" aria-expanded="false" aria-controls="collapseExample4" class="btn btn-warning text-white">
						상담원과 1대1 톡상담
						
					</a>
						<div class="collapse mt-4" id="collapseExample4">
						<div class="row justify-content-center">
							<div class="card card-body" style="width: 300px;">
								카카오톡 채팅 상담시간
								09:00~17:40 (평일, 점심시간 11:40~13:00)
							</div>
						</div>
					 </div>
                 </li>
                 
                 </ul>
					<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-warning text-white" onclick="location.href='${pageContext.request.contextPath}/qa/list.do'">문의하기</button>
				</div>
			
			</div>
			</div>
		</div>
	</div>
	<!-- 챗봇 끝 -->
<!-- <script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
Popper.js
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
Bootstrap JS	 -->
</body>

<script>
	// Popover와 Tooltip을 초기화하는 함수
	$(document).ready(function() {
		$('[data-bs-toggle="popover"]').popover();
		$('[data-bs-toggle="tooltip"]').tooltip();
	});
</script>
</html>
