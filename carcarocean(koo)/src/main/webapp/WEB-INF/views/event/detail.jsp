<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 게시판 상세</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container">
			<h2 class="pt-5 pb-3">이벤트 게시판</h2>
			
		<hr size="1" noshade="noshade" width="100%">
			<div class="mt-4 mb-4 d-flex justify-content-between align-items-center">
				<!-- 제목 -->
				<div class="text-start fs-3 mt-1">${event.event_title}</div>
				<!-- 작성일 -->
				<div class="text-end" style="margin-right: 30px;">
					<c:if test="${!empty event.event_modify}">
						${fn:substring(event.event_modify,0,10)}
					</c:if>
					<c:if test="${empty event.event_modify}">
						${fn:substring(event.event_reg,0,10)}
					</c:if>
				</div>		
			</div>			
			
		<hr size="1" noshade="noshade" width="100%">
			<div class="mt-1 mb-1 d-flex justify-content-between align-items-center">
				<!-- 작성자 정보 -->
        		<div class="d-flex align-items-center" style="margin-left: 30px;">
        			관리자
        		</div>
        		<!-- 조회수 -->
        		<div class="text-end">
           			<div class="d-inline" style="margin-right: 30px;">조회수 : ${event.event_hit}</div>
        		</div>
       		</div>
       		
        <hr size="1" noshade="noshade" width="100%">
			<!-- 사진 첨부 -->
			<c:if test="${!empty event.event_photo}">
					<div class="text-center mb-5">
						<c:forEach var="photo" items="${fn:split(event.event_photo,',')}">
							<img src="${pageContext.request.contextPath}/upload/${photo}" class="detail-img" width="600px" height="400px"><br>
						</c:forEach>
					</div>
			</c:if>
			<!-- 상세 내용 -->
				<p>
					${event.event_content}
				</p>
		<hr size="1" noshade="noshade" width="100%">
			<!-- 내용 하단 버튼 -->
			<div class="text-end mb-5">
				<ul class="detail-sub list-unstyled">
					<li>
						<input type="button" class="btn btn-warning text-white" value="목록" onclick="location.href='list.do'">
						<c:if test="${!empty user_num && user_auth == 9}">
						<input type="button" class="btn btn-warning text-white" value="수정" onclick="location.href='updateForm.do?event_num=${event.event_num}'">
						<input type="button" class="btn btn-warning text-white" value="삭제" id="delete_btn">
						<script type="text/javascript">
							const delete_btn = document.getElementById('delete_btn');
							//이벤트 연결
							delete_btn.onclick = function(){
								let choice = confirm('삭제하시겠습니까?');
								if(choice){
									location.replace('delete.do?event_num=${event.event_num}');
								}
							};
						</script>
						</c:if>
					</li>
				</ul>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>