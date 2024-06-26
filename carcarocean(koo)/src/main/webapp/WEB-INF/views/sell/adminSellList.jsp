<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>차량 검수 신청 목록(관리자)</title>
</head>
<body>
	<!-- 헤더 고정 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container" style="margin-bottom: 100px; !important"> 
		<h1 class="text-center my-5">차량 검수 신청 목록</h1>
		<form id="check_form" action="adminSellList.do" method="get" class="d-flex justify-content-between mb-3">
			<div class="align-self-center">
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="sell_check" id="sell_check1" value="0" <c:if test="${sell_check == 0}">checked</c:if>>
				  <label class="form-check-label" for="sell_check1">미검수</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="sell_check" id="sell_check2" value="1" <c:if test="${sell_check == 1}">checked</c:if>>
				  <label class="form-check-label" for="sell_check2"><span class="text-primary">검수중</span></label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="sell_check" id="sell_check3" value="2" <c:if test="${sell_check == 2}">checked</c:if>>
				  <label class="form-check-label" for="sell_check3"><span class="text-danger">검수완료</span></label>
				</div>
			</div>
			<div class="d-flex justify-content-center">
				<div class="d-flex align-items-center ms-4 mt-5 mb-5">
				<select id="keyfield" name="keyfield" class="form-select" style="width:auto; margin-right:10px;">
					<option value="0" <c:if test="${keyfield == 0}">selected</c:if>>신청자명</option>
					<option value="1" <c:if test="${keyfield == 1}">selected</c:if>>제조사</option>
					<option value="1" <c:if test="${keyfield == 1}">selected</c:if>>차명</option>
				</select>
				<input type="search" size="20" id="keyword" name="keyword" class="form-control rounded me-2"
				 placeholder="Search" aria-label="Search" aria-describedby="search-addon" style="width:400px;">
				<button type="submit" class="btn btn-warning fw-bold text-white btn-lg"><i class="bi bi-search"></i></button>
				<button class="btn btn-warning fw-bold text-white btn-lg ms-2" onclick="reset_btn()"><i class="bi bi-arrow-clockwise"></i></button>
				</div>
			</div>
		</form>
		<table class="table table-hover mt-3 text-center fw-bold">
			<thead class="table-light">
				<tr>
					<th>#</th>
					<th>신청자명</th>
					<th>제조사</th>
					<th>차명</th>
					<th>판매희망일</th>
					<th>검수완료여부</th>
					<th>판매 등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="sell" items="${list}">
				<tr>
					<td><a href="adminSellDetail.do?sell_num=${sell.sell_num}" class="text-decoration-none text-dark">${sell.sell_num}</a></td>
					<td><a href="adminSellDetail.do?sell_num=${sell.sell_num}" class="text-decoration-none text-dark">${sell.sell_name}</a></td>
					<td><a href="adminSellDetail.do?sell_num=${sell.sell_num}" class="text-decoration-none text-dark">${sell.sell_maker}</a></td>
					<td><a href="adminSellDetail.do?sell_num=${sell.sell_num}" class="text-decoration-none text-dark">${sell.sell_cname}</a></td>
					<td><a href="adminSellDetail.do?sell_num=${sell.sell_num}" class="text-decoration-none text-dark">${sell.sell_reg}</a></td>
					<td>
						<c:choose>
							<c:when test="${sell.sell_check == 0}"><a href="adminSellDetail.do?sell_num=${sell.sell_num}" class="text-decoration-none text-dark">미검수</a></c:when>
							<c:when test="${sell.sell_check == 1}"><a href="adminSellDetail.do?sell_num=${sell.sell_num}" class="text-decoration-none text-primary">검수중</a></c:when>
							<c:when test="${sell.sell_check == 2}"><a href="adminSellDetail.do?sell_num=${sell.sell_num}" class="text-decoration-none text-danger">검수 완료</a></c:when>
						</c:choose>
					</td>
					<td>
                        <c:choose>
                            <c:when test="${sell.sell_date == 0}"><a href="adminSellDetail.do?sell_num=${sell.sell_num}" class="text-decoration-none text-dark">즉시</a></c:when>
                            <c:when test="${sell.sell_date == 1}"><a href="adminSellDetail.do?sell_num=${sell.sell_num}" class="text-decoration-none text-dark">7일 이내</a></c:when>
                            <c:when test="${sell.sell_date == 2}"><a href="adminSellDetail.do?sell_num=${sell.sell_num}" class="text-decoration-none text-dark">30일 이내</a></c:when>
                        </c:choose>
                    </td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="text-center">${page}</div>
	</div>
	<script>
		window.onload = function(){
			const checkForm = document.getElementById('check_form');
			checkForm.onchange = function(){
				checkForm.submit();
			};
		};
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>