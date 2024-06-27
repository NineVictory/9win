<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<title>구매 예약 관리</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<h1 class="text-center my-5">구매 예약 관리 (관리자)</h1>
		<div class="d-flex flex-row justify-content-end">
			<form id="search_form" action="adminBuyList.do" method="get" class="d-flex">
				<div class="d-flex align-items-center ms-4 mt-5 mb-5">
				<select id="keyfield" name="keyfield" class="form-select" style="width:auto; margin-right:10px;">
					<option value="0" <c:if test="${keyfield == 0}">selected</c:if>>이름</option>
					<option value="1" <c:if test="${keyfield == 1}">selected</c:if>>아이디</option>
					<option value="2" <c:if test="${keyfield == 2}">selected</c:if>>이메일</option>
					<option value="3" <c:if test="${keyfield == 3}">selected</c:if>>차량</option>
				</select>
				<input type="search" size="20" id="keyword" name="keyword" class="form-control rounded me-2" placeholder="Search" aria-label="Search" aria-describedby="search-addon" style="width:400px;">
				<button type="submit" class="btn btn-warning fw-bold text-white btn-lg"><i class="bi bi-search"></i></button>
				<button class="btn btn-warning fw-bold text-white btn-lg ms-2" onclick="reset_btn()"><i class="bi bi-arrow-clockwise"></i></button>
				</div>
			</form>
		</div>
		<table class="table table-hover text-center align-content-center fw-bold mt-3 mb-5">
			<thead>
				<tr class="table-light">
					<th>#</th>
					<th>차량</th>
					<th>이름</th>
					<th>아이디</th>
					<th>이메일</th>
					<th>차량사진</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${list}">
					<c:if test="${fn:contains(item.car.car_photo, ',')}">
           				<c:set var="photoList" value="${fn:split(item.car.car_photo, ',')}" />
            			<c:set var="firstPhoto" value="${photoList[0]}"/>
             		</c:if>
     				<c:if test="${!fn:contains(item.car.car_photo, ',')}">
     					<c:set var="firstPhoto" value="${item.car.car_photo}" />
     				</c:if>
					<tr class="align-middle">
						<td>${item.buy_num}</td>
						<td>${item.car.car_maker} ${item.car.car_name}</td>
						<td>${item.member.mem_name}</td>
						<td>${item.member.mem_id}</td>
						<td>${item.member.mem_email}</td>
						<td><img src="${pageContext.request.contextPath}/upload/${firstPhoto}" width="100px" height="100px" class="rounded-4"></td>
						<td><button class="btn btn-danger" onclick="insertBuy_btn(this)" data-carnum="${item.car.car_num}" data-memnum="${item.member.mem_num}">구매확정</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script type="text/javascript">
	function insertBuy_btn(button){
		if(confirm('구매를 확정 하시겠습니까?')){
			if(confirm('진짜 확정 하시겠습니까?')){
				const car_num = button.getAttribute('data-carnum');
				const mem_num = button.getAttribute('data-memnum');
				location.href='adminInsertBuy.do?car_num='+car_num+'&mem_num='+mem_num;
			}
		}
	};
	function reset_btn(){
		location.href='redirect:/buy/adminBuyList.do';
	};
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>