<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원정보 수정</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		//회원정보 수정 유효성 체크
		$('#modify_form').submit(
				function() {
					const items = document.querySelectorAll('.input-check');
					for (let i = 0; i < items.length; i++) {
						if (items[i].value.trim() == '') {
							const label = document.querySelector('label[for="'
									+ items[i].id + '"]');
							alert(label.textContent + ' 항목은 필수 입력');
							items[i].value = '';
							items[i].focus();
							return false;
						}
						if (items[i].id == 'zipcode'
								&& !/^[0-9]{5}$/.test($('#zipcode').val())) {
							alert('우편번호를 입력하세요(숫자5자리)');
							$('#zipcode').val('').focus();
							return false;
						}
					}//end of for
					if ($('#mem_passwd').val() != $('#cpasswd').val()) {
						alert('새비밀번호와 새비밀번호 확인이 불일치');
						$('#mem_passwd').val('').focus();
						$('#cpasswd').val('');
						return false;
					}
				}); //end of submit

		//새비밀번호 확인까지 한 후 다시 새비밀번호를 수정하려고 하면 새비밀번호 확인을
		//초기화
		$('#mem_passwd').keyup(function() {
			$('#cpasswd').val('');
			$('#message_cpasswd').text('');
		});

		//새비밀번호와 새비밀번호 확인 일치 여부 체크
		$('#cpasswd').keyup(function() {
			if ($('#mem_passwd').val() == $('#cpasswd').val()) {
				$('#message_cpasswd').text('새비밀번호 일치');
			} else {
				$('#message_cpasswd').text('');
			}
		});

		$('#photo_btn').click(function() {
			$('#photo_choice').show();
			$(this).hide(); //수정 버튼 감추기
		});

		//사진 업로드 ,수정 부분
		//이미지 미리 보기
		let photo_path = $('.my-photo').attr('src');//처음 화면에 보여지는 이미지 읽기
		$('#mem_photo').change(
				function() {
					let my_photo = this.files[0];
					if (!my_photo) {
						//선택을 취소하면 원래 처음 화면으로 되돌림
						$('.my-photo').attr('src', photo_path);
						return;
					}

					if (my_photo.size > 1024 * 1024) {
						alert(Math.round(my_photo.size / 1024)
								+ 'kbytes(1024kbytes까지만 업로드 가능)');
						$('.my-photo').attr('src', photo_path);
						$(this).val('');//선택한 파일 정보 지우기
						return;
					}
					//화면에 이미지 미리 보기
					const reader = new FileReader();
					reader.readAsDataURL(my_photo);

					reader.onload = function() {
						$('.my-photo').attr('src', reader.result);
					};
				});//end of change

		//이미지 전송
		$('#photo_submit').click(function() {
			if ($('#mem_photo').val() == '') {
				alert('파일을 선택하세요');
				$('#mem_photo').focus();
				return;
			}
			//파일 전송
			const form_data = new FormData();
			//업로드할 파일은 $('#photo').files[0]를 호출할 수 없음
			//$('#photo')[0].files[0] 또는
			//document.getElementById('photo').files[0]
			//형식으로 호출 가능
			form_data.append('mem_photo', $('#mem_photo')[0].files[0]);

			$.ajax({
				url : 'updateMyPhoto.do',
				type : 'post',
				data : form_data,
				dataType : 'json',
				contentType : false, //데이터 객체를 문자열로 바꿀지 설정.true이면 일반문자
				processData : false, //해당 타입을 true로 하면 일반 text로 구분
				success : function(param) {
					if (param.result == 'logout') {
						alert('로그인 후 사용하세요');
					} else if (param.result == 'success') {
						alert('프로필 사진이 수정되었습니다.');
						//수정된 이미지 정보 저장
						photo_path = $('.my-photo').attr('src');
						$('#mem_photo').val('');
						$('#photo_choice').hide();
						$('#photo_btn').show();//수정 버튼 표시
					} else {
						alert('파일 전송 오류 발생');
					}
				},
				error : function() {
					alert('네트워크 오류 발생');
				}
			});

		});//end of click

		//이미지 미리보기 취소
		$('#photo_reset').click(function() {
			//초기 이미지 표시
			$('.my-photo').attr('src', photo_path);//이미지 미리보기 전 이미지로 되돌리기
			$('#mem_photo').val('');
			$('#photo_choice').hide();
			$('#photo_btn').show();//수정 버튼 표시
		});
	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<div class="row justify-content-center">
			<c:set var="sub_title" value="회원정보"
				scope="request" />
			<jsp:include page="/WEB-INF/views/member/myPageMenu.jsp" />
			<main class="col-md-10 pt-5 pb-5">
				<div class="page-main conteiner">
					<div class="contents">
						<form id="modify_form" action="modifyUser.do" method="post"
							class="shadow p-3 bg-light">
						<h2 class = "text-warning">${member.mem_name}님의 정보</h2>
							<div class="form-group">
							<label for="mem_name">이름</label> <input type="text"
								name="mem_name" id="mem_name" value="${member.mem_name}"
								maxlength="10" class="input-check form-control">
							</div> 
							<div class="form-group">
							<label
								for="mem_photo">프로필</label><br>
							<c:if test="${empty member.mem_photo}">
								<img src="${pageContext.request.contextPath}/images/face.png"
									width="200" height="200" class="my-photo">
							</c:if>
							<c:if test="${!empty member.mem_photo}">
								<img
									src="${pageContext.request.contextPath}/upload/${member.mem_photo}"
									width="200" height="200" class="my-photo">
							</c:if>
							<div class="align-center">
								<input type="button" value="프로필 사진 수정" id="photo_btn" class = "btn btn-warning text-white">
							</div>
							<div id="photo_choice" style="display: none;">
								<input type="file" id="mem_photo"
									accept="image/gif,image/png,image/jpeg"> <input
									type="button" value="전송" id="photo_submit"> <input
									type="button" value="취소" id="photo_reset">
							</div>
							</div>
							<div class="form-group">
							<label for="mem_id">아이디</label> <input type="text" name="mem_id"
								id="mem_id" maxlength="12" class="input-check form-control">
							</div> 
							<div class="form-group">
							<label
								for="mem_phone">전화번호</label> <input type="text" name="mem_phone"
								id="mem_phone" value="${member.mem_phone}" maxlength="11"
								class="input-check form-control">
							</div> 
							<div class="form-group"><label for="origin_passwd">현재
								비밀번호</label> <input type="password" name="origin_passwd"
								id="origin_passwd" maxlength="12" class="input-check form-control">
							</div> 
							<div class="form-group">
							<label
								for="mem_passwd">새비밀번호</label> <input type="password"
								name="mem_passwd" id="mem_passwd" maxlength="12"
								class="input-check form-control"> 
								</div>
								<div class="form-group"><label for="cpasswd">새비밀번호
								확인</label> <input type="password" id="cpasswd" maxlength="12"
								class="input-check form-control"> <span id="message_cpasswd"></span>
								</div>
								<div class="form-group">
							<label for="mem_email">이메일</label> <input type="email"
								name="mem_email" id="mem_mail" value="${member.mem_email}"
								maxlength="50" class="input-check form-control"></div>
								<div class="form-group">
								 <label
								for="mem_zipcode">우편번호</label> <input type="text"
								name="mem_zipcode" id="mem_zipcode" maxlength="5"
								autocomplete="off" value="${member.mem_zipcode}"
								class="input-check form-control"> <input type="button" class = "btn btn-warning text-white"
								value="우편번호 찾기" onclick="execDaumPostcode()"></div>
								<div class="form-group">
								 <label
								for="amem_ddress1">주소</label> <input type="text"
								name="mem_address1" id="mem_address1"
								value="${member.mem_address1}" maxlength="30"
								class="input-check form-control">
								</div>
								<div class="form-group">
								 <label for="mem_address2">나머지
								주소</label> <input type="text" name="mem_address2" id="mem_address2"
								value="${member.mem_address2}" maxlength="30"
								class="input-check form-control"> 
								</div>
								가입일 <br>
								${fn:substring(member.mem_reg,0,10)}
							<c:if test="${!empty member.mem_modify}">
								<br>
								최근 정보 수정일<br>
								${fn:substring(member.mem_modify,0,10)} 
								<br>
								</c:if>
							<div class="btn-group w-100" role="group" aria-label="Basic outlined example">
								<input type="submit" value="수정" class = "btn btn-outline-light bg-warning text-white"> <input type="button"
									value="마이페이지" class = "btn btn-outline-light bg-warning text-white" onclick="location.href='myPage.do'">
							</div>
						</form>
					</div>
				</div>
			</main>
		</div>
	</div>

	<!-- footer -->
	<!-- 다음 우편번호 API 시작 -->
	<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
	<div id="layer"
		style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
			id="btnCloseLayer"
			style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
			onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		// 우편번호 찾기 화면을 넣을 element
		var element_layer = document.getElementById('layer');

		function closeDaumPostcode() {
			// iframe을 넣은 element를 안보이게 한다.
			element_layer.style.display = 'none';
		}

		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								//(주의)address1에 참고항목이 보여지도록 수정
								// 조합된 참고항목을 해당 필드에 넣는다.
								//(수정) document.getElementById("address2").value = extraAddr;

							}
							//(수정) else {
							//(수정)    document.getElementById("address2").value = '';
							//(수정) }

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('mem_zipcode').value = data.zonecode;
							//(수정) + extraAddr를 추가해서 address1에 참고항목이 보여지도록 수정
							document.getElementById("mem_address1").value = addr
									+ extraAddr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("mem_address2").focus();

							// iframe을 넣은 element를 안보이게 한다.
							// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
							element_layer.style.display = 'none';
						},
						width : '100%',
						height : '100%',
						maxSuggestItems : 5
					}).embed(element_layer);

			// iframe을 넣은 element를 보이게 한다.
			element_layer.style.display = 'block';

			// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
			initLayerPosition();
		}

		// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
		// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
		// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
		function initLayerPosition() {
			var width = 300; //우편번호서비스가 들어갈 element의 width
			var height = 400; //우편번호서비스가 들어갈 element의 height
			var borderWidth = 5; //샘플에서 사용하는 border의 두께

			// 위에서 선언한 값들을 실제 element에 넣는다.
			element_layer.style.width = width + 'px';
			element_layer.style.height = height + 'px';
			element_layer.style.border = borderWidth + 'px solid';
			// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
			element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
					+ 'px';
			element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
					+ 'px';
		}
	</script>
	<!-- 다음 우편번호 API 끝 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>






