<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 차 팔기 메인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<style>
        .background-image1 {
            background-image: url('../images/logo.png');
            background-size: inherit;
            background-position: right;
            background-repeat: no-repeat;
        }
        .img:hover{
        	filter:brightness(80%);
        }
        
        .car-name-link:link{
        	color:black;
        }
        .car-name-link:visited{
        	color:black;
        }
        .car-name-link{
        	text-decoration-line: none;
        }
        .sellBox{
			width: 100vw;
			margin-left: calc(-50vw + 50%);
        }
    </style>
</head>
<body>
	<!-- 헤더 고정 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<!-- 판매 신청 부분 -->
		<!-- <div class="sellBox rounded background-image my-5 p-5"> -->
		<div class="sellBox bg-light my-5 p-5">
			<div class="container p-4">
				<div class="background-image1">
					<p class="text-danger fs-4 my-4"><b>내 차 팔기!</b></p>
					<p class="fs-3 my-4"><b>지금 카카오션에 자신의 차를 팔아보세요!</b></p>
					<h1><b>흥정 없이 높은 가격</b></h1>
					<h1><b class="text-danger">12만원 </b><b>상당의 혜택까지 !</b></h1>
					<p class="small"><b class="text-danger"><i class="bi bi-exclamation-circle-fill"> </i>당일 판매</b>에 한함</p>
				</div>
				<div class="mt-5">
					<button onclick="openPopup()" class="btn btn-warning text-white fw-bold" style="padding: 0.8rem 5rem; font-size: 1.75rem;"><b>간편 신청 ></b></button>
				</div>
			</div>
		</div>
		<!-- 이벤트 부분 -->
		<div class="border rounded my-5 p-5">
			<div class="row">
				<div class="col-6">
					<div class="col">
						<div class="row-4 px-3">
							<div class="fs-5"><b>내차팔기 이벤트!</b></div>
							<div class="fs-4"><b>내차팔기 <b class="text-danger fs-2">당일판매</b>시 혜택이 더욱 풍성해집니다!</b></div>
						</div>
						<div class="row-8 mt-4 text-center">
							<img src="../images/logo.png" width="500" height="300" style="cursor: pointer;">
						</div>
					</div>
				</div>
				<div class="col-1 border-end"></div>
				<div class="col-4 ms-5 align-self-center">
					<ul class="list-unstyled">
						<li class="py-2">
							<div class="row">
								<div class="col-3 text-center">
									<span class="badge text-bg-danger">대상고객</span>
								</div>
								<div class="col-9">
									차량평가사 방문 당일에 판매하신 고객
								</div>
							</div>
						</li>
						<li class="py-2">
							<div class="row">
								<div class="col-3 text-center">
									<span class="badge text-bg-danger">상품안내</span>
								</div>
								<div class="col-9">
									밀키트 포인트!
								</div>
							</div>
						</li>
						<li class="py-2">
							<div class="row">
								<div class="col-3 text-center">
									<span class="badge text-bg-danger">사용처</span>
								</div>
								<div class="col-9">
									www.mychef.kr
								</div>
							</div>
						</li>
						<li class="py-2">
							<div class="row">
								<div class="col-3 text-center">
									<span class="badge text-bg-danger">행사기간</span>
								</div>
								<div class="col-9">
									2024.05.31 ~ 이벤트 종료일
								</div>
							</div>
						</li>
						<li class="py-2">
							<div class="row">
								<div class="col-3 text-center">
									<span class="badge text-bg-danger">지급방법</span>
								</div>
								<div class="col-9 fw-bold">
									차량 판매금액 입금 후 최대 3일(영업일) 안에 문자메시지로 발송
								</div>
							</div>
						</li>
						<li>
							<span style="font-size:12px;">※ 문자메시지를 받은 뒤 <span class="text-danger">6개월 이내</span>에 마이셰프 회원가입 후 적립해주세요.</span>
							<p style="font-size:11px;">단, <span class="text-danger">적립 후 1년 이내</span>에 사용 가능합니다.</p>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 카카오션의 차별점 -->
		<div class="my-5">
			<div class="text-center"><span class="fs-1"><b class="text-warning">카카오션 </b></span><span class="fs-2"><b>무엇이 다른가요?</b></span></div>
			<div class="bg-light rounded p-4">
				<div class="row justify-content-between p-4">
					<div class="row col-6 border rounded mb-5 py-5">
						<div class="col-3 text-center">
							<i class="bi bi-speedometer" style="font-size: 4.5rem;"></i>
						</div>
						<div class="col-8">
							<p><b>기다림 NO 하루만에 내 차 팔기</b><p>
							<b class="text-secondary">K Car가 차량 판매의 모든 과정을 직접 진행하니까 방문견적부터 소유권 이전까지 하루 만에 끝나요.</b>
						</div>
					</div>
					<div class="row col-6 border rounded mb-5 py-5">
						<div class="col-3 text-center">
							<i class="bi bi-clipboard2-check-fill" style="font-size: 4.5rem;"></i>
						</div>
						<div class="col-8">
							<p><b>전국 어디든 K Car가 직접 방문</b><p>
							<b class="text-secondary">제주도, 강원도는 물론 전국 어디든지 K Car 차량평가사가 직접 방문하니 편리해요.</b>
						</div>
					</div>
					<div class="row col-6 border rounded py-5">
						<div class="col-3 text-center">
							<i class="bi bi-currency-exchange" style="font-size: 4.5rem;"></i>
						</div>
						<div class="col-8">
							<p><b>수수료 없는 무료 방문 견적</b><p>
							<b class="text-secondary">견적을 확인 후 판매하지 않아도 돼요! 견적비용이 없어 맘 편히 이용할 수 있어요.</b>
						</div>
					</div>
					<div class="row col-6 border rounded py-5">
						<div class="col-3 text-center">
							<i class="bi bi-list-check text-center" style="font-size: 4.5rem;"></i>
						</div>
						<div class="col-8">
							<p><b>부당감가 없이 정확한 견적</b><p>
							<b class="text-secondary">K Car 차량평가사가 직접 차량을 평가하니까 부당감가 없이 믿고 팔 수 있어요.</b>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 내 차 팔기 진행 방식 -->
		<div class="my-5">
			<p class="fs-1 text-center"><b class="text-warning">카카오션</b> <b>내 차 팔기</b></p>
			<p class="fs-2 text-center"><b>이렇게 진행 됩니다.</b></p>
			<div class="row">
				<div class="col-2 p-2 border rounded-start text-center">
					<p class="badge text-bg-secondary">STEP1</p><br>
					<p><b>내차팔기신청</b></p>
					<span class="text-secondary">차량번호와 연락처 입력 후 신청</span>
				</div>
				<div class="col-2 p-2 border text-center">
					<p class="badge text-bg-secondary">STEP2</p><br>
					<p><b>상담 진행</b></p>
					<span class="text-secondary">상담원이 전화 상담으로 내용 확인</span>
				</div>
				<div class="col-2 p-2 border text-center">
					<p class="badge text-bg-secondary">STEP3</p><br>
					<p><b>일정 조율</b></p>
					<span class="text-secondary">차량 평가사와 전화로 방문 일정 조율</span>
				</div>
				<div class="col-2 p-2 border text-center">
					<p class="badge text-bg-secondary">STEP4</p><br>
					<p><b>검수 진행</b></p>
					<span class="text-secondary">CarCarOcean 차량 평가사가 방문하여 무료 견적</span>
				</div>
				<div class="col-2 p-2 border text-center">
					<p class="badge text-bg-secondary">STEP5</p><br>
					<p><b>계약 진행</b></p>
					<span class="text-secondary">계약서 작성 후 당일 판매대금 입금</span>
				</div>
				<div class="col-2 p-2 border rounded-end text-center">
					<p class="badge text-bg-secondary">STEP6</p><br>
					<p><b>차량 인도</b></p>
					<span class="text-secondary">차량 인도 및 명의 이전</span>
				</div>
			</div>
		</div>
		<!-- 최근 올라온 차량 3개만 보여주기 -->
		<div class="my-5">
			<h2 class="text-center"><b>최근 등록된 차량</b></h2>
			<div class="row d-flex justify-content-center">
			<c:forEach var="car" items="${carList}">
				<c:if test="${fn:contains(car.car_photo, ',')}">
            		<c:set var="photoList" value="${fn:split(car.car_photo, ',')}" />
            		<c:set var="firstPhoto" value="${photoList[0]}"/>
            	</c:if>
    			<c:if test="${!fn:contains(car.car_photo, ',')}">
    				<c:set var="firstPhoto" value="${car.car_photo}" />
    			</c:if>
				<div class="col-3 border mt-3 text-center p-3">
					<a href="${pageContext.request.contextPath}/buy/buyDetail.do?car_num=${car.car_num}"><img src="${pageContext.request.contextPath}/upload/${firstPhoto}" style="width:200px; height:150px;" class="img img-fluid img-thumbnail rounded"></a>
					<p><b class="fs-5"><a href="${pageContext.request.contextPath}/buy/buyDetail.do?car_num=${car.car_num}" class="car-name-link">${car.car_maker} ${car.car_name}</a></b></p>
					<p><b><fmt:formatNumber value="${car.car_price}" type="number"/></b>만원</p>
					<p><b><fmt:formatNumber value="${car.car_mile}" type="number"/></b>km</p>
				</div>
			</c:forEach>
			</div>
		</div>
		
		<!-- 판매 후기 -->
		<div class="my-5">
			<h2 class="text-center"><b>판매 후기</b></h2>
			<div class="p-4">
				<c:forEach var="s_re" items="${s_reList}" begin="0" end="2">
					<div class="border rounded-4 bg-light my-2">
			        	<div class="d-flex justify-content-start">
			        		<p class="border rounded mt-2 ms-2 mb-4 me-4 bg-white p-2" style="font-size:13px;">${s_re.sell_maker} ${s_re.sell_cname}</p>
			        	</div>
			        	<div class="d-flex justify-content-between">
			        		<div class="ms-5">
			        			<h5 class="fw-bold">${s_re.s_re_title}</h5>
			        		</div>
			        		<div class="me-5">
			        			<p>${s_re.mem_id}</p>
			        		</div>
			        	</div>
			        	<div class="fw-bold mx-5 p-1 mb-3" style="height:100px; overflow: hidden;">
			        		${s_re.s_re_content}
			        	</div>
			        	<div class="small mx-5 my-3 text-secondary">
			        		${fn:substring(s_re.s_re_reg,0,10)}
			        	</div>
			        </div>
				</c:forEach>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
    	function openPopup() {
    		window.open("insertSellForm.do", "판매 신청서", "width=900,height=800,scrollbars=no,resizable=yes");
    	}
	</script>
</body>
</html>