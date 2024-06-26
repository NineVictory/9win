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
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<body>
    <div class="container" style = "margin-bottom:150px">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="text-center mt-5 mb-3 text-warning">아이디 찾기</h2>
                <!-- 로그인 폼 -->
                <form id="findId_form" action="findId.do" method="post" class="shadow p-3 rounded-4 bg-light">
                    <div class="form-group">
                        <label for="mem_name">이름</label>
                        <input type="text" class="form-control" name="mem_name" id="mem_name" maxlength="12">
                    </div>
                    <div class="form-group">
                        <label for="mem_email">이메일</label>
                        <input type="email" class="form-control" name="mem_email" id="mem_email">
                    </div>
                    <button type="submit" class="btn btn-warning btn-block text-white">아이디찾기</button>
                </form> 
                <br>
	            <div class="d-grid gap-2 d-md-block">
	            	 <button class="btn btn-warning text-white" type="button" onclick="location.href='${pageContext.request.contextPath}/member/findPasswdForm.do'">비빌번호 찾기</button>
	 				 <button class="btn btn-warning text-white" type="button" onclick="location.href='${pageContext.request.contextPath}/member/loginForm.do'">로그인</button>
	 				 <button class="btn btn-warning text-white" type="button" onclick="location.href='${pageContext.request.contextPath}/member/registerUserForm.do'">회원가입</button>
				</div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>