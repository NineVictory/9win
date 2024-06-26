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
<title>중고거래</title>
<style>
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
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<h2 class="pt-5 pb-3">중고거래</h2>
		<div class="text-end"><button class="btn btn-warning text-white fw-bold mb-3" onclick="location.href='insertItemForm.do'">상품 등록</button></div>
		<form class="form-control d-flex justify-content-center bg-light p-5" action="itemList.do" method="get">
			<select id="keyfield" name="keyfield" class="form-select" style="width:auto;">
				<option value="0" <c:if test="${keyfield == 0}">selected</c:if>>상품명</option>
				<option value="1" <c:if test="${keyfield == 1}">selected</c:if>>상품내용</option>
				<option value="2" <c:if test="${keyfield == 2}">selected</c:if>>아이디</option>
			</select>
			<input type="text" class="form-control" id="keyword" name="keyword" style="width:400px;">
			<button type="submit" class="btn btn-warning fw-bold text-white btn-lg"><i class="bi bi-search"></i></button>
			<button class="btn btn-warning fw-bold text-white btn-lg ms-2" onclick="reset_btn()"><i class="bi bi-arrow-clockwise"></i></button>
		</form>
		<div class="row justify-content-start my-3 px-3">
			<c:forEach var="item" items="${itemList}">
				<c:if test="${fn:contains(item.item_photo, ',')}">
					<c:set var="photoList" value="${fn:split(item.item_photo, ',')}" />
					<c:set var="firstPhoto" value="${photoList[0]}"/>
				</c:if>
				<c:if test="${!fn:contains(item.item_photo, ',')}">
					<c:set var="firstPhoto" value="${item.item_photo}" />
				</c:if>
				<div class="col-3 mx-5 my-3">
					<div class="text-center px-3">
						<c:if test="${empty firstPhoto}">
							<a href="itemDetail.do?item_num=${item.item_num}"><img src="${pageContext.request.contextPath}/images/logo.png" style="width:270px; height:200px;" class="border rounded-4 image-container"></a>
						</c:if>
						<c:if test="${!empty firstPhoto}">
							<a href="itemDetail.do?item_num=${item.item_num}"><img src="${pageContext.request.contextPath}/upload/${firstPhoto}" style="width:270px; height:200px;" class="border rounded-4 image-container"></a>
						</c:if>
					</div>
					<div class="px-3">
						<div class="float-start"><a href="itemDetail.do?item_num=${item.item_num}" class="text-decoration-none text-secondary fw-bold small">${item.item_reg}</a></div>
						<div class="text-end"><a href="itemDetail.do?item_num=${item.item_num}" class="text-decoration-none text-dark fw-bold small">${item.member.mem_id}</a></div>
						<div class="overflow-hidden my-1" style="height:30px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><c:if test="${fn:contains(item.item_reg,'초미만') or fn:contains(item.item_reg,'초 전') or fn:contains(item.item_reg,'분 전')}"><span class="badge bg-danger me-2">New</span></c:if><a href="itemDetail.do?item_num=${item.item_num}" class="text-decoration-none text-dark overflow-hidden">${item.item_name}</a></div>
						<div class="my-1"><a href="itemDetail.do?item_num=${item.item_num}" class="text-decoration-none text-dark fw-bold"><fmt:formatNumber value="${item.item_price}" type="number"/>원</a></div>
						<div class="small mt-2">${item.member.mem_address1}</div>
						<div class="small text-secondary">채팅 ${item.item_chatCount} ∙ 조회 ${item.item_views}</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="text-center mb-5">${page}</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		function reset_btn(){
    		location.href='redirect:/item/itemList.do';
    	};
	</script>
</body>
</html>