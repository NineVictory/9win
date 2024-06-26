<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<title>마이페이지</title>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
</head>
<body>

	<div class="container">
		<div class="row">
			<c:set var="sub_title" value="마이페이지" scope="request" />
			<jsp:include page="/WEB-INF/views/member/myPageMenu.jsp" />
			<main class="col-md-10 pt-5 pb-5">
				<div class="mypage-div">
					<div class="menu-container">
						<div class="profile">
							<div class="shadow p-3 bg-light row rounded-3">
								<div class="col-3 text-center">
									<h2>${member.mem_name}님</h2>
									<a class = "text-dark" href="${pageContext.request.contextPath}/member/modifyUserForm.do">정보수정</a><br>
									<c:if test="${!empty member.mem_photo}">
										<!-- 이미지가 비어있지 않는 경우 -->
										<img
											src="${pageContext.request.contextPath}/upload/${member.mem_photo}"
											width="100" height="100" class="rounded-circle">
									</c:if>
								</div>
								<div class="col-4 text-center align-text-middle"
									style="height: 200px;">
									<div class="d-flex justify-content-center align-items-center"
										style="height: 100px">
										<h3>${member.mem_name}님의등급</h3>
									</div>
									<div class="d-flex justify-content-center align-items-center"
										style="height: 100px">
										<c:if test="${member.mem_grade == 1}">
											<h3>Member</h3>
										</c:if>
										<c:if test="${member.mem_grade == 2}">
											<h3>Silver</h3>
										</c:if>
										<c:if test="${member.mem_grade == 3}">
											<h3>Gold</h3>
										</c:if>
										<c:if test="${member.mem_grade == 4}">
											<h3>Platinum</h3>
										</c:if>
										<c:if test="${member.mem_grade == 5}">
											<h3>Diamond</h3>
										</c:if>
									</div>
								</div>
								<div class="col-2">
									<div>
										<div class="d-flex justify-content-center align-items-center"
											style="height: 200px;">
											<img src="${pageContext.request.contextPath}/upload/dia.png"
												class="rounded-circle" width="100">
										</div>
									</div>
								</div>
								<div class="col-3 text-center align-text-middle">
									<div class="d-flex justify-content-center align-items-center"
										style="height: 100px">
										<h3>다음 등급까지</h3>
									</div>
									<div class="d-flex justify-content-center align-items-center"
										style="height: 100px">
										<h3>${cost}만원</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="p-3 bg-right w-80 mx-auto">
						<h3>자유게시판</h3>
						<table class="table text-center align-content-center fw-bold mt-3">
							<thead>
								<tr>
									<th>#</th>
									<th>제목</th>
									<th>작성일</th>
									<th>수정일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="board" items="${list}">
									<tr>
										<td width="250px">${board.board_num}</td>
										<td width="250px"><a
											href="${pageContext.request.contextPath}/board/detail.do?board_num=${board.board_num}"
											class="link-warning link-offset-2 link-underline-opacity-0 link-underline-opacity-0-hover">${board.board_title}</a></td>
										<td>${fn:substring(board.board_reg,0,10)}</td>
										<c:if test="${!empty board.board_modify}">
											<td>${fn:substring(board.board_modify,0,10)}</td>
										</c:if>
										<c:if test="${empty board.board_modify}">
											<td>데이터없음</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<c:if test = "${empty list}">
                	  	  <td><h2 class = "text-center">데이터없음</h2></td>
                 	   </c:if>
					</div>
					<br>
					<div class="p-3 bg-right w-80 mx-auto">
						<h3>내차팔기 신청현황</h3>
						<table class="table text-center align-content-center fw-bold mt-3">
							<thead>
								<tr>
									<th>#</th>
									<th>차명</th>
									<th>검수완료여부</th>
									<th>검수수정일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="sell" items="${slist}">
									<tr>
										<td width="250px">${sell.sell_num}</td>
										<c:if test="${sell.sell_check==0}">
											<td width="250px"><a
												href="${pageContext.request.contextPath}/sell/mySellList.do?sell_check=0&keyfield=1&keyword="
												class="link-warning link-offset-2 link-underline-opacity-0 link-underline-opacity-0-hover">${sell.sell_cname}</a></td>
											<td>검수전</td>
										</c:if>
										<c:if test="${sell.sell_check==1}">
											<td width="250px"><a
												href="${pageContext.request.contextPath}/sell/mySellList.do?sell_check=1&keyfield=1&keyword="
												class="link-warning link-offset-2 link-underline-opacity-0 link-underline-opacity-0-hover">${sell.sell_cname}</a></td>
											<td>검수중</td>
										</c:if>
										<c:if test="${sell.sell_check==2}">
											<td width="250px"><a
												href="${pageContext.request.contextPath}/sell/mySellList.do?sell_check=2&keyfield=1&keyword="
												class="link-warning link-offset-2 link-underline-opacity-0 link-underline-opacity-0-hover">${sell.sell_cname}</a></td>
											<td>검수완료</td>
										</c:if>
										<c:if test="${!empty sell.sell_modify_check}">
											<td>${fn:substring(sell.sell_modify_check,0,10)}</td>
										</c:if>
										<c:if test="${empty sell.sell_modify_check}">
											<td>데이터없음</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<c:if test = "${empty slist}">
                	  	  <td><h2 class = "text-center">데이터없음</h2></td>
                 	   </c:if>
					</div>

				</div>
			</main>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
