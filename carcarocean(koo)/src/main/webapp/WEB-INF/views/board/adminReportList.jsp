<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 누적된 글</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<body>
<div class="container">
	<h2 class="text-danger fw-bold my-5">신고 누적된 글</h2>
	<h3 class="my-3">자유게시판</h3>
	<table class="table text-center align-content-center fw-bold my-5">
		<thead class="table-light">
			<tr>
				<th>글번호</th>
				<th>제목</th>
                   <th>작성자</th>
                   <th>작성일</th>
                   <th>조회수</th>
                   <th style="width:100px;"> </th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${list}">
				<c:if test="${board.board_report >= 10}">
					<tr class="align-middle">
						<td>${board.board_num}</td>
						<td><a href="${pageContext.request.contextPath}/board/detail.do?board_num=${board.board_num}" class="link-warning link-offset-2 link-underline-opacity-0 link-underline-opacity-0-hover">${board.board_title}</a></td>
						<td>${board.mem_id}</td>
						<td>
							<c:if test = "${empty board.board_modify}">${fn:substring(board.board_reg,0,10)}</c:if>
							<c:if test = "${!empty board.board_modify}">${fn:substring(board.board_modify,0,10)}</c:if>
						</td>
						<td>${board.board_hit}</td>
						<td><input type="button" class="btn btn-danger text-white" value="삭제" onclick="delete_board(this)" data-num1="${board.board_num}"></td>
                      </tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
	<hr class="my-5">
	<h3 class="mt-5">정보공유 게시판</h3>
	<table class="table text-center align-content-center fw-bold my-5">
		<thead class="table-light">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th style="width:100px;"></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="info" items="${list2}">
				<c:if test="${info.info_board_report >= 10}">
					<tr class="align-middle">
						<td>${info.info_board_num}</td>
						<td><a href="${pageContext.request.contextPath}/info_board/detail.do?info_board_num=${info.info_board_num}" class="link-warning link-offset-2 link-underline-opacity-0 link-underline-opacity-0-hover">${info.info_board_title}</a></td>
						<td>${info.mem_id}</td>

						<td>
						<c:if test = "${empty info.info_board_modify}">${fn:substring(info.info_board_reg,0,10)}</c:if>
						<c:if test = "${!empty info.info_board_modify}">${fn:substring(info.info_board_modify,0,10)}</c:if>
						</td>
						<td>${info.info_board_hit}</td>
						<td><input type="button" class="btn btn-danger text-white" value="삭제" onclick="delete_info(this)" data-num2="${info.info_board_num}"></td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		function delete_board(button){
			if(confirm('신고 누적된 게시글을 삭제하시겠습니까?')){
				const board_num1 = button.getAttribute('data-num1');
				location.href='${pageContext.request.contextPath}/board/delete.do?board_num='+board_num1;
			}
		};
		function delete_info(button){
			if(confirm('신고 누적된 게시글을 삭제하시겠습니까?')){
				const board_num2 = button.getAttribute('data-num2');	
				location.href='${pageContext.request.contextPath}/info_board/delete.do?info_board_num='+board_num2;
			}
		};
	</script>
</body>
</html>