<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 판매후기 쓰기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
window.onload=function(){
	const myForm = document.getElementById('write_form');
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

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="container">
			<h2 class="mt-5 mb-5">글쓰기</h2>
			<form id="write_form" action="write.do" method="post" 
				enctype="mutipart/form-data" >
				<div class="form-group" class="border border-warning p-3">
				
						<label for="s_re_title" class="fs-4 mt-2 mb-2">제목(필수)</label><br>
						<input type="text" name="s_re_title" id="s_re_title" maxlength="50" class="input-check form-control mb-4">
					</div>
					<!-- <li>
						<label for="checker_num">차량 검수자(필수)</label><br>
						<input type="text" name="checker_num" id="checker_num" maxlength="50">
					</li> -->
                  
					<div class="form-group">
                    	<label for="sell_num" class="fs-4 mb-2">판매한 차량 식별번호(필수)</label><br>
                    		<select name="sell_num" id="sell_num" class="btn btn-secondary dropdown-toggle fs-5" style="width:auto;">
							<option value="">거래 내역을 선택하세요</option>
							<c:forEach var="sell" items="${sellList}">
							
								<option value="${sell.sell_num}">${sell.sell_num}/ ${sell.sell_maker}/${sell.sell_cname}</option>
								
							</c:forEach>
					</select> 
					</div>
					
					<div class="form-group">
						<label for="s_re_content" class="fs-4 mt-3 mb-2">내용</label><br>
						<textarea rows="20" cols="70" name="s_re_content" id="s_re_content" class="form-control" placeholder="후기를 입력해주세요."></textarea>
					</div>
				
				<div class="mt-3 mb-5 center">
					<input type="submit" value="등록" class="btn btn-warning text-white">
					<input type="button" value="목록" class="btn btn-warning text-white" onclick="location.href='list.do'">
				</div>
			</form>
		</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>