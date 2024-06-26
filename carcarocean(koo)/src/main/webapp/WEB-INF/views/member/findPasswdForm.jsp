<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="container" style = "margin-bottom:100px">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="text-center mt-5 mb-3 text-warning">비밀번호 찾기</h2>
                <!-- 로그인 폼 -->
                <form id="findPasswd_form" action="findPasswd.do" method="post" class="shadow p-3 rounded-4 bg-light">
                    <div class="form-group">
                        <label for="mem_name">이름</label>
                        <input type="text" class="form-control" name="mem_name" id="mem_name" maxlength="12">
                    </div>
                     <div class="form-group">
                        <label for="mem_id">아이디</label>
                        <input type="text" class="form-control" name="mem_id" id="mem_id">
                    </div>
                    <div class="form-group">
                        <label for="mem_email">이메일</label>
                        <input type="email" class="form-control" name="mem_email" id="mem_email">
                    </div>
                     <div class="form-group">
                        <label for="mem_phone">전화번호</label>
                        <input type="text" class="form-control" name="mem_phone" id="mem_phone">
                    </div>
                    <button type="submit" class="btn btn-warning btn-block text-white">비밀번호찾기</button>
                </form>
                <br>
	            <div class="d-grid gap-2 d-md-block">
	 				 <button class="btn btn-warning text-white" type="button" onclick="location.href='${pageContext.request.contextPath}/member/loginForm.do'">로그인</button>
	 				 <button class="btn btn-warning text-white" type="button" onclick="location.href='${pageContext.request.contextPath}/member/registerUserForm.do'">회원가입</button>
				</div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>