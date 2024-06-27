<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:if test="${check}">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원탈퇴</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pgh.css" type="text/css">
</head>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<body>
<div class="page-main">
	<div class="content-main">
		<h2>회원탈퇴 완료</h2>
		<div class="result-display">
			<div class="align-center">
				회원탈퇴가 완료되었습니다.
				<p>
				<input type="button" value="홈으로"
				  onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
			</div>
		</div>
	</div>
</div>
</body>
<footer>
	<!-- Footer-->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<!-- end of Footer -->
</footer>
</html>
</c:if>
<c:if test="${!check}">
	<script>
		alert('입력한 정보가 정확하지 않습니다.');
		history.go(-1);
	</script>
</c:if>











