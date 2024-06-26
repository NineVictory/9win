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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<title>내 차 구매 메인</title>
	<style>
        /* 사진 흑백 */
        .brightness {
        	filter: brightness(50%);
    	}
    	/* 사진 상자 */
    	.image-container {
            position: relative;
            display: inline-block;
            overflow: hidden;
        }
        /* 사진 */
        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* 이미지가 부모 div를 덮도록 설정 */
        }
        /* 이미지에 마우스 갖다 대면 흑백 */
        .image-container:hover{
        	filter: brightness(85%);
        }
        
        /* 하트 아이콘 */
        .overlay-icon {
            position: absolute;
            bottom: 10px; /* 원하는 위치에 따라 조정 가능 */
            right: 10px;  /* 원하는 위치에 따라 조정 가능 */
            font-size: 25px;
            color: red;
        }
        .menu-name:link{
        	color:black;
        }
        .menu-name:visited{
        	color:black;
        }
        .menu-name{
        	text-decoration-line: none;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/loading.jsp" />
<div class="container">
     <div class="row">
         <!-- 사이드바 메뉴 -->
         <nav class="col-md-2 sidebar mt-5">
             <ul class="nav flex-column bg-light rounded">
             	<li>
             		<hr width="0%">
             	</li>
             	<!-- 첫번째 토글 -->
                 <li class="my-3 text-center fw-bold">
					<a data-bs-toggle="collapse" href="#collapseExample1" role="button" aria-expanded="false" aria-controls="collapseExample1" class="text-secondary fs-5 menu-name">
						차종
					</a>
					 <div class="collapse mt-3" id="collapseExample1">
						<div class="row justify-content-center">
							<button class="col-5 btn btn-outline-secondary">경차</button>
							<button class="col-5 btn btn-outline-secondary">소형차</button>
						</div>
						<div class="row justify-content-center">
							<button class="col-5 btn btn-outline-secondary">준중형차</button>
							<button class="col-5 btn btn-outline-secondary">중형차</button>
						</div>
						<div class="row justify-content-center">
							<button class="col-5 btn btn-outline-secondary">준대형차</button>
							<button class="col-5 btn btn-outline-secondary">대형차</button>
						</div>
					 </div>
                 </li>
                 <!-- 절취선 -->
                 <li>
                 	<hr size="1" noshade width="100%">
                 </li>
                 
                 <li class="my-3 text-center fw-bold">
					<a data-bs-toggle="collapse" href="#collapseExample2" role="button" aria-expanded="false" aria-controls="collapseExample2" class="text-secondary fs-5 menu-name">
						연식
					</a>
					 <div class="collapse mt-3" id="collapseExample2">
						<form>
							<div>
								<input type="number" id="minBirth" name="minBirth" placeholder="최소" style="width: 80px; height: 30px;" class="form-control d-inline">
								<b class="d-inline"> ~ </b>
								<input type="number" id="maxBirth" name="maxBirth" placeholder="최대" style="width: 80px; height: 30px;" class="form-control d-inline">
							</div>
						</form>
					 </div>
                 </li>
                 <li>
                 	<hr size="1" noshade width="100%">
                 </li>
                 <li class="my-3 text-center fw-bold">
					<a data-bs-toggle="collapse" href="#collapseExample3" role="button" aria-expanded="false" aria-controls="collapseExample3" class="text-secondary fs-5 menu-name">
						주행거리
					</a>
					 <div class="collapse mt-3" id="collapseExample3">
						<form>
							<div>
								<input type="number" id="minMile" name="minMile" placeholder="최소" style="width: 80px; height: 30px;" class="form-control d-inline">
								<b class="d-inline"> ~ </b>
								<input type="number" id="maxMile" name="maxMile" placeholder="최대" style="width: 80px; height: 30px;" class="form-control d-inline">
							</div>
						</form>
					 </div>
                 </li>
                 <li>
                 	<hr size="1" noshade width="100%">
                 </li>
                 <li class="my-3 text-center fw-bold">
					<a data-bs-toggle="collapse" href="#collapseExample4" role="button" aria-expanded="false" aria-controls="collapseExample4" class="text-secondary fs-5 menu-name">
						가격
					</a>
					 <div class="collapse mt-3" id="collapseExample4">
						<form>
							<div>
								<input type="number" id="minPrice" name="minPrice" placeholder="최소(만원)" style="width: 80px; height: 30px;" class="form-control d-inline">
								<b class="d-inline"> ~ </b>
								<input type="number" id="maxPrice" name="maxPrice" placeholder="최대(만원)" style="width: 80px; height: 30px;" class="form-control d-inline">
							</div>
						</form>
					 </div>
                 </li>
                 <li>
                 	<hr size="1" noshade width="100%">
                 </li>
                 <li class="my-3 text-center fw-bold">
					<a data-bs-toggle="collapse" href="#collapseExample5" role="button" aria-expanded="false" aria-controls="collapseExample5" class="text-secondary fs-5 menu-name">
						색상
					</a>
					 <div class="collapse mt-3" id="collapseExample5">
						<form>
							<div>
								<input type="text" id="color" name="color" placeholder="색상 검색" style="width: 160px; height: 30px;" class="form-control d-inline">
							</div>
						</form>
					 </div>
                 </li>
                 <li>
                 	<hr size="1" noshade width="100%">
                 </li>
                 <li class="my-3 text-center fw-bold">
					<a data-bs-toggle="collapse" href="#collapseExample6" role="button" aria-expanded="false" aria-controls="collapseExample6" class="text-secondary fs-5 menu-name">
						옵션
					</a>
					 <div class="collapse mt-3" id="collapseExample6">
						<form>
							<div>
								<input type="text" id="option" name="option" placeholder="옵션 검색" style="width: 160px; height: 30px;" class="form-control d-inline">
							</div>
						</form>
					 </div>
                 </li>
                 <li>
                 	<hr size="1" noshade width="100%">
                 </li>
                 <li class="my-3 text-center fw-bold">
					<a data-bs-toggle="collapse" href="#collapseExample7" role="button" aria-expanded="false" aria-controls="collapseExample7" class="text-secondary fs-5 menu-name">
						연료
					</a>
					 <div class="collapse mt-3" id="collapseExample7">
						<div class="row justify-content-center">
							<button class="col-5 btn btn-outline-secondary">가솔린</button>
							<button class="col-5 btn btn-outline-secondary">디젤</button>
						</div>
						<div class="row justify-content-center">
							<button class="col-5 btn btn-outline-secondary">전기</button>
							<button class="col-5 btn btn-outline-secondary">수소</button>
						</div>
					 </div>
                 </li>
                 <li>
                 	<hr size="1" noshade width="100%">
                 </li>
                 <li class="my-3 text-center fw-bold">
					<a data-bs-toggle="collapse" href="#collapseExample8" role="button" aria-expanded="false" aria-controls="collapseExample8" class="text-secondary fs-5 menu-name">
						변속기
					</a>
					 <div class="collapse mt-3" id="collapseExample8">
						<div class="row justify-content-center">
							<button class="col-5 btn btn-outline-secondary">오토</button>
							<button class="col-5 btn btn-outline-secondary">수동</button>
						</div>
					 </div>
                 </li>
                 <li>
             		<hr width="0%">
             	</li>
             </ul>
         </nav>
         <!-- 사이드바 제외 메인 컨텐츠 -->
         <main class="col-md-10 pt-5 pb-5">
         	<!-- 검색바 -->
         	<div class="d-flex justify-content-center rounded" style="background-color:#f5f6f9;">
				<form id="search_form" action="mainBuy.do" method="get">
					<div class="d-flex align-items-center m-5">
						<select id="keyfield" name="keyfield" class="form-select" style="width:auto; margin-right:10px;">
							<option value="1" <c:if test="${keyfield == 1}">selected</c:if>>제조사</option>
							<option value="2" <c:if test="${keyfield == 2}">selected</c:if>>차명</option>
						</select>
						<input type="search" id="keyword" name="keyword" class="form-control rounded me-2" placeholder="원하시는 제조사/차량을 검색하세요." aria-label="Search" aria-describedby="search-addon" style="width:400px;">
						<button type="submit" class="btn btn-warning fw-bold text-white btn-lg rounded me-2"><i class="bi bi-search"></i></button>
						<button class="btn btn-warning fw-bold text-white btn-lg me-2" onclick="reset_btn()"><i class="bi bi-arrow-clockwise"></i></button>
					</div>
				</form>
			</div>
			<h4><b>총 <span class="text-danger"><fmt:formatNumber value="${count}" type="number"/></span>대</b></h4>
			<!-- 차량 리스트 -->
             <div class="container">
             	<div class="row mb-3">
             	<c:forEach var="car" items="${carList}" begin="0" end="11" varStatus="status">
   					<c:if test="${fn:contains(car.car_photo, ',')}">
           				<c:set var="photoList" value="${fn:split(car.car_photo, ',')}" />
            			<c:set var="firstPhoto" value="${photoList[0]}"/>
             		</c:if>
     				<c:if test="${!fn:contains(car.car_photo, ',')}">
     					<c:set var="firstPhoto" value="${car.car_photo}" />
     				</c:if>
             		<div class="col-4 mt-3">
		                <div class="p-3 border bg-light">
		                	<!-- 사진 상자 -->
		                	<div class="image-container ps-3">
			                	<a href="buyDetail.do?car_num=${car.car_num}">
			                		<img src="${pageContext.request.contextPath}/upload/${firstPhoto}" style="width:270px; height:200px;" class="img-fluid img-thumbnail rounded-4 img-fluid">
		                		</a>
              	     			<c:set var="favIconId" value="fav_icon_${status.index}" />
              	     			<!-- 관심차량 아이콘 체크 -->
              	     			<c:if test="${!car.fav_check}">
		                		<i id="${favIconId}" class="bi bi-heart overlay-icon" style="cursor:pointer;" onclick="favCar(${car.car_num},'${favIconId}')"></i>
		                		</c:if>
		                		<c:if test="${car.fav_check}">
		                		<i id="${favIconId}" class="bi bi-heart-fill overlay-icon" style="cursor:pointer;" onclick="favCar(${car.car_num},'${favIconId}')"></i>
		                		</c:if>
		                	</div>
		                	<!-- 설명 -->
		                	<div>
			                	<div class="fs-5 mt-3 fw-bold" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><a href="buyDetail.do?car_num=${car.car_num}" class="menu-name">${car.car_maker} ${car.car_name}</a></div>
			                	<c:if test="${car.car_status==1}">
		                		<c:if test="${empty car.mem_num or car.mem_num!=user_num}"><span class="text-danger small fw-bold"> 예약완료</span></c:if>
		                		<c:if test="${!empty car.mem_num and car.mem_num==user_num}"><span class="text-warning small fw-bold"> 내가 예약한 차량</span></c:if>
          						</c:if>
          						<c:if test="${car.car_status!=1}">
		                		<p>&nbsp</p>
          						</c:if>
			                	<p class="mt-3"><a href="buyDetail.do?car_num=${car.car_num}" class="menu-name"><b><fmt:formatNumber value="${car.car_price}"/> 만원</b></a></p>
			                	
			                	<div class="mt-3" style="font-size:12px;">${fn:substring(car.car_birth,2,4)}년${fn:substring(car.car_birth,5,7)}월식
			                	<div class="vr mx-1"></div><fmt:formatNumber value="${car.car_mile}" type="number"/>km
			                	<div class="vr mx-1"></div>
				                	<c:if test="${car.car_fuel_type==1}">가솔린</c:if>
				                	<c:if test="${car.car_fuel_type==2}">디젤</c:if>
				                	<c:if test="${car.car_fuel_type==3}">전기</c:if>
				                	<c:if test="${car.car_fuel_type==4}">수소</c:if>
				                </div>
		                	</div>
		                </div>
		            </div>
       			</c:forEach>
       			
           		</div>
             </div>
             <div class="text-center">${page}</div>
         </main>
     </div>
  </div>
<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function favCar(carnum,favIconId) {
        $.ajax({
        	url:'favCar.do',
        	type:'post',
        	data:{car_num:carnum},
        	dataType:'json',
        	success:function(param){
        		if(param.result=='success'){
    	    		if(param.action=='insertFav'){
    	    			alert('관심차량 등록 완료');
    	    			$("#" + favIconId).removeClass("bi-heart").addClass("bi-heart-fill");
    				} else if(param.action=='removeFav'){
    					alert('관심차량 삭제 완료');
    					$("#" + favIconId).removeClass("bi-heart-fill").addClass("bi-heart");
    				}
    	    	} else if(param.result=='logout'){
     				alert('로그인 후 이용해주세요!');
     				location.href = '${pageContext.request.contextPath}/member/loginForm.do';
    	    	}else {
    	    		alert('관심차량을 등록/삭제하는 과정에서 오류가 발생했습니다.');
    	    	}
        	},
        	error:function(){
        		alert('네트워크에 오류가 발생했습니다!');
        	}
        });
    };
    function reset_btn(){
    	location.href='redirect:/buy/mainBuy.do';
    };
</script>
</body>
</html>