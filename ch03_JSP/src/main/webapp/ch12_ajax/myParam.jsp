<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!-- contentType="text/plain;: html에서 plain으로 바뀜 전송데이터가 HTML형식이 아닌 일반 데이터 라는뜻 -->
<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
이름은 <%= name %> 이고 나이는 <%= age %>입니다.
