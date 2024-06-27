<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>검수자 세부정보</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<h1 class="text-center my-5">검수자 세부정보</h1>
		<div>
			<ul class="list-unstyled">
				<li>
					<p class="text-center"><img src="${pageContext.request.contextPath}/upload/${checker.checker_photo}" width="250px" height="150px" class="rounded-4"></p>
				</li>
				<li>
					<p class="fs-3 fw-bold">이름 : ${checker.checker_name}</p>
				</li>
				<li>
					<p class="fs-5 fw-bold">회사 : ${checker.checker_company}</p>
				</li>
				<li>
					<p class="fs-5 fw-bold">전화번호 : ${checker.checker_phone}</p>
				</li>
			</ul> 
		</div>
		<hr size="1" noshade width="100%">
		<div class="text-end mb-5">
			<input type="button" value="목록" class="btn btn-warning" onclick="location.href='adminCheckerList.do'">
			<input type="button" value="수정" class="btn btn-primary" onclick="location.href='adminUpdateCheckerForm.do?checker_num=${checker.checker_num}'">
			<input type="button" value="삭제" class="btn btn-danger" onclick="delete_btn()" <c:if test="${count>0}">disabled</c:if>>
		</div>
	</div>
	<script>
		function delete_btn() {
			if(confirm("정말 삭제하시겠습니까?")){
				location.href= "adminDeleteChecker.do?checker_num=${checker.checker_num}";
				alert("삭제되었습니다!");
			}
		}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>