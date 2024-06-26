<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
    li {
    list-style:none;
    }
    </style>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- 카카오 SDK 로드 -->
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.2/kakao.min.js"
      integrity="sha384-TiCUE00h649CAMonG018J2ujOgDKW/kVWlChEuu4jK2vxfAAD0eZxzCKakxg55G4" crossorigin="anonymous"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            Kakao.init('3b68b2e61ad2013cf3f1403f5226af96'); // 여기에 실제 인증키를 넣으세요
            displayToken();
        });

        // 로그인 함수
        function loginWithKakao() {
            Kakao.Auth.authorize({
               /*  redirectUri: 'http://localhost:8080/carcarocean/member/loginForm.do', // 실제 리다이렉트 URI를 입력하세요. */
                state: 'userme',
            });
        }

        function requestUserInfo() {
            Kakao.API.request({
                url: '/v2/user/me',
                success: function(response) {
                    alert(JSON.stringify(response));
                    document.getElementById('token-result').innerText = 'login success, user: ' + JSON.stringify(response);
                },
                fail: function(error) {
                    alert('failed to request user information: ' + JSON.stringify(error));
                }
            });
        }

        // 데모를 위한 UI 코드
        function displayToken() {
            var token = getCookie('authorize-access-token');
            if(token) {
                Kakao.Auth.setAccessToken(token);
                document.querySelector('#token-result').innerText = 'login success, ready to request API';
                document.querySelector('button.api-btn').style.visibility = 'visible';
            }
        }

        // 쿠키에서 토큰을 가져오는 함수
        function getCookie(name) {
            var parts = document.cookie.split(name + '=');
            if (parts.length === 2) { return parts[1].split(';')[0]; }
        }
    </script>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
</head>
<body>
    <div class="container" style = "margin-bottom:150px;">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="text-center mt-5 mb-3 text-warning">로그인</h2>
                <!-- 로그인 폼 -->
                <form id="login_form" action="login.do" method="post" class="p-3 rounded-4 bg-light shadow">
                    <div class="form-group">
                        <label for="mem_id">아이디</label>
                        <input type="text" class="form-control" name="mem_id" id="mem_id" maxlength="12">
                    </div>
                    <div class="form-group">
                        <label for="mem_passwd">비밀번호</label>
                        <input type="password" class="form-control" name="mem_passwd" id="mem_passwd">
                    </div>
                    <button type="submit" class="btn btn-warning btn-block text-white">로그인</button>
                </form>
                <br>
	            <div class="d-grid gap-2 d-md-block">
	 				 <button class="btn btn-warning text-white" type="button" onclick="location.href='${pageContext.request.contextPath}/member/findIdForm.do'">아이디 찾기</button>
	 				 <button class="btn btn-warning text-white" type="button" onclick="location.href='${pageContext.request.contextPath}/member/findPasswdForm.do'">비밀번호 찾기</button>
				</div>
            </div>
                <!-- 카카오 로그인 버튼 -->
                <ul class="mt-1">
                    <li>
                        <a id="kakao-login-btn" href="javascript:loginWithKakao()" class="btn btn-block" >
                            <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222" alt="카카오 로그인 버튼" />
                        </a>
                    </li>
                </ul>
                <!-- 토큰 결과를 표시할 곳 -->
                <p id="token-result" class="mt-3"></p>
                <button class="api-btn" onclick="requestUserInfo()" style="visibility:hidden">사용자 정보 가져오기</button>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>