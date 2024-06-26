<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>차량 등록 폼</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="container">
	<hr size="1" width="100%" noshade="noshade">
	<h1 class="text-center">차량 등록 폼</h1>
	<form id="write_form" action="carWrite.do" method="post" enctype="multipart/form-data" class="m-5">
		<input type="hidden" name="sell_num" value="${sell.sell_num}">
		<ul class="list-unstyled">
			<li>
				<label for="car_maker">제조사</label>
				<input type="text" name="car_maker" id="car_maker" class="input-check form-control" maxlength="20" placeholder="예) 제네시스" value="${sell.sell_maker}">
			</li>
			<li>
				<label for="car_name">차량명</label>
				<input type="text" name="car_name" id="car_name" class="input-check form-control" maxlength="30" placeholder="예) gv80" value="${sell.sell_cname}">
			</li>
			<li>
				<label for="car_size">차종</label>
				<select id="car_size" name="car_size" class="form-select">
			        <option value="1">경차</option>
			        <option value="2">소형차</option>
			        <option value="3">준중형차</option>
			        <option value="4">중형차</option>
			        <option value="5">준대형차</option>
			        <option value="6">대형차</option>
			    </select>
			</li>
			<li>
				<label for="car_cnumber">차량번호</label>
				<input type="text" name="car_cnumber" id="car_cnumber" class="input-check form-control" maxlength="15" placeholder="ex) 123가 1234" value="${sell.sell_cnumber}">
			</li>
			<li>
				<label for="car_birth">연식</label>
				<input type="text" name="car_birth" id="car_birth" class="input-check form-control" maxlength="9" placeholder="예) 2018년 05월">
			</li>
			<li>
				<label for="car_cc">배기량(cc)</label>
				<input type="number" name="car_cc" id="car_cc" class="input-check form-control" maxlength="4" placeholder="예) 1999">
			</li>
			<li>
				<label for="car_fuel_type">연료 타입</label>
				<select id="car_fuel_type" name="car_fuel_type" class="form-select">
			        <option value="1">가솔린</option>
			        <option value="2">디젤</option>
			        <option value="3">전기</option>
			        <option value="4">수소</option>
			    </select>
			</li>
			<li>
				<label for="car_fuel_efficiency">연비(km/L)</label>
				<input type="text" name="car_fuel_efficiency" id="car_fuel_efficiency" class="input-check form-control" maxlength="5" placeholder="예) 10.2">
			</li>
			<li>
				<label for="car_mile">주행거리</label>
				<input type="number" name="car_mile" id="car_mile" class="input-check form-control" maxlength="6" placeholder="예) 14000" value="${sell.sell_mile}">
			</li>
			<li>
				<label for="car_price">차량 가격(만원)</label>
				<input type="number" name="car_price" id="car_price" class="input-check form-control" maxlength="5" placeholder="예) 2450">
			</li>
			<li>
				<label for="car_color">차량 색상</label>
				<input type="text" name="car_color" id="car_color" class="input-check form-control" maxlength="20" placeholder="예) 검은색">
			</li>
			<li>
				<label for="car_auto">변속기 타입</label>
				<select id="car_auto" name="car_auto" class="form-select">
			        <option value="1">수동</option>
			        <option value="2">오토</option>
			    </select>
			</li>
			<li>
				<label for="car_use">사용기간(개월)</label>
				<input type="number" name="car_use" id="car_use" class="input-check form-control" maxlength="3" placeholder="ex) 30">
			</li>
			<li>
				<label for="car_accident">사고이력</label>
				<input type="text" name="car_accident" id="car_accident" class="input-check form-control" maxlength="50" placeholder="ex) 침수차, 충돌사고">
			</li>
			<li>
				<label for="car_owner_change">소유주 변경 이력(회)</label>
				<input type="number" name="car_owner_change" id="car_owner_change" class="input-check form-control" maxlength="2" placeholder="ex) 2">
			</li>
			<li>
				<label for="car_design_op">디자인 옵션</label>
				<input type="text" name="car_design_op" id="car_design_op" maxlength="400" class="input-check form-control" maxlength="50" placeholder="ex) 디자인 옵션 종류(,로 구분)">
			</li>
			<li>
				<label for="car_con_op">편의 옵션</label>
				<input type="text" name="car_con_op" id="car_con_op" maxlength="400" class="input-check form-control" maxlength="50" placeholder="ex) 편의 옵션 종류(,로 구분)">
			</li>
			<li>
				<label for="car_drive_op">주행 옵션</label>
				<input type="text" name="car_drive_op" id="car_drive_op" maxlength="400" class="input-check form-control" maxlength="50" placeholder="ex) 주행 옵션 종류(,로 구분)">
			</li>
			<li>
				<label for="car_photo">차량 사진</label>
				<input type="file" name="car_photo" id="car_photo" accept="image/gif,image/png,image/jpeg" class="input-check form-control" multiple>
			</li>
			<c:if test="${!empty checkerList }">
			<li>
				<label for="checker_num">검수자</label>
				<select id="checker_num" name="checker_num" class="form-select">
					<c:forEach var="checker" items="${checkerList}">
					<option value="${checker.checker_num}">${checker.checker_name} / ${checker.checker_company}</option>
					</c:forEach>
				</select>
			</li>
			<li>
				<label for="car_checker_opinion">검수자 의견</label>
				<textarea rows="5" name="car_checker_opinion" id="car_checker_opinion" class="input-check form-control"></textarea>
			</li>
			</c:if>
		</ul>
		<hr size="1" width="100%" noshade>
		<c:if test="${empty checkerList }">
			<p class="ft-4">검수자 정보를 먼저 등록해주세요!!</p>
		</c:if>
		<c:if test="${!empty checkerList }">
		<div class="text-center">
			<input type="button" value="뒤로가기" onclick="history.back()" class="btn btn-secondary btn-lg">
			<input type="submit" value="등록" class="btn btn-primary btn-lg">
		</div>
		</c:if>
	</form>
</div>
<script type="text/javascript">
window.onload = function(){
	const myForm = document.getElementById('write_form');
	//이벤트 연결
	myForm.onsubmit = function(){	
		const items = document.querySelectorAll('.input-check');
		for(let i=0; i<items.length; i++){
			if(items[i].value.trim()==''){
				const label = document.querySelector(
						       'label[for="'+items[i].id+'"]');
				alert(label.textContent + ' 항목은 필수 입력');
				items[i].value = '';
				items[i].focus();
				return false;
			}
			
			/* 주행거리는 숫자만 입력 */
			if(items[i].id == 'car_mile'){
				var regex = /^\d+(\.\d+)?$/; //소수점을 허용하는 정규표현식
				if(isNaN(items[i].value)){
					alert('주행거리는 숫자만 입력해주세요.');
					items[i].value = '';
					items[i].focus();
					return false;
				}
			}
			
			/* 차량가격은 숫자만 입력 */
			if(items[i].id == 'car_owner_change'){
				if(items[i].value<0){
					alert('(-)는 입력하실 수 없습니다.');
					items[i].value = '0';
					items[i].focus();
					return false;
				}
			}
			
			/* 차량가격은 숫자만 입력 */
			if(items[i].id == 'car_price'){
				if(isNaN(items[i].value)){
					alert('차량가격은 숫자만 입력해주세요.');
					items[i].value = '';
					items[i].focus();
					return false;
				}
			}
			
			/* 차량 색상은 한글만 입력 */
			if (items[i].id == 'car_color') {
    			var koreanRegex = /^[가-힣\s]+$/; // 한글만 허용하는 정규표현식
   				 if (!koreanRegex.test(items[i].value)) {
       			 alert('색상을 다시 입력해주세요. 예) 검은색');
       			 items[i].value = '';
       			 items[i].focus();
      			  return false;
  			  }
			}

			/* 사용기간은 1자에서 3자까지 숫자만 입력 (개월) */
			if(items[i].id == 'car_use'){
				if(isNaN(items[i].value)){
					alert('사용기간은 숫자만 입력해주세요.');
					items[i].value = '';
					items[i].focus();
					return false;
				}
				if(items[i].value.length < 1 || items[i].value.length > 3){
					alert('사용기간은 개월수로 입력해주세요. 예)30');
					items[i].value = '';
					items[i].focus();
					return false;
				}
			}
			
			/* 연식 양식 체크 */
			if(items[i].id == 'car_birth'){
				if(items[i].value.length!=8){
					alert('연식은 년도와 월을 입력해주세요. 예) 0000년00월');
					items[i].value = '';
					items[i].focus();
					return false;
				}
			}
			
			/* 소유주 변경 이력(회) */
			if(items[i].id == 'car_owner_change'){
				if(isNaN(items[i].value)){
					alert('숫자만 입력해주세요. (없으면 0)');
					items[i].value = '';
					items[i].focus();
					return false;
				}
			}
			
		}
		if(!confirm('정말 제출하시겠습니까?')){
			return false;
		}else {
			alert('등록되었습니다!');
		}
	};
};
</script>
</body>
</html>