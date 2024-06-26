<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logo.png"/>
<title>차량 상세 정보</title>
<style>
	.myList li{
		margin-top:15px; 
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
	<fmt:formatNumber value="${car.car_price}" type="number" var="carPrice"/>
	<fmt:formatNumber value="${car.car_price*0.07}" pattern="#" type="number" var="firstPrice"/>
	<fmt:formatNumber value="${car.car_price*0.005}" pattern="#" type="number" var="secondPrice"/>
	<fmt:formatNumber value="${car.car_price*0.0009}" pattern="#" type="number" var="thirdPrice"/>
	
	<fmt:formatNumber value="${car.car_price+firstPrice+secondPrice+thirdPrice}" type="number" var="totalPrice"/>
		<div class="p-3">
			<h1 class="fw-bold">${car.car_maker} ${car.car_name}</h1>
			<div class="d-flex justify-content-between">
				<div class="mb-3">
					<b>${car.car_cnumber}</b>
					<div class="vr me-2 ms-1"></div>${fn:substring(car.car_birth,2,4)}년 ${fn:substring(car.car_birth,5,7)}월식
					<div class="vr me-2 ms-1"></div>${car.car_mile}km
					<div class="vr me-2 ms-1"></div>
						<c:if test="${car.car_fuel_type==1}">가솔린</c:if>
						<c:if test="${car.car_fuel_type==2}">디젤</c:if>
						<c:if test="${car.car_fuel_type==3}">전기</c:if>
						<c:if test="${car.car_fuel_type==4}">수소</c:if>
					<div class="vr me-2 ms-1"></div>${car.car_color}
					<div class="vr me-2 ms-1"></div>
						<c:if test="${car.car_auto==1}">오토</c:if>
						<c:if test="${car.car_auto==2}">수동</c:if>
					<div class="vr me-2 ms-1"></div>${car.car_price}만원
				</div>
				<c:if test="${user_auth==9}">
				<div>
					<button class="btn btn-warning text-white fw-bold" onclick="update_car()" id="update_btn">수정하기</button>
				</div>
				</c:if>
			</div>
		</div>
		<div class="d-flex justify-content-between border rounded-top bg-warning">
			<div class="p-3 fw-bold fst-italic text-secondary">#${fn:substring(car.car_design_op,0,25)} #${fn:substring(car.car_con_op,0,25)} #${fn:substring(car.car_drive_op,0,25)}</div>
			<div class="p-3"><b class="text-danger"><i class="bi bi-telephone-fill"> </i>${checker.checker_phone}</b><div class="vr me-2 ms-2"></div>${checker.checker_name}</div>
		</div>
		<!-- 갤러리 사진 옆으로 넘기기 구현해야 함 -->
		<div class="text-center">
			<c:if test="${fn:contains(car.car_photo, ',')}">
        		<c:set var="photoList" value="${fn:split(car.car_photo, ',')}" />
        		<c:set var="firstPhoto" value="${photoList[0]}"/>
        		<div id="carouselExample" class="carousel slide">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="${pageContext.request.contextPath}/upload/${firstPhoto}" class="d-block rounded-bottom" width="1296px" height="700px" alt="...">
						</div>
					<c:forEach var="photo" items="${photoList}" begin="1">
						<div class="carousel-item">
							<img src="${pageContext.request.contextPath}/upload/${photo}" class="d-block rounded-bottom" width="1296px" height="700px" alt="...">
						</div>
					</c:forEach>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
       		</c:if>
			<c:if test="${!fn:contains(car.car_photo, ',')}">
				<img src="${pageContext.request.contextPath}/upload/${car.car_photo}" width="1296px" height="700px" class="rounded-bottom">
			</c:if>
		</div>
		<!-- 사진 아래 컨텐츠 -->
	    <div class="container-fluid">
	        <div class="row">
	            <!-- 차량 상세정보 들어갈 공간 -->
	            <main class="col-md-9">
	            	<div class="border rounded mt-5 p-4">
	            		<div class="text-center">
	            			<span><b class="fs-2 text-danger">${carPrice}</b><b class="fs-5"> 만원</b></span>
	            		</div>
	            		<div class="mt-3 text-center">
	            			<span class="text-secondary fs-5">할부 </span><span class="fs-5 text-decoration-underline fw-bold">월 <b class="text-danger"><fmt:formatNumber type="number" value="${car.car_price/60}" pattern="#"/></b> 만원</span>
	            		</div>
	            		<div class="row mt-3 align-items-center">
	            			<div class="col-5 border rounded ms-5" style="cursor:pointer;" data-bs-toggle="modal" data-bs-target="#exampleModal">
								<div class="row text-center align-items-center">
									<div class="col-3">
										<i class="bi bi-car-front-fill" style="font-size: 3rem;"></i>
									</div>
									<div class="col-7">
										<span class="fs-5 fw-bold text-secondary">차량 기본정보 상세</span>
									</div>
									<div class="col-2">
										<i class="bi bi-caret-right-fill" style="font-size: 1.5rem;"></i>
									</div>
								</div>
	            			</div>
							<div class="modal" id="exampleModal" tabindex="-1">
								<div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title"><b>차량 기본정보 상세</b></h4>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body p-4">
											<div class="row">
												<div class="col-3">
													<ul class="list-unstyled fw-bold myList">
														<li>제조사</li>
														<li>차명</li>
														<li>차종</li>
														<li>연식</li>
														<li>배기량</li>
														<li>연료</li>
														<li>연비</li>
														<li>주행거리</li>
														<li>가격</li>
													</ul>
												</div>
												<div class="col-3 border-end">
													<ul class="list-unstyled text-secondary myList">
														<li>${car.car_maker}</li>
														<li>${car.car_name}</li>
														<li>${car.car_size}</li>
														<li>${car.car_birth}</li>
														<li>${car.car_cc}</li>
														<li>${car.car_fuel_type}</li>
														<li>${car.car_fuel_efficiency}</li>
														<li>${car.car_mile}</li>
														<li>${car.car_price}</li>
													</ul>
												</div>
												<div class="col-3">
													<ul class="list-unstyled fw-bold myList">
														<li>색상</li>
														<li>변속기</li>
														<li>사용기간</li>
														<li>사고이력</li>
														<li>사용자 변경 횟수</li>
														<li>디자인 옵션</li>
														<li>편의 옵션</li>
														<li>주행 옵션</li>
													</ul>
												</div>
												<div class="col-3 border-end">
													<ul class="list-unstyled text-secondary myList">
														<li>${car.car_color}</li>
														<li>${car.car_auto}</li>
														<li>${car.car_use}</li>
														<li>${car.car_accident}</li>
														<li>${car.car_owner_change}</li>
														<li>${car.car_design_op}</li>
														<li>${car.car_con_op}</li>
														<li>${car.car_drive_op}</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

	            			<div class="col-5 border rounded ms-5" style="cursor:pointer;" onclick="location.href='#checkerInfo'">
	            				<div class="row text-center align-items-center">
									<div class="col-3">
										<i class="bi bi-file-person-fill" style="font-size: 3rem;"></i>
									</div>
									<div class="col-7">
										<span class="fs-5 fw-bold text-secondary">차량평가사 정보</span>
									</div>
									<div class="col-2">
										<i class="bi bi-caret-right-fill" style="font-size: 1.5rem;"></i>
									</div>
								</div>
	            			</div>
	            		</div>
	            	</div>
	            	
	            	<div class="mt-5">
            			<div class="border rounded p-5">
            				<div class="row text-center">
	            				<div class="col-4 fw-bold">
	            					<h5>디자인 옵션</h5>
	            					<b>${car.car_design_op}</b>
	            				</div>
	            				<div class="col-4 fw-bold">
	            					<h5>편의 옵션</h5>
	            					<b>${car.car_con_op}</b>
	            				</div>
	            				<div class="col-4 fw-bold">
	            					<h5>주행 옵션</h5>
	            					<b>${car.car_drive_op}</b>
	            				</div>
            				</div>
            			</div>
	            	</div>
	            	
	            	<div class="mt-5">
	            		<h4>CarCarOcean이 직접 확인한 진단 결과</h4>
	            		<div class="border border-warning rounded-top p-5">
            				<p>${car.car_checker_opinion}</p>
	            		</div>
	            		<div class="d-flex justify-content-between border-bottom border-warning rounded-bottom bg-warning p-2">
            				<div class="align-self-center">
           						<b>CarCarOcean ${checker.checker_name} 차량평가사</b>
           					</div>
            				<div>
            					<img src="${pageContext.request.contextPath}/upload/${checker.checker_photo}" class="rounded-circle" width="50" height="50">
           					</div>
            			</div>
	            	</div>
	            	
	            	<div class="mt-5">
	            		<h4>진단결과</h4>
		            	<div class="border rounded p-4">
		            		<div class="row">
		            			<div class="col-4 ps-5">
		            				<i class="bi bi-car-front" style="font-size: 3rem;"></i>
		            			</div>
		            			<div class="col-4 align-self-center">
		            				<b>사고진단</b>
		            			</div>
		            			<div class="col-4 align-self-center">
		            				<c:if test="${car.car_accident=='없음'}"><b class="text-danger fs-4">무사고</b></c:if>
		            				<c:if test="${car.car_accident!='없음'}"><b class="text-danger fs-5">${car.car_accident}</b><span class="small"> 이력 있음</span></c:if>
		            			</div>
		            		</div>
		            		<hr size="1" width="100%" noshade>
		            		<div class="row">
		            			<div class="col-4 ps-5">
		            				<i class="bi bi-check2-circle" style="font-size: 3rem;"></i>
		            			</div>
		            			<div class="col-4 align-self-center">
		            				<b>진단통과</b>
		            			</div>
		            			<div class="col-4 align-self-center">
		            				<div>
		            					<div class="d-inline">
		            						<b>실내 및 외관 <b class="text-danger">6</b>건</b>
		            					</div>
		            					<div class="d-inline">
		            						<b>소모품 <b class="text-danger">8</b>건</b>
		            					</div>
		            				</div>
		            				<div>
		            					<div class="d-inline">
		            						<b>타이어 및 휠 <b class="text-danger">3</b>건</b>
		            					</div>
		            					<div class="d-inline">
		            						<b>하체 <b class="text-danger">5</b>건</b>
		            					</div>
		            				</div>
		            			</div>
		            		</div>
		            		<hr size="1" width="100%" noshade>
		            		<div class="row">
		            			<div class="col-4 ps-5">
		            				<i class="bi bi-exclamation-circle-fill" style="font-size: 3rem;"></i>
		            			</div>
		            			<div class="col-4 align-self-center">
		            				<b>알림사항</b>
		            			</div>
		            			<div class="col-4 align-self-center">
		            				<div>
		            					<div class="d-inline">
		            						<b>실내 및 외관 <b class="text-danger">0</b>건</b>
		            					</div>
		            					<div class="d-inline">
		            						<b>소모품 <b class="text-danger">1</b>건</b>
		            					</div>
		            				</div>
		            				<div>
		            					<div class="d-inline">
		            						<b>타이어 및 휠 <b class="text-danger">1</b>건</b>
		            					</div>
		            					<div class="d-inline">
		            						<b>하체 <b class="text-danger">0</b>건</b>
		            					</div>
		            				</div>
		            			</div>
		            		</div>
		            	</div>
	            	</div>
	            	
	            	<div class="mt-5" id="checkerInfo">
	            		<h4>차량평가사 정보</h4>
		            	<div class="border rounded p-5">
		            		<div class="row mb-4 text-center">
			            		<div class="col-4"><i class="bi bi-file-earmark-person-fill"><b> ${checker.checker_name}</b></i></div>
			            		<div class="col-4"><i class="bi bi-telephone-fill"> ${checker.checker_phone}</i></div>
			            		<div class="col-4"><i class="bi bi-buildings-fill"> ${checker.checker_company}</i></div>
		            		</div>
		            		<hr size="1" width="100%" noshade>
		            		<div class="text-center">
		            			<img src="${pageContext.request.contextPath}/upload/${checker.checker_photo}" width="250" height="150" class="rounded-circle">
		            		</div>
		            	</div>
	            	</div>
	            	
	            	<div class="mt-5">
	            		<h4>예약 후 직영점 방문</h4>
	            		<div class="border rounded p-4">
            				<b>차량을 직접 보시고 싶다면, 직영점 당일 방문 예약을 이용해 주세요.</b>
	            			<div class="d-flex justify-content-between">
	            				<div>
		            				<ul>
		            					<li class="text-secondary">토요일은 전화를 통한 예약만 가능합니다.</li>
		            					<li class="text-secondary">예약 차량은 다른 고객에게 판매하지 않습니다.</li>
		            				</ul>
	            				</div>
	            				<div>
		            				<c:if test="${car.car_status==0}">
	            					<button class="btn btn-outline-warning fw-bold px-5 py-3" onclick="insertReservation_btn()">예약하기</button>
	            					</c:if>
	            					<c:if test="${car.car_status==1}">
	            					<button class="btn btn-outline-warning fw-bold px-5 py-3" onclick="insertReservation_btn()" disabled="disabled">예약하기</button>
	            					</c:if>
            					</div>
            				</div>
	            		</div>
	            	</div>
	            	
	            	<div class="my-5">
	            		<h4>구매후기 정보</h4>
		            	<c:forEach var="b_re" items="${b_reList}">
		            		<div class="border rounded-4 bg-white my-2">
					        	<div class="d-flex justify-content-start">
					        		<p class="border rounded mt-2 ms-2 mb-4 me-4 bg-light p-2" style="font-size:13px;">${b_re.car_maker} ${b_re.car_name}</p>
					        	</div>
					        	<div class="d-flex justify-content-between">
					        		<div class="ms-5">
					        			<h5 class="fw-bold">${b_re.b_re_title}</h5>
					        		</div>
					        		<div class="me-5">
					        			<p>${b_re.mem_id}</p>
					        		</div>
					        	</div>
					        	<div class="fw-bold mx-5 p-1 mb-3" style="height:80px; overflow: hidden;">
					        		${b_re.b_re_content}
					        	</div>
					        	<div class="small mx-5 my-3 text-secondary">
					        		${fn:substring(b_re.b_re_reg,0,11)}
					        	</div>
					        </div>
		            	</c:forEach>
	            	</div>
	            </main>
	            <!-- 구매 버튼 공간 -->
	            <div class="col-md-3 sidebar">
	            	<div class="sticky-top border rounded mt-5 p-4">
		                <div class="fs-3 text-center text-danger fw-bold"><i class="bi bi-telephone-fill"></i> ${checker.checker_phone}</div>
		                <hr size="1" width="100%" noshade>
		                <div class="fs-2 fw-bold">
		                	${car.car_maker} ${car.car_name}
	                	</div>
		                <div class="text-center pt-3">
			                ${fn:substring(car.car_birth,2,4)}년 ${fn:substring(car.car_birth,5,7)}월식
			                <div class="vr me-2 ms-2"></div>${car.car_mile}km
			                <div class="vr me-2 ms-2"></div>
				                <c:if test="${car.car_fuel_type==1}">가솔린</c:if>
								<c:if test="${car.car_fuel_type==2}">디젤</c:if>
								<c:if test="${car.car_fuel_type==3}">전기</c:if>
								<c:if test="${car.car_fuel_type==4}">수소</c:if>
						</div>
						<div class="p-3 text-center">
							<div class="fs-5">총 예상 구매비용</div>
							<div class="fs-5"><b>${totalPrice}만원</b></div>
						</div>
						
						<div class="border rounded bg-light p-3">
							<ul class="list-unstyled">
								<li><span class="float-start">차량가</span><span class="float-end">${carPrice}만원</span><br></li>
								<li><span class="float-start">이전등록비</span><span class="float-end">${firstPrice}만원</span><br></li>
								<li><span class="float-start">관리비용</span><span class="float-end">${secondPrice}만원</span><br></li>
								<li><span class="float-start">등록신청대행수수료</span><span class="float-end">${thirdPrice}만원</span><br></li>
								<c:if test="${!empty user_grade}"><li><span class="float-start">등급수수료</span><span class="float-end">${getDiscountFee}만원</span><br></li></c:if>
								<!-- 회원 별 수수료 할인가 적용하면 좋음 -->
							</ul>
						</div>
						<div class="text-center pt-3">
							<span class="text-danger fs-2">합계 </span><span class="fs-4">${totalPrice}만원</span>
						</div>
						<div class="text-center pt-3">
							<!-- 예약 안 되었을 때 -->
							<c:if test="${car.car_status==0}">
							<input type="button" class="btn btn-warning fw-bold text-white" id="buy_btn" value="구매 예약" onclick="insertReservation_btn()" style="padding: 1.5rem 3.0rem; font-size: 2rem;">
							</c:if>
							<!-- 예약 되었을 때-->
							<c:if test="${car.car_status==1}">
								<!-- 로그인된 회원이 예약한 차량일 때 -->
								<c:if test="${car.mem_num==user_num}">
								<input type="button" class="btn btn-warning fw-bold text-white" value="구매예약 취소" onclick="deleteReservation_btn()" style="padding: 1.5rem 2rem; font-size: 1.75rem;">
								</c:if>
								<!-- 로그인된 회원이 예약한 차량이 아닐 때 -->
								<c:if test="${car.mem_num!=user_num}">
								<input type="button" class="btn btn-warning fw-bold text-white" value="예약 완료" style="padding: 1.5rem 3.0rem; font-size: 2rem;" disabled>
								</c:if>
							</c:if>
						</div>
						<div class="text-center pt-3">
							<c:if test="${empty fav}">
							<button class="btn btn-outline-danger fw-bold" id="fav_btn" onclick="favCar(${car.car_num})"><i class="fav_icon bi bi-heart">찜하기</i></button>
							</c:if>
							<c:if test="${!empty fav}">
							<button class="btn btn-outline-danger fw-bold" id="fav_btn" onclick="favCar(${car.car_num})"><i class="fav_icon bi bi-heart-fill">찜하기</i></button>
							</c:if>
							<button class="btn btn-outline-primary fw-bold" id="share_btn" onclick="share_btn()"><i class="bi bi-share">공유하기</i></button>
							<div class="text-center bg-light pt-1" id="share_div" style="display:none; position:absolute; transform:translate(85px,0)">
								<button class="btn btn-sm" style="background-color: #3b5998; color:white;" onclick="shareFacebook()"><i class="bi bi-facebook"> 페이스북</i></button>
								<button class="btn btn-sm" style="background-color: #00acee; color:white;" onclick="shareTwitter()"><i class="bi bi-twitter-x"> 트위터 X</i></button>
							</div>
						</div>
					</div>
	            </div>
	        </div>
	    </div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
const myModal = document.getElementById('myModal')
const myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', () => {
  myInput.focus()
});

function update_car(){
	if(confirm('차량 정보를 수정하시겠습니까?')){
		location.href='${pageContext.request.contextPath}/car/carUpdateForm.do?car_num=${car.car_num}';
	}
}

function share_btn() {
    if($("#share_div").css("display") =="none"){
    	$("#share_div").show();
    }else {
    	$("#share_div").hide();
    }
}
const url = encodeURI(window.location.href);
function shareFacebook(){
	window.open("http://www.facebook.com/sharer/sharer.php?u=" + url,"FaceBook","width=410,height=500,resizable=yes");
}
function shareTwitter(){
	const text = '중고차를 판매해보세요!'
	window.open("https://twitter.com/intent/tweet?text=" + text + "&url=" +  url,"Twitter","width=410,height=500,resizable=yes")
}

function favCar(carnum){
	$.ajax({
		url:'favCar.do',
		type:'post',
		data:{car_num:carnum},
		dataType:'json',
		success:function(param){
			if(param.result=='success'){
	    		if(param.action=='insertFav'){
	    			alert('관심차량 등록 완료');
	    			$(".fav_icon").removeClass("bi-heart").addClass("bi-heart-fill");
				} else if(param.action=='removeFav'){
					alert('관심차량 삭제 완료');
					$(".fav_icon").removeClass("bi-heart-fill").addClass("bi-heart");
				}
	    	} else if(param.result=='logout'){
 				alert('로그인 후 이용해주세요!');
 				location.href = '${pageContext.request.contextPath}/member/loginForm.do';
	    	}else {
	    		alert('관심차량을 등록/삭제하는 과정에서 오류가 발생했습니다.');
	    	}
		},
		error:function(){
			
		}
	});
};


function insertReservation_btn (){
	if(confirm("정말 예약하시겠습니까?")){
		/* location.href= "insertBuy.do?car_num=${car.car_num}"; */
		$.ajax({
			url:'insertReservation.do',
			type:'post',
			data:{car_num:${car.car_num}},
			dataType:'json',
			success:function(param){
				if(param.result=='success'){
					alert('예약이 완료되셨습니다!');
					location.href = '${pageContext.request.contextPath}/buy/buyDetail.do?car_num=${car.car_num}';
				} else if(param.result=='fail'){
					alert('이미 예약/구매 된 상품입니다!');
					location.href = '${pageContext.request.contextPath}/buy/buyDetail.do?car_num=${car.car_num}';
				} else if(param.result=='logout'){
					alert('로그인 후 이용해주세요!');
					location.href = '${pageContext.request.contextPath}/member/loginForm.do';
				}
			},error:function(){
				alert('네트워크에 오류가 발생했습니다!');
			}
		});
	}
};

function deleteReservation_btn(){
	if(confirm('구매 예약을 취소하시겠습니까?')){
		location.href='deleteReservation.do?car_num=${car.car_num}';
	}
};
</script>
</body>
</html>