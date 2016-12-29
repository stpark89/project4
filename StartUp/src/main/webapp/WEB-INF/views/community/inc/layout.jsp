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
<link rel="stylesheet" type="text/css" href="dashboard/dashboard.css">
<link rel="stylesheet" type="text/css" href="dashboard/header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="js/jquery-3.1.1.min.js"></script>
<script src="dashboard/dashboard.js"></script>
<script src="dashboard/sub01.js"></script>
<script src="js/NewsRss.js"></script>
<title>게시판</title>
</head>
<body>

	<!-- Header -->
	<tiles:insertAttribute name="header" />
	<!-- Main Wrapper -->
	<tiles:insertAttribute name="content" />
	<!--풋터-->
	<tiles:insertAttribute name="footer" />

</body>
</html>