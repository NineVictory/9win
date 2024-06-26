<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>이벤트 게시판 목록</title>
<script type="text/javascript">
	window.onload = function(){
		const myForm = document.getElementById('search_form');
		//이벤트 연결
		myForm.onsubmit = function(){
			const keyword = document.getElementById('keyword');
			if(keyword.value.trim()==''){
				alert('검색어를 입력하세요');
				keyword.value = '';
				keyword.focus();
				return false;
			}
		};
	};
</script>
</head>
<body>
	<div class="page-main">
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container">
		<h2 class="pt-5 pb-3">이벤트 게시판</h2>
		<!-- 검색바 -->
				<div class="d-flex justify-content-between align-items-center rounded" style="background-color: #f5f6f9;">
					<div class="text-start ms-4 mt-5 mb-5" style="font-size: 15pt;">
						총 ${count}건의 글이 있습니다.
					</div>
					<form id="search_form" action="list.do" method="get" class="d-flex justify-content-center">
					<div class="d-flex align-items-center ms-4 mt-5 mb-5">
					<select name="keyfield" class="form-select" style="width: auto; margin-right: 10px;">
						<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>제목</option>
						<option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>>내용</option>
					</select>
					<input type="search" size="20" name="keyword" id="keyword" value="${param.keyword}" class="form-control rounded me-2" placeholder="검색할 정보를 입력하세요" style="width: 400px;">
					<button type="submit" class="btn btn-warning fw-bold text-white btn-lg me-2"><i class="bi bi-search"></i></button>
					<a href="../event/list.do" class="btn btn-warning fw-bold text-white btn-lg me-4">
						<i class="bi bi-arrow-clockwise"></i>
					</a>
					</div>
					</form>
				</div>	
			<table class="table table-hover mt-4">
				<thead class="table-light text-center">
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
				<thead>
				<tbody>
				<c:forEach var="event" items="${list}">
					<tr>
						<td class="text-center"><a href="detail.do?event_num=${event.event_num}" class="text-decoration-none text-dark fw-bold">${event.event_num}</a></td>
						<td><a href="detail.do?event_num=${event.event_num}" class="text-decoration-none text-dark fw-bold">${event.event_title}</a></td>
						<c:if test="${!empty event.event_modify}">
							<td class="text-center"><a href="detail.do?event_num=${event.event_num}" class="text-decoration-none text-dark fw-bold">${fn:substring(event.event_modify,0,10)}</a></td>
						</c:if>
						<c:if test="${empty event.event_modify}">
							<td class="text-center"><a href="detail.do?event_num=${event.event_num}" class="text-decoration-none text-dark fw-bold">${fn:substring(event.event_reg,0,10)}</a></td>
						</c:if>	
						<td class="text-center"><a href="detail.do?event_num=${event.event_num}" class="text-decoration-none text-dark fw-bold">${event.event_hit}</a></td>	
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="text-center mt-3 mb-3">${page}</div>
				<!-- 버튼 -->
		<div class="text-end mb-4">
				<c:if test="${!empty user_num && user_auth == 9}">
					<input type="button" class="btn btn-warning text-white" value="글쓰기" onclick="location.href='writeForm.do'">			
				</c:if>
					<input type="button" class="btn btn-warning text-white" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	</div>
</body>
</html>