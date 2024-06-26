<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO" %>
<%@ page import="kr.story.vo.StoryVO" %>
<%
	Integer user_num = (Integer)session.getAttribute("user_num");
	if(user_num==null){
		response.sendRedirect("loginForm.jsp");
	}else{
		request.setCharacterEncoding("utf-8");
%>  
<jsp:useBean id="vo" class="kr.story.vo.StoryVO"/>
<jsp:setProperty property="*" name="vo"/>
<%
	StoryDAO dao = StoryDAO.getInstance();
	StoryVO db_vo = dao.getStory(vo.getSnum());
	if(user_num!=db_vo.getNum()){//타인의 글에 접속한 경우
%>
	<script>
		alert('잘못된 접속입니다.');
		location.href='list.jsp';
	</script>
<%
	}else{
	vo.setIp(request.getRemoteAddr());
	dao.update(vo);
%>
	<script>
		alert('글 수정을 완료했습니다.');
		location.href='detail.jsp?snum=<%=vo.getSnum()%>';
	</script>
<%
	}
}
%>