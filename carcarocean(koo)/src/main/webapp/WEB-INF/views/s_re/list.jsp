	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>판매후기게시판 목록</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<h2 class="pt-5 pb-3">판매후기게시판 목록</h2>
		<div class="d-flex justify-content-center rounded bg-light p-5">
			<form id="search_form" action="list.do" method="get" class="d-flex justify-content-center">
			<div class="d-flex align-items-center ms-4 mt-5 mb-5">
				<select name="keyfield" class="form-select me-1" style="width:auto;">
					<%-- c:if와 selected를 쓰는건 검색을 계속 유지 시키기 위해서 --%>
					<option value="1" <c:if test="${param.keyfield ==1}">selected</c:if>>제목</option>
					<option value="2" <c:if test="${param.keyfield ==2}">selected</c:if>>작성자</option>
					<option value="3" <c:if test="${param.keyfield ==3}">selected</c:if>>제조사</option>
				</select>
				<input type="search" name="keyword" id="keyword" value="${param.keyword}" class="form-control rounded me-2" placeholder="Search" aria-label="Search" aria-describedby="search-addon" style="width:400px;">
				<button type="submit" class="btn btn-warning fw-bold text-white btn-lg"><i class="bi bi-search"></i></button>
				<button class="btn btn-warning fw-bold text-white btn-lg ms-1" onclick="reset_btn()"><i class="bi bi-arrow-clockwise"></i></button>
				</div>
			</form>
		</div>
		<div class="d-flex justify-content-end my-3"> 
			<c:if test="${!empty user_num}">
			<input type="button" value="글쓰기" class="btn btn-warning text-white" onclick="location.href='writeForm.do'"	<%-- <c:if test="${empty user_num}">disabled="disabled" </c:if> --%> <%-- 비홯성화 시키는 법 --%>> 
			</c:if>
		</div>

		<table class="table table-hover my-3 text-center fw-bold">
			<thead class="table-light">
				<tr>
					<th>제조사</th>
					<th>차명</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="s_re" items="${list}">
				<tr>
					<td><a href="detail.do?s_re_num=${s_re.s_re_num}" class="text-decoration-none text-dark">${s_re.sell_maker}</a></td>
					<td><a href="detail.do?s_re_num=${s_re.s_re_num}" class="text-decoration-none text-dark">${s_re.sell_cname}</a></td>
					<td><a href="detail.do?s_re_num=${s_re.s_re_num}" class="text-decoration-none text-dark">${s_re.s_re_title}</a></td>
					<td><a href="detail.do?s_re_num=${s_re.s_re_num}" class="text-decoration-none text-dark">${s_re.mem_id}</a></td>
					<td><a href="detail.do?s_re_num=${s_re.s_re_num}" class="text-decoration-none text-dark"> ${fn:substring(s_re.s_re_reg, 0, 10)} </a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="text-center">${page}</div>
	<!--챗봇 끝  -->
    <jsp:include page="/WEB-INF/views/common/chatbot.jsp" />
	<!-- 푸터 시작-->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		function reset_btn(){
			location.href = 'redirect:/s_re/list.do';
		};
	</script>
</body>
</html>