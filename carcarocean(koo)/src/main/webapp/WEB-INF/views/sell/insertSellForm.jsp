<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>판매 신청서 팝업창</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
.noto-sans-kr-<uniquifier> {
  font-family: "Noto Sans KR", sans-serif;
  font-optical-sizing: auto;
  font-weight: <weight>;
  font-style: normal;
}
</style>
</head>
<body style="font-family:Noto Sans KR;">
	<div class="container text-center p-5">
		<h1>내 차 팔기 신청서</h1>
		<form id="my_form" action="insertSell.do" method="post">
			<ul class="list-unstyled">
				<li>
					<label for="sell_cnumber">차량번호</label>
					<input type="text" id="sell_cnumber" name="sell_cnumber" class="sell-data form-control" maxlength="9" placeholder="예) 123가 1234">
				</li>
				<li>
					<label for="sell_maker">제조사</label>
					<input type="text" id="sell_maker" name="sell_maker" class="sell-data form-control" placeholder="예) 기아">			
				</li>
				<li>
					<label for="sell_cname">차량명</label>
					<input type="text" id="sell_cname" name="sell_cname" class="sell-data form-control" placeholder="예) 셀토스">
				</li>
				<li>
					<label for="sell_mile">주행거리</label>
					<input type="text" id="sell_mile" name="sell_mile" class="sell-data form-control" min="0" placeholder="예) 14000">
				</li>
				<li>
					<label for="sell_name">신청자명</label>
					<input type="text" id="sell_name" name="sell_name" class="sell-data form-control" maxlength="4" placeholder="예) 홍길동" value="${member.mem_name}">
				</li>
				<li>
					<label for="sell_phone">휴대폰번호</label>
					<input type="text" id="sell_phone" name="sell_phone" class="sell-data form-control" maxlength="11" placeholder="예) '-'없이 숫자만 입력. 예)01012345678" value="${member.mem_phone}">
				</li>
			</ul>
			<ul class="list-unstyled">
				<!-- 시/도 선택 시작 -->
				<li>
					<label for="sell_place1">방문진단 요청 지역(시/도)</label>
					<select id="sell_place1" name="sell_place1" class="sell-data form-select">
						<option>시/도를 선택해주세요.</option>
				        <option value="서울특별시">서울특별시</option>
				        <option value="부산광역시">부산광역시</option>
				        <option value="대구광역시">대구광역시</option>
				        <option value="인천광역시">인천광역시</option>
				        <option value="광주광역시">광주광역시</option>
				        <option value="대전광역시">대전광역시</option>
				        <option value="울산광역시">울산광역시</option>
				        <option value="세종특별자치시">세종특별자치시</option>
				        <option value="경기도">경기도</option>
				        <option value="강원도">강원도</option>
				        <option value="충청북도">충청북도</option>
				        <option value="충청남도">충청남도</option>
				        <option value="전라북도">전라북도</option>
				        <option value="전라남도">전라남도</option>
				        <option value="경상북도">경상북도</option>
				        <option value="경상남도">경상남도</option>
				        <option value="제주특별자치도">제주특별자치도</option>
				    </select>
				</li>
				<!-- 시/도 선택 끝 -->
				<!-- 군/구 선택 시작 -->
				<li>
					<label for="sell_place2">방문진단 요청 지역(군/구)</label>
				    <select id="sell_place2" name="sell_place2" class="sell-data form-select">
					    <c:forEach var="city" items="${cityList}">
					    	<option value="${city}">${city}</option>
					    </c:forEach>
				    </select>
				    <!-- 군/구 선택 끝 -->
				</li>
			</ul>
			<ul class="list-unstyled">
				<li>
					<label>검수 희망일</label>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="sell_date" id="sell_date0" value="0" checked>
					  <label class="form-check-label" for="sell_date0">즉시</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="sell_date" id="sell_date1" value="1">
					  <label class="form-check-label" for="sell_date1">7일 이내</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="sell_date" id="sell_date2" value="2">
					  <label class="form-check-label" for="sell_date2">30일 이내</label>
					</div>
				</li>
			</ul>
			<div class="bg-color-gray">
				<input type="submit" class="btn btn-primary" value="제출" onclick="submitForm()">
				<input type="button" class="btn btn-secondary" value="취소" onclick="closePopup()">
			</div>
		</form>
	</div>
<script>
	$('#sell_place1').change(function(){
		$.ajax({
			url:'cityList.do',
			type:'post',
			data:{city:$("#sell_place1").val()},
			dataType:'json',
			success:function(param){
				var cityList = param.cityList; // 받아온 cityList 배열
	            var selectHTML = ''; // select 요소에 들어갈 HTML 코드

	            // 받아온 cityList를 반복하여 select 요소의 option을 생성
	            for(var i = 0; i < cityList.length; i++) {
	                selectHTML += '<option value="' + cityList[i] + '">' + cityList[i] + '</option>';
	            }

	            // 생성된 HTML 코드를 sell_place2의 내부 HTML로 설정
	            $('#sell_place2').html(selectHTML);
			}
		});
	});

	/* 제출 버튼 */
	const myForm = document.getElementById('my_form');
	myForm.onsubmit = function() {
		const data = document.querySelectorAll(".sell-data");
		for(let i=0; i<data.length; i++){
			const label = document.querySelector('label[for="'+data[i].id+'"]');
			if(data[i].value.trim()=='' ||data[i].value==null){
				alert(label.textContent+' 항목을 입력해주세요!');
				data[i].value = '';
				data[i].focus();
				return false;
			}
			
			/* 신청자명은 2자에서 4자까지 인정 */
			if(data[i].id=='sell_name'){
				if(data[i].value.length<2 || data[i].value.length>5){
					alert('신청자명은 본명으로 입력해주세요! (2~4자)');
					data[i].value = '';
					data[i].focus();
					return false;
				}
			}
			/* 주행거리 숫자만 인정 */
			if(data[i].id=='sell_mile'){
				if(isNaN(data[i].value)){
					alert('주행거리는 숫자로 입력해주세요!');
					data[i].value = '';
					data[i].focus();
					return false;
				}
			}
			/* 휴대폰번호는 11자로 된 숫자만 인정 */
			if(data[i].id=='sell_phone'){
				if(isNaN(data[i].value)){
					alert('핸드폰 번호는 숫자로 입력해주세요!');
					data[i].value = '';
					data[i].focus();
					return false;
				}
				if(data[i].value.length!=11){
					alert("휴대폰 번호는 '-'없이 11자로 입력해주세요!")
					data[i].value = '';
					data[i].focus();
					return false;
				}
			}
		}
	};
	/* 취소 버튼 */
	function closePopup() {
	    window.close();
	};
</script>
</body>
</html>