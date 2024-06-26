<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>게시물 목록</title>
<meta charset="UTF-8">
<title>정보공유 게시판 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="container">
	<h2 class="pt-5 pb-3">정보공유 게시판 목록</h2>
	<div class="d-flex justify-content-between align-items-center rounded" style="background-color:#f5f6f9;">
		<div class="text-start ms-4 mt-5 mb-5" style="font-size: 15pt;">
	        총 ${count}건의 글이 있습니다.
		</div>
		<form id="search_form" action="list.do" method="get">
			<div class="d-flex align-items-center">
				<select name="keyfield" class="form-select" style="width:auto; margin-right: 10px;">
					<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>제목</option>
					<option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>>작성자</option>
					<option value="3" <c:if test="${param.keyfield == 3}">selected</c:if>>내용</option>
				</select>
				<input type="search" size="20" name="keyword" id="keyword" value="${param.keyword}" class="form-control rounded me-2" placeholder=" 검색할 정보를 입력하세요" aria-label="Search" aria-describedby="search-addon" style="width:400px;">
				<button type="submit" class="btn btn-warning fw-bold text-white btn-lg me-2"><i class="bi bi-search"></i></button>
				<a href="../info_board/list.do" class="btn btn-warning fw-bold text-white btn-lg me-4"><i class="bi bi-arrow-clockwise"></i></a>
			</div>
		</form>
	</div>
	<table class="table table-hover mt-4">
		<thead class="table-light text-center">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>추천수</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="info" items="${list}">
		<c:if test="${info.info_board_report < 10}">
		<tr>
		<c:choose>
                <c:when test="${info.likes >= 10}">
                	<tr>
                    <td class="text-center"><a href="detail.do?info_board_num=${info.info_board_num}" class="text-decoration-none text-dark">${info.info_board_num}</a></td>
                    <td><a href="detail.do?info_board_num=${info.info_board_num}" class="text-decoration-none text-warning fw-bold">${info.info_board_title}</a></td>
                    <td class="text-center"><a href="detail.do?info_board_num=${info.info_board_num}" class="text-decoration-none text-dark">${info.mem_id}</a></td>
                    <td class="text-center">
						<c:if test="${empty info.info_board_modify}">
							  <a class="text-decoration-none text-dark" href="detail.do?info_board_num=?${info.info_board_num}">${fn:substring(info.info_board_reg, 0, 10)}</a>
						</c:if>
						<c:if test="${!empty info.info_board_modify}">
							 <a class="text-decoration-none text-dark" href="detail.do?info_board_num=?${info.info_board_num}">${fn:substring(info.info_board_modify, 0, 10)}</a>
						</c:if>
					</td>
                    <td class="text-center"><a href="detail.do?info_board_num=${info.info_board_num}" class="text-decoration-none text-dark">${info.info_board_hit}</a></td>
                    <td class="text-center"><a href="detail.do?info_board_num=${info.info_board_num}" class="text-decoration-none text-warning fw-bold">${info.likes}</a></td>
                	</tr>
                </c:when>
                <c:otherwise>
                    <td class="text-center"><a href="detail.do?info_board_num=${info.info_board_num}" class="text-decoration-none text-dark">${info.info_board_num}</a></td>
                    <td><a href="detail.do?info_board_num=${info.info_board_num}" class="text-decoration-none text-dark">${info.info_board_title}</a></td>
                    <td class="text-center"><a href="detail.do?info_board_num=${info.info_board_num}" class="text-decoration-none text-dark">${info.mem_id}</a></td>
                     <td class="text-center">
						<c:if test="${empty info.info_board_modify}">
							  <a class="text-decoration-none text-dark" href="detail.do?info_board_num=?${info.info_board_num}">${fn:substring(info.info_board_reg, 0, 10)}</a>
						</c:if>
						<c:if test="${!empty info.info_board_modify}">
							 <a class="text-decoration-none text-dark" href="detail.do?info_board_num=?${info.info_board_num}">${fn:substring(info.info_board_modify, 0, 10)}</a>
						</c:if>
					</td>
                    <td class="text-center"><a href="detail.do?info_board_num=${info.info_board_num}" class="text-decoration-none text-dark">${info.info_board_hit}</a></td>
                    <td class="text-center"><a href="detail.do?info_board_num=${info.info_board_num}" class="text-decoration-none text-dark">${info.likes}</a></td>
                </c:otherwise>
            </c:choose>
		</tr>
		</c:if>
		</c:forEach>
		</tbody>
	</table>
	<div class="text-center">${page}</div>
	<div class="text-end">
		<input type="button" class="btn btn-warning fw-bold text-white my-3" value="글쓰기" onclick="location.href='writeForm.do'"
			<c:if test="${empty user_num}">disabled="disabled"</c:if>>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script type="text/javascript">
	window.onload=function(){
		const myForm = document.getElementById('search_form');
		//이벤트 연결
		myForm.onsubmit=function(){
			const keyword = document.getElementById('keyword');
			if(keyword.value.trim() == ''){
				alert('검색어를 입력하세요.');
				keyword.value = '';
				keyword.focus();
				return false;
			}
		};
	};
</script>
</html>