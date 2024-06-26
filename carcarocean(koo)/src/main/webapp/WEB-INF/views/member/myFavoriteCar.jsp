<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix ="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 관심차량</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<div class="row">
			<c:set var="sub_title" value="마이페이지"
				scope="request" />
			<jsp:include page="/WEB-INF/views/member/myPageMenu.jsp" />
			<main class="col-md-10 pt-5 pb-5">
                <div class="mypage-div">
                	<h2 class = "text-secondary">${member.mem_name}님의 관심차량</h2>
                    <table class="table text-center align-content-center fw-bold mt-3">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>차량명</th>
                                <th>차량번호</th>
                                <th>차량가격</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="list" items="${list}">
                                <tr>
                                    <td width = "250px">${list.car.car_num}</td>
                                    <td width = "250px"><a href="${pageContext.request.contextPath}/buy/buyDetail.do?car_num=${list.car.car_num}" class="link-warning link-offset-2 link-underline-opacity-0 link-underline-opacity-0-hover">${list.car.car_name}</a></td>
                                    <td width = "250px">${list.car.car_cnumber}</td>
                                    <td width = "250px">${list.car.car_price}만원</td>
                           	    </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <c:if test = "${empty list}">
                    <td><h2 class = "text-center">데이터없음</h2></td>
                    </c:if>
                </div>
            </main>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>