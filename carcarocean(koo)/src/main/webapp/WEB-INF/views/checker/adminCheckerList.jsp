<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>검수자 목록 (관리자)</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<h1 class="my-5 text-center">검수자 정보 목록</h1>
		<table class="table table-hover mt-3 text-center fw-bold">
			<thead class="table-light">
				<tr>
					<th>#</th>
					<th>이름</th>
					<th>회사</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="checker" items="${list}">
				<tr>
					<td><a href="adminCheckerDetail.do?checker_num=${checker.checker_num}" class="text-decoration-none text-dark">${checker.checker_num}</a></td>
					<td><a href="adminCheckerDetail.do?checker_num=${checker.checker_num}" class="text-decoration-none text-dark">${checker.checker_name}</a></td>
					<td><a href="adminCheckerDetail.do?checker_num=${checker.checker_num}" class="text-decoration-none text-dark">${checker.checker_company}</a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="text-center">${page}</div>
		<hr size="1" width="100%" noshade="noshade">
		<div class="text-end mb-5">
			<input type="button" value="검수자 등록" class="btn btn-warning btn-lg text-lg text-white fw-bold" onclick="location.href='adminWriteCheckerForm.do'">
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>