<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 비밀번호 변경 시작 -->
<div class="page-main">
    <h2>비밀번호 변경</h2>
    <form:form action="changePassword" id="member_change" modelAttribute="memberVO">
        <form:errors element="div" cssClass="error-color"/>
        <ul>
            <li>
                <form:label path="now_passwd">현재 비밀번호</form:label>
                <form:password path="now_passwd"/>
                <form:errors path="now_passwd" cssClass="error-color"/>
            </li>
            <li>
                <form:label path="passwd">비밀번호</form:label>
                <form:password path="passwd"/>
                <form:errors path="passwd" cssClass="error-color"/>
            </li>
            <li>
                <!-- 자바빈에 없기 때문에 기본 태그를 사용해야됨. 비밀번호와 같은지 확인용도. JavaScript로 확인 -->
                <label for="confirm_passwd">새비밀번호 확인</label>
                <input type="password" id="confirm_passwd">
                <span id="message_password"></span>
            </li>
            <li>
                <div id="captcha_div">
                    <img src="getCaptcha" id="captcha_img" width="200" height="90">
                </div>
                <input type="button" value="새로고침" id="reload_btn">
                <!-- 새로고침을 누르면 위 이미지 태그가 리로드되도록 -->
                <script>
                    $(function() {
                        $('#reload_btn').click(function() {
                            $.ajax({
                                url: 'getCaptcha',
                                type: 'get',
                                success: function() { //captcha_div는 캡챠의 이미지주소가 있는 div이다.
                                					 //' #captcha_div' #앞에 공백이 없으면 페이지 전체로 인식하기 때문에
                                					 //한 칸 띄우고 작성해야된다.
                                    $('#captcha_div').load(location.href + ' #captcha_div');
                                },
                                error: function() {
                                    alert('네트워크 오류 발생');
                                }
                            });
                        });
                    });
                </script>
            </li>
            <li>
                <form:label path="captcha_chars">캡챠 문자 확인</form:label>
                <form:input path="captcha_chars"/>
                <form:errors path="captcha_chars" cssClass="error-color"/>
            </li>
        </ul>
        <div class="align-center">
            <form:button>전송</form:button>
            <input type="button" value="MY페이지" onclick="location.href='myPage'">
        </div>
    </form:form>
</div>
<!-- 비밀번호 변경 끝 -->
