<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>검수 대기 차량 상세 정보</title>
</head>
<body>
	<!-- 헤더 고정 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container my-5" style="margin-bottom: 100px; !important">
		<h1 class="text-center p-4 my-5">검수 대기 차량 상세 정보</h1>
		<span class="fs-3 float-start fw-bold">${sell.sell_maker} ${sell.sell_cname}</span><br>
		<span class="float-end p-4"><b>${sell.sell_name} | ${sell.sell_reg}</b></span><br>
		<div class="mt-3 p-4">
			<ul class="list-unstyled">
				<li>
					차량번호 : ${sell.sell_cnumber}
				</li>
				<li>
					제조사 : ${sell.sell_maker}
				</li>
				<li>
					차량명 : ${sell.sell_cname}
				</li>
				<li>
					주행거리 : ${sell.sell_mile}
				</li>
				<li>
					신청자명 : ${sell.sell_name}
				</li>
				<li>
					휴대폰번호 : ${sell.sell_phone}
				</li>
				<li>
					검수 희망 지역 (시/도) : ${sell.sell_place1}
				</li>
				<li>
					검수 희망 지역 (군/구) : ${sell.sell_place2}
				</li>
				<li>
					판매 희망일 : <c:choose>
                            	  <c:when test="${sell.sell_date == 0}">즉시</c:when>
                            	  <c:when test="${sell.sell_date == 1}">7일 이내</c:when>
                            	  <c:when test="${sell.sell_date == 2}">30일 이내</c:when>
                        	  </c:choose>
				</li>
				<li>
					검수 진행 상황 : <strong class="fs-3">
								<c:choose>
								 	 <c:when test="${sell.sell_check == 0}"><span class="text-dark">미검수</span></c:when>
								     <c:when test="${sell.sell_check == 1}"><span class="text-primary">검수중</span></c:when>
									 <c:when test="${sell.sell_check == 2}"><span class="text-danger">검수 완료</span></c:when>
								 </c:choose>
								 </strong>
				</li>
				<c:if test="${!empty sell.sell_modify_check}">검수 상태 변경일 : ${sell.sell_modify_check}</c:if>
			</ul>
		</div>
		<hr size="1" width="100%" noshade>
		<div class="d-felx justify-content-between m-3">
			<div class="d-flex justify-content-between align-items-center text-start">
				<!-- sell_detail 에서는 검수 상태를 미검수와 검수중으로 밖에 변경하지 못하고 만약 검수중으로 변경 시 차량 정보 등록 버튼이 뜬다. -->
				<!-- 검수 완료된 차량은 검수 상태 변경 폼이 사라진다. -->
				<c:if test="${sell.sell_check<2}">
				<form action="updateSellCheck.do" method="post" class="d-flex">

						<input type="hidden" name="sell_num" value="${sell.sell_num}">
						<select class="form-select" name="sell_check" style="width:auto;">
							<option value="0" <c:if test="${sell.sell_check==0}">selected</c:if>>미검수</option>
							<option value="1" <c:if test="${sell.sell_check==1}">selected</c:if>>검수중</option>
						</select>
						<input type="submit" class="btn btn-success" value="검수 상태 변경">

				</form>
				</c:if>
				<!-- 누르면 차량 정보 등록 폼이 뜨고 등록하게 되면 sell_check는 2로 업데이트 되면서 car에 정보들이 등록된다.-->
				<c:if test="${sell.sell_check==1}">
				<form action="${pageContext.request.contextPath}/car/carWriteForm.do" method="post" class="ms-5">
					<input type="hidden" name="sell_num" value="${sell.sell_num}">
					<input type="submit" class="btn btn-primary" value="검수 완료 차량 등록 폼">
				</form>
				</c:if>
				<div class="text-end">
					<input type="button" class="btn btn-warning" value="목록" onclick="location.href='adminSellList.do'">
					<input type="button" class="btn btn-danger" value="삭제" onclick="delete_btn()">
				</div>
			</div>
		</div>
	</div>
<script>
	function delete_btn() {
		if(confirm("정말 삭제하시겠습니까?")){
			alert("삭제되었습니다.");
			location.href= "deleteSell.do?sell_num=${sell.sell_num}";
		}
	};
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>