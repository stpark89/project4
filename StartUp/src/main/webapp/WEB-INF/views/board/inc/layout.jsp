<!--  
	작성자 : 박성준
	작성일 : 2016-12-19
	목  적 : 로그인 및 회원가입시 사용
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/subHeader.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="js/FreeBoard.js"></script>
<title>게시판</title>
</head>
<body>
<div class="container-fluid">
  <div class="row content">
	<!-- Header -->
	<tiles:insertAttribute name="header" />
	<br/><br/><br/>
	<tiles:insertAttribute name="sidebar"/>

	<!-- Main Wrapper -->
	<tiles:insertAttribute name="content" />
	<!--풋터-->
	</div>
</div>

<tiles:insertAttribute name="footer" />

</body>
</html>