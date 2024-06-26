<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 글</title>
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<body>
	<div class="container">
		<div class="row">
			<c:set var="sub_title" value="마이페이지"
				scope="request" />
			<jsp:include page="/WEB-INF/views/member/myPageMenu.jsp" />
			<main class="col-md-10 pt-5 pb-5">
				<h2 class = "text-secondary">${member.mem_name}님이 작성한 글 목록</h2>
				<br><br>
                <div class="mypage-div">
             	    <h3>자유게시판</h3>
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
                            <c:forEach var="board" items="${list}">
                                <tr>
                                    <td width = "250px">${board.board_num}</td>
                                    <td width = "250px"><a href="${pageContext.request.contextPath}/board/detail.do?board_num=${board.board_num}" class="link-warning link-offset-2 link-underline-opacity-0 link-underline-opacity-0-hover">${board.board_title}</a></td>
                                    <td>${fn:substring(board.board_reg,0,10)}</td>
                                    <c:if test = "${!empty board.board_modify}">
									<td>${fn:substring(board.board_modify,0,10)}</td>
									</c:if>
									<c:if test = "${empty board.board_modify}">
                                    <td>데이터없음</td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <c:if test = "${empty list}">
                    <td><h2 class = "text-center">데이터없음</h2></td>
                    </c:if>
                    <br>
                	<h3>판매후기</h3>
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
                            <c:forEach var="s_re" items="${slist}">
                                <tr>
                                    <td width = "250px">${s_re.s_re_num}</td>
                                    <td width = "250px"><a href="${pageContext.request.contextPath}/s_re/detail.do?s_re_num=${s_re.s_re_num}" class="link-warning link-offset-2 link-underline-opacity-0 link-underline-opacity-0-hover">${s_re.s_re_title}</a></td>
                                    <td>${fn:substring(s_re.s_re_reg,0,10)}</td>
                                    <c:if test = "${!empty s_re.s_re_modify}">
									<td>${fn:substring(s_re.s_re_modify,0,10)}</td>
									</c:if>
									<c:if test = "${empty s_re.s_re_modify}">
                                    <td>데이터없음</td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <c:if test = "${empty slist}">
                    <td><h2 class = "text-center">데이터없음</h2></td>
                    </c:if>
                    <br><br>
                    <h3>구매후기</h3>
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
                            <c:forEach var="b_re" items="${blist}">
                                <tr>
                                    <td width = "250px">${b_re.b_re_num}</td>
                                    <td width = "250px"><a href="${pageContext.request.contextPath}/b_re/detail.do?b_re_num=${b_re.b_re_num}" class="link-warning link-offset-2 link-underline-opacity-0 link-underline-opacity-0-hover">${b_re.b_re_title}</a></td>
                                    <td>${fn:substring(b_re.b_re_reg,0,10)}</td>
                                    <c:if test = "${!empty b_re.b_re_modify}">
									<td>${fn:substring(b_re.b_re_modify,0,10)}</td>
									</c:if>
									<c:if test = "${empty b_re.b_re_modify}">
                                    <td>데이터없음</td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <c:if test = "${empty blist}">
                    <td><h2 class = "text-center">데이터없음</h2></td>
                    </c:if>
                    <br>
                </div>
            </main>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>