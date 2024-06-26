<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix ="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 문의내역</title>
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
        
                	<h2 class = "text-secondary">${member.mem_name}님의 문의내역</h2>
                    <table class="table text-center align-content-center fw-bold mt-3">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>제목</th>
                                <th>작성일</th>
                                <th>수정일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="qa" items="${list}">
                                <tr>
                                    <td width = "250px">${qa.qa_num}</td>
                                    <td width = "250px"><a href="${pageContext.request.contextPath}/qa/detail.do?qa_num=${qa.qa_num}" class="link-warning link-offset-2 link-underline-opacity-0 link-underline-opacity-0-hover">${qa.qa_title}</a></td>
                                   	<td>${fn:substring(qa.qa_reg,0,10)}</td>
                                    <c:if test = "${!empty qa.qa_modify}">
									<td>${fn:substring(qa.qa_modify,0,10)}</td>
									</c:if>
									<c:if test = "${empty qa.qa_modify}">
                                    <td>데이터없음</td>
                                    </c:if>
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