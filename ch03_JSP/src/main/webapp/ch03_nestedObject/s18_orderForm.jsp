<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식주문</title>
<script type="text/javascript">
/*
수량을 입력(주문안할시 0이라고 입력하기), 세가지 음식 중 하나는 꼭 주문
짜장면 4000원 짬뽕5000원 볶음밥6000원
[출력예시]
짜장면 2개
짬뽕 1개
총 지불금액 : 13,000원
 */

 window.onload = function(){
		const myForm = document.getElementById('myForm');
		myForm.onsubmit = function(){
			let foodOrdered = false; // 최소한 한 가지 음식을 선택했는지 확인하기 위한 변수
			
			const input = document.querySelectorAll('.input-check');
			for(let i=0;i<input.length;i++){
				if(input[i].value.trim()==''){
					const label = document.querySelector('label[for="'+input[i].id+'"]');
					const label_text = label.textContent;
					alert(label_text + ' 항목은 필수 입력');
					input[i].value = '';
					input[i].focus();
					return false;
				}
				
				// 수량이 0보다 크다면 해당 음식이 선택된 것으로 간주
				if(parseInt(input[i].value) > 0) {
					foodOrdered = true;
				}
			}
			
			// 최소한 한 가지 음식을 선택하지 않았다면 경고 메시지 표시 후 전송 취소
			if (!foodOrdered) {
				alert('최소한 한 가지 음식을 선택해주세요.');
				return false;
			}
		};
	};
</script>
</head>
<body>
<form action="s19_order.jsp" method="post" id="myForm">
	<table>
		<tr>
			<td class="title">식사류</td>
			<td>
				<ul>
					<li>
						<label for="c0">짜장면</label>
						<input type="number" name="food_c0" id="c0" min="0" max="99" value="0" class="input-check">
					</li>
					<li>
						<label for="c1">짬뽕</label>
						<input type="number" name="food_c1" id="c1" min="0" max="99" value="0" class="input-check">
					</li>
					<li>
						<label for="c2">볶음밥</label>
						<input type="number" name="food_c2" id="c2" min="0" max="99" value="0" class="input-check">
					</li>
				</ul>
			</td>
		</tr>
		<tr align="center">
			<td colspan="2">
				<input type="submit" value="전송">
			</td>
		</tr>
	</table>
</form>
</body>
</html>