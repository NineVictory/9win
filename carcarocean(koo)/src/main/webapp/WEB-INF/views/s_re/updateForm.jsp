<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>차량 판매후기 글수정</title>
<script type="text/javascript">
window.onload=function(){
	const myForm = document.getElementById('update_form');
	//이벤트 연결
	myForm.onsubmit=function(){
		const title = document.getElementById('s_re_title');
		if(title.value.trim()==''){
			alert('제목을 입력하세요');
			title.value = '';
			title.focus();
			return false;
		}
		const sellNum = document.getElementById('sell_num');
        if (sellNum.value == '') {
            alert('판매한 차량 식별번호를 선택하세요');
            sellNum.focus();
            return false;
        }
		const content = document.getElementById('s_re_content');
		if(content.value.trim()==''){
			alert('내용을 입력하세요');
			content.value='';
			content.focus();
			return false;
		}
	};
};
</script>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
</head>
<body>
<div class="page-main">
		<div class="content-main">
			<h2>글수정</h2>
			<form id="update_form" action="update.do" method="post" 
				enctype="mutipart/form-data">
				<input type="hidden" name="s_re_num" value="${s_re.s_re_num}">
				<ul>
					<li>
						<label for="s_re_title">제목(필수)</label><br>
						<input type="text" name="s_re_title" id="s_re_title" value="${s_re.s_re_title}" maxlength="50">
					</li>
					<!-- <li>
						<label for="checker_num">차량 검수자(필수)</label><br>
						<input type="text" name="checker_num" id="checker_num" maxlength="50">
					</li> -->
                  
					<li>
                    	<label for="sell_num">판매한 차량 식별번호(필수)</label><br>
                    		<select name="sell_num" id="sell_num">
							<option value="">거래 내역을 선택하세요</option>
							<c:forEach var="sell" items="${sellList}">
							
								<option value="${sell.sell_num}">${sell.sell_num}/ ${sell.sell_maker}/${sell.sell_cname}</option>
								
							</c:forEach>
					</select> 
					</li>
					
					<li>
						<label for="s_re_content">내용</label><br>
						<textarea rows="5" cols="40" name="s_re_content" id="s_re_content">${s_re.s_re_content}</textarea>
					</li>
				</ul>
				<div class="align-center">
					<input type="submit" value="등록">
					<input type="button" value="목록" onclick="location.href='list.do'">
				</div>
			</form>
		</div>
</div>
</body>
</html>