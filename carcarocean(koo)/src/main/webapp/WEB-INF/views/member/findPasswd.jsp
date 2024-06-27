<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose> 
	<c:when test="${mem_passwd != null}">   
	<script type="text/javascript">
		alert('회원님의 비밀번호는 ${mem_passwd} 입니다.');
		history.go(-1);
	</script>
	</c:when>
	<c:otherwise>
	<script type="text/javascript">
		alert('입력한 정보가 불일치합니다.');
		history.go(-1);
	</script> 
	</c:otherwise>
</c:choose>	