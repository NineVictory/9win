$(function(){
	let reportCount = $('#output_report').attr('data-checkRedirect');
	/*============================
	 * 신고선택 여부와 선택한 총 개수 읽기
	 * =========================== */
	function selectReport(){
		//서버와 통신
		$.ajax({
			url:'getReport.do',
			type:'post',
			data:{info_board_num:$('#output_report').attr('data-num')},
			dataType:'json',
			success:function(param){
				displayReport(param);
				
			},
			error:function(){
				alert('네트워크 오류 발생1');
			}
		});
	}
	/*============================
	 * 신고 등록(및 삭제) 이벤트 연결
	 * =========================== */
	$('#output_report').click(function(){
		let choice = confirm("신고하시겠습니까");
		if(choice){
			//서버와 통신
			$.ajax({
				url:'writeReport.do',
				type:'post',
				data:{info_board_num:$(this).attr('data-num')},
				dataType:'json',
				success:function(param){
					if(param.result == 'logout'){
						alert('로그인 후 신고가 가능합니다.');
					}else if(param.result == 'success'){
							alert('신고되었습니다.');
							if(param.count>=10){
									alert('신고 수가 10을 넘어가 페이지가 이동합니다.');
				       	 	location.href = 'list.do';
				       	 	}
				       	 	displayReport(param);		
					}else{
						alert('신고 등록/삭제 오류 발생');
					}
				},
				error:function(){
					alert('네트워크 오류 발생2');
				}
			});
		}
	});
	/*============================
	 * 신고 표시 함수
	 * =========================== */
	function displayReport(param){
        let output;
        let text;
        if(param.status === 'yesReport'){
            $("#reportIcon").removeClass("bi-exclamation-octagon-fill").addClass("bi-exclamation-octagon");
            $("#output_report").attr("disabled","disabled");
            
        } else if(param.status === 'alreadyReport'){
			
            $("#reportIcon").removeClass("bi-exclamation-octagon-fill").addClass("bi-exclamation-octagon");
            $("#output_report").attr("disabled","disabled");
        } else {
            
            $("#reportIcon").removeClass("bi-exclamation-octagon").addClass("bi-exclamation-octagon-fill");
        }
		//문서 객체에 설정
		$('#output_report').attr('src',output);
		$('#report_status_text').text(text);
		
		if (param.result === 'logout') {
            $('#output_report').click(function() {
                alert('로그인 후 신고가 가능합니다.');
            });
        }
	}



	/*============================
	 * 초기 데이터 호출
	 * =========================== */
	selectReport();
});





