<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 거래내역</title>
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<body>
	<div class="container">
		<div class="row">
			<c:set var="sub_title" value="마이페이지"
				scope="request" />
			<jsp:include page="/WEB-INF/views/member/myPageMenu.jsp" />
			<main class="col-md-10 pt-5 pb-5">
                <div class="mypage-div">
                	<div>
                	<h2 class = "text-secondary">${member.mem_name}님의 거래내역</h2><br>
                	<div>
					<h3>구매내역 <span style="margin-right: 80%;"></span><a href="${pageContext.request.contextPath}/b_re/list.do" class="btn btn-warning text-white">구매후기</a></h3>
					</div>
           			</div>
                    <table class="table text-center align-content-center fw-bold mt-3">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>차명</th>
                                <th>구매가격</th>
                                <th>거래완료일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="buy" items="${buyList}">
                                <tr>
                                    <td width = "250px">${buy.buy_num}</td>
                                    <td width = "250px">${buy.car_name}</td>
                                    <td><fmt:formatNumber type="number" value="${buy.car_price}" pattern="#,###" />만원</td>
									<td>${fn:substring(buy.buy_reg,0,10)}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table> 
                    <c:if test = "${empty buyList}">
                    <td><h2 class = "text-center">데이터없음</h2></td>
                    </c:if>
                    <br><br><br>

                    <div>
					<h3>판매내역 <span style="margin-right: 80%;"></span><a href="${pageContext.request.contextPath}/s_re/list.do" class="btn btn-warning text-white">판매후기</a></h3>
					</div>
                    <table class="table text-center align-content-center fw-bold mt-3">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>차명</th>
                                <th>판매신청일</th>
                                <th>거래완료일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="sell" items="${sellList}">
                                <tr>
                                    <td width = "250px">${sell.sell_num}</td>
                                    <td width = "250px">${sell.sell_cname}</td>
                                    <td>${fn:substring(sell.sell_reg,0,10)}</td>
									<td>${fn:substring(sell.sell_modify_check,0,10)}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <c:if test = "${empty sellList}">
                    <td><h2 class = "text-center">데이터없음</h2></td>
                    </c:if>
                </div>
            </main>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>