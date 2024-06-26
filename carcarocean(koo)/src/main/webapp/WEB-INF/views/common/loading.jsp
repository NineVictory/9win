<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#load {
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    position: fixed;
    display: block;
    opacity: 0.8;
    background: white;
    z-index: 99;
    text-align: center;
}

#load > img {
    position: absolute;
    top: 30%;
    left: 40%;
    z-index: 100;
}
</style>
</head>
<body>
	<div id="load">
	  <img src="../images/loading.gif" alt="loading">
	</div>
	<script >
	  const loading_page = document.getElementById("load");
	  window.onload = function(){
		  loading_page.style.display = 'none';
	  };
	</script>
</body>
</html>