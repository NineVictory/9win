<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	alert('예약이 취소되었습니다.');
	location.href = '${pageContext.request.contextPath}/buy/buyDetail.do?car_num=${car_num}';
</script>